// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import std;
import json;
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
fn test_records_and_arrays() {
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
    assert(data.numbers[0] == -9223372036854775808 && data.numbers[1] == 9223372036854775807);
    assert(data.flags.len == 2 && data.flags[0] && !data.flags[1]);
    assert(data.scores.len == 2 && data.scores[0] == 1.25 && data.scores[1] == -200.0);
    let encoded, ee = json_codec::serialize(data);
    assert(ee.len == 0);
    var decoded = Data { .. };
    let re = json_codec::deserialize_into(encoded, decoded);
    assert(re.len == 0 && decoded.scores[1] == -200.0);
    assert(decoded.numbers.len == 2 && decoded.numbers[0] == data.numbers[0] && decoded.numbers[1] == data.numbers[1]);
    assert(decoded.flags.len == 2 && decoded.flags[0] && !decoded.flags[1]);
    assert(decoded.scores.len == 2 && decoded.scores[0] == data.scores[0]);
    assert(json_codec::deserialize_into(encoded, decoded).len == 0);
    assert(decoded.numbers.len == 2 && decoded.flags.len == 2 && decoded.scores.len == 2);
    assert(json_codec::deserialize_into("{\"point\":{\"x\":0,\"y\":0},\"numbers\":[],\"flags\":[],\"scores\":[]}", decoded).len == 0);
    assert(decoded.numbers.len == 0 && decoded.flags.len == 0 && decoded.scores.len == 0);
    let empty, em = json_codec::deserialize<Empty>("{}");
    assert(em.len == 0);
    let escaped, ke = json_codec::deserialize<Item>("{\"\\u0069d\":1,\"active\":false,\"name\":\"\"}");
    assert(ke.len == 0 && escaped.id == 1);
}

fn test_rejections_and_reuse() {
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
}

fn test_number_limits() {
    // Regressions: bound numeric work before the standard reader, which
    // otherwise mishandles saturated exponents and has quadratic conversion.
    var huge_number = str("{\"value\":1.");
    for i in 499999 { huge_number.push('0'); }
    huge_number.append("1}");
    let huge_value, huge_error = json_codec::deserialize<Float>(huge_number);
    assert(huge_error.len > 0);
    var compensated = str("{\"value\":0.");
    for i in 999999 { compensated.push('0'); }
    compensated.append("1e1000000}");
    let compensated_value, compensated_error = json_codec::deserialize<Float>(compensated);
    assert(compensated_error.len > 0);
    let underflow, underflow_error = json_codec::deserialize<Float>("{\"value\":1e-9999}");
    assert(underflow_error.len == 0 && underflow.value == 0.0);
    var boundary = str("{\"value\":1.");
    for i in 126 { boundary.push('0'); }
    boundary.push('}');
    let at_limit, at_error = json_codec::deserialize<Float>(boundary);
    assert(at_error.len == 0 && at_limit.value == 1.0);
    boundary.pop(); boundary.append("0}");
    let over_limit, over_error = json_codec::deserialize<Float>(boundary);
    assert(over_error.len > 0);
    var integer:      i64     = 0;
    var long_integer: u8[>..] = [];
    for i in 100000 { long_integer.push('9'); }
    assert(json_codec::deserialize_into(long_integer, integer).len > 0);

    var maximum = Float { value: 1.7976931348623157e308 };
    let max_text, max_write_error = json_codec::serialize(maximum);
    assert(max_write_error.len == 0);
    let max_back, max_read_error = json_codec::deserialize<Float>(max_text);
    assert(max_read_error.len == 0 && max_back.value == maximum.value);
    var minimum = Float { value: 5e-324 };
    let min_text, min_write_error = json_codec::serialize(minimum);
    assert(min_write_error.len == 0);
    let min_back, min_read_error = json_codec::deserialize<Float>(min_text);
    assert(min_read_error.len == 0 && min_back.value == minimum.value);
}

fn test_owned_text() {
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
}

