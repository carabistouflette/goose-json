| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 79.783,76.806,73.807,84.915,85.486,85.948,78.601 -->
| goose-json | plain | decode | 38 | 200000 | 79.8 | 73.8–85.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 35.947,35.896,37.210,44.574,39.077,39.189,36.020 -->
| goose-json | plain | encode | 38 | 200000 | 37.2 | 35.9–44.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.952,55.903,57.903,66.968,60.587,60.519,57.827 -->
| Goose DOM | plain | decode | 38 | 200000 | 58.0 | 55.9–67.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 148.116,171.049,157.698,146.697,166.380,164.384,166.155 -->
| goose-json | escaped | decode | 62 | 200000 | 164.4 | 146.7–171.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 70.806,79.576,69.580,69.880,71.951,70.856,74.126 -->
| goose-json | escaped | encode | 54 | 200000 | 70.9 | 69.6–79.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 107.979,103.233,96.925,106.172,101.547,101.368,99.144 -->
| Goose DOM | escaped | decode | 62 | 200000 | 101.5 | 96.9–108.0 | 30822000 |
<!-- samples | goose-json | array | decode | 8238.333,7915.782,8696.017,8563.488,11020.212,11521.937,11750.122 -->
| goose-json | array | decode | 4022 | 20000 | 8696.0 | 7915.8–11750.1 | 288627000 |
<!-- samples | goose-json | array | encode | 4310.779,4265.183,4481.584,4851.422,7071.737,6091.407,6251.720 -->
| goose-json | array | encode | 4022 | 20000 | 4851.4 | 4265.2–7071.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 13374.756,14172.897,20809.088,19070.729,21464.261,19619.306,19547.689 -->
| Goose DOM | array | decode | 4022 | 20000 | 19547.7 | 13374.8–21464.3 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 12699.012,12063.364,11627.149,12291.074,12539.518,11924.892,12188.351 -->
| goose-json | array-signed | decode | 4538 | 20000 | 12188.4 | 11627.1–12699.0 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6383.051,6206.385,6296.749,6476.558,6476.273,6305.073,5877.124 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6305.1 | 5877.1–6476.6 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 20538.583,20956.611,20563.685,21702.595,20460.573,21278.537,19639.620 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 20563.7 | 19639.6–21702.6 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32905.019,33904.198,32207.814,33312.633,31251.928,41669.621,32846.573 -->
| goose-json | array-wide | decode | 19771 | 20000 | 32905.0 | 31251.9–41669.6 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 14142.504,14634.481,12994.255,16716.532,13489.366,19366.173,16326.874 -->
| goose-json | array-wide | encode | 19770 | 20000 | 14634.5 | 12994.3–19366.2 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 52794.858,41749.342,44403.884,55105.823,42666.605,58503.582,60156.126 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 52794.9 | 41749.3–60156.1 | 144666000 |
<!-- samples | goose-json | mixed | decode | 3611.865,2699.291,2938.280,2651.386,2662.019,2647.791,2681.848 -->
| goose-json | mixed | decode | 1187 | 20000 | 2681.8 | 2647.8–3611.9 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2924.908,2927.675,2882.788,2792.203,2778.560,2839.777,2640.589 -->
| goose-json | mixed | encode | 1186 | 20000 | 2839.8 | 2640.6–2927.7 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 4423.387,4277.159,2975.319,2769.852,2786.331,2926.585,2923.928 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2926.6 | 2769.9–4423.4 | 83331000 |
<!-- samples | goose-json | floats | decode | 5337.037,5516.926,5667.456,5067.220,5518.875,5190.869,5348.813 -->
| goose-json | floats | decode | 1581 | 2000 | 5348.8 | 5067.2–5667.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 12165.208,13044.801,11873.543,12103.858,12156.413,12170.353,11503.037 -->
| goose-json | floats | encode | 1581 | 2000 | 12156.4 | 11503.0–13044.8 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5298.333,5750.059,4844.528,5231.536,5162.913,5319.031,4920.831 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5231.5 | 4844.5–5750.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8547.639,7668.291,8241.326,8395.558,8434.952,6682.958,8647.355 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8395.6 | 6683.0–8647.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11703.860,11451.748,11570.290,11773.660,10640.201,10025.365,11923.392 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11570.3 | 10025.4–11923.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 14637.971,15968.846,15952.265,16101.567,12860.819,15527.201,16559.259 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 15952.3 | 12860.8–16559.3 | 3870000 |
<!-- samples | goose-json | text-short | decode | 157.542,160.107,158.553,161.458,233.552,130.992,130.389 -->
| goose-json | text-short | decode | 97 | 200000 | 158.6 | 130.4–233.6 | 149907000 |
<!-- samples | goose-json | text-short | encode | 54.408,53.864,54.696,55.787,57.707,53.547,54.189 -->
| goose-json | text-short | encode | 97 | 200000 | 54.4 | 53.5–57.7 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 142.962,142.303,143.097,142.442,143.286,137.561,139.692 -->
| Goose DOM | text-short | decode | 97 | 200000 | 142.4 | 137.6–143.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2076.478,2031.182,2063.778,2144.320,1929.723,1929.656,2042.290 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2042.3 | 1929.7–2144.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1960.375,1962.686,1987.153,1933.954,1848.753,1842.275,1964.707 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1960.4 | 1842.3–1987.2 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 16137.194,16133.901,16107.064,15217.904,15243.521,15505.915,16301.558 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 16107.1 | 15217.9–16301.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1381.931,1314.037,1319.372,1377.919,1377.344,1303.301,1313.550 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1319.4 | 1303.3–1381.9 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 869.751,831.647,829.226,868.337,876.674,820.745,829.436 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 831.6 | 820.7–876.7 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7517.403,7441.225,7724.259,7623.614,7774.016,7508.083,7221.546 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7517.4 | 7221.5–7774.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 14325.548,14280.135,12507.499,14278.458,15094.366,15672.672,14881.285 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14325.5 | 12507.5–15672.7 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11257.928,11379.576,9637.809,11320.099,12196.699,12214.817,12259.771 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11379.6 | 9637.8–12259.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 16644.891,16003.909,14821.503,17160.725,18088.324,18352.429,17585.790 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17160.7 | 14821.5–18352.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 454.317,460.604,476.624,483.424,523.940,526.784,507.052 -->
| goose-json | wide | decode | 135 | 40000 | 483.4 | 454.3–526.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 170.278,180.758,170.600,174.480,185.836,182.772,186.647 -->
| goose-json | wide | encode | 135 | 40000 | 180.8 | 170.3–186.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 327.502,362.303,365.115,380.958,390.509,383.500,409.530 -->
| Goose DOM | wide | decode | 135 | 40000 | 381.0 | 327.5–409.5 | 4777000 |
