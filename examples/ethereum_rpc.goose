// SPDX-License-Identifier: Apache-2.0
// Read the current Ethereum block number from one JSON-RPC endpoint.
import json_codec from "carabistouflette/goose-json@fcee7b75658a5708756dc163127b70df656996a4";
import json_codec.protocol;
import http from "carabistouflette/goose-http@c2310d8403d93b24b65eb45e9dae11e36183514d";
import std;
import os;

fn fail(message: const u8[:]) {
    write_stderr(message); write_stderr("\n"); exit(1);
}
fn quantity(value: const u8[:]) -> bool {
    if value.len < 3 || value.len > 66 || value[0] != '0' || value[1] != 'x' { return false; }
    if value.len > 3 && value[2] == '0' { return false; }
    for c in value[2..] {
        if !((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f')) { return false; }
    }
    return true;
}
fn main() {
    let argv = args();
    if argv.len < 2 || argv.len > 3 { fail("usage: ethereum_rpc URL [--allow-http]"); }
    let allow_http = argv.len == 3 && argv[2] == "--allow-http";
    if argv.len == 3 && !allow_http { fail("unknown option"); }
    let request = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"eth_blockNumber\",\"params\":[]}";
    let headers = [http::Header { name: "Content-Type", value: "application/json" }];
    let options = http::Options { method: http::Method.Post, headers: headers[..], body: request,
        timeout_ms: 10000, body_limit: 524288, header_limit: 16384, allow_http: allow_http, .. };
    var body:             u8[>..] = [];
    var response_headers: u8[>..] = [];
    let status = http::request(argv[1], options, body, response_headers);
    if status.error != http::Error.None { fail("HTTP transport failed"); }
    if !http::success(status) { fail("HTTP response was not successful"); }

    let fields: (const u8[:])[4] = ["jsonrpc", "id", "result", "error"];
    var selected = json_codec::ProtocolResult { .. };
    if json_codec::protocol_select(body, fields, selected).len > 0 { fail("invalid JSON response"); }
    if !json_codec::protocol_present(selected, 0) || !json_codec::protocol_present(selected, 1) ||
        json_codec::protocol_present(selected, 2) == json_codec::protocol_present(selected, 3) {
        fail("invalid JSON-RPC envelope");
    }
    var version = json_codec::Text { bytes: [] };
    var id: i64 = 0;
    if json_codec::deserialize_into(json_codec::protocol_value(selected, 0), version).len > 0 || version.bytes != "2.0" ||
        json_codec::deserialize_into(json_codec::protocol_value(selected, 1), id).len > 0 || id != 1 {
        fail("unexpected JSON-RPC version or id");
    }
    if json_codec::protocol_present(selected, 3) {
        let error_fields: (const u8[:])[2] = ["code", "message"];
        var error = json_codec::ProtocolResult { .. };
        if json_codec::protocol_select(json_codec::protocol_value(selected, 3), error_fields, error).len > 0 ||
            !json_codec::protocol_present(error, 0) || !json_codec::protocol_present(error, 1) {
            fail("invalid JSON-RPC error");
        }
        var code: i64 = 0;
        var message = json_codec::Text { bytes: [] };
        if json_codec::deserialize_into(json_codec::protocol_value(error, 0), code).len > 0 ||
            json_codec::deserialize_into(json_codec::protocol_value(error, 1), message).len > 0 {
            fail("invalid JSON-RPC error");
        }
        // The error's exact JSON bytes are hex encoded so even Unicode
        // display controls cannot change a terminal's rendering.
        let raw_error = json_codec::protocol_value(selected, 3);
        let digits = "0123456789abcdef";
        var hex: u8[>..] = [];
        for c in raw_error { hex.push(digits[c / 16]); hex.push(digits[c % 16]); }
        write_stderr("JSON-RPC error code ");
        write_stderr(json_codec::protocol_value(error, 0));
        write_stderr("; error JSON in hex: "); write_stderr(hex); write_stderr("\n");
        exit(2);
    }
    if json_codec::protocol_value(selected, 2) == "null" { fail("JSON-RPC result is null"); }
    var block_value = json_codec::Text { bytes: [] };
    if json_codec::deserialize_into(json_codec::protocol_value(selected, 2), block_value).len > 0 || !quantity(block_value.bytes) {
        fail("invalid Ethereum block quantity");
    }
    print(block_value.bytes);
}
