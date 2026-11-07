# SPDX-License-Identifier: Apache-2.0
"""Generate a deterministic Python JSON oracle for the optional reader."""
import json
import random
from pathlib import Path

rng = random.Random(73513)
def val(d=0):
    if d < 3:
        kind = rng.randrange(6)
        if kind == 0:
            return [val(d + 1) for _ in range(rng.randrange(4))]
        if kind == 1:
            return {k: val(d + 1) for k in rng.sample(['a', 'z', 'é', '😀', '\\x', ''], rng.randrange(4))}
    x = rng.randrange(8)
    return [None, True, False, rng.randrange(-10**25, 10**25), 'é😀\n\\"\x00', '', 0, -1][x]

def enc(x):
    return json.dumps(x, ensure_ascii=False, separators=(',', ':'))

def src(x):
    return json.dumps(x, ensure_ascii=False)

lines = ['import json_codec from "..";', 'import json_codec.protocol;', 'import std;', 'fn main() {', ' var r = json_codec::ProtocolResult { .. };', ' let names: (const u8[:])[3] = ["a","x","é"];']
for i in range(450):
    d = {k: val() for k in rng.sample(['a', 'x', 'é', 'unused', '😀', ''], rng.randrange(7))}
    lines.append(f' assert(json_codec::protocol_select({src(enc(d))}, names, r).len == 0);')
    for j, k in enumerate(['a', 'x', 'é']):
        if k in d:
            lines.append(f' assert(json_codec::protocol_present(r, {j}) && json_codec::protocol_value(r, {j}) == {src(enc(d[k]))});')
        else:
            lines.append(f' assert(!json_codec::protocol_present(r, {j}));')
lines.append('}')
Path('.build').mkdir(exist_ok=True)
Path('.build/protocol-independent-review.goose').write_text('\n'.join(lines) + '\n', encoding='utf-8')
