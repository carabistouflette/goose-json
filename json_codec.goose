// SPDX-License-Identifier: Apache-2.0
namespace json_codec;
import std;
import json;

// Owned UTF-8 text; unlike a slice, it outlives the JSON input.
struct Text { bytes: u8[>..] }
let MAX_INPUT_BYTES = 1048576;
let MAX_NUMBER_BYTES = 128;

// This convenience constructor accepts struct roots. All fields are required, including fields
// with Goose defaults. On failure the returned value is partial: discard it.
fn deserialize<T>(text: u8[:]) -> T, u8[>..] {
    var value = T { .. };
    let error = deserialize_into(text, value);
    return value, error;
}

// Also accepts root structs and supported scalar/array destinations. Encountered
// strings and arrays replace existing contents; failure may leave partial changes.
fn deserialize_into<T>(text: u8[:], value: T&) -> u8[>..] {
    if text.len > MAX_INPUT_BYTES { return str("json_codec: input exceeds 1 MiB"); }
    if !valid_utf8(text) { return str("json_codec: invalid UTF-8"); }
    var r = json::reader(text);
    read(r, value);
    if !json::finish(r) { return json::message(r); }
    return [];
}

fn read(r: json::Reader&, value: Text&) {
    // The entry point already validated UTF-8. A raw string can be copied
    // directly; escaped strings still use the standard Unicode decoder.
    if json::peek(r) == '"' {
        let end, ascii = plain_prefix(r.text, r.pos + 1);
        if end < r.text.len && r.text[end] == '"' {
            value.bytes.clear();
            value.bytes.append(r.text[r.pos + 1..end]);
            r.pos = end + 1;
            return;
        }
    }
    // Decode escapes straight into the owner, avoiding scratch storage and a copy.
    value.bytes.clear();
    let s = json::read_string(r, value.bytes);
    if value.bytes.len == 0 { value.bytes.append(s); }
    else if !valid_utf8(value.bytes) { json::fail(r, "invalid Unicode string"); }
}
// Parse integers without routing through the standard reader's float conversion.
// Accumulating negatively permits -2^63 without an overflowing intermediate.
inline fn read(r: json::Reader&, value: i64&) {
    r.pos = json::skip_space(r.text, r.pos);
    var pos = r.pos;
    var negative = false;
    if pos < r.text.len && r.text[pos] == '-' { negative = true; pos++; }
    let start = pos;
    if pos + 1 < r.text.len && r.text[pos] == '0' && r.text[pos + 1] >= '0' && r.text[pos + 1] <= '9' {
        json::fail(r, "expected an integer"); return;
    }
    let last_digit = if negative { 8 } else { 7 };
    var number: i64 = 0;
    while pos < r.text.len {
        let c = r.text[pos];
        if c < '0' || c > '9' { break; }
        let digit = (c - '0') as i64;
        if number < -922337203685477580 || (number == -922337203685477580 && digit > last_digit) {
            json::fail(r, "integer outside i64 range"); return;
        }
        number = number * 10 - digit;
        pos++;
    }
    if pos == start {
        json::fail(r, "expected an integer"); return;
    }
    // The enclosing container (or finish) validates the delimiter, so a
    // fraction/exponent suffix still makes the complete read fail.
    value = if negative { number } else { -number };
    r.pos = pos;
}
fn read(r: json::Reader&, value: bool&) { value = json::read_bool(r); }
fn read(r: json::Reader&, value: f64&) {
    if !number_allowed(r) { return; }
    value = json::read_number(r);
    if !finite(value) { json::fail(r, "number outside finite f64 range"); }
}

// Use the standard reader for keys as well as values, so escaped spellings
// compare equal and cannot bypass duplicate-key checks.
fn read<T>(r: json::Reader&, value: T&) {
    var seen: bool[>..] = [];
    const for <N, A> in fields<T> { seen.push(false); }
    if json::peek(r) != '{' { json::fail(r, "expected object"); return; }
    r.pos++;
    if json::peek(r) == '}' { r.pos++; }
    else {
        loop {
            var scratch: u8[>..] = [];
            let key = json::read_string(r, scratch);
            if scratch.len > 0 && !valid_utf8(key) { json::fail(r, "invalid Unicode key"); return; }
            if json::peek(r) != ':' { json::fail(r, "expected ':'"); return; }
            r.pos++;
            var found = false;
            var index = 0;
            const for <N, A> in fields<T> {
                if !found && key == N {
                    if seen[index] { json::fail(r, "duplicate field"); return; }
                    seen[index] = true;
                    read(r, value.A);
                    found = true;
                }
                index++;
            }
            if !found { json::fail(r, "unknown field"); return; }
            if r.error.len > 0 { return; }
            let c = json::peek(r);
            if c == ',' { r.pos++; continue; }
            if c != '}' { json::fail(r, "expected ',' or '}'"); return; }
            r.pos++;
            break;
        }
    }
    for present in seen {
        if !present { json::fail(r, "missing field"); return; }
    }
}

// An error produces empty output; partial JSON is never returned.
fn serialize<T>(value: T&) -> u8[>..], u8[>..] {
    var out: u8[>..] = [];
    if !write(out, value) { out.clear(); return out, str("json_codec: invalid UTF-8 or non-finite number"); }
    return out, [];
}
fn write(out: u8[>..]&, value: Text&) -> bool {
    let end, ascii = plain_prefix(value.bytes, 0);
    // The prefix scan proves ASCII safe. Unicode needs the full validator;
    // bytes after the first escape must be checked even if the prefix is ASCII.
    if !valid_utf8(if ascii { value.bytes[end..] } else { value.bytes[..] }) { return false; }
    out.push('"');
    out.append(value.bytes[..end]);
    if end < value.bytes.len { json::format_escaped(out, value.bytes[end..]); }
    out.push('"');
    return true;
}

