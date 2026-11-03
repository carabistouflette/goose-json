Measured 2026-11-03 UTC. [Hardware, compiler flags, source revisions, commands and caveats](../README.md).

| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| goose-json | plain | decode | 38 | 500000 | 195.1 | 193.7–197.3 | 168048000 |
| goose-json | plain | encode | 38 | 500000 | 48.5 | 46.5–51.0 | 418553273 |
| Goose DOM | plain | decode | 38 | 500000 | 116.4 | 114.7–118.9 | 14004000 |
| goose-json | escaped | decode | 62 | 500000 | 328.7 | 325.0–345.7 | 213561000 |
| goose-json | escaped | encode | 54 | 500000 | 112.1 | 109.2–118.2 | 537984104 |
| Goose DOM | escaped | decode | 62 | 500000 | 160.2 | 158.1–168.4 | 77022000 |
| goose-json | array | decode | 4022 | 50000 | 20575.5 | 20481.6–20870.9 | 718497000 |
| goose-json | array | encode | 4022 | 50000 | 5631.5 | 5555.6–5667.8 | 1429447762 |
| Goose DOM | array | decode | 4022 | 50000 | 22472.5 | 22385.5–23480.3 | 360126000 |
