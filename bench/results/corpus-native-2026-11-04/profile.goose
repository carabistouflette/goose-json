// SPDX-License-Identifier: Apache-2.0
import json_codec from "../../..";
import json;
import std;
import os;

struct Item { id: i64, active: bool, name: json_codec::Text }
struct Numbers { values: i64[>..] }
struct Floats { values: f64[>..] }
struct Wide { f00: i64, f01: i64, f02: i64, f03: i64, f04: i64, f05: i64, f06: i64, f07: i64, f08: i64, f09: i64, f10: i64, f11: i64, f12: i64, f13: i64, f14: i64, f15: i64 }
struct Context { region: i64, label: json_codec::Text }
root struct Mixed { event_id: i64, active: bool, reading: f64, context: Context, counters: i64[>..], samples: f64[>..], flags: bool[>..], message: json_codec::Text }
let SAMPLES = 7;

fn signed_integer(i: i64) -> i64 { (i + 1) * (if i % 2 == 0 { 1 } else { -1 }) }
fn wide_integer(i: i64) -> i64 {
    let boundaries: i64[9] = [-9223372036854775808, 9223372036854775807, -10000, 10000, -9999, 9999, -1, 0, 1];
    if i < boundaries.len { return boundaries[i]; }
    let magnitude = ((i * 2654435761) % 1000003 + 1) * 1000000000039;
    return magnitude * (if i % 2 == 0 { 1 } else { -1 });
}
fn consume(value: Mixed&) -> i64 { value.event_id % 1024 + value.context.region + value.context.label.bytes.len + value.counters.len + value.samples.len + value.flags.len + value.message.bytes.len }
fn equal(a: Mixed&, b: Mixed&) -> bool {
    if a.event_id != b.event_id || a.active != b.active || float_text::bits_of(a.reading) != float_text::bits_of(b.reading) || a.context.region != b.context.region || a.context.label.bytes != b.context.label.bytes || a.message.bytes != b.message.bytes { return false; }
    if a.counters.len != b.counters.len || a.samples.len != b.samples.len || a.flags.len != b.flags.len { return false; }
    for i in a.counters.len { if a.counters[i] != b.counters[i] { return false; } }
    for i in a.samples.len { if float_text::bits_of(a.samples[i]) != float_text::bits_of(b.samples[i]) { return false; } }
    for i in a.flags.len { if a.flags[i] != b.flags[i] { return false; } }
    return true;
}
fn validate_fixture(name: u8[:], value: Mixed&) {
    assert(value.event_id == 9223372036854775807 && value.active && float_text::bits_of(value.reading) == float_text::bits_of(1.0000000000000002));
    assert(value.context.region == 7 && value.context.label.bytes == "edge/é");
    assert(value.counters.len == 16 && value.samples.len == 32 && value.flags.len == 4);
    for i in value.counters.len { assert(value.counters[i] == wide_integer(i)); }
    for i in value.samples.len { assert(float_text::bits_of(value.samples[i]) == float_text::bits_of((i - 16) / 8.0)); }
    assert(value.flags[0] && !value.flags[1] && value.flags[2] && value.flags[3]);
    var message: u8[>..] = [];
    for i in 16 { message.append("temperature\n\"東京\"\\sensor 😀\t"); }
    assert(value.message.bytes == message);
}

fn consume(value: Item&) -> i64 { value.id + value.name.bytes.len + (if value.active { 1 } else { 0 }) }
fn consume(value: Numbers&) -> i64 { value.values.len + value.values[0] % 1024 + value.values[value.values.len - 1] % 1024 }

