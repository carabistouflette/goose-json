// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import json_codec.protocol;
import std;

fn append_hex(out: u8[>..]&, n: i64) {
    let digits = "0123456789abcdef";
    out.push(digits[(n / 256) % 16]); out.push(digits[(n / 16) % 16]); out.push(digits[n % 16]);
}
fn pairs(extra: i64) -> u8[>..] {
    var text = str("{\"x\":[{");
    for i in 512 {
        if i > 0 { text.push(','); }
        text.push('"'); append_hex(text, i); text.append("\":0");
    }
    text.push('}');
    for i in extra { text.append(",{\"a\":0,\"b\":0}"); }
    text.append("]}");
    return text;
}
fn comparisons(extra: i64) -> u8[>..] {
    var text = str("{\"x\":[{");
    for i in 46 {
        if i > 0 { text.push(','); }
        text.push('"');
        for j in 4051 { text.push('a'); }
        if i < 26 { text.push(('A' + i) as u8); } else { text.push(('a' + i - 26) as u8); }
        for j in 44 { text.push('z'); }
        text.append("\":0");
    }
    text.push('}');
    for i in extra { text.append(",{\"a\":0,\"b\":0}"); }
    text.append("]}");
    return text;
}
fn test_work_limits() {
    var result = json_codec::ProtocolResult { .. };
    let names: (const u8[:])[0] = [];
    var exact_pairs = pairs(256);
    assert(json_codec::protocol_select(exact_pairs, names, result).len == 0);
    var over_pairs = pairs(257);
    assert(json_codec::protocol_select(over_pairs, names, result).len > 0);
    var exact_bytes = comparisons(484);
    assert(json_codec::protocol_select(exact_bytes, names, result).len == 0);
    var over_bytes = comparisons(485);
    assert(json_codec::protocol_select(over_bytes, names, result).len > 0);
}
fn test_members() {
    var result = json_codec::ProtocolResult { .. };
    let names: (const u8[:])[0] = [];
    var text = str("{\"x\":[");
    for i in 64 {
        if i > 0 { text.push(','); }
        text.push('{');
        let count = if i == 63 { 63 } else { 64 };
        for j in count {
            if j > 0 { text.push(','); }
            text.push('"'); append_hex(text, j); text.append("\":0");
        }
        text.push('}');
    }
    text.append("]}");
    assert(json_codec::protocol_select(text, names, result).len == 0);
    text.pop(); text.pop(); text.pop(); text.append(",\"03f\":0}]}");
    assert(json_codec::protocol_select(text, names, result).len > 0);
}
fn test_selectors() {
    var result = json_codec::ProtocolResult { .. };
    var bytes: u8[>..] = [];
    for i in 65 { bytes.push((32 + i) as u8); }
    var names: (const u8[:])[>..] = [];
    for i in 65 { names.push(bytes[i..i + 1]); }
    assert(json_codec::protocol_select("{}", names[..64], result).len == 0);
    assert(json_codec::protocol_select("{}", names, result).len > 0);
    var large: u8[>..] = [];
    for i in 16 {
        large.push(('a' + i) as u8);
        for j in 4095 { large.push('x'); }
    }
    var long_names: (const u8[:])[>..] = [];
    for i in 16 { long_names.push(large[i * 4096..(i + 1) * 4096]); }
    assert(json_codec::protocol_select("{}", long_names, result).len == 0);
    long_names.push("q");
    assert(json_codec::protocol_select("{}", long_names, result).len > 0);
    let overlong: (const u8[:])[1] = [large[..4097]];
    assert(json_codec::protocol_select("{}", overlong, result).len > 0);
    let invalid:       u8[1]            = [0xff];
    let invalid_names: (const u8[:])[1] = [invalid[..]];
    assert(json_codec::protocol_select("{}", invalid_names, result).len > 0);
}
fn main() { test_work_limits(); test_members(); test_selectors(); }
