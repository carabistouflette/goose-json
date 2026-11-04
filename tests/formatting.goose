// SPDX-License-Identifier: Apache-2.0
// Consumer formatting overloads must not affect JSON validity or diagnostics.
import std;
import json_codec from "..";

fn format(out: u8[>..]&, value: const u8[:]) {}
fn format(out: u8[>..]&, value: i64) {}
fn format(out: u8[>..]&, value: u64) {}
fn format(out: u8[>..]&, value: f64) {}
fn format(out: u8[>..]&, value: bool) {}

struct Item { value: i64 }
struct Real { value: f64 }

fn reject(text: u8[:]) {
    let item, error = json_codec::deserialize<Item>(text);
    assert(error.len > 0);
}
fn test_errors() {
    for text in ["", "invalid", "{}", "{\"other\":1}", "{\"value\":1,\"value\":2}",
                 "{\"value\":1}x", "{\"value\":01}", "{\"value\":9223372036854775808}",
                 "{\"value\":1.5}", "{\"value\":true}"] { reject(text); }
    var integer: i64 = 0;
    assert(json_codec::deserialize_into("x", integer) == "json: expected an integer at byte 0");
    var bytes: u8[>..] = [];
    bytes.push(0xff);
    assert(json_codec::deserialize_into(bytes, integer) == "json_codec: invalid UTF-8");
    bytes.resize(json_codec::MAX_INPUT_BYTES + 1, ' ');
    assert(json_codec::deserialize_into(bytes, integer) == "json_codec: input exceeds 1 MiB");
    var number: f64 = 0.0;
    for text in ["1e9999", "1e", "NaN", "01", "1."] {
        assert(json_codec::deserialize_into(text, number).len > 0);
    }
    bytes.clear();
    bytes.resize(json_codec::MAX_NUMBER_BYTES + 1, '1');
    assert(json_codec::deserialize_into(bytes, number).len > 0);
    var invalid = Real { value: 1.0 / 0.0 };
    let text, error = json_codec::serialize(invalid);
    assert(text.len == 0 && error.len > 0);
    invalid.value = 0.0 / 0.0;
    let nan_text, nan_error = json_codec::serialize(invalid);
    assert(nan_text.len == 0 && nan_error.len > 0);
    var invalid_text = json_codec::Text { bytes: [0xff] };
    let encoded, encode_error = json_codec::serialize(invalid_text);
    assert(encoded.len == 0 && encode_error.len > 0);
}
fn test_numbers() {
    var integers: i64[>..] = [-9223372036854775808, -1, 0, 1, 9223372036854775807];
    let text, error = json_codec::serialize(integers);
    assert(error.len == 0 && text == "[-9223372036854775808,-1,0,1,9223372036854775807]");
    var boundaries: i64[>..] = [-10001, -10000, -9999, -1000, -999, -100, -99, -10, -9, -1, 0, 1, 9, 10, 99, 100, 999, 1000, 9999, 10000, 10001];
    let boundary_text, boundary_error = json_codec::serialize(boundaries);
    assert(boundary_error.len == 0 && boundary_text == "[-10001,-10000,-9999,-1000,-999,-100,-99,-10,-9,-1,0,1,9,10,99,100,999,1000,9999,10000,10001]");
    var reals: f64[>..] = [-0.0, 0.0, 1.0, -1.25, 1e-5, 1e16, 1e17, 5e-324, 1.7976931348623157e308];
    let encoded, encode_error = json_codec::serialize(reals);
    assert(encode_error.len == 0 && encoded == "[-0.0,0.0,1.0,-1.25,0.00001,1e16,1e17,5e-324,1.7976931348623157e308]");
    var back: f64[>..] = [];
    assert(json_codec::deserialize_into(encoded, back).len == 0 && back.len == reals.len);
    for i in reals.len { assert(float_text::bits_of(back[i]) == float_text::bits_of(reals[i])); }
    // 1.0000000000000002 needs the portable runtime fallback, beyond the 15-digit path.
    var precise = 1.0000000000000002;
    let precise_text, precise_error = json_codec::serialize(precise);
    assert(precise_error.len == 0 && precise_text == "1.0000000000000002");
    var flag = true;
    let flag_text, flag_error = json_codec::serialize(flag);
    assert(flag_error.len == 0 && flag_text == "true");
}
fn test_integer_paths() {
    // Exercise every fast-path value and both boundaries under hostile hooks.
    for i in -10002..10002 {
        var value = i;
        let text, error = json_codec::serialize(value);
        assert(error.len == 0 && text.len > 0);
        var back: i64 = 0;
        assert(json_codec::deserialize_into(text, back).len == 0 && back == i);
    }
}
fn test_runtime_bounds() {
    var bytes: u8[66] = [0xa5; 66];
    for n in 32 {
        assert(json_codec::runtime_i64(-9223372036854775808, bytes[1..n + 1]) == -1);
        assert(json_codec::runtime_f64(1.7976931348623157e308, bytes[1..n + 1]) == -1);
        for c in bytes { assert(c == 0xa5); }
    }
    let count = json_codec::runtime_i64(-9223372036854775808, bytes[1..33]);
    assert(count == 20 && bytes[1..count + 1] == "-9223372036854775808");
    assert(bytes[0] == 0xa5 && bytes[33] == 0xa5);
    let float_count = json_codec::runtime_f64(1.7976931348623157e308, bytes[1..33]);
    assert(float_count > 0 && float_count <= 32 && bytes[0] == 0xa5 && bytes[33] == 0xa5);
}
fn main() {
    test_errors();
    test_numbers();
    test_integer_paths();
    test_runtime_bounds();
}
