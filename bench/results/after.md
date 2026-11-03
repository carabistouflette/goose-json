Measured 2026-11-03 UTC. [Hardware, compiler flags, source revisions, commands and caveats](../README.md).

| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| goose-json | plain | decode | 38 | 500000 | 121.7 | 120.1–123.4 | 168048000 |
| goose-json | plain | encode | 38 | 500000 | 48.9 | 47.5–49.3 | 418553273 |
| Goose DOM | plain | decode | 38 | 500000 | 120.5 | 117.4–120.8 | 14004000 |
| goose-json | escaped | decode | 62 | 500000 | 243.1 | 235.1–245.8 | 213561000 |
| goose-json | escaped | encode | 54 | 500000 | 114.9 | 111.8–117.5 | 537984104 |
| Goose DOM | escaped | decode | 62 | 500000 | 164.6 | 160.8–167.8 | 77022000 |
| goose-json | array | decode | 4022 | 50000 | 12422.6 | 12155.4–13013.3 | 718497000 |
| goose-json | array | encode | 4022 | 50000 | 5714.1 | 5645.5–6063.9 | 1429447762 |
| Goose DOM | array | decode | 4022 | 50000 | 23258.5 | 22657.3–23589.6 | 360126000 |