// Whether a word contains a zero byte. Unsigned subtraction wraps by design.
checkfree fn has_zero(word: u64) -> bool {
    ((word - 0x0101010101010101) & ~word & 0x8080808080808080) != 0
}

// Find a run without JSON escapes, including raw Unicode. Bytewise assembly
// permits unaligned input without casts, overreads, or target-specific code.
checkfree fn plain_prefix(text: u8[:], at: i64) -> i64, bool {
    assert(at >= 0 && at <= text.len);
    var end = at;
    var high: u64 = 0;
    if text.len - end >= 32 {
        while end < text.len - 7 {
            let word = text[end] | (text[end + 1] as u64 << 8) |
                (text[end + 2] as u64 << 16) | (text[end + 3] as u64 << 24) |
                (text[end + 4] as u64 << 32) | (text[end + 5] as u64 << 40) |
                (text[end + 6] as u64 << 48) | (text[end + 7] as u64 << 56);
            let controls = (word - 0x2020202020202020) & ~word & 0x8080808080808080;
            if controls != 0 || has_zero(word ^ 0x2222222222222222) || has_zero(word ^ 0x5c5c5c5c5c5c5c5c) { break; }
            high |= word;
            end += 8;
        }
    }
    while end < text.len {
        let c = text[end];
        if c < 0x20 || c == '"' || c == '\\' { break; }
        high |= c;
        end++;
    }
    return end, (high & 0x8080808080808080) == 0;
}
fn write(out: u8[>..]&, value: i64&) -> bool { json::format_int(out, value); return true; }
fn write(out: u8[>..]&, value: bool&) -> bool { json::format_bool(out, value); return true; }
fn write(out: u8[>..]&, value: f64&) -> bool {
    if !finite(value) { return false; }
    json::format_number(out, value);
    return true;
}
fn write<T>(out: u8[>..]&, value: T&) -> bool {
    out.push('{');
    var first = true;
    const for <N, A> in fields<T> {
        if !first { out.push(','); }
        first = false;
        json::format_key(out, N);
        if !write(out, value.A) { return false; }
    }
    out.push('}');
    return true;
}
fn read(r: json::Reader&, value: i64[>..]&) {
    value.clear();
    json::each_element(r) { read(r, value.push(0)); };
}

fn read(r: json::Reader&, value: bool[>..]&) {
    value.clear();
    json::each_element(r) { read(r, value.push(false)); };
}

fn read(r: json::Reader&, value: f64[>..]&) {
    value.clear();
    json::each_element(r) { read(r, value.push(0.0)); };
}

// Bound work BEFORE entering the upstream arbitrary-precision number scanner.
// Its exponent saturation is also safe within this bound: a mantissa of at
// most 128 bytes cannot compensate an exponent saturated at 100000.
fn number_allowed(r: json::Reader&) -> bool {
    json::peek(r);
    var end = r.pos;
    while end < r.text.len {
        let c = r.text[end];
        if !((c >= '0' && c <= '9') || c == '-' || c == '+' || c == '.' || c == 'e' || c == 'E') { break; }
        end++;
        if end - r.pos > MAX_NUMBER_BYTES {
            json::fail(r, "number token exceeds 128 bytes");
            return false;
        }
    }
    return true;
}

fn finite(value: f64) -> bool {
    value == value && value <= 1.7976931348623157e308 && value >= -1.7976931348623157e308
}

// Reject overlong encodings, surrogates, truncation, and > U+10FFFF.
fn valid_utf8(text: u8[:]) -> bool {
    var i = 0;
    // Scan an ASCII prefix in safe eight-byte chunks, then use the scalar
    // validator for the remainder. No word casts or alignment assumptions.
    while i < text.len - 7 && (text[i] | text[i + 1] | text[i + 2] | text[i + 3] |
            text[i + 4] | text[i + 5] | text[i + 6] | text[i + 7]) < 0x80 { i += 8; }
    while i < text.len {
        let c = text[i];
        i++;
        if c < 0x80 { continue; }
        var count = 0;
        var lo: u8 = 0x80;
        var hi: u8 = 0xbf;
        if c >= 0xc2 && c <= 0xdf { count = 1; }
        else if c >= 0xe0 && c <= 0xef {
            count = 2;
            if c == 0xe0 { lo = 0xa0; }
            if c == 0xed { hi = 0x9f; }
        } else if c >= 0xf0 && c <= 0xf4 {
            count = 3;
            if c == 0xf0 { lo = 0x90; }
            if c == 0xf4 { hi = 0x8f; }
        } else { return false; }
        if count > text.len - i { return false; }
        if text[i] < lo || text[i] > hi { return false; }
        for j in 1..count { if text[i + j] < 0x80 || text[i + j] > 0xbf { return false; } }
        i += count;
    }
    return true;
}

fn write(out: u8[>..]&, value: i64[>..]&) -> bool {
    out.push('[');
    for &element, i in value {
        if i > 0 { out.push(','); }
        if !write(out, element) { return false; }
    }
    out.push(']');
    return true;
}
fn write(out: u8[>..]&, value: bool[>..]&) -> bool {
    out.push('[');
    for &element, i in value {
        if i > 0 { out.push(','); }
        if !write(out, element) { return false; }
    }
    out.push(']');
    return true;
}
fn write(out: u8[>..]&, value: f64[>..]&) -> bool {
    out.push('[');
    for &element, i in value {
        if i > 0 { out.push(','); }
        if !write(out, element) { return false; }
    }
    out.push(']');
    return true;
}
