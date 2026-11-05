// SPDX-License-Identifier: Apache-2.0
import json_codec from "..";
import os;

root struct Batch { name: json_codec::Text, values: i64[>..] }
fn main() {
    var batch = Batch { .. };
    let error = json_codec::deserialize_into("{\"name\":\"batch\",\"values\":[1,-2,3]}", batch);
    if error.len > 0 { write_stderr(error); exit(1); }
    assert(batch.name.bytes == "batch" && batch.values.len == 3 && batch.values[1] == -2);

    var numbers: i64[>..] = [];
    let array_error = json_codec::deserialize_into("[4,5]", numbers);
    if array_error.len > 0 { write_stderr(array_error); exit(1); }
    assert(numbers.len == 2 && numbers[0] == 4 && numbers[1] == 5);
    let text, write_error = json_codec::serialize(batch);
    if write_error.len > 0 { write_stderr(write_error); exit(1); }
    print(text);
}
