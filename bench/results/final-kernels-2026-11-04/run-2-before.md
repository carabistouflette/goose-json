| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 110.124,111.771,108.240,108.010,110.088,112.885,111.606 -->
| goose-json | plain | decode | 38 | 200000 | 110.1 | 108.0–112.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 39.000,38.816,40.285,40.910,41.417,41.471,41.643 -->
| goose-json | plain | encode | 38 | 200000 | 40.9 | 38.8–41.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 110.405,109.056,111.642,111.429,108.886,109.174,114.581 -->
| Goose DOM | plain | decode | 38 | 200000 | 110.4 | 108.9–114.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 230.499,227.107,227.102,234.144,233.141,229.743,227.261 -->
| goose-json | escaped | decode | 62 | 200000 | 229.7 | 227.1–234.1 | 85461000 |
<!-- samples | goose-json | escaped | encode | 100.456,96.147,95.670,101.271,102.638,101.928,102.109 -->
| goose-json | escaped | encode | 54 | 200000 | 101.3 | 95.7–102.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 155.781,153.767,155.412,157.733,158.289,154.701,155.200 -->
| Goose DOM | escaped | decode | 62 | 200000 | 155.4 | 153.8–158.3 | 30822000 |
<!-- samples | goose-json | array | decode | 10033.852,9860.819,9852.120,10239.902,10514.510,9931.871,10491.387 -->
| goose-json | array | decode | 4022 | 20000 | 10033.9 | 9852.1–10514.5 | 288627000 |
<!-- samples | goose-json | array | encode | 5499.684,5375.302,5360.852,5590.682,5638.966,5502.759,5637.560 -->
| goose-json | array | encode | 4022 | 20000 | 5502.8 | 5360.9–5639.0 | 574225548 |
<!-- samples | Goose DOM | array | decode | 22093.669,22179.608,22812.757,22987.139,22975.142,22613.639,23418.697 -->
| Goose DOM | array | decode | 4022 | 20000 | 22812.8 | 22093.7–23418.7 | 144666000 |
<!-- samples | goose-json | floats | decode | 6810.856,6430.321,6476.254,6515.440,6700.100,6983.757,6742.130 -->
| goose-json | floats | decode | 1581 | 2000 | 6700.1 | 6430.3–6983.8 | 3825000 |
<!-- samples | goose-json | floats | encode | 30425.443,30736.106,30465.244,30803.532,30471.746,31320.454,30589.614 -->
| goose-json | floats | encode | 1581 | 2000 | 30589.6 | 30425.4–31320.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6492.199,6506.363,6636.848,6396.736,6417.386,6576.087,6490.770 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6492.2 | 6396.7–6636.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 27083.512,26238.000,25222.716,25482.716,25191.281,26806.320,26242.607 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 26238.0 | 25191.3–27083.5 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 1124058.537,1116827.250,1075437.893,1058967.610,1078255.299,1094731.560,1117118.249 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 1094731.6 | 1058967.6–1124058.5 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17961.891,16717.059,16573.997,16757.762,18150.548,17355.322,17896.527 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17355.3 | 16574.0–18150.5 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 6774.110,7200.517,6883.877,6742.087,6698.649,6756.289,6710.349 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 6756.3 | 6698.6–7200.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 5514.947,5456.715,5389.324,5347.443,5292.466,5296.462,5350.858 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 5350.9 | 5292.5–5514.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7397.693,7303.284,7139.843,7102.443,7073.781,7146.909,7097.464 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7139.8 | 7073.8–7397.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 44717.005,44090.959,44032.889,43881.666,44225.007,44134.984,44079.177 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 44091.0 | 43881.7–44717.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 33075.291,32767.369,32769.410,32917.320,32811.303,32914.295,32899.964 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 32900.0 | 32767.4–33075.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 23215.287,23278.003,22321.225,23234.368,23255.957,23184.175,23111.621 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 23215.3 | 22321.2–23278.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 776.784,778.250,776.545,772.510,772.297,770.386,759.888 -->
| goose-json | wide | decode | 135 | 40000 | 772.5 | 759.9–778.3 | 33720000 |
<!-- samples | goose-json | wide | encode | 183.433,179.441,191.379,170.568,177.684,179.686,184.557 -->
| goose-json | wide | encode | 135 | 40000 | 179.7 | 170.6–191.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 441.087,444.188,438.642,436.151,426.633,434.809,435.616 -->
| Goose DOM | wide | decode | 135 | 40000 | 436.2 | 426.6–444.2 | 4777000 |
