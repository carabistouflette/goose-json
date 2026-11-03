// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import os;
struct Item { id: i64, active: bool, name: json_codec::Text }
fn main() {
    var item, error = json_codec::deserialize<Item>("{\"id\":42,\"active\":true,\"name\":\"Goose\"}");
    if error.len > 0 { write_stderr(error); exit(1); }
    let text, write_error = json_codec::serialize(item);
    if write_error.len > 0 { write_stderr(write_error); exit(1); }
    print(text);
}
