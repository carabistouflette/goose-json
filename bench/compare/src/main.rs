// SPDX-License-Identifier: Apache-2.0
use prost::Message;
use serde::{de::DeserializeOwned, Deserialize, Serialize};
use std::{hint::black_box, time::Instant};

#[derive(Clone, PartialEq, Message, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
struct Item {
    #[prost(int64, tag = "1")]
    id: i64,
    #[prost(bool, tag = "2")]
    active: bool,
    #[prost(string, tag = "3")]
    name: String,
}
#[derive(Clone, PartialEq, Message, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
struct Numbers {
    #[prost(int64, repeated, packed = "true", tag = "1")]
    values: Vec<i64>,
}
#[derive(Clone, PartialEq, Message, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
struct Floats {
    #[prost(double, repeated, packed = "true", tag = "1")]
    values: Vec<f64>,
}
#[derive(Clone, PartialEq, Message, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
struct Wide {
    #[prost(int64, tag = "1")]
    f00: i64,
    #[prost(int64, tag = "2")]
    f01: i64,
    #[prost(int64, tag = "3")]
    f02: i64,
    #[prost(int64, tag = "4")]
    f03: i64,
    #[prost(int64, tag = "5")]
    f04: i64,
    #[prost(int64, tag = "6")]
    f05: i64,
    #[prost(int64, tag = "7")]
    f06: i64,
    #[prost(int64, tag = "8")]
    f07: i64,
    #[prost(int64, tag = "9")]
    f08: i64,
    #[prost(int64, tag = "10")]
    f09: i64,
    #[prost(int64, tag = "11")]
    f10: i64,
    #[prost(int64, tag = "12")]
    f11: i64,
    #[prost(int64, tag = "13")]
    f12: i64,
    #[prost(int64, tag = "14")]
    f13: i64,
    #[prost(int64, tag = "15")]
    f14: i64,
    #[prost(int64, tag = "16")]
    f15: i64,
}
#[derive(Clone, PartialEq, Message, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
struct Context {
    #[prost(int64, tag = "1")]
    region: i64,
    #[prost(string, tag = "2")]
    label: String,
}
#[derive(Clone, PartialEq, Message, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
struct Mixed {
    #[prost(int64, tag = "1")]
    event_id: i64,
    #[prost(bool, tag = "2")]
    active: bool,
    #[prost(double, tag = "3")]
    reading: f64,
    #[prost(message, required, tag = "4")]
    context: Context,
    #[prost(int64, repeated, packed = "true", tag = "5")]
    counters: Vec<i64>,
    #[prost(double, repeated, packed = "true", tag = "6")]
    samples: Vec<f64>,
    #[prost(bool, repeated, packed = "true", tag = "7")]
    flags: Vec<bool>,
    #[prost(string, tag = "8")]
    message: String,
}
fn wide_integer(i: usize) -> i64 {
    const BOUNDARIES: [i64; 9] = [i64::MIN, i64::MAX, -10000, 10000, -9999, 9999, -1, 0, 1];
    if i < BOUNDARIES.len() {
        return BOUNDARIES[i];
    }
    let magnitude = ((i as i64 * 2654435761) % 1000003 + 1) * 1000000000039;
    magnitude * if i % 2 == 0 { 1 } else { -1 }
}
impl Consume for Mixed {
    fn consume(&self) -> i64 {
        self.event_id.rem_euclid(1024)
            + self.context.region
            + self.context.label.len() as i64
            + self.counters.len() as i64
            + self.samples.len() as i64
            + self.flags.len() as i64
            + self.message.len() as i64
    }
    fn same(&self, other: &Self) -> bool {
        self == other
            && self.reading.to_bits() == other.reading.to_bits()
            && self
                .samples
                .iter()
                .zip(&other.samples)
                .all(|(a, b)| a.to_bits() == b.to_bits())
    }
    fn validate(&self, _name: &str) {
        assert_eq!(self.event_id, i64::MAX);
        assert!(self.active);
        assert_eq!(self.reading.to_bits(), 1.0000000000000002f64.to_bits());
        assert_eq!(
            (self.context.region, self.context.label.as_str()),
            (7, "edge/é")
        );
        assert_eq!(self.counters, (0..16).map(wide_integer).collect::<Vec<_>>());
        assert_eq!(self.samples.len(), 32);
        for (i, value) in self.samples.iter().enumerate() {
            assert_eq!(value.to_bits(), ((i as f64 - 16.0) / 8.0).to_bits());
        }
        assert_eq!(self.flags, [true, false, true, true]);
        assert_eq!(
            self.message,
            "temperature\n\"東京\"\\sensor 😀\t".repeat(16)
        );
    }
}
impl Consume for Floats {
    fn same(&self, other: &Self) -> bool {
        self.values.len() == other.values.len()
            && self
                .values
                .iter()
                .zip(&other.values)
                .all(|(a, b)| a.to_bits() == b.to_bits())
    }
    fn validate(&self, name: &str) {
        assert_eq!(self.values.len(), 256);
        for (i, v) in self.values.iter().enumerate() {
            let mut expected = (i as f64 - 128.0) / 8.0;
            if name == "floats-wide" {
                let exponent = (i * 37) % 2045;
                let power = f64::from_bits(((exponent + 1) as u64) << 52);
                expected = (((i * 2654435761) % 1000003 + 1) as f64 / 1000003.0) * power;
                if i % 2 > 0 {
                    expected = -expected;
                }
                if i == 0 {
                    expected = 0.125;
                }
                if i == 255 {
                    expected = 1.25;
                }
            }
            assert_eq!(v.to_bits(), expected.to_bits());
        }
    }
    fn consume(&self) -> i64 {
        self.values.len() as i64
            + ((self.values[0] + self.values[self.values.len() - 1]) * 8.0) as i64
    }
}
impl Consume for Wide {
    fn validate(&self, _name: &str) {
        assert_eq!(
            [
                self.f00, self.f01, self.f02, self.f03, self.f04, self.f05, self.f06, self.f07,
                self.f08, self.f09, self.f10, self.f11, self.f12, self.f13, self.f14, self.f15
            ],
            std::array::from_fn(|i| i as i64)
        );
    }
    fn consume(&self) -> i64 {
        self.f00
            + self.f01
            + self.f02
            + self.f03
            + self.f04
            + self.f05
            + self.f06
            + self.f07
            + self.f08
            + self.f09
            + self.f10
            + self.f11
            + self.f12
            + self.f13
            + self.f14
            + self.f15
    }
}
trait Consume: PartialEq {
    fn consume(&self) -> i64;
    fn validate(&self, name: &str);
    fn same(&self, other: &Self) -> bool {
        self == other
    }
}
impl Consume for Item {
    fn validate(&self, name: &str) {
        assert_eq!(self.id, 42);
        assert!(self.active);
        let expected = match name {
            "plain" => "Goose".to_owned(),
            "escaped" => "Goose\n\"東京\"😀".to_owned(),
            "text-short" => "abcdefgh".repeat(8),
            "text-ascii" => "abcdefgh".repeat(1024),
            "text-sparse" => {
                let mut text = "abcdefgh".repeat(1024).into_bytes();
                text[1023] = b'\n';
                text[4095] = b'"';
                text.extend_from_slice("é😀".as_bytes());
                String::from_utf8(text).unwrap()
            }
            "text-escaped" => "abc\n\"\\\té😀".repeat(512),
            _ => panic!("unknown item fixture: {name}"),
        };
        assert_eq!(self.name, expected);
    }
    fn consume(&self) -> i64 {
        self.id + self.name.len() as i64 + i64::from(self.active)
    }
}
impl Consume for Numbers {
    fn validate(&self, name: &str) {
        assert_eq!(self.values.len(), 1024);
        for (i, value) in self.values.iter().enumerate() {
            let expected = match name {
                "array" => i as i64,
                "array-signed" => (i as i64 + 1) * if i % 2 == 0 { 1 } else { -1 },
                "array-wide" => wide_integer(i),
                _ => panic!("unknown integer fixture: {name}"),
            };
            assert_eq!(*value, expected);
        }
    }
    fn consume(&self) -> i64 {
        self.values.len() as i64
            + self.values[0].rem_euclid(1024)
            + self.values[self.values.len() - 1].rem_euclid(1024)
    }
}
fn measure(mut operation: impl FnMut(usize) -> i64, count: usize) -> ([f64; 7], i64) {
    let mut checksum = 0;
    for i in 0..count.min(1000) {
        checksum += black_box(operation(i));
    }
    let mut times = [0.0; 7];
    for time in &mut times {
        let start = Instant::now();
        for i in 0..count {
            checksum += black_box(operation(i));
        }
        *time = start.elapsed().as_nanos() as f64 / count as f64;
    }
    (times, checksum)
}
fn report(
    implementation: &str,
    name: &str,
    operation: &str,
    bytes: usize,
    count: usize,
    result: ([f64; 7], i64),
) {
    let (mut times, checksum) = result;
    println!(
        "<!-- samples | {implementation} | {name} | {operation} | {} -->",
        times
            .iter()
            .map(|t| format!("{t:.3}"))
            .collect::<Vec<_>>()
            .join(",")
    );
    times.sort_by(f64::total_cmp);
    println!("| {implementation} | {name} | {operation} | {bytes} | {count} | {:.1} | {:.1}–{:.1} | {checksum} |", times[3], times[0], times[6]);
}
fn benchmark<
    T: Message + Default + Serialize + DeserializeOwned + Consume + PartialEq + std::fmt::Debug,
