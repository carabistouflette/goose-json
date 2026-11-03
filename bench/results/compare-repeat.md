Measured 2026-11-03 UTC. [Hardware, compiler flags, source revisions, commands and caveats](2026-11-03-methodology.md).

| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| serde_json | plain | decode | 38 | 500000 | 161.0 | 158.5–274.7 | 168048000 |
| serde_json | plain | encode | 38 | 500000 | 73.3 | 71.1–74.8 | 418553273 |
| prost (binary) | plain | decode | 11 | 500000 | 60.6 | 60.0–61.7 | 168048000 |
| prost (binary) | plain | encode | 11 | 500000 | 39.2 | 37.6–39.5 | 231700868 |
| serde_json | escaped | decode | 62 | 500000 | 323.9 | 312.0–328.5 | 213561000 |
| serde_json | escaped | encode | 54 | 500000 | 102.3 | 100.3–107.3 | 537984104 |
| prost (binary) | escaped | decode | 24 | 500000 | 72.8 | 69.1–75.3 | 213561000 |
| prost (binary) | escaped | encode | 24 | 500000 | 26.2 | 26.1–26.8 | 452645823 |
| serde_json | array | decode | 4022 | 50000 | 13698.9 | 12741.4–13784.5 | 718497000 |
| serde_json | array | encode | 4022 | 50000 | 8314.7 | 8177.5–8748.8 | 1429447762 |
| prost (binary) | array | decode | 1923 | 50000 | 4865.9 | 4767.2–4929.2 | 718497000 |
| prost (binary) | array | encode | 1923 | 50000 | 7389.0 | 7281.0–7861.6 | 708452272 |
