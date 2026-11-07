// SPDX-License-Identifier: Apache-2.0
// Optional bounded selective reader; import json_codec.protocol.
import json_codec;
import json;
import std;
namespace json_codec;

const PROTOCOL_INPUT = 1048576;
const PROTOCOL_OUTPUT = 524288;
const PROTOCOL_DEPTH = 64;
const PROTOCOL_VALUES = 8192;
const PROTOCOL_MEMBERS = 4096;
const PROTOCOL_KEY = 4096;
const PROTOCOL_NUMBER = 128;
const PROTOCOL_SELECTORS = 64;
const PROTOCOL_SELECTOR_BYTES = 65536;
const PROTOCOL_PAIRS = 131072;
const PROTOCOL_COMPARE_BYTES = 4194304;

struct ProtocolSpan { start: i64 = 0, len: i64 = 0, present: bool = false }
root struct ProtocolResult { _bytes: u8[>..] = [], _spans: ProtocolSpan[>..] = [] }
fn protocol_count(result: const ProtocolResult&) -> i64 { result._spans.len }
// Index must be in range. A view is invalidated when the result changes.
fn protocol_present(result: const ProtocolResult&, index: i64) -> bool { result._spans[index].present }
fn protocol_value(result: const ProtocolResult&, index: i64) -> const u8[:] {
    let span = result._spans[index];
    return result._bytes[span.start..span.start + span.len];
}
root struct ProtocolReader {
    text:   const u8[:], names: const (const u8[:])[:], pos: i64 = 0,
    values: i64                                                  = 0, members: i64 = 0, pairs: i64 = 0, compared: i64 = 0,
    keys:   u8[>..]                                              = [], seen: ProtocolSpan[>..] = [],
    output: u8[>..]                                              = [], spans: ProtocolSpan[>..] = [],
}
fn protocol_space(r: ProtocolReader&) {
    while r.pos < r.text.len {
        let c = r.text[r.pos];
        if c != ' ' && c != '\n' && c != '\r' && c != '\t' { break; }
        r.pos++;
    }
}
fn protocol_take(r: ProtocolReader&, c: u8) -> bool {
    protocol_space(r);
    if r.pos >= r.text.len || r.text[r.pos] != c { return false; }
    r.pos++; return true;
}
fn protocol_string(r: ProtocolReader&, out: u8[>..]&) -> bool {
    var reader = json::reader(r.text);
    reader.pos = r.pos;
    let s = json::read_string(reader, out);
    if reader.error.len > 0 || !valid_utf8(s) { return false; }
    if out.len == 0 { out.append(s); }
    r.pos = reader.pos;
    return true;
}
// Preflight decoded key length and surrogate pairs before allocating the key.
fn protocol_key_fits(r: ProtocolReader&) -> bool {
    if r.pos >= r.text.len || r.text[r.pos] != '"' { return false; }
    let end, escaped = json::scan_string(r.text, r.pos + 1);
    if end < 0 || (escaped && !json::valid_escapes(r.text, r.pos + 1, end)) { return false; }
    var p = r.pos + 1;
    var count = 0;
    while p < end {
        if r.text[p] != '\\' { count++; p++; }
        else {
            let e = r.text[p + 1]; p += 2;
            if e != 'u' { count++; }
            else {
                var cp = 0;
                for i in 4 { cp = cp * 16 + json::hex_digit(r.text[p + i]); }
                p += 4;
                if cp >= 0xD800 && cp < 0xDC00 {
                    if p + 6 > end || r.text[p] != '\\' || r.text[p + 1] != 'u' { return false; }
                    var low = 0;
                    for i in 4 { low = low * 16 + json::hex_digit(r.text[p + 2 + i]); }
                    if low < 0xDC00 || low >= 0xE000 { return false; }
                    p += 6; count += 4;
                } else if cp >= 0xDC00 && cp < 0xE000 { return false; }
                else if cp < 0x80 { count++; }
                else if cp < 0x800 { count += 2; }
                else { count += 3; }
            }
        }
        if count > PROTOCOL_KEY { return false; }
    }
    return true;
}
fn protocol_number(r: ProtocolReader&) -> bool {
    let start = r.pos;
    if r.text[r.pos] == '-' { r.pos++; }
    if r.pos >= r.text.len { return false; }
    if r.text[r.pos] == '0' { r.pos++; }
    else {
        if r.text[r.pos] < '1' || r.text[r.pos] > '9' { return false; }
        while r.pos < r.text.len && r.text[r.pos] >= '0' && r.text[r.pos] <= '9' { r.pos++; if r.pos - start > PROTOCOL_NUMBER { return false; } }
    }
    if r.pos < r.text.len && r.text[r.pos] == '.' {
        r.pos++; let at = r.pos;
        while r.pos < r.text.len && r.text[r.pos] >= '0' && r.text[r.pos] <= '9' { r.pos++; if r.pos - start > PROTOCOL_NUMBER { return false; } }
        if r.pos == at { return false; }
    }
    if r.pos < r.text.len && (r.text[r.pos] == 'e' || r.text[r.pos] == 'E') {
        r.pos++;
        if r.pos < r.text.len && (r.text[r.pos] == '+' || r.text[r.pos] == '-') { r.pos++; }
        let at = r.pos;
        while r.pos < r.text.len && r.text[r.pos] >= '0' && r.text[r.pos] <= '9' { r.pos++; if r.pos - start > PROTOCOL_NUMBER { return false; } }
        if r.pos == at { return false; }
    }
    return r.pos - start <= PROTOCOL_NUMBER;
}
fn protocol_word(r: ProtocolReader&, word: const u8[:]) -> bool {
    if word.len > r.text.len - r.pos || r.text[r.pos..r.pos + word.len] != word { return false; }
    r.pos += word.len; return true;
}
recursive fn protocol_value_read(r: ProtocolReader&, depth: i64) -> bool {
    protocol_space(r);
    if r.pos >= r.text.len || r.values >= PROTOCOL_VALUES { return false; }
    r.values++;
    let c = r.text[r.pos];
    if c == '{' { return protocol_object(r, depth + 1); }
    if c == '[' { return protocol_array(r, depth + 1); }
    if c == '"' { var scratch: u8[>..] = []; return protocol_string(r, scratch); }
    if c == 't' { return protocol_word(r, "true"); }
    if c == 'f' { return protocol_word(r, "false"); }
    if c == 'n' { return protocol_word(r, "null"); }
    if c == '-' || (c >= '0' && c <= '9') { return protocol_number(r); }
    return false;
}
fn protocol_array(r: ProtocolReader&, depth: i64) -> bool {
    if depth > PROTOCOL_DEPTH || !protocol_take(r, '[') { return false; }
    protocol_space(r);
    if r.pos < r.text.len && r.text[r.pos] == ']' { r.pos++; return true; }
    loop {
        if !protocol_value_read(r, depth) { return false; }
        protocol_space(r);
        if r.pos >= r.text.len { return false; }
        let c = r.text[r.pos]; r.pos++;
        if c == ']' { return true; }
        if c != ',' { return false; }
    }
}
fn protocol_object(r: ProtocolReader&, depth: i64) -> bool {
    if depth > PROTOCOL_DEPTH || !protocol_take(r, '{') { return false; }
    let first = r.seen.len;
    let key_base = r.keys.len;
    protocol_space(r);
    if r.pos < r.text.len && r.text[r.pos] == '}' { r.pos++; return true; }
    loop {
        protocol_space(r);
        if r.members >= PROTOCOL_MEMBERS { return false; }
        r.members++;
        var selected = -1;
        {
            var key: u8[>..] = [];
            if !protocol_key_fits(r) || !protocol_string(r, key) { return false; }
            for i in first..r.seen.len {
                if r.pairs >= PROTOCOL_PAIRS { return false; }
                r.pairs++;
                let previous = r.seen[i];
                if previous.len == key.len {
                    var equal = true;
                    for j in key.len {
                        if r.compared >= PROTOCOL_COMPARE_BYTES { return false; }
                        r.compared++;
                        if r.keys[previous.start + j] != key[j] { equal = false; break; }
                    }
                    if equal { return false; }
                }
            }
            let start = r.keys.len;
            r.keys.append(key);
            r.seen.push(ProtocolSpan { start: start, len: key.len, .. });
            if depth == 1 {
                for i in r.names.len { if r.names[i] == key { selected = i; break; } }
            }
        }
        if !protocol_take(r, ':') { return false; }
        protocol_space(r); let value_start = r.pos;
        if !protocol_value_read(r, depth) { return false; }
        if selected >= 0 {
            let len = r.pos - value_start;
            if len > PROTOCOL_OUTPUT - r.output.len { return false; }
            let offset = r.output.len;
            r.output.append(r.text[value_start..r.pos]);
            r.spans[selected] = ProtocolSpan { start: offset, len: len, present: true };
        }
        protocol_space(r);
        if r.pos >= r.text.len { return false; }
        let c = r.text[r.pos]; r.pos++;
        if c == '}' { break; }
        if c != ',' { return false; }
    }
    while r.seen.len > first { r.seen.pop(); }
    while r.keys.len > key_base { r.keys.pop(); }
    return true;
}
// Builds in scratch first, permitting input and names to alias result storage.
fn protocol_select(text: const u8[:], names: const (const u8[:])[:], result: ProtocolResult&) -> u8[>..] {
    var valid = text.len <= PROTOCOL_INPUT && names.len <= PROTOCOL_SELECTORS;
    var total = 0;
    if valid {
        for i in names.len {
            let name = names[i];
            if name.len > PROTOCOL_KEY || name.len > PROTOCOL_SELECTOR_BYTES - total || !valid_utf8(name) { valid = false; break; }
            total += name.len;
            for j in i { if name == names[j] { valid = false; break; } }
            if !valid { break; }
        }
    }
    var bytes: u8[>..]           = [];
    var spans: ProtocolSpan[>..] = [];
    {
        var r = ProtocolReader { text: text, names: names, .. };
        if valid && valid_utf8(text) {
            for i in names.len { r.spans.push(ProtocolSpan { .. }); }
            protocol_space(r);
            if r.pos >= text.len || text[r.pos] != '{' { valid = false; }
            else { valid = protocol_value_read(r, 0); }
            protocol_space(r);
            if r.pos != text.len { valid = false; }
        } else { valid = false; }
        if valid { bytes.append(r.output); spans.append(r.spans); }
    }
    result._bytes.clear(); result._spans.clear();
    if !valid { return error_text("json protocol: invalid input or limit exceeded"); }
    result._bytes.append(bytes); result._spans.append(spans);
    return [];
}