>(
    name: &str,
    count: usize,
) {
    let input = std::fs::read(format!("bench/fixtures/{name}.json")).unwrap();
    let value: T = serde_json::from_slice(&input).unwrap();
    value.validate(name);
    let encoded = serde_json::to_vec(&value).unwrap();
    assert!(
        value.same(&serde_json::from_slice::<T>(&encoded).unwrap()),
        "serde roundtrip: {name}"
    );
    let sonic_encoded = sonic_rs::to_vec(&value).unwrap();
    assert!(
        value.same(&sonic_rs::from_slice::<T>(&input).unwrap()),
        "sonic input: {name}"
    );
    assert!(
        value.same(&sonic_rs::from_slice::<T>(&sonic_encoded).unwrap()),
        "sonic roundtrip: {name}"
    );
    let wire = value.encode_to_vec();
    assert!(
        value.same(&T::decode(wire.as_slice()).unwrap()),
        "protobuf roundtrip: {name}"
    );
    report(
        "serde_json",
        name,
        "decode",
        input.len(),
        count,
        measure(
            |_| {
                let decoded: T = serde_json::from_slice(black_box(&input)).unwrap();
                decoded.consume()
            },
            count,
        ),
    );
    report(
        "serde_json",
        name,
        "encode",
        encoded.len(),
        count,
        measure(
            |i| {
                let text = serde_json::to_vec(black_box(&value)).unwrap();
                text.len() as i64 + i64::from(text[i % text.len()])
            },
            count,
        ),
    );
    report(
        "sonic-rs",
        name,
        "decode",
        input.len(),
        count,
        measure(
            |_| {
                let decoded: T = sonic_rs::from_slice(black_box(&input)).unwrap();
                decoded.consume()
            },
            count,
        ),
    );
    report(
        "sonic-rs",
        name,
        "encode",
        sonic_encoded.len(),
        count,
        measure(
            |i| {
                let text = sonic_rs::to_vec(black_box(&value)).unwrap();
                text.len() as i64 + i64::from(text[i % text.len()])
            },
            count,
        ),
    );
    report(
        "prost (binary)",
        name,
        "decode",
        wire.len(),
        count,
        measure(
            |_| {
                let decoded = T::decode(black_box(wire.as_slice())).unwrap();
                decoded.consume()
            },
            count,
        ),
    );
    report(
        "prost (binary)",
        name,
        "encode",
        wire.len(),
        count,
        measure(
            |i| {
                let text = black_box(&value).encode_to_vec();
                text.len() as i64 + i64::from(text[i % text.len()])
            },
            count,
        ),
    );
}
fn main() {
    let count: usize = std::env::args()
        .nth(1)
        .map(|s| s.parse().expect("positive iteration count"))
        .unwrap_or(100_000);
    assert!((1..=10_000_000).contains(&count));
    println!("| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |");
    println!("| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |");
    benchmark::<Item>("plain", count);
    benchmark::<Item>("escaped", count);
    benchmark::<Numbers>("array", (count / 10).max(1));
    benchmark::<Numbers>("array-signed", (count / 10).max(1));
    benchmark::<Numbers>("array-wide", (count / 10).max(1));
    benchmark::<Mixed>("mixed", (count / 10).max(1));
    benchmark::<Floats>("floats", (count / 100).max(1));
    benchmark::<Floats>("floats-wide", (count / 100).max(1));
    benchmark::<Item>("text-short", count);
    benchmark::<Item>("text-sparse", (count / 100).max(1));
    benchmark::<Item>("text-ascii", (count / 100).max(1));
    benchmark::<Item>("text-escaped", (count / 100).max(1));
    benchmark::<Wide>("wide", (count / 5).max(1));
}
