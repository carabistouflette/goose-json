| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 114.301,104.682,117.103,109.200,114.837,129.410,108.138 -->
| goose-json | plain | decode | 38 | 100000 | 114.3 | 104.7–129.4 | 33648000 |
<!-- samples | goose-json | plain | encode | 44.241,45.032,45.855,46.716,45.117,45.721,42.808 -->
| goose-json | plain | encode | 38 | 100000 | 45.1 | 42.8–46.7 | 83806357 |
<!-- samples | Goose DOM | plain | decode | 121.619,125.110,129.155,125.023,128.420,127.400,126.214 -->
| Goose DOM | plain | decode | 38 | 100000 | 126.2 | 121.6–129.2 | 2804000 |
<!-- samples | goose-json | escaped | decode | 220.360,227.466,227.246,230.982,225.565,223.989,223.702 -->
| goose-json | escaped | decode | 62 | 100000 | 225.6 | 220.4–231.0 | 42761000 |
<!-- samples | goose-json | escaped | encode | 108.464,105.435,106.281,109.798,105.888,105.131,103.938 -->
| goose-json | escaped | encode | 54 | 100000 | 105.9 | 103.9–109.8 | 107718681 |
<!-- samples | Goose DOM | escaped | decode | 176.475,175.548,176.426,177.395,173.120,175.508,169.183 -->
| Goose DOM | escaped | decode | 62 | 100000 | 175.5 | 169.2–177.4 | 15422000 |
<!-- samples | goose-json | array | decode | 9487.577,9504.679,9452.995,9923.925,9516.625,9654.532,9808.597 -->
| goose-json | array | decode | 4022 | 10000 | 9516.6 | 9453.0–9923.9 | 145337000 |
<!-- samples | goose-json | array | encode | 5833.234,5783.169,5731.127,5918.304,5891.073,5862.920,5756.853 -->
| goose-json | array | encode | 4022 | 10000 | 5833.2 | 5731.1–5918.3 | 289142183 |
<!-- samples | Goose DOM | array | decode | 24445.931,24370.257,24167.403,24206.731,25142.024,24441.466,23904.000 -->
| Goose DOM | array | decode | 4022 | 10000 | 24370.3 | 23904.0–25142.0 | 72846000 |
<!-- samples | goose-json | floats | decode | 4974.602,5022.918,4925.417,4977.537,4982.560,4965.491,5004.342 -->
| goose-json | floats | decode | 1581 | 1000 | 4977.5 | 4925.4–5022.9 | 2040000 |
<!-- samples | goose-json | floats | encode | 10534.408,10536.105,10877.393,10536.160,10778.578,11006.813,10547.342 -->
| goose-json | floats | encode | 1581 | 1000 | 10547.3 | 10534.4–11006.8 | 13042088 |
<!-- samples | Goose DOM | floats | decode | 6574.338,6525.226,6586.110,6485.248,6496.341,6579.696,6602.920 -->
| Goose DOM | floats | decode | 1581 | 1000 | 6574.3 | 6485.2–6602.9 | 2064000 |
<!-- samples | goose-json | floats-wide | decode | 8521.798,8133.658,8229.611,8409.409,8517.091,8366.950,8554.147 -->
| goose-json | floats-wide | decode | 5975 | 1000 | 8409.4 | 8133.7–8554.1 | 2136000 |
<!-- samples | goose-json | floats-wide | encode | 10880.185,10330.566,10688.365,10921.220,10987.578,10964.945,10923.041 -->
| goose-json | floats-wide | encode | 5862 | 1000 | 10921.2 | 10330.6–10987.6 | 47325760 |
<!-- samples | Goose DOM | floats-wide | decode | 17253.055,16166.748,16807.852,17468.773,17548.241,17359.137,17448.507 -->
| Goose DOM | floats-wide | decode | 5975 | 1000 | 17359.1 | 16166.7–17548.2 | 2064000 |
<!-- samples | goose-json | text-short | decode | 123.025,113.546,127.300,109.534,113.518,116.728,109.727 -->
| goose-json | text-short | decode | 97 | 100000 | 113.5 | 109.5–127.3 | 75007000 |
<!-- samples | goose-json | text-short | encode | 43.620,42.883,42.913,42.951,43.228,42.926,42.884 -->
| goose-json | text-short | encode | 97 | 100000 | 42.9 | 42.9–43.6 | 133196708 |
<!-- samples | Goose DOM | text-short | decode | 178.341,178.481,179.001,178.251,178.912,178.357,178.404 -->
| Goose DOM | text-short | decode | 97 | 100000 | 178.4 | 178.3–179.0 | 2804000 |
<!-- samples | goose-json | text-sparse | decode | 2340.936,2299.621,2373.562,2318.263,2242.039,2330.296,2360.068 -->
| goose-json | text-sparse | decode | 8233 | 1000 | 2330.3 | 2242.0–2373.6 | 65928000 |
<!-- samples | goose-json | text-sparse | encode | 1926.806,1919.818,1925.149,1938.177,1927.078,1933.611,1994.123 -->
| goose-json | text-sparse | encode | 8233 | 1000 | 1927.1 | 1919.8–1994.1 | 66662496 |
<!-- samples | Goose DOM | text-sparse | decode | 15159.986,15077.197,15532.729,15431.515,14871.907,14887.781,15036.656 -->
| Goose DOM | text-sparse | decode | 8233 | 1000 | 15077.2 | 14871.9–15532.7 | 65616000 |
<!-- samples | goose-json | text-ascii | decode | 876.723,851.191,887.940,825.089,858.193,832.427,938.784 -->
| goose-json | text-ascii | decode | 8225 | 1000 | 858.2 | 825.1–938.8 | 65880000 |
<!-- samples | goose-json | text-ascii | encode | 494.965,458.381,486.239,491.436,486.545,493.359,488.366 -->
| goose-json | text-ascii | encode | 8225 | 1000 | 488.4 | 458.4–495.0 | 66598496 |
<!-- samples | Goose DOM | text-ascii | decode | 7073.204,7112.173,7181.143,7070.506,7139.787,7045.641,7090.180 -->
| Goose DOM | text-ascii | decode | 8225 | 1000 | 7090.2 | 7045.6–7181.1 | 32000 |
<!-- samples | goose-json | text-escaped | decode | 12880.019,12823.774,12845.162,12752.434,13358.032,13154.690,13450.818 -->
| goose-json | text-escaped | decode | 8737 | 1000 | 12880.0 | 12752.4–13450.8 | 53592000 |
<!-- samples | goose-json | text-escaped | encode | 9483.150,9506.884,9671.608,9878.178,10087.447,9902.007,9799.317 -->
| goose-json | text-escaped | encode | 8737 | 1000 | 9799.3 | 9483.1–10087.4 | 70853440 |
<!-- samples | Goose DOM | text-escaped | decode | 14547.654,14883.134,14594.873,15015.927,15427.648,15768.562,14604.310 -->
| Goose DOM | text-escaped | decode | 8737 | 1000 | 14883.1 | 14547.7–15768.6 | 53280000 |
<!-- samples | goose-json | wide | decode | 812.617,742.223,790.121,781.833,790.709,779.657,787.267 -->
| goose-json | wide | decode | 135 | 20000 | 787.3 | 742.2–812.6 | 16920000 |
<!-- samples | goose-json | wide | encode | 187.028,186.145,173.175,166.989,183.119,177.686,186.886 -->
| goose-json | wide | encode | 135 | 20000 | 183.1 | 167.0–187.0 | 26639006 |
<!-- samples | Goose DOM | wide | decode | 416.171,416.696,419.926,424.885,419.200,422.992,404.622 -->
| Goose DOM | wide | decode | 135 | 20000 | 419.2 | 404.6–424.9 | 2397000 |
