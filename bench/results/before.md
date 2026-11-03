Measured 2026-11-03 UTC. [Hardware, compiler flags, source revisions, commands and caveats](2026-11-03-methodology.md).

| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| goose-json | plain | decode | 38 | 500000 | 209.6 | 204.7–238.1 | 168048000 |
| goose-json | plain | encode | 38 | 500000 | 47.8 | 45.8–49.9 | 418553273 |
| Goose DOM | plain | decode | 38 | 500000 | 125.8 | 123.4–128.9 | 14004000 |
| goose-json | escaped | decode | 62 | 500000 | 337.0 | 333.1–354.1 | 213561000 |
| goose-json | escaped | encode | 54 | 500000 | 113.2 | 112.1–118.4 | 537984104 |
| Goose DOM | escaped | decode | 62 | 500000 | 165.3 | 164.0–174.1 | 77022000 |
| goose-json | array | decode | 4022 | 50000 | 21422.6 | 20992.4–21989.0 | 718497000 |
| goose-json | array | encode | 4022 | 50000 | 5783.9 | 5749.8–6084.6 | 1429447762 |
| Goose DOM | array | decode | 4022 | 50000 | 23158.4 | 23074.3–24479.5 | 360126000 |
