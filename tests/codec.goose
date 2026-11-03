// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import std;
struct Item { id: i64, active: bool, name: json_codec::Text }
struct Point { x: i64, y: i64 }
root struct Data { point: Point, numbers: i64[>..], flags: bool[>..], scores: f64[>..] }
struct Empty {}
struct Float { value: f64 }

fn reject(text: u8[:]) {
    let value, err = json_codec::deserialize<Item>(text);
    if err.len == 0 { print("unexpected acceptance: ", text); }
    assert(err.len > 0);
}
fn main() {
    var item, err = json_codec::deserialize<Item>("{\"name\":\"Goose\\n\\uD83D\\uDE00\",\"active\":true,\"id\":42}");
    assert(err.len == 0);
    assert(item.id == 42 && item.active && item.name.bytes == "Goose\n😀");
    let text, error = json_codec::serialize(item);
    assert(error.len == 0);
    var back, back_error = json_codec::deserialize<Item>(text);
    assert(back_error.len == 0 && back.name.bytes == item.name.bytes);
    assert(text == "{\"id\":42,\"active\":true,\"name\":\"Goose\\n😀\"}");

    var data = Data { .. };
    let de = json_codec::deserialize_into("{\"point\":{\"x\":1,\"y\":2},\"numbers\":[-9223372036854775808,9223372036854775807],\"flags\":[true,false],\"scores\":[1.25,-2e2]}", data);
    assert(de.len == 0);
    assert(data.numbers.len == 2 && data.point.y == 2);
    let encoded, ee = json_codec::serialize(data);
    assert(ee.len == 0);
    var decoded = Data { .. };
    let re = json_codec::deserialize_into(encoded, decoded);
    assert(re.len == 0 && decoded.scores[1] == -200.0);
    let empty, em = json_codec::deserialize<Empty>("{}");
    assert(em.len == 0);
    let escaped, ke = json_codec::deserialize<Item>("{\"\\u0069d\":1,\"active\":false,\"name\":\"\"}");
    assert(ke.len == 0 && escaped.id == 1);

    reject(""); reject("null"); reject("[]"); reject("{}");
    reject("{\"id\":1,\"active\":true}");
    reject("{\"id\":1,\"id\":2,\"active\":true,\"name\":\"x\"}");
    reject("{\"id\":1,\"\\u0069d\":2,\"active\":true,\"name\":\"x\"}");
    reject("{\"id\":1,\"active\":true,\"name\":\"x\",\"extra\":0}");
    reject("{\"id\":1.0,\"active\":true,\"name\":\"x\"}");
    reject("{\"id\":9223372036854775808,\"active\":true,\"name\":\"x\"}");
    reject("{\"id\":1,\"active\":1,\"name\":\"x\"}");
    reject("{\"id\":1,\"active\":true,\"name\":null}");
    reject("{\"id\":1,\"active\":true,\"name\":\"\\uD800\"}");
    reject("{\"id\":1,\"active\":true,\"name\":\"\\q\"}");
    reject("{\"id\":1,\"active\":true,\"name\":\"x\",}");
    reject("{\"id\":1,\"active\":true,\"name\":\"x\"} garbage");
    reject("{\"id\":01,\"active\":true,\"name\":\"x\"}");
    var invalid: u8[>..] = [];
    invalid.push(0xff);
    reject(invalid);
    let bad_float, fe = json_codec::deserialize<Float>("{\"value\":1e9999}");
    assert(fe.len > 0);
    var too_big: u8[>..] = [];
    for i in json_codec::MAX_INPUT_BYTES + 1 { too_big.push(' '); }
    reject(too_big);

    // Every truncated prefix of a valid document must fail.
    let complete = "{\"id\":1,\"active\":true,\"name\":\"x\"}";
    for i in complete.len { reject(complete[..i]); }
    let low, le = json_codec::deserialize<Float>("{\"value\":-1e9999}");
    assert(le.len > 0);
    var infinite = Float { value: 1.0 / 0.0 };
    let infinite_text, ie = json_codec::serialize(infinite);
    assert(ie.len > 0 && infinite_text.len == 0);
    var nan = Float { value: 0.0 / 0.0 };
    let nan_text, ne = json_codec::serialize(nan);
    assert(ne.len > 0 && nan_text.len == 0);
    var reused = Item { id: 9, active: false, name: json_codec::Text { bytes: "old" } };
    let reuse_error = json_codec::deserialize_into(complete, reused);
    assert(reuse_error.len == 0 && reused.name.bytes == "x");
    var array_data = Data { .. };
    let array_error = json_codec::deserialize_into("{\"point\":{\"x\":0,\"y\":0},\"numbers\":[1,],\"flags\":[],\"scores\":[]}", array_data);
    assert(array_error.len > 0);

    // Results own their strings: a temporary source can die before use.
    fn owned() -> Item {
        var source = str("{\"id\":7,\"active\":false,\"name\":\"owned\"}");
        let value, e = json_codec::deserialize<Item>(source);
        assert(e.len == 0);
        return value;
    }
    var independent = owned();
    assert(independent.name.bytes == "owned");
    independent.name.bytes.push(0xff);
    let bad_out, se = json_codec::serialize(independent);
    assert(bad_out.len == 0 && se.len > 0);

    assert(json_codec::valid_utf8("é😀"));
    assert(!json_codec::valid_utf8([0xc0, 0x80]));
    assert(!json_codec::valid_utf8([0xed, 0xa0, 0x80]));
    assert(!json_codec::valid_utf8([0xf4, 0x90, 0x80, 0x80]));
    assert(!json_codec::valid_utf8([0xe2, 0x82]));
    assert(!json_codec::finite(1.0 / 0.0));
    print("codec tests passed");
}
