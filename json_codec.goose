// SPDX-License-Identifier: Apache-2.0
namespace json_codec;
import std;
import json;
import .native.runtime;

// Internal C ABI wrappers; no native function retains a reference.
extern fn native_available() -> bool = "gj_available";
extern fn native_utf8(text: const u8[:]) -> bool = "gj_utf8";
extern fn native_prefix(text: const u8[:], at: i64, end: i64&, ascii: bool&) = "gj_prefix";
extern fn native_quote_prefix(text: const u8[:]) -> i64 = "gj_quote_prefix";
extern fn native_escape_chunk(text: const u8[:], at: i64, out: u8[:], position: i64&) -> i64 = "gj_escape_chunk";
extern fn native_unquote(text: const u8[:], at: i64, out: u8[:], position: i64&, done: bool&) -> i64 = "gj_unquote";
extern fn native_parse_float_chunk(text: const u8[:], at: i64, out: f64[:], position: i64&, done: bool&, prefix: bool) -> i64 = "gj_parse_float_chunk";
extern fn native_parse_number(text: const u8[:], value: f64&) -> i64 = "gj_parse_number";
extern fn native_number(value: f64, out: u8[:]) -> i64 = "gj_number";
extern fn native_float_chunk(values: const f64[:], out: u8[:], prefix: bool) -> i64 = "gj_float_chunk";

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
    if text.len > MAX_INPUT_BYTES { return error_text("json_codec: input exceeds 1 MiB"); }
    if !valid_utf8(text) { return error_text("json_codec: invalid UTF-8"); }
    var r = json::reader(text);
    read(r, value);
    if !json::finish(r) { return reader_error(r); }
    return [];
}

// Error length is the success/failure signal. Consumer formatting overloads
// must never be able to erase it, so diagnostics use byte operations directly.
fn error_text(message: const u8[:]) -> u8[>..] {
    var out: u8[>..] = [];
    out.append(message);
    return out;
}
fn reader_error(r: json::Reader&) -> u8[>..] {
    var out: u8[>..] = [];
    out.append("json: "); out.append(r.error); out.append(" at byte ");
    owned_int(out, r.error_at);
    return out;
}

