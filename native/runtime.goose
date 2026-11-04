// SPDX-License-Identifier: Apache-2.0
namespace json_codec;
extern fn runtime_i64(value: i64, out: u8[:]) -> i64 = "gj_runtime_i64";
extern fn runtime_f64(value: f64, out: u8[:]) -> i64 = "gj_runtime_f64";
