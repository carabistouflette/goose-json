#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Generate the additional synthetic corpus; --check never rewrites fixtures."""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent / 'fixtures'
BOUNDARIES = [-(1 << 63), (1 << 63) - 1, -10000, 10000, -9999, 9999, -1, 0, 1]


def signed(i):
    return (i + 1) * (-1 if i % 2 else 1)


def wide(i):
    if i < len(BOUNDARIES):
        return BOUNDARIES[i]
    magnitude = ((i * 2654435761) % 1000003 + 1) * 1000000000039
    return magnitude * (-1 if i % 2 else 1)


def fixtures():
    return {
        'array-signed': {'values': [signed(i) for i in range(1024)]},
        'array-wide': {'values': [wide(i) for i in range(1024)]},
        # Deliberately reversed member order, escaped text and independent owners.
        'mixed': {'message': ('temperature\n"東京"\\sensor 😀\t' * 16),
                  'flags': [True, False, True, True],
                  'samples': [i / 8 for i in range(-16, 16)],
                  'counters': [wide(i) for i in range(16)],
                  'context': {'label': 'edge/é', 'region': 7},
                  'reading': 1.0000000000000002, 'active': True,
                  'event_id': 9223372036854775807},
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for name, value in fixtures().items():
        path = ROOT / f'{name}.json'
        data = json.dumps(value, ensure_ascii=False, separators=(',', ':')) + '\n'
        if args.check:
            if not path.exists() or path.read_text(encoding="utf-8") != data:
                parser.exit(1, f'{path.name} is stale; run python3 bench/fixtures.py\n')
        else:
            path.write_text(data, encoding="utf-8")


if __name__ == '__main__':
    main()
