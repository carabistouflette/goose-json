| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 84.778,74.270,75.650,77.675,76.706,79.381,76.628 -->
| goose-json | plain | decode | 38 | 200000 | 76.7 | 74.3–84.8 | 67248000 |
<!-- samples | goose-json | plain | encode | 37.095,35.091,34.672,36.373,36.685,36.909,35.560 -->
| goose-json | plain | encode | 38 | 200000 | 36.4 | 34.7–37.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.554,56.050,55.702,56.132,59.152,56.877,54.747 -->
| Goose DOM | plain | decode | 38 | 200000 | 56.1 | 54.7–59.2 | 5604000 |
<!-- samples | goose-json | escaped | decode | 147.617,150.275,143.062,138.883,158.022,149.357,156.382 -->
| goose-json | escaped | decode | 62 | 200000 | 149.4 | 138.9–158.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 69.058,67.957,67.580,68.692,89.274,72.381,71.337 -->
| goose-json | escaped | encode | 54 | 200000 | 69.1 | 67.6–89.3 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 92.979,91.772,94.244,95.186,109.701,103.672,94.918 -->
| Goose DOM | escaped | decode | 62 | 200000 | 94.9 | 91.8–109.7 | 30822000 |
<!-- samples | goose-json | array | decode | 7780.847,7711.196,7645.345,11822.664,11835.710,8078.383,7723.193 -->
| goose-json | array | decode | 4022 | 20000 | 7780.8 | 7645.3–11835.7 | 288627000 |
<!-- samples | goose-json | array | encode | 4386.685,4050.256,5319.742,6001.533,5599.055,5320.080,3905.960 -->
| goose-json | array | encode | 4022 | 20000 | 5319.7 | 3906.0–6001.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12228.275,12435.035,17828.164,21780.943,17762.747,12835.509,11187.974 -->
| Goose DOM | array | decode | 4022 | 20000 | 12835.5 | 11188.0–21780.9 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 7593.047,7409.502,7870.062,7156.906,7454.289,7800.098,7679.769 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7593.0 | 7156.9–7870.1 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 4826.436,5214.626,5149.694,4692.353,4698.250,4739.534,4684.033 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4739.5 | 4684.0–5214.6 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 13542.288,12131.240,12405.281,12575.799,14109.637,13330.647,12617.394 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 12617.4 | 12131.2–14109.6 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 26353.365,23555.376,21662.230,22584.383,21986.003,24415.697,21999.124 -->
| goose-json | array-wide | decode | 19771 | 20000 | 22584.4 | 21662.2–26353.4 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 18631.481,19396.336,19331.873,19157.872,18942.649,26567.875,21841.813 -->
| goose-json | array-wide | encode | 19770 | 20000 | 19331.9 | 18631.5–26567.9 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 34861.978,36170.220,34756.361,34345.343,34599.876,39778.970,34924.414 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 34862.0 | 34345.3–39779.0 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1809.814,1647.509,1572.500,1637.799,1559.962,1587.689,2013.825 -->
| goose-json | mixed | decode | 1187 | 20000 | 1637.8 | 1560.0–2013.8 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1891.339,1778.649,1770.096,1868.928,1768.246,2089.740,2170.733 -->
| goose-json | mixed | encode | 1186 | 20000 | 1868.9 | 1768.2–2170.7 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1984.926,1902.143,1946.729,1971.578,1908.143,2060.101,2557.819 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1971.6 | 1902.1–2557.8 | 83331000 |
<!-- samples | goose-json | floats | decode | 5204.449,4760.888,3691.553,3378.729,3362.190,3347.494,3758.026 -->
| goose-json | floats | decode | 1581 | 2000 | 3691.6 | 3347.5–5204.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 11559.709,9525.717,7997.842,7616.893,7557.904,8438.407,8233.192 -->
| goose-json | floats | encode | 1581 | 2000 | 8233.2 | 7557.9–11559.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4877.823,3743.889,3366.724,3394.165,3206.974,3734.646,3377.023 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3394.2 | 3207.0–4877.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 6193.781,6109.054,5800.738,6041.623,5979.070,6384.527,6416.859 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 6109.1 | 5800.7–6416.9 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8189.220,8566.281,7890.276,7908.007,7897.649,8464.662,8299.573 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8189.2 | 7890.3–8566.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10855.959,11015.085,10890.873,10885.588,11055.325,11170.130,11325.477 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 11015.1 | 10856.0–11325.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 88.283,92.665,84.921,89.741,84.370,83.051,79.886 -->
| goose-json | text-short | decode | 97 | 200000 | 84.9 | 79.9–92.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 35.546,36.296,34.422,35.866,33.357,34.558,32.324 -->
| goose-json | text-short | encode | 97 | 200000 | 34.6 | 32.3–36.3 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 94.194,92.770,98.317,90.184,89.108,88.728,85.593 -->
| Goose DOM | text-short | decode | 97 | 200000 | 90.2 | 85.6–98.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1224.213,1224.753,1237.675,1218.905,1571.354,1430.778,1813.487 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1237.7 | 1218.9–1813.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1175.150,1173.145,1220.055,1177.719,1505.492,1372.632,1789.054 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1220.1 | 1173.1–1789.1 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 9694.799,9680.038,9829.749,11937.521,11743.827,12627.790,15235.188 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11743.8 | 9680.0–15235.2 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1302.398,1300.928,1341.206,1354.900,1409.127,1458.394,1425.546 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1354.9 | 1300.9–1458.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 827.202,825.217,824.856,836.831,872.774,883.260,873.177 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 836.8 | 824.9–883.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7384.801,7376.269,7392.827,7432.939,7851.521,7877.758,7857.665 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7432.9 | 7376.3–7877.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13985.337,19644.883,16581.325,15364.684,14380.028,13816.770,10870.188 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14380.0 | 10870.2–19644.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11518.588,14727.828,12008.300,11313.080,9130.606,9036.169,7690.025 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11313.1 | 7690.0–14727.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 19848.552,21051.467,17378.379,17046.590,14473.559,12877.208,11612.763 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17046.6 | 11612.8–21051.5 | 99900000 |
<!-- samples | goose-json | wide | decode | 312.591,315.195,316.619,323.277,317.852,340.090,319.853 -->
| goose-json | wide | decode | 135 | 40000 | 317.9 | 312.6–340.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 134.749,139.439,140.650,140.524,143.670,144.748,116.789 -->
| goose-json | wide | encode | 135 | 40000 | 140.5 | 116.8–144.7 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 238.580,239.890,244.598,237.446,253.678,247.430,238.600 -->
| Goose DOM | wide | decode | 135 | 40000 | 239.9 | 237.4–253.7 | 4777000 |
