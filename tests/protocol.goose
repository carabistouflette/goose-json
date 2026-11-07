// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import json_codec.protocol;
import std;

fn reject(text: const u8[:]) {
    let names: (const u8[:])[1] = ["id"];
    var result = json_codec::ProtocolResult { .. };
    assert(json_codec::protocol_select("{\"id\":42}", names, result).len == 0);
    assert(json_codec::protocol_select(text, names, result).len > 0);
    assert(json_codec::protocol_count(result) == 0);
}
fn test_selection() {
    var result = json_codec::ProtocolResult { .. };
    let names: (const u8[:])[4] = ["jsonrpc", "id", "result", "error"];
    var input = str("{\"jsonrpc\":\"2.0\",\"id\":9007199254740993,\"result\":null}");
    let err = json_codec::protocol_select(input, names, result);
    assert(err.len == 0 && json_codec::protocol_count(result) == 4);
    assert(json_codec::protocol_present(result, 2) && json_codec::protocol_value(result, 2) == "null");
    assert(json_codec::protocol_value(result, 1) == "9007199254740993");
    assert(!json_codec::protocol_present(result, 3));
    assert(json_codec::protocol_select("{\"jsonrpc\":\"2.0\",\"id\":1,\"error\":{\"code\":-32601,\"message\":\"not found\"}}", names, result).len == 0);
    assert(!json_codec::protocol_present(result, 2));
    assert(json_codec::protocol_value(result, 3) == "{\"code\":-32601,\"message\":\"not found\"}");
    assert(json_codec::protocol_select(input, names, result).len == 0);
    input.clear();
    assert(json_codec::protocol_value(result, 0) == "\"2.0\"");
    assert(json_codec::protocol_select("{\"\\u0069d\":1e999,\"result\": [ 1, {\"x\":true} ]}", names, result).len == 0);
    assert(json_codec::protocol_value(result, 1) == "1e999");
    assert(json_codec::protocol_value(result, 2) == "[ 1, {\"x\":true} ]");
    assert(json_codec::protocol_select("{\"ignored\":{\"a\":1,\"\\u0061\":2}}", names, result).len > 0);
    assert(json_codec::protocol_count(result) == 0);
    let duplicate: (const u8[:])[2] = ["id", "id"];
    assert(json_codec::protocol_select("{}", duplicate, result).len > 0);
    assert(json_codec::protocol_count(result) == 0);
    let empty: (const u8[:])[0] = [];
    assert(json_codec::protocol_select("{\"unknown\":[null,{},[]]}", empty, result).len == 0);
    assert(json_codec::protocol_count(result) == 0);
    assert(json_codec::protocol_select("{\"a\":{\"x\":1},\"b\":{\"x\":2}}", empty, result).len == 0);
}
fn test_invalid() {
    reject(""); reject("[]"); reject("null"); reject("{}{}");
    reject("{\"id\":1,\"id\":2}"); reject("{\"id\":1,\"\\u0069d\":2}");
    reject("{\"id\":[1,]}"); reject("{\"id\":{},}"); reject("{\"id\":01}");
    reject("{\"id\":1e}"); reject("{\"id\":1.}"); reject("{\"id\":-}");
    reject("{\"id\":truex}"); reject("{\"id\":\"\\uD800\"}");
    reject("{\"id\":\"\\uDC00\"}"); reject("{\"id\":\"\\q\"}");
    reject("{\"id\":\"\n\"}"); reject("{\"ignored\":[1,]}");
    var bad = str("{\"id\":\""); bad.push(0xff); bad.append("\"}"); reject(bad);
    reject("{\"é\":0,\"\\u00e9\":1}");
    reject("{\"😀\":0,\"\\uD83D\\uDE00\":1}");
    let full = "{\"id\":[1,{\"a\":\"x\"}]}";
    for i in full.len { reject(full[..i]); }
}
fn test_alias_and_reuse() {
    var result = json_codec::ProtocolResult { .. };
    let one: (const u8[:])[1] = ["x"];
    assert(json_codec::protocol_select("{\"x\":{\"x\":17}}", one, result).len == 0);
    assert(json_codec::protocol_select(json_codec::protocol_value(result, 0), one, result).len == 0);
    assert(json_codec::protocol_value(result, 0) == "17");
    assert(json_codec::protocol_select(json_codec::protocol_value(result, 0), one, result).len > 0);
    assert(json_codec::protocol_count(result) == 0);
    assert(json_codec::protocol_select("{\"x\":17}", one, result).len == 0);
    let alias_names: (const u8[:])[1] = [json_codec::protocol_value(result, 0)];
    assert(json_codec::protocol_select("{\"17\":true}", alias_names, result).len == 0);
    assert(json_codec::protocol_value(result, 0) == "true");
}
fn test_limits() {
    var result = json_codec::ProtocolResult { .. };
    let names: (const u8[:])[1] = ["x"];
    var number = str("{\"x\":1");
    for i in 127 { number.push('0'); }
    number.push('}');
    assert(json_codec::protocol_select(number, names, result).len == 0);
    number.pop(); number.append("0}");
    assert(json_codec::protocol_select(number, names, result).len > 0);
    var depth = str("{\"x\":");
    for i in 63 { depth.push('['); }
    depth.push('0');
    for i in 63 { depth.push(']'); }
    depth.push('}');
    assert(json_codec::protocol_select(depth, names, result).len == 0);
    var deep = str("{\"x\":");
    for i in 64 { deep.push('['); }
    deep.push('0');
    for i in 64 { deep.push(']'); }
    deep.push('}');
    assert(json_codec::protocol_select(deep, names, result).len > 0);
    var array = str("{\"x\":[");
    for i in 8190 { if i > 0 { array.push(','); } array.append("null"); }
    array.append("]}");
    assert(json_codec::protocol_select(array, names, result).len == 0);
    array.pop(); array.pop(); array.append(",null]}");
    assert(json_codec::protocol_select(array, names, result).len > 0);
    var large = str("{\"x\":\"");
    for i in 524286 { large.push('a'); }
    large.append("\"}");
    assert(json_codec::protocol_select(large, names, result).len == 0);
    large.pop(); large.pop(); large.append("a\"}");
    assert(json_codec::protocol_select(large, names, result).len > 0);
    var max_input = str("{}");
    for i in 1048574 { max_input.push(' '); }
    assert(json_codec::protocol_select(max_input, names, result).len == 0);
    max_input.push(' ');
    assert(json_codec::protocol_select(max_input, names, result).len > 0);
    var key = str("{\"");
    for i in 4096 { key.push('a'); }
    key.append("\":0}");
    assert(json_codec::protocol_select(key, names, result).len == 0);
    key.clear(); key.append("{\"");
    for i in 4097 { key.push('a'); }
    key.append("\":0}");
    assert(json_codec::protocol_select(key, names, result).len > 0);
    key.clear(); key.append("{\"");
    for i in 4096 { key.append("\\u0061"); }
    key.append("\":0}");
    assert(json_codec::protocol_select(key, names, result).len == 0);
    key.clear(); key.append("{\"");
    for i in 4097 { key.append("\\u0061"); }
    key.append("\":0}");
    assert(json_codec::protocol_select(key, names, result).len > 0);
}
fn main() { test_selection(); test_invalid(); test_alias_and_reuse(); test_limits(); }
