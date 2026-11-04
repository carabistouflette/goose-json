| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 88.307,82.102,88.542,78.721,81.261,79.901,86.406 -->
| goose-json | plain | decode | 38 | 200000 | 82.1 | 78.7–88.5 | 67248000 |
<!-- samples | goose-json | plain | encode | 39.286,38.477,39.934,37.568,38.968,37.695,38.443 -->
| goose-json | plain | encode | 38 | 200000 | 38.5 | 37.6–39.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 59.977,63.751,58.935,58.834,60.010,61.853,59.080 -->
| Goose DOM | plain | decode | 38 | 200000 | 60.0 | 58.8–63.8 | 5604000 |
<!-- samples | goose-json | escaped | decode | 154.458,181.079,156.552,152.820,147.000,195.503,175.484 -->
| goose-json | escaped | decode | 62 | 200000 | 156.6 | 147.0–195.5 | 85461000 |
<!-- samples | goose-json | escaped | encode | 76.191,83.614,79.632,77.807,70.502,74.011,70.421 -->
| goose-json | escaped | encode | 54 | 200000 | 76.2 | 70.4–83.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 103.348,108.308,112.369,105.259,112.448,101.455,100.103 -->
| Goose DOM | escaped | decode | 62 | 200000 | 105.3 | 100.1–112.4 | 30822000 |
<!-- samples | goose-json | array | decode | 7831.043,8393.379,8772.318,8538.993,8233.046,7986.485,8280.782 -->
| goose-json | array | decode | 4022 | 20000 | 8280.8 | 7831.0–8772.3 | 288627000 |
<!-- samples | goose-json | array | encode | 4191.681,4348.579,5522.312,4400.734,4329.248,4150.324,4127.854 -->
| goose-json | array | encode | 4022 | 20000 | 4329.2 | 4127.9–5522.3 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12326.464,12059.224,14236.095,12000.329,12174.770,13374.825,11849.424 -->
| Goose DOM | array | decode | 4022 | 20000 | 12174.8 | 11849.4–14236.1 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 8249.987,8944.871,7527.294,8247.551,8234.386,9330.845,7420.013 -->
| goose-json | array-signed | decode | 4538 | 20000 | 8247.6 | 7420.0–9330.8 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 5866.449,5804.684,5148.306,5161.316,5355.818,5213.054,5317.484 -->
| goose-json | array-signed | encode | 4537 | 20000 | 5317.5 | 5148.3–5866.4 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 14309.142,15276.840,12829.084,13781.940,13492.406,13309.218,15285.255 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 13781.9 | 12829.1–15285.3 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 23829.631,24969.931,23293.862,21770.162,22891.353,22587.960,23883.193 -->
| goose-json | array-wide | decode | 19771 | 20000 | 23293.9 | 21770.2–24969.9 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 20148.888,20908.388,19543.703,19208.214,19919.878,21222.530,22456.060 -->
| goose-json | array-wide | encode | 19770 | 20000 | 20148.9 | 19208.2–22456.1 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 42644.105,37125.842,35748.004,36120.312,36517.341,42717.102,46167.120 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 37125.8 | 35748.0–46167.1 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1816.738,1826.129,2013.864,2264.557,2109.717,1792.840,1896.767 -->
| goose-json | mixed | decode | 1187 | 20000 | 1896.8 | 1792.8–2264.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1957.255,2166.698,2134.122,2214.268,2065.810,2062.260,2081.247 -->
| goose-json | mixed | encode | 1186 | 20000 | 2081.2 | 1957.3–2214.3 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1973.385,1996.268,2553.426,2153.383,1987.467,2060.964,2113.684 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2061.0 | 1973.4–2553.4 | 83331000 |
<!-- samples | goose-json | floats | decode | 3661.985,3738.914,3577.782,3849.521,3926.971,3986.231,3972.728 -->
| goose-json | floats | decode | 1581 | 2000 | 3849.5 | 3577.8–3986.2 | 3825000 |
<!-- samples | goose-json | floats | encode | 8891.993,8349.335,7973.217,8627.758,8815.615,9192.734,8993.662 -->
| goose-json | floats | encode | 1581 | 2000 | 8815.6 | 7973.2–9192.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3809.470,3479.123,3696.010,3811.503,3874.207,3786.909,3686.881 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3786.9 | 3479.1–3874.2 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7177.060,7029.720,6823.708,6282.149,6898.849,6577.557,6099.292 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 6823.7 | 6099.3–7177.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 9292.805,9082.783,9207.347,8744.844,8842.873,8616.520,8754.782 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8842.9 | 8616.5–9292.8 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 12916.799,11958.658,11819.923,13024.016,12296.073,11226.069,11320.778 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 11958.7 | 11226.1–13024.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 84.430,89.368,93.432,88.690,92.253,89.205,96.950 -->
| goose-json | text-short | decode | 97 | 200000 | 89.4 | 84.4–96.9 | 149907000 |
<!-- samples | goose-json | text-short | encode | 35.423,36.698,38.566,36.476,37.544,40.533,38.256 -->
| goose-json | text-short | encode | 97 | 200000 | 37.5 | 35.4–40.5 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 97.143,96.973,100.163,93.352,96.247,108.559,96.857 -->
| Goose DOM | text-short | decode | 97 | 200000 | 97.0 | 93.4–108.6 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1435.468,1413.057,1331.057,1396.588,1416.678,1518.629,1370.208 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1413.1 | 1331.1–1518.6 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1378.370,1333.083,1268.902,1322.172,1376.278,1441.453,1320.967 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1333.1 | 1268.9–1441.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 11105.147,10632.153,11052.929,10958.506,11293.217,11370.774,10525.112 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11052.9 | 10525.1–11370.8 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 950.356,1025.809,1012.566,970.697,934.138,892.460,989.153 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 970.7 | 892.5–1025.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 603.993,635.456,644.029,609.114,583.663,568.270,617.534 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 609.1 | 568.3–644.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5515.167,5800.261,5649.632,5365.073,5263.876,5244.867,5830.998 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 5515.2 | 5244.9–5831.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 11135.965,10802.544,11211.668,11785.837,11055.367,13510.697,13767.244 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 11211.7 | 10802.5–13767.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7806.346,7855.039,7689.090,8000.067,8384.596,10857.999,8770.201 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 8000.1 | 7689.1–10858.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 12194.344,12661.565,12469.693,11791.313,12557.127,16183.244,12661.270 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 12557.1 | 11791.3–16183.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 374.740,338.295,331.435,335.830,336.728,385.122,353.716 -->
| goose-json | wide | decode | 135 | 40000 | 338.3 | 331.4–385.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 138.253,119.787,127.766,121.543,137.623,141.856,130.188 -->
| goose-json | wide | encode | 135 | 40000 | 130.2 | 119.8–141.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 261.852,254.054,277.988,270.114,312.833,302.032,293.022 -->
| Goose DOM | wide | decode | 135 | 40000 | 278.0 | 254.1–312.8 | 4777000 |
