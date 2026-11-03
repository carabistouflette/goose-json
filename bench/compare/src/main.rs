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
trait Consume {
    fn consume(&self) -> i64;
}
impl Consume for Item {
    fn consume(&self) -> i64 {
        self.id + self.name.len() as i64 + i64::from(self.active)
    }
}
impl Consume for Numbers {
    fn consume(&self) -> i64 {
        self.values.len() as i64 + self.values[0] + self.values[self.values.len() - 1]
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
    times.sort_by(f64::total_cmp);
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
    let (times, checksum) = result;
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
    let encoded = serde_json::to_vec(&value).unwrap();
    assert_eq!(serde_json::from_slice::<T>(&encoded).unwrap(), value);
    let wire = value.encode_to_vec();
    assert_eq!(T::decode(wire.as_slice()).unwrap(), value);
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
}
