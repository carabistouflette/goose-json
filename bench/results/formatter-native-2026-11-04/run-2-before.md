| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 76.106,89.990,87.819,86.838,97.724,91.606,90.978 -->
| goose-json | plain | decode | 38 | 200000 | 90.0 | 76.1–97.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 33.922,45.092,40.645,39.579,34.877,32.171,33.753 -->
| goose-json | plain | encode | 38 | 200000 | 34.9 | 32.2–45.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 60.927,75.063,71.919,69.605,59.638,57.739,63.710 -->
| Goose DOM | plain | decode | 38 | 200000 | 63.7 | 57.7–75.1 | 5604000 |
<!-- samples | goose-json | escaped | decode | 152.559,136.896,139.672,153.741,162.426,159.627,160.808 -->
| goose-json | escaped | decode | 62 | 200000 | 153.7 | 136.9–162.4 | 85461000 |
<!-- samples | goose-json | escaped | encode | 70.743,68.645,68.565,68.315,73.744,70.594,71.032 -->
| goose-json | escaped | encode | 54 | 200000 | 70.6 | 68.3–73.7 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 98.282,96.506,98.401,96.715,103.777,103.878,98.113 -->
| Goose DOM | escaped | decode | 62 | 200000 | 98.3 | 96.5–103.9 | 30822000 |
<!-- samples | goose-json | array | decode | 9301.974,10840.230,9256.976,11080.223,9362.278,10237.014,9275.849 -->
| goose-json | array | decode | 4022 | 20000 | 9362.3 | 9257.0–11080.2 | 288627000 |
<!-- samples | goose-json | array | encode | 4481.915,4325.141,4073.902,5847.941,4246.038,4556.638,4228.414 -->
| goose-json | array | encode | 4022 | 20000 | 4325.1 | 4073.9–5847.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 13539.881,14593.637,14569.705,13016.304,12737.526,12915.082,12635.377 -->
| Goose DOM | array | decode | 4022 | 20000 | 13016.3 | 12635.4–14593.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 3492.935,3453.738,3654.186,3468.414,3333.028,3302.248,3764.468 -->
| goose-json | floats | decode | 1581 | 2000 | 3468.4 | 3302.2–3764.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 8124.676,7908.659,7833.764,7540.188,7542.129,7592.516,7860.679 -->
| goose-json | floats | encode | 1581 | 2000 | 7833.8 | 7540.2–8124.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3504.035,3542.815,3351.791,3257.523,3314.047,3553.334,3399.516 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3399.5 | 3257.5–3553.3 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5940.873,5992.815,5765.901,5797.782,5904.359,6043.243,5687.457 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5904.4 | 5687.5–6043.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8302.274,7939.054,7907.075,7918.223,8336.639,8171.422,7610.082 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 7939.1 | 7610.1–8336.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 11056.076,10530.120,10534.206,10557.263,11759.823,10450.310,10463.093 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10534.2 | 10450.3–11759.8 | 3870000 |
<!-- samples | goose-json | text-short | decode | 73.757,70.590,68.760,70.497,71.225,76.275,71.872 -->
| goose-json | text-short | decode | 97 | 200000 | 71.2 | 68.8–76.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 31.131,29.876,29.806,29.833,29.837,31.160,29.824 -->
| goose-json | text-short | encode | 97 | 200000 | 29.8 | 29.8–31.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 94.274,91.061,89.962,89.492,89.881,93.046,91.393 -->
| Goose DOM | text-short | decode | 97 | 200000 | 91.1 | 89.5–94.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1326.728,1492.344,1377.246,1488.831,1457.549,1401.326,1321.188 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1401.3 | 1321.2–1492.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1175.371,1327.618,1219.516,1319.312,1256.802,1218.455,1182.086 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1219.5 | 1175.4–1327.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 11979.229,11736.832,11481.753,12023.456,11426.091,11163.027,12084.657 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11736.8 | 11163.0–12084.7 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 949.779,915.446,878.631,884.076,869.378,880.144,875.273 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 880.1 | 869.4–949.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 587.889,563.693,542.745,544.297,543.924,542.986,544.124 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 544.1 | 542.7–587.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6489.791,6254.744,6166.713,6163.059,6167.880,6165.030,5967.563 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6166.7 | 5967.6–6489.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9385.874,10891.492,9541.282,9822.129,10127.834,9437.406,9739.040 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9739.0 | 9385.9–10891.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 6909.382,7450.166,7027.094,7122.173,7113.840,6926.506,7088.633 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7088.6 | 6909.4–7450.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15564.447,14655.836,15142.879,14421.756,14225.094,13978.058,13951.109 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14421.8 | 13951.1–15564.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 255.754,258.052,257.795,263.757,268.125,278.596,269.454 -->
| goose-json | wide | decode | 135 | 40000 | 263.8 | 255.8–278.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 154.637,152.958,155.742,159.900,160.211,159.369,159.920 -->
| goose-json | wide | encode | 135 | 40000 | 159.4 | 153.0–160.2 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 228.345,228.887,228.699,237.881,238.934,238.133,238.562 -->
| Goose DOM | wide | decode | 135 | 40000 | 237.9 | 228.3–238.9 | 4777000 |