fn read(r: json::Reader&, value: Text&) {
    // Small records avoid native call and chunk-buffer setup costs.
    if native_available() && r.text.len - r.pos >= 128 {
        if json::peek(r) != '"' { json::fail(r, "expected a string"); return; }
        let start = r.pos + 1;
        var end = start;
        var ascii = true;
        native_prefix(r.text, start, end, ascii);
        if end == r.text.len { json::fail(r, "unterminated string"); return; }
        value.bytes.clear();
        if r.text[end] == '"' {
            value.bytes.append(r.text[start..end]);
            r.pos = end + 1;
        } else {
            var buffer: u8[4096] = [0; 4096];
            var position = start;
            var done = false;
            while !done {
                let count = native_unquote(r.text, position, buffer[..], position, done);
                if count < 0 { json::fail(r, "bad string or Unicode escape"); return; }
                value.bytes.append(buffer[..count]);
            }
            r.pos = position;
        }
        return;
    }
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
    if native_available() {
        json::peek(r);
        let count = native_parse_number(r.text[r.pos..], value);
        if count > 0 { r.pos += count; return; }
    }
    if number_end(r) < 0 { return; }
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
    if !write(out, value) { out.clear(); return out, error_text("json_codec: invalid UTF-8 or non-finite number"); }
    return out, [];
}
fn write(out: u8[>..]&, value: Text&) -> bool {
    if native_available() && value.bytes.len >= 64 {
        let prefix = native_quote_prefix(value.bytes);
        if prefix < 0 { return false; }
        out.push('"');
        if prefix == value.bytes.len { out.append(value.bytes); }
        else {
            var buffer: u8[4096] = [0; 4096];
            var position = 0;
            while position < value.bytes.len {
                let count = native_escape_chunk(value.bytes, position, buffer[..], position);
                if count < 0 { return false; }
                out.append(buffer[..count]);
            }
        }
        out.push('"');
        return true;
    }
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
fn plain_prefix(text: u8[:], at: i64) -> i64, bool {
    assert(at >= 0 && at <= text.len);
    if native_available() && text.len - at >= 32 {
        var end = at;
        var ascii = true;
        native_prefix(text, at, end, ascii);
        return end, ascii;
    }
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
inline fn write(out: u8[>..]&, value: i64&) -> bool { owned_int(out, value); return true; }
fn write(out: u8[>..]&, value: bool&) -> bool { json::format_bool(out, value); return true; }
fn write(out: u8[>..]&, value: f64&) -> bool {
    if !finite(value) { return false; }
    if native_available() {
        var text: u8[32] = [0; 32];
        let count = native_number(value, text[..]);
        if count < 0 { return false; }
        out.append(text[..count]);
        return true;
    }
    owned_number(out, value);
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
    if native_available() && json::peek(r) == '[' {
        let start = r.pos;
        var position = start + 1;
        var done = false;
        var prefix = false;
        var buffer: f64[64] = [0.0; 64];
        value.clear();
        while !done {
            let count = native_parse_float_chunk(r.text, position, buffer[..], position, done, prefix);
            if count < 0 { break; }
            value.append(buffer[..count]);
            prefix = true;
        }
        if done { r.pos = position; return; }
        // Reparse uncommon conversions with the standard reader's established
        // underflow/range policy. No partially parsed native values escape.
        r.pos = start;
    }
    value.clear();
    json::each_element(r) { read(r, value.push(0.0)); };
}

// Bound work BEFORE entering the upstream arbitrary-precision number scanner.
// Its exponent saturation is also safe within this bound: a mantissa of at
// most 128 bytes cannot compensate an exponent saturated at 100000.
fn number_end(r: json::Reader&) -> i64 {
    json::peek(r);
    var end = r.pos;
    while end < r.text.len {
        let c = r.text[end];
        if !((c >= '0' && c <= '9') || c == '-' || c == '+' || c == '.' || c == 'e' || c == 'E') { break; }
        end++;
        if end - r.pos > MAX_NUMBER_BYTES {
            json::fail(r, "number token exceeds 128 bytes");
            return -1;
        }
    }
    return end;
}

fn finite(value: f64) -> bool {
    value == value && value <= 1.7976931348623157e308 && value >= -1.7976931348623157e308
}

// Reject overlong encodings, surrogates, truncation, and > U+10FFFF.
fn valid_utf8(text: u8[:]) -> bool {
    if native_available() && text.len >= 32 { return native_utf8(text); }
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
    if native_available() {
        out.push('[');
        var buffer: u8[2112] = [0; 2112];
        var start = 0;
        while start < value.len {
            let end = min(value.len, start + min(64, value.len - start));
            let count = native_float_chunk(value[start..end], buffer[..], start > 0);
            if count < 0 { return false; }
            out.append(buffer[..count]);
            start = end;
        }
        out.push(']');
        return true;
    }
    out.push('[');
    for &element, i in value {
        if i > 0 { out.push(','); }
        if !write(out, element) { return false; }
    }
    out.push(']');
    return true;
}

inline fn owned_int(out: u8[>..]&, value: i64) {
    // Keep common nonnegative integers in Goose, without a runtime call/copy.
    if value >= 0 && value < 10000 {
        if value >= 1000 { out.push(('0' + value / 1000) as! u8); }
        if value >= 100 { out.push(('0' + value / 100 % 10) as! u8); }
        if value >= 10 { out.push(('0' + value / 10 % 10) as! u8); }
        out.push(('0' + value % 10) as! u8);
        return;
    }
    var text: u8[32] = [0; 32];
    let count = runtime_i64(value, text[..]);
    assert(count > 0 && count <= text.len);
    out.append(text[..count]);
}
// Float digit selection and layout adapted from Goose stdlib/json.goose
// (eadca409f68210893f366e60d0c2f0dc29a339be, Apache-2.0). See NOTICE.
// Keep JSON spelling while avoiding consumer formatting hooks.
fn owned_number(out: u8[>..]&, value: f64) {
    if value == 0.0 {
        out.append(if 1.0 / value < 0.0 { "-0.0" } else { "0.0" });
        return;
    }
    var text: u8[21] = [0; 21];
    let len, point = json::ryu_digits(value, text[1..]);
    if len > 0 {
        if value < 0.0 { out.push('-'); }
        owned_layout(out, text, len, point);
        return;
    }
    let other_len, other_point = owned_general(abs(value), text[1..18]);
    if value < 0.0 { out.push('-'); }
    owned_layout(out, text, other_len, other_point);
}
fn runtime_digits(value: f64, out: u8[:]) -> i64, i64 {
    var text: u8[32] = [0; 32];
    let count = runtime_f64(value, text[..]);
    assert(count > 0 && count <= text.len);
    var len = 0;
    var point = 0;
    var frac = false;
    var lead = true;
    var i = 0;
    while i < count && text[i] != 'e' {
        let c = text[i];
        i++;
        if c == '.' { frac = true; continue; }
        if lead && c == '0' {
            if frac { point--; }
            continue;
        }
        lead = false;
        if len < out.len { out[len] = c; len++; } else { assert(c == '0'); }
        if !frac { point++; }
    }
    if i < count {
        let e, end = json::scan_exponent(text[..count], i + 1);
        assert(end == count);
        point += e;
    }
    assert(len > 0);
    return len, point;
}
fn owned_general(x: f64, out: u8[:]) -> i64, i64 {
    var s = 15;
    var p = x * 1e15;
    while p < 1e14 && s < 22 { s++; p = x * float_text::POW10[s]; }
    while p >= 1e15 && s > -22 { s--; p = if s >= 0 { x * float_text::POW10[s] } else { x / float_text::POW10[-s] }; }
    if p >= 1e14 && p < 1e15 {
        var n = (p + 0.5) as! u64;
        if n == 1000000000000000 {
            // A carry at the lower scaling bound would index POW10[23].
            if s == -22 { return runtime_digits(x, out); }
            n = 100000000000000; s--;
        }
        let back = if s >= 0 { n / float_text::POW10[s] } else { n * float_text::POW10[-s] };
        if back == x {
            json::put_digits(out[..15], n);
            return 15, 15 - s;
        }
    }
    return runtime_digits(x, out);
}

inline fn owned_layout(out: u8[>..]&, text: u8[21]&, digits: i64, point: i64) {
    var len = digits;
    while text[len] == '0' { len--; }
    if point > 0 && point < len {
        for i in point { text[i] = text[i + 1]; }
        text[point] = '.';
        out.append(text[..len + 1]);
        return;
    }
    let d = text[1..len + 1];
    if point >= len && point <= 16 {
        out.append(d);
        for i in point - len { out.push('0'); }
        out.append(".0");
    } else if point > -5 && point <= 0 {
        out.append("0.");
        for i in -point { out.push('0'); }
        out.append(d);
    } else {
        out.push(d[0]);
        if len > 1 {
            out.push('.');
            out.append(d[1..]);
        }
        out.push('e');
        owned_int(out, point - 1);
    }
}
