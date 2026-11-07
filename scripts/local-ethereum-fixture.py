#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Build the pinned consumer's source with the current checkout for testing."""
from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
source = (root / "examples/ethereum_rpc.goose").read_text(encoding="utf-8")
source, count = re.subn(
    r'^import json_codec from "carabistouflette/goose-json@[0-9a-f]{40}";$',
    'import json_codec from "..";', source, flags=re.MULTILINE,
)
if count != 1:
    raise SystemExit("expected exactly one commit-pinned goose-json import")
output = root / ".build/ethereum-rpc-local.goose"
output.parent.mkdir(exist_ok=True)
output.write_text(source, encoding="utf-8")