fn test_utf8_validation() {
    assert(json_codec::valid_utf8("é😀"));
    assert(!json_codec::valid_utf8([0xc0, 0x80]));
    assert(!json_codec::valid_utf8([0xed, 0xa0, 0x80]));
    assert(!json_codec::valid_utf8([0xf4, 0x90, 0x80, 0x80]));
    assert(!json_codec::valid_utf8([0xe2, 0x82]));
    assert(!json_codec::finite(1.0 / 0.0));
    // The ASCII word path must handle UTF-8 and invalid bytes at every alignment.
    for offset in 16 {
        var aligned: u8[>..] = [];
        for i in offset { aligned.push('a'); }
        aligned.append("é😀abcdefghijklmnop");
        assert(json_codec::valid_utf8(aligned));
        var bad_aligned: u8[>..] = [];
        for i in offset { bad_aligned.push('a'); }
        bad_aligned.append([0xed, 0xa0, 0x80]);
        bad_aligned.append("abcdefghijklmnop");
        assert(!json_codec::valid_utf8(bad_aligned));
    }
}

fn test_prefix_scanner() {
    // Differential-check the word scan against a scalar reference at each
    // byte alignment, including controls, quotes, backslashes and high bytes.
    for offset in 40 {
        for byte in 256 {
            var input: u8[>..] = [];
            for i in offset { input.push('a'); }
            input.push(byte as! u8);
            input.append("abcdefghijklmnopqrstuvwxyz0123456789");
            let end, ascii = json_codec::plain_prefix(input, 0);
            var expected = 0;
            var expected_ascii = true;
            for c in input {
                if c < 0x20 || c == '"' || c == '\\' { break; }
                if c >= 0x80 { expected_ascii = false; }
                expected++;
            }
            assert(end == expected && ascii == expected_ascii);
        }
    }
    // Nonzero starts, adjacent special/high bytes, and every short tail.
    var mixed: u8[>..] = [];
    for i in 3 { mixed.append("a\0\"\\\n é😀abcdefghijklmnopqrstuvwxyz"); }
    for at in mixed.len + 1 {
        let end, ascii = json_codec::plain_prefix(mixed, at);
        var expected = at;
        var expected_ascii = true;
        for c in mixed[at..] {
            if c < 0x20 || c == '"' || c == '\\' { break; }
            if c >= 0x80 { expected_ascii = false; }
            expected++;
        }
        assert(end == expected && ascii == expected_ascii);
    }
}

fn test_text_encoding() {
    // The fused writer must preserve standard JSON escaping byte-for-byte.
    for byte in 128 {
        var value = json_codec::Text { bytes: [] };
        value.bytes.append("abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789");
        value.bytes.push(byte as! u8);
        value.bytes.append("é😀\n\"\\");
        var expected: u8[>..] = [];
        json::format_string(expected, value.bytes);
        let actual, error = json_codec::serialize(value);
        assert(error.len == 0 && actual[..] == expected[..]);
        var decoded = json_codec::Text { bytes: [] };
        assert(json_codec::deserialize_into(actual, decoded).len == 0);
        assert(decoded.bytes[..] == value.bytes[..]);
    }
}

fn test_integers() {
    // Integer fast path: exact boundaries, signs, grammar and owned API calls.
    let boundaries: i64[7] = [-9223372036854775808, -9223372036854775807, -1, 0, 1, 9223372036854775806, 9223372036854775807];
    for expected in boundaries {
        var actual: i64 = 0;
        assert(json_codec::deserialize_into(str(expected), actual).len == 0 && actual == expected);
    }
    for i in 10000 {
        let expected = (i * 2654435761) % 1000000000000 - 500000000000;
        var actual: i64 = 0;
        assert(json_codec::deserialize_into(str(" ", expected, "\t"), actual).len == 0 && actual == expected);
    }
    let invalid_integers: const u8[:][16] = ["", "-", "+1", "00", "-01", "1.0", "1e0", "1E0", "--1", "1-1", "1+1", "1 2", "9223372036854775808", "-9223372036854775809", "18446744073709551615", "-18446744073709551616"];
    for input in invalid_integers {
        var actual: i64 = 0;
        assert(json_codec::deserialize_into(input, actual).len > 0);
    }
}

