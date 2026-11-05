// SPDX-License-Identifier: Apache-2.0
import json_codec from "../..";
import std;
import os;

struct Leaf { label: json_codec::Text }
struct Context { region: i64, leaf: Leaf }
root struct Document { id: i64, active: bool, context: Context, values: i64[>..] }

fn encode(value: Document&, count: i64) -> i64, i64 {
    var checksum = 0;
    var size = 0;
    for i in count {
        let text, error = json_codec::serialize(value);
        assert(error.len == 0 && text.len > 0);
        size = text.len;
        checksum += text.len + text[i % text.len];
    }
    return size, checksum;
}
fn main() {
    assert(arg_count() == 5);
    var mode:     u8[>..] = []; arg(1, mode);
    var kind:     u8[>..] = []; arg(2, kind);
    var argument: u8[>..] = []; arg(3, argument);
    let repeats, valid = parse_int(argument);
    assert(valid && repeats >= 0 && repeats <= 4194304);
    argument.clear(); arg(4, argument);
    var value = Document { .. };
    value.id = 42; value.active = true; value.context.region = 7;
    value.values.append([0, -1, 9223372036854775807, -9223372036854775808]);
    let unit = if kind == "ascii" { "a" } else if kind == "unicode" { "é😀" } else { "\0\n\"\\\t" };
    assert(kind == "ascii" || kind == "unicode" || kind == "escapes");
    for i in repeats { value.context.leaf.label.bytes.append(unit); }
    if mode == "validate" {
        let text, error = json_codec::serialize(value);
        assert(error.len == 0 && write_file(argument, text));
        var decoded = Document { .. };
        let failure = json_codec::deserialize_into(text, decoded);
        if text.len > json_codec::MAX_INPUT_BYTES { assert(failure.len > 0); }
        else {
            assert(failure.len == 0 && decoded.id == value.id && decoded.active == value.active);
            assert(decoded.context.region == value.context.region);
            assert(decoded.context.leaf.label.bytes == value.context.leaf.label.bytes);
            assert(decoded.values == value.values);
        }
        value.context.leaf.label.bytes.push(0xff);
        let rejected, invalid = json_codec::serialize(value);
        assert(rejected.len == 0 && invalid.len > 0);
        return;
    }
    let count, ok = parse_int(argument);
    assert(ok && count >= 1 && count <= 2000);
    if mode == "memory" {
        assert(count == 1);
        let size, checksum = encode(value, count);
        print(str(size, ",", checksum));
        return;
    }
    assert(mode == "timing");
    encode(value, 3);
    let started = clock_ns();
    let size, checksum = encode(value, count);
    let elapsed = clock_ns() - started;
    print(str(size, ",", checksum, ",", elapsed));
}
