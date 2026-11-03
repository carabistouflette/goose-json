Measured 2026-11-03 UTC. [Hardware, compiler flags, source revisions, commands and caveats](2026-11-03-methodology.md).

| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| goose-json | plain | decode | 38 | 500000 | 121.6 | 118.9–124.4 | 168048000 |
| goose-json | plain | encode | 38 | 500000 | 49.0 | 46.7–49.6 | 418553273 |
| Goose DOM | plain | decode | 38 | 500000 | 116.2 | 115.0–117.5 | 14004000 |
| goose-json | escaped | decode | 62 | 500000 | 234.2 | 228.5–241.5 | 213561000 |
| goose-json | escaped | encode | 54 | 500000 | 112.5 | 109.4–142.5 | 537984104 |
| Goose DOM | escaped | decode | 62 | 500000 | 161.1 | 159.2–163.6 | 77022000 |
| goose-json | array | decode | 4022 | 50000 | 12220.4 | 12080.2–12660.5 | 718497000 |
| goose-json | array | encode | 4022 | 50000 | 5665.9 | 5618.1–5935.1 | 1429447762 |
| Goose DOM | array | decode | 4022 | 50000 | 22539.0 | 22270.4–23613.6 | 360126000 |