fn consume(value: Floats&) -> i64 { value.values.len + ((value.values[0] + value.values[value.values.len - 1]) * 8.0) as! i64 }
fn consume(value: Wide&) -> i64 {
    var sum: i64 = 0;
    const for <N, A> in fields<Wide> { sum += value.A; }
    return sum;
}
fn equal(a: Floats&, b: Floats&) -> bool {
    if a.values.len != b.values.len { return false; }
    for i in a.values.len { if float_text::bits_of(a.values[i]) != float_text::bits_of(b.values[i]) { return false; } }
    return true;
}
fn equal(a: Wide&, b: Wide&) -> bool {
    const for <N, A> in fields<Wide> { if a.A != b.A { return false; } }
    return true;
}
fn validate_fixture(name: u8[:], value: Floats&) {
    assert(value.values.len == 256);
    for i in value.values.len {
        var expected = (i - 128) / 8.0;
        if name == "floats-wide" {
            expected = float_text::ldexp(((i * 2654435761) % 1000003 + 1) / 1000003.0, ((i * 37) % 2045 - 1022) as! i32);
            if i % 2 > 0 { expected = -expected; }
            if i == 0 { expected = 0.125; }
            if i == 255 { expected = 1.25; }
        }
        assert(float_text::bits_of(value.values[i]) == float_text::bits_of(expected));
    }
}
fn validate_fixture(name: u8[:], value: Wide&) {
    var i = 0;
    const for <N, A> in fields<Wide> { assert(value.A == i); i++; }
}

fn equal(a: Item&, b: Item&) -> bool {
    a.id == b.id && a.active == b.active && a.name.bytes[..] == b.name.bytes[..]
}
fn equal(a: Numbers&, b: Numbers&) -> bool {
    if a.values.len != b.values.len { return false; }
    for i in a.values.len { if a.values[i] != b.values[i] { return false; } }
    return true;
}
fn validate_fixture(name: u8[:], value: Item&) {
    assert(value.id == 42 && value.active);
    if name == "plain" { assert(value.name.bytes == "Goose"); }
    else if name == "escaped" { assert(value.name.bytes == "Goose\n\"東京\"😀"); }
    else {
        var expected: u8[>..] = [];
        if name == "text-short" { for i in 8 { expected.append("abcdefgh"); } }
        else if name == "text-ascii" || name == "text-sparse" {
            for i in 1024 { expected.append("abcdefgh"); }
            if name == "text-sparse" {
                expected[1023] = '\n'; expected[4095] = '"';
                expected.append("é😀");
            }
        }
        else { for i in 512 { expected.append("abc\n\"\\\té😀"); } }
        assert(value.name.bytes[..] == expected[..]);
    }
}
fn validate_fixture(name: u8[:], value: Numbers&) {
    assert(value.values.len == 1024);
    for i in value.values.len {
        let expected = if name == "array-signed" { signed_integer(i) } else if name == "array-wide" { wide_integer(i) } else { i };
        assert(value.values[i] == expected);
    }
}

fn decode_batch<T>(text: u8[:], count: i64) -> i64 {
    var checksum = 0;
    for i in count {
        var value = T { .. };
        let error = json_codec::deserialize_into(text, value);
        assert(error.len == 0);
        checksum += consume(value);
    }
    return checksum;
}
fn encode_batch<T>(value: T&, count: i64) -> i64 {
    var checksum = 0;
    for i in count {
        let text, error = json_codec::serialize(value);
        assert(error.len == 0 && text.len > 0);
        checksum += text.len + text[i % text.len];
    }
    return checksum;
}

// Profiling entry: same typed API/preflight, encode only; timings are not reported.
fn profile<T>(name: u8[:], count: i64) {
    var input: u8[>..] = [];
    assert(read_file(str("bench/fixtures/", name, ".json"), input));
    var value = T { .. };
    assert(json_codec::deserialize_into(input, value).len == 0);
    validate_fixture(name, value);
    let encoded, error = json_codec::serialize(value);
    assert(error.len == 0);
    var back = T { .. };
    assert(json_codec::deserialize_into(encoded, back).len == 0 && equal(value, back));
    print(encode_batch(value, count));
}
fn main() {
    var name:     u8[>..] = [];
    var argument: u8[>..] = [];
    assert(arg_count() == 3);
    arg(1, name); arg(2, argument);
    let count, ok = parse_int(argument);
    assert(ok && count > 0 && count <= 10000000);
    if name == "array-signed" || name == "array-wide" { profile<Numbers>(name, count); }
    else if name == "floats" || name == "floats-wide" { profile<Floats>(name, count); }
    else if name == "text-sparse" || name == "text-escaped" { profile<Item>(name, count); }
    else { assert(false); }
}
