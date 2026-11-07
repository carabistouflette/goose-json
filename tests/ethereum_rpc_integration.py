#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Exercise the Ethereum consumer against an actual local HTTP server."""
import http.server
import json
import os
from pathlib import Path
import subprocess
import sys
import threading
import unittest

BINARY = str(Path(sys.argv[1]).resolve())
sys.argv = sys.argv[:1]
REQUEST = {"jsonrpc": "2.0", "id": 1, "method": "eth_blockNumber", "params": []}


class Handler(http.server.BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"
    fixtures = {}
    requests = []

    def log_message(self, *args):
        pass

    def do_POST(self):
        length = int(self.headers.get("Content-Length", "0"))
        body = self.rfile.read(length)
        self.requests.append((self.path, self.headers.get("Content-Type"), body))
        status, response, extra = self.fixtures[self.path]
        self.send_response(status)
        truncate = extra.get("X-Test-Truncate") == "yes"
        for key, value in extra.items():
            if key != "X-Test-Truncate":
                self.send_header(key, value)
        self.send_header("Content-Length", str(len(response) + (1 if truncate else 0)))
        if truncate:
            self.close_connection = True
        self.end_headers()
        try:
            self.wfile.write(response)
        except (BrokenPipeError, ConnectionResetError):
            pass


class ConsumerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.server = http.server.ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        cls.server.daemon_threads = True
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()
        cls.base = f"http://127.0.0.1:{cls.server.server_port}"

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=5)

    def setUp(self):
        Handler.fixtures.clear()
        Handler.requests.clear()

    def request(self, body, status=200, extra=None, allow_http=True):
        Handler.fixtures["/rpc"] = (status, body, extra or {})
        env = os.environ.copy()
        env.update({"HTTP_PROXY": "http://127.0.0.1:1", "HTTPS_PROXY": "http://127.0.0.1:1",
                    "ALL_PROXY": "http://127.0.0.1:1", "NO_PROXY": ""})
        args = [BINARY, self.base + "/rpc"]
        if allow_http:
            args.append("--allow-http")
        result = subprocess.run(args, capture_output=True, timeout=20, env=env)
        if allow_http:
            self.assertEqual(len(Handler.requests), 1)
            path, content_type, payload = Handler.requests[0]
            self.assertEqual(path, "/rpc")
            self.assertEqual(content_type, "application/json")
            self.assertEqual(json.loads(payload), REQUEST)
        else:
            self.assertEqual(Handler.requests, [])
        return result

    def test_success_and_quantity(self):
        for quantity in ["0x0", "0x123abc", "0x" + "f" * 64]:
            with self.subTest(quantity=quantity):
                Handler.requests.clear()
                data = json.dumps({"jsonrpc": "2.0", "id": 1, "result": quantity}).encode()
                result = self.request(data)
                self.assertEqual((result.returncode, result.stdout, result.stderr),
                                 (0, (quantity + "\n").encode(), b""))
        Handler.requests.clear()
        result = self.request(b'{"jsonrpc":"\\u0032.0","id":1,"result":"0x\\u0031"}')
        self.assertEqual((result.returncode, result.stdout), (0, b"0x1\n"))

    def test_invalid_envelopes_and_results(self):
        cases = [
            b'{}', b'{"id":1,"result":"0x1"}',
            b'{"jsonrpc":"1.0","id":1,"result":"0x1"}',
            b'{"jsonrpc":"2.0","result":"0x1"}',
            b'{"jsonrpc":"2.0","id":2,"result":"0x1"}',
            b'{"jsonrpc":"2.0","id":null,"result":"0x1"}',
            b'{"jsonrpc":"2.0","id":"1","result":"0x1"}',
            b'{"jsonrpc":"2.0","id":1.0,"result":"0x1"}',
            b'{"jsonrpc":"2.0","id":1}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x1","error":null}',
            b'{"jsonrpc":"2.0","id":1,"result":null}',
            b'{"jsonrpc":"2.0","id":1,"result":1}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x"}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x00"}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x1A"}',
            b'{"jsonrpc":"2.0","id":1,"result":"0xg"}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x' + b'f' * 65 + b'"}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x1","\\u0069d":1}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x1","other":[1,]}',
            b'{"jsonrpc":"2.0","id":1,"result":"0x1","other":{"x":0,"x":1}}',
        ]
        for body in cases:
            with self.subTest(body=body):
                Handler.requests.clear()
                result = self.request(body)
                self.assertEqual(result.returncode, 1)
                self.assertEqual(result.stdout, b"")
                self.assertTrue(result.stderr)

    def test_null_result_differs_from_missing(self):
        result = self.request(b'{"jsonrpc":"2.0","id":1,"result":null}')
        self.assertIn(b"result is null", result.stderr)
        Handler.requests.clear()
        result = self.request(b'{"jsonrpc":"2.0","id":1}')
        self.assertIn(b"invalid JSON-RPC envelope", result.stderr)

    def test_structured_errors(self):
        raw = ('{ "code":-32601,\r\n "message":"not found \u202e\u0085\u007f", '
               '"data":{"detail":"\\u001b[2J"} }').encode("utf-8")
        result = self.request(b'{"jsonrpc":"2.0","id":1,"error":' + raw + b'}')
        self.assertEqual((result.returncode, result.stdout), (2, b""))
        prefix = b"JSON-RPC error code -32601; error JSON in hex: "
        self.assertTrue(result.stderr.startswith(prefix))
        self.assertTrue(result.stderr.isascii())
        self.assertNotIn(b"\x1b", result.stderr)
        self.assertNotIn(b"\x7f", result.stderr)
        self.assertNotIn(b"\r", result.stderr)
        decoded_raw = bytes.fromhex(result.stderr[len(prefix):].decode("ascii"))
        self.assertEqual(decoded_raw, raw)
        self.assertEqual(json.loads(decoded_raw)["data"]["detail"], "\x1b[2J")
        for raw_error in [b'{"code":-1,"message":"x"}',
                          b'{"code":-1,"message":"x","data":null}']:
            Handler.requests.clear()
            response = self.request(b'{"jsonrpc":"2.0","id":1,"error":' + raw_error + b'}')
            self.assertEqual(response.returncode, 2)
            self.assertEqual(bytes.fromhex(response.stderr.split(b"error JSON in hex: ", 1)[1].decode()), raw_error)
        for error in [b'null', b'{}', b'{"code":"-1","message":"x"}',
                      b'{"code":-1,"message":null}', b'{"code":-1}']:
            with self.subTest(error=error):
                Handler.requests.clear()
                result = self.request(b'{"jsonrpc":"2.0","id":1,"error":' + error + b'}')
                self.assertEqual(result.returncode, 1)
                self.assertEqual(result.stdout, b"")

    def test_transport_policies(self):
        result = self.request(b'{}', allow_http=False)
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"transport failed", result.stderr)
        Handler.requests.clear()
        result = self.request(b'{}', status=500)
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"not successful", result.stderr)
        Handler.requests.clear()
        result = self.request(b'{}', status=302, extra={"Location": self.base + "/other"})
        self.assertEqual(result.returncode, 1)
        self.assertEqual(len(Handler.requests), 1)
        Handler.requests.clear()
        complete = b'{"jsonrpc":"2.0","id":1,"result":"0x1"}'
        result = self.request(complete + b' ' * (524288 - len(complete)))
        self.assertEqual((result.returncode, result.stdout), (0, b"0x1\n"))
        Handler.requests.clear()
        result = self.request(b' ' * 524289)
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"transport failed", result.stderr)
        Handler.requests.clear()
        result = self.request(complete, extra={"X-Test-Truncate": "yes"})
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"transport failed", result.stderr)
        Handler.requests.clear()
        result = self.request(b'{}', extra={"X-Large": "a" * 16385})
        self.assertEqual(result.returncode, 1)
        self.assertIn(b"transport failed", result.stderr)


if __name__ == "__main__":
    unittest.main()
