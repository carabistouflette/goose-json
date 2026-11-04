// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import json;
import std;
import os;

struct Item { id: i64, active: bool, name: json_codec::Text }
struct Numbers { values: i64[>..] }
struct Floats { values: f64[>..] }
struct Wide { f00: i64, f01: i64, f02: i64, f03: i64, f04: i64, f05: i64, f06: i64, f07: i64, f08: i64, f09: i64, f10: i64, f11: i64, f12: i64, f13: i64, f14: i64, f15: i64 }
let SAMPLES = 7;

fn consume(value: Item&) -> i64 { value.id + value.name.bytes.len + (if value.active { 1 } else { 0 }) }
fn consume(value: Numbers&) -> i64 { value.values.len + value.values[0] + value.values[value.values.len - 1] }

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
    for i in value.values.len { assert(value.values[i] == i); }
}

fn decode_batch<T>(text: u8[:], count: i64) -> i64 {
    var checksum = 0;
    for i in count {
        var value, error = json_codec::deserialize<T>(text);
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

// Untyped, borrowing DOM baseline. It intentionally performs no schema mapping,
// required/unknown/duplicate-field checks, or owned string construction.
fn dom_batch(text: u8[:], count: i64) -> i64 {
    var checksum = 0;
    for i in count {
        var nodes:   json::Node[>..] = [];
        var decoded: u8[>..]         = [];
        let root, error = json::parse(text, nodes, decoded);
        assert(error.len == 0 && root);
        checksum += nodes.len + decoded.len;
    }
    return checksum;
}

fn report(implementation: u8[:], name: u8[:], operation: u8[:], bytes: i64, count: i64, times: f64[:], checksum: i64) {
    var samples = str("<!-- samples | ", implementation, " | ", name, " | ", operation, " | ");
    for t, i in times {
        if i > 0 { samples.append(","); }
        format_flt(samples, t, 3);
    }
    samples.append(" -->");
    print(samples);
    for i in times.len {
        for j in i + 1..times.len {
            if times[j] < times[i] { let t = times[i]; times[i] = times[j]; times[j] = t; }
        }
    }
    var row = str("| ", implementation, " | ", name, " | ", operation, " | ", bytes, " | ", count, " | ");
    format_flt(row, times[times.len / 2], 1);
    row.append(" | "); format_flt(row, times[0], 1);
    row.append("–"); format_flt(row, times[times.len - 1], 1);
    format(row, " | ", checksum, " |");
    print(row);
}

fn benchmark<T>(name: u8[:], count: i64) {
    var input: u8[>..] = [];
    assert(read_file(str("bench/fixtures/", name, ".json"), input));
    var value, error = json_codec::deserialize<T>(input);
    assert(error.len == 0);
    validate_fixture(name, value);
    let encoded, encode_error = json_codec::serialize(value);
    assert(encode_error.len == 0);
    var roundtrip, roundtrip_error = json_codec::deserialize<T>(encoded);
    assert(roundtrip_error.len == 0 && equal(roundtrip, value));
    let warmup = min(count, 1000);
    var decode_checksum = decode_batch<T>(input, warmup);
    var encode_checksum = encode_batch(value, warmup);
    var dom_checksum = dom_batch(input, warmup);
    var decode: f64[SAMPLES] = [0.0; SAMPLES];
    var encode: f64[SAMPLES] = [0.0; SAMPLES];
    var dom:    f64[SAMPLES] = [0.0; SAMPLES];
    for sample in SAMPLES {
        let start_decode = clock_ns();
        decode_checksum += decode_batch<T>(input, count);
        decode[sample] = (clock_ns() - start_decode) / (count as f64);
        let start_encode = clock_ns();
        encode_checksum += encode_batch(value, count);
        encode[sample] = (clock_ns() - start_encode) / (count as f64);
        let start_dom = clock_ns();
        dom_checksum += dom_batch(input, count);
        dom[sample] = (clock_ns() - start_dom) / (count as f64);
    }
    report("goose-json", name, "decode", input.len, count, decode, decode_checksum);
    report("goose-json", name, "encode", encoded.len, count, encode, encode_checksum);
    report("Goose DOM", name, "decode", input.len, count, dom, dom_checksum);
}

fn main() {
    var count: i64 = 100000;
    if arg_count() > 1 {
        var argument: u8[>..] = [];
        arg(1, argument);
        let parsed, ok = parse_int(argument);
        assert(ok && parsed > 0 && parsed <= 10000000);
        count = parsed;
    }
    print("| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |");
    print("| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |");
    benchmark<Item>("plain", count);
    benchmark<Item>("escaped", count);
    benchmark<Numbers>("array", max(1, count / 10));
    benchmark<Floats>("floats", max(1, count / 100));
    benchmark<Floats>("floats-wide", max(1, count / 100));
    benchmark<Item>("text-short", count);
    benchmark<Item>("text-sparse", max(1, count / 100));
    benchmark<Item>("text-ascii", max(1, count / 100));
    benchmark<Item>("text-escaped", max(1, count / 100));
    benchmark<Wide>("wide", max(1, count / 5));
}
