| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 277.681,274.082,239.232,251.376,252.415,237.504,234.460 -->
| goose-json | plain | decode | 38 | 200000 | 251.4 | 234.5–277.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 114.261,109.293,128.809,112.153,120.487,122.316,106.834 -->
| goose-json | plain | encode | 38 | 200000 | 114.3 | 106.8–128.8 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 209.769,177.598,193.649,170.555,177.663,177.478,170.609 -->
| Goose DOM | plain | decode | 38 | 200000 | 177.6 | 170.6–209.8 | 5604000 |
<!-- samples | goose-json | escaped | decode | 461.263,485.862,528.465,447.058,495.894,451.708,460.422 -->
| goose-json | escaped | decode | 62 | 200000 | 461.3 | 447.1–528.5 | 85461000 |
<!-- samples | goose-json | escaped | encode | 225.449,241.500,262.817,216.524,238.658,239.371,217.287 -->
| goose-json | escaped | encode | 54 | 200000 | 238.7 | 216.5–262.8 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 287.584,318.028,340.507,299.795,292.647,294.056,293.051 -->
| Goose DOM | escaped | decode | 62 | 200000 | 294.1 | 287.6–340.5 | 30822000 |
<!-- samples | goose-json | array | decode | 24727.444,23888.176,25319.438,24005.461,25636.921,25552.817,24871.145 -->
| goose-json | array | decode | 4022 | 20000 | 24871.1 | 23888.2–25636.9 | 288627000 |
<!-- samples | goose-json | array | encode | 12821.390,12550.824,14766.262,12714.116,13096.266,12626.189,12824.936 -->
| goose-json | array | encode | 4022 | 20000 | 12821.4 | 12550.8–14766.3 | 574225548 |
<!-- samples | Goose DOM | array | decode | 41609.039,39284.677,42646.566,41582.245,42199.181,40688.648,40457.075 -->
| Goose DOM | array | decode | 4022 | 20000 | 41582.2 | 39284.7–42646.6 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 23321.106,23585.620,23140.840,23432.033,24777.853,25271.328,24549.387 -->
| goose-json | array-signed | decode | 4538 | 20000 | 23585.6 | 23140.8–25271.3 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 12597.432,12928.549,12948.222,12811.676,13664.476,13795.694,13020.480 -->
| goose-json | array-signed | encode | 4537 | 20000 | 12948.2 | 12597.4–13795.7 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 43995.865,42332.801,42406.542,41810.774,45005.518,45615.241,43306.278 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 43306.3 | 41810.8–45615.2 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 72084.641,68827.998,72937.538,70476.212,75565.300,69872.667,70239.243 -->
| goose-json | array-wide | decode | 19771 | 20000 | 70476.2 | 68828.0–75565.3 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 37170.132,36443.618,34997.528,34477.395,35244.539,34618.932,34714.891 -->
| goose-json | array-wide | encode | 19770 | 20000 | 34997.5 | 34477.4–37170.1 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 111146.809,116357.455,116781.422,113781.693,112608.407,113376.381,114970.096 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 113781.7 | 111146.8–116781.4 | 144666000 |
<!-- samples | goose-json | mixed | decode | 6450.669,5433.392,7719.787,6573.136,5243.415,7190.171,6487.541 -->
| goose-json | mixed | decode | 1187 | 20000 | 6487.5 | 5243.4–7719.8 | 227997000 |
<!-- samples | goose-json | mixed | encode | 6435.949,6003.994,5818.344,6519.821,6444.290,7267.219,6901.346 -->
| goose-json | mixed | encode | 1186 | 20000 | 6444.3 | 5818.3–7267.2 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 7034.038,12512.151,6827.820,6847.511,8258.353,6946.917,6552.223 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 6946.9 | 6552.2–12512.2 | 83331000 |
<!-- samples | goose-json | floats | decode | 11373.496,11515.403,11171.578,11383.344,11079.759,11300.764,11623.635 -->
| goose-json | floats | decode | 1581 | 2000 | 11373.5 | 11079.8–11623.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 24841.572,24034.849,24398.180,24150.752,24391.707,25368.829,22764.693 -->
| goose-json | floats | encode | 1581 | 2000 | 24391.7 | 22764.7–25368.8 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 9291.238,8568.665,10449.567,9449.242,10890.131,10152.745,10044.914 -->
| Goose DOM | floats | decode | 1581 | 2000 | 10044.9 | 8568.7–10890.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 20868.362,22001.164,21862.821,19992.970,19897.631,17145.298,19892.334 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 19993.0 | 17145.3–22001.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 30080.210,25740.962,25317.047,30991.236,27637.708,25784.078,27453.482 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 27453.5 | 25317.0–30991.2 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 38753.374,38367.317,35748.247,38183.316,37605.304,36196.999,33960.643 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 37605.3 | 33960.6–38753.4 | 3870000 |
<!-- samples | goose-json | text-short | decode | 281.161,291.825,273.906,301.822,390.223,332.530,283.580 -->
| goose-json | text-short | decode | 97 | 200000 | 291.8 | 273.9–390.2 | 149907000 |
<!-- samples | goose-json | text-short | encode | 125.237,129.035,111.815,117.266,136.010,160.564,119.692 -->
| goose-json | text-short | encode | 97 | 200000 | 125.2 | 111.8–160.6 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 327.555,309.667,348.330,318.646,320.979,276.311,283.728 -->
| Goose DOM | text-short | decode | 97 | 200000 | 318.6 | 276.3–348.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 4540.565,3643.828,4965.534,4813.462,3872.179,3474.046,5086.066 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 4540.6 | 3474.0–5086.1 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 4038.204,5101.859,3537.070,4211.505,5149.636,4075.421,5269.476 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 4211.5 | 3537.1–5269.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 33817.777,31369.677,32418.911,36171.257,35249.378,34748.012,37065.973 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 34748.0 | 31369.7–37066.0 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 3190.765,2933.591,1575.768,2363.466,2784.776,2920.812,2996.277 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 2920.8 | 1575.8–3190.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 997.854,1776.509,1669.219,1263.988,2855.954,2548.046,923.426 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 1669.2 | 923.4–2856.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 17738.144,17313.930,18307.480,17985.989,16079.833,16439.961,17462.944 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 17462.9 | 16079.8–18307.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 37477.009,31856.761,32801.633,33049.827,34381.732,34291.158,33570.492 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 33570.5 | 31856.8–37477.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 27212.280,26822.592,26222.487,28210.894,26287.949,26213.210,28892.394 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 26822.6 | 26213.2–28892.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 37355.721,38253.177,40347.329,40212.400,38191.152,39819.106,41137.938 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 39819.1 | 37355.7–41137.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 1129.454,999.575,986.660,1039.534,988.923,1087.716,1133.210 -->
| goose-json | wide | decode | 135 | 40000 | 1039.5 | 986.7–1133.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 408.926,453.105,310.425,351.143,349.593,430.532,412.713 -->
| goose-json | wide | encode | 135 | 40000 | 408.9 | 310.4–453.1 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 834.745,806.661,798.390,806.085,794.183,847.143,785.605 -->
| Goose DOM | wide | decode | 135 | 40000 | 806.1 | 785.6–847.1 | 4777000 |
