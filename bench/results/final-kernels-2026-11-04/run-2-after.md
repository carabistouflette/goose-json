| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 105.118,115.709,111.082,116.161,108.402,112.970,116.995 -->
| goose-json | plain | decode | 38 | 200000 | 113.0 | 105.1–117.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 43.386,43.187,43.058,42.269,43.005,43.366,44.432 -->
| goose-json | plain | encode | 38 | 200000 | 43.2 | 42.3–44.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 120.620,121.018,121.997,120.240,120.683,122.638,120.450 -->
| Goose DOM | plain | decode | 38 | 200000 | 120.7 | 120.2–122.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 210.921,208.113,208.936,211.930,205.904,212.181,210.572 -->
| goose-json | escaped | decode | 62 | 200000 | 210.6 | 205.9–212.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 103.674,100.677,103.115,103.558,104.619,104.099,100.902 -->
| goose-json | escaped | encode | 54 | 200000 | 103.6 | 100.7–104.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 164.221,157.504,165.483,165.359,169.476,166.236,160.819 -->
| Goose DOM | escaped | decode | 62 | 200000 | 165.4 | 157.5–169.5 | 30822000 |
<!-- samples | goose-json | array | decode | 9309.797,9059.426,9019.182,9243.000,9110.471,9023.220,9082.538 -->
| goose-json | array | decode | 4022 | 20000 | 9082.5 | 9019.2–9309.8 | 288627000 |
<!-- samples | goose-json | array | encode | 5449.334,5406.209,5411.187,5502.914,5473.960,5365.391,5448.026 -->
| goose-json | array | encode | 4022 | 20000 | 5448.0 | 5365.4–5502.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23437.884,23120.342,23011.628,23297.263,23454.474,23653.183,23907.624 -->
| Goose DOM | array | decode | 4022 | 20000 | 23437.9 | 23011.6–23907.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 4959.652,5026.474,4924.179,4968.260,4971.409,4885.368,4907.730 -->
| goose-json | floats | decode | 1581 | 2000 | 4959.7 | 4885.4–5026.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 9987.040,9954.524,10239.413,10037.387,10228.404,9625.526,9997.284 -->
| goose-json | floats | encode | 1581 | 2000 | 9997.3 | 9625.5–10239.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6456.300,6638.951,6603.794,6565.519,6200.085,6580.321,6459.883 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6565.5 | 6200.1–6639.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8086.133,8390.556,8233.572,8056.475,8016.877,7955.090,8529.354 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8086.1 | 7955.1–8529.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11319.921,11525.324,11540.980,11445.544,11515.981,11608.964,11615.686 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11525.3 | 11319.9–11615.7 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17355.204,17106.418,16812.339,16533.874,16573.946,17103.894,17272.446 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17103.9 | 16533.9–17355.2 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 960.963,955.408,876.187,962.265,970.006,945.193,985.389 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 961.0 | 876.2–985.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 855.082,808.595,827.865,843.575,856.636,850.308,862.134 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 850.3 | 808.6–862.1 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7136.333,6949.563,7096.668,7406.023,7084.919,7043.489,7285.079 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7096.7 | 6949.6–7406.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12406.087,12675.211,12720.896,12344.665,12504.319,12305.098,12077.240 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12406.1 | 12077.2–12720.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9919.683,10066.147,10236.477,10138.589,9789.380,10074.191,9777.411 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10066.1 | 9777.4–10236.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14192.748,14080.757,14713.109,14224.007,13603.887,14216.821,14176.377 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14192.7 | 13603.9–14713.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 742.545,730.294,787.811,755.754,735.405,745.672,736.829 -->
| goose-json | wide | decode | 135 | 40000 | 742.5 | 730.3–787.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 203.718,192.498,214.002,208.129,206.822,184.951,194.297 -->
| goose-json | wide | encode | 135 | 40000 | 203.7 | 185.0–214.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 394.183,398.242,405.294,403.044,383.050,384.183,394.513 -->
| Goose DOM | wide | decode | 135 | 40000 | 394.5 | 383.1–405.3 | 4777000 |
