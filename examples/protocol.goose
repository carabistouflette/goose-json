// SPDX-License-Identifier: Apache-2.0
// Validate a single successful JSON-RPC response for the outstanding id.
import json_codec from "..";
import json_codec.protocol;
import std;
import os;

fn main() {
    let response = "{\"jsonrpc\":\"2.0\",\"id\":7,\"result\":null}";
    let names: (const u8[:])[4] = ["jsonrpc", "id", "result", "error"];
    var selected = json_codec::ProtocolResult { .. };
    let error = json_codec::protocol_select(response, names, selected);
    if error.len > 0 { write_stderr(error); exit(1); }
    if !json_codec::protocol_present(selected, 0) || !json_codec::protocol_present(selected, 1) ||
        !json_codec::protocol_present(selected, 2) || json_codec::protocol_present(selected, 3) {
        write_stderr("invalid success envelope\n"); exit(1);
    }
    var version = json_codec::Text { bytes: [] };
    var id: i64 = 0;
    if json_codec::deserialize_into(json_codec::protocol_value(selected, 0), version).len > 0 || version.bytes != "2.0" ||
        json_codec::deserialize_into(json_codec::protocol_value(selected, 1), id).len > 0 || id != 7 {
        write_stderr("unexpected version or id\n"); exit(1);
    }
    print(json_codec::protocol_value(selected, 2));
}
