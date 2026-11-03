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
    var scratch: u8[>..] = [];
    let s = json::read_string(r, scratch);
    if !valid_utf8(s) { json::fail(r, "invalid Unicode string"); return; }
    value.bytes.clear();
    value.bytes.append(s);
}
fn read(r: json::Reader&, value: i64&) {
    if !number_allowed(r) { return; }
    value = json::read_int(r);
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
            if !valid_utf8(key) { json::fail(r, "invalid Unicode key"); return; }
            if json::peek(r) != ':' { json::fail(r, "expected ':'"); return; }
            r.pos++;
            var found = false;
            var index = 0;
            const for <N, A> in fields<T> {
                if key == N {
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
    if !valid_utf8(value.bytes) { return false; }
    json::format_string(out, value.bytes);
    return true;
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