fn test_float_chunks() {
    // Float layout, signed zero, chunk boundaries and public API round-trips.
    let float_inputs: const u8[:][10] = ["0.0", "-0.0", "1e-5", "1e-6", "1e15", "1e16", "5e-324", "2.2250738585072014e-308", "1.7976931348623157e308", "1.0000000000000002"];
    for input in float_inputs {
        var value: f64 = 0.0;
        assert(json_codec::deserialize_into(input, value).len == 0);
        let text, error = json_codec::serialize(value);
        assert(error.len == 0);
        var back: f64 = 0.0;
        assert(json_codec::deserialize_into(text, back).len == 0);
        assert(float_text::bits_of(value) == float_text::bits_of(back));
    }
    for count in 130 {
        var values: f64[>..] = [];
        for i in count { values.push((i - 64) / 8.0); }
        let text, error = json_codec::serialize(values);
        assert(error.len == 0);
        var back: f64[>..] = [];
        assert(json_codec::deserialize_into(text, back).len == 0 && back.len == count);
        for i in count { assert(back[i] == values[i]); }
    }
    var bad_chunk: f64[>..] = [];
    for i in 65 { bad_chunk.push(1.0); }
    bad_chunk.push(1.0 / 0.0);
    let no_text, bad_chunk_error = json_codec::serialize(bad_chunk);
    assert(no_text.len == 0 && bad_chunk_error.len > 0);
    let bad_float_arrays: const u8[:][10] = ["[1,]", "[,1]", "[01]", "[1.00000000000000001,]", "[1e9999]", "[nan]", "[1e+]", "[1.25 2.5]", "[1]true", "[1.]"];
    for input in bad_float_arrays {
        var values: f64[>..] = [];
        assert(json_codec::deserialize_into(input, values).len > 0);
    }
    var underflow_values: f64[>..] = [];
    assert(json_codec::deserialize_into("[1.25,-1e-9999,2.5]", underflow_values).len == 0);
    assert(underflow_values.len == 3 && float_text::bits_of(underflow_values[1]) == float_text::bits_of(-0.0));
    // An uncommon conversion after completed batches must restart the array
    // without retaining previously appended native values.
    for count in [64, 65, 128, 129] {
        var input = str("[");
        for i in count { input.append(str(i + 1, ",")); }
        input.append("-1e-9999,2.5]");
        var values: f64[>..] = [];
        assert(json_codec::deserialize_into(input, values).len == 0);
        assert(values.len == count + 2);
        for i in count { assert(values[i] == (i + 1)); }
        assert(float_text::bits_of(values[count]) == float_text::bits_of(-0.0));
        assert(values[count + 1] == 2.5);
        input.pop(); input.append(",]");
        assert(json_codec::deserialize_into(input, values).len > 0);
    }
}

fn test_text_chunk_boundaries() {
    // Escapes and surrogate pairs straddle native block/output boundaries.
    for offset in 96 {
        var value = json_codec::Text { bytes: [] };
        for i in 4090 + offset { value.bytes.push('a'); }
        value.bytes.append("\n\"\\é😀");
        // Keep multiple escape chunks even when the large prefix is reused.
        for i in 4090 + offset { value.bytes.push('b'); }
        value.bytes.append("\n\"\\é😀");
        let text, error = json_codec::serialize(value);
        var expected: u8[>..] = [];
        json::format_string(expected, value.bytes);
        assert(error.len == 0 && text[..] == expected[..]);
        var back = json_codec::Text { bytes: [] };
        assert(json_codec::deserialize_into(text, back).len == 0 && back.bytes[..] == value.bytes[..]);
        // Prefix reuse must not skip invalid bytes after the first escape.
        value.bytes.push(0xff);
        let invalid, invalid_error = json_codec::serialize(value);
        assert(invalid.len == 0 && invalid_error.len > 0);
    }
}

fn main() {
    test_records_and_arrays();
    test_rejections_and_reuse();
    test_number_limits();
    test_owned_text();
    test_utf8_validation();
    test_prefix_scanner();
    test_text_encoding();
    test_integers();
    test_float_chunks();
    test_text_chunk_boundaries();
    print("codec tests passed");
}
