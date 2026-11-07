# SPDX-License-Identifier: Apache-2.0
"""Generate a deterministic Python JSON oracle for the optional reader."""
import json
from decimal import Decimal
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
# Python's parser independently checks syntax; object_pairs_hook rejects
# duplicate decoded names, including duplicates in ignored nested objects.
def unique_pairs(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            raise ValueError("duplicate object key")
        result[key] = value
    return result

invalid = [
    '{"a":01}', '{"a":-01}', '{"a":+1}', '{"a":1.}',
    '{"a":.1}', '{"a":1e}', '{"a":1e+}', '{"a":--1}',
    '{"a":NaN}', '{"a":Infinity}', '{"a":1}x', '{"a":[1,]}',
    '{"a":1,}', '{"a":1,"a":2}',
    r'{"a":1,"\u0061":2}', r'{"unused":{"x":1,"\u0078":2}}',
]
for document in invalid:
    try:
        json.loads(document, object_pairs_hook=unique_pairs,
                   parse_constant=lambda x: (_ for _ in ()).throw(ValueError(x)))
    except (ValueError, json.JSONDecodeError):
        pass
    else:
        raise AssertionError(f"reference unexpectedly accepted {document!r}")
    lines.append(f' assert(json_codec::protocol_select({src(document)}, names, r).len > 0);')

# The expected raw token is the independently provided JSON lexeme; Decimal
# avoids overflow and rounding when the reference checks number grammar.
for token in ['0', '-0', '1.0', '1e999', '-12345678901234567890',
              '0.00001', '1E-1000', '1.234567890123456789']:
    document = '{"a":' + token + '}'
    json.loads(document, parse_float=Decimal, parse_int=int, object_pairs_hook=unique_pairs)
    lines.append(f' assert(json_codec::protocol_select({src(document)}, names, r).len == 0);')
    lines.append(f' assert(json_codec::protocol_present(r, 0) && json_codec::protocol_value(r, 0) == {src(token)});')
lines.append('}')
Path('.build').mkdir(exist_ok=True)
Path('.build/protocol-independent-review.goose').write_text('\n'.join(lines) + '\n', encoding='utf-8')
