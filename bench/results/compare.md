Measured 2026-11-03 UTC. [Hardware, compiler flags, source revisions, commands and caveats](2026-11-03-methodology.md).

| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| serde_json | plain | decode | 38 | 500000 | 157.7 | 156.3–166.9 | 168048000 |
| serde_json | plain | encode | 38 | 500000 | 70.6 | 70.1–73.1 | 418553273 |
| prost (binary) | plain | decode | 11 | 500000 | 64.8 | 62.9–65.2 | 168048000 |
| prost (binary) | plain | encode | 11 | 500000 | 37.6 | 37.0–38.4 | 231700868 |
| serde_json | escaped | decode | 62 | 500000 | 304.3 | 301.7–335.1 | 213561000 |
| serde_json | escaped | encode | 54 | 500000 | 96.7 | 95.8–100.9 | 537984104 |
| prost (binary) | escaped | decode | 24 | 500000 | 75.6 | 74.5–77.3 | 213561000 |
| prost (binary) | escaped | encode | 24 | 500000 | 28.4 | 28.1–29.0 | 452645823 |
| serde_json | array | decode | 4022 | 50000 | 13424.5 | 13371.7–13639.1 | 718497000 |
| serde_json | array | encode | 4022 | 50000 | 8228.8 | 8062.2–8338.3 | 1429447762 |
| prost (binary) | array | decode | 1923 | 50000 | 4614.2 | 4561.4–5521.8 | 718497000 |
| prost (binary) | array | encode | 1923 | 50000 | 7158.0 | 7043.8–7288.2 | 708452272 |
