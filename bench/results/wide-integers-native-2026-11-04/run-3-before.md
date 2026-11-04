| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 273.305,263.449,260.523,264.032,249.350,271.619,254.561 -->
| goose-json | plain | decode | 38 | 200000 | 263.4 | 249.4–273.3 | 67248000 |
<!-- samples | goose-json | plain | encode | 138.631,111.100,132.849,136.990,123.672,109.490,133.837 -->
| goose-json | plain | encode | 38 | 200000 | 132.8 | 109.5–138.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 185.289,224.454,203.424,208.131,186.451,217.826,189.214 -->
| Goose DOM | plain | decode | 38 | 200000 | 203.4 | 185.3–224.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 511.686,543.143,517.912,534.781,500.203,511.507,529.970 -->
| goose-json | escaped | decode | 62 | 200000 | 517.9 | 500.2–543.1 | 85461000 |
<!-- samples | goose-json | escaped | encode | 239.661,244.749,248.053,240.519,253.867,243.121,238.317 -->
| goose-json | escaped | encode | 54 | 200000 | 243.1 | 238.3–253.9 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 375.572,346.963,326.210,336.348,343.319,334.100,346.015 -->
| Goose DOM | escaped | decode | 62 | 200000 | 343.3 | 326.2–375.6 | 30822000 |
<!-- samples | goose-json | array | decode | 25566.848,25559.818,29813.095,27319.931,27106.451,27219.136,26735.939 -->
| goose-json | array | decode | 4022 | 20000 | 27106.5 | 25559.8–29813.1 | 288627000 |
<!-- samples | goose-json | array | encode | 13390.617,14117.169,14819.393,14067.323,15096.194,14454.998,13980.769 -->
| goose-json | array | encode | 4022 | 20000 | 14117.2 | 13390.6–15096.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 43715.099,48948.302,44916.340,46270.172,45919.581,45464.915,45933.642 -->
| Goose DOM | array | decode | 4022 | 20000 | 45919.6 | 43715.1–48948.3 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 25242.175,25335.710,24213.159,24555.759,25124.814,23622.553,23104.708 -->
| goose-json | array-signed | decode | 4538 | 20000 | 24555.8 | 23104.7–25335.7 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 16843.528,16574.954,15896.506,15551.103,15517.992,15319.667,15462.281 -->
| goose-json | array-signed | encode | 4537 | 20000 | 15551.1 | 15319.7–16843.5 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 47080.417,47103.079,43895.744,46723.872,42954.996,42825.626,43715.499 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 43895.7 | 42825.6–47103.1 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 69454.754,70558.287,74558.987,75891.428,75703.889,69337.931,72021.037 -->
| goose-json | array-wide | decode | 19771 | 20000 | 72021.0 | 69337.9–75891.4 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 59769.754,67304.224,61323.775,65573.290,66093.437,60595.834,65335.373 -->
| goose-json | array-wide | encode | 19770 | 20000 | 65335.4 | 59769.8–67304.2 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 111097.093,120098.441,121523.347,111679.180,112604.122,113508.234,114291.537 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 113508.2 | 111097.1–121523.3 | 144666000 |
<!-- samples | goose-json | mixed | decode | 5356.111,5539.234,5638.118,5818.338,5700.908,5387.555,6160.512 -->
| goose-json | mixed | decode | 1187 | 20000 | 5638.1 | 5356.1–6160.5 | 227997000 |
<!-- samples | goose-json | mixed | encode | 5898.425,5953.155,6616.048,6436.515,5772.478,6293.454,6536.423 -->
| goose-json | mixed | encode | 1186 | 20000 | 6293.5 | 5772.5–6616.0 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 6351.877,6605.975,6914.606,7343.919,6174.463,6372.251,6809.497 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 6606.0 | 6174.5–7343.9 | 83331000 |
<!-- samples | goose-json | floats | decode | 12538.890,11036.041,10587.253,12827.859,10762.042,9844.115,11078.093 -->
| goose-json | floats | decode | 1581 | 2000 | 11036.0 | 9844.1–12827.9 | 3825000 |
<!-- samples | goose-json | floats | encode | 28336.209,24475.923,24924.866,23551.733,24577.175,26861.941,26582.339 -->
| goose-json | floats | encode | 1581 | 2000 | 24924.9 | 23551.7–28336.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 11052.622,9806.577,9947.139,11309.560,9942.460,10221.414,10774.366 -->
| Goose DOM | floats | decode | 1581 | 2000 | 10221.4 | 9806.6–11309.6 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 18486.223,17955.395,20857.339,17357.905,20585.757,18877.945,17789.287 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 18486.2 | 17357.9–20857.3 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 23661.748,27114.890,24099.378,25452.183,27881.570,25929.540,24159.323 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 25452.2 | 23661.7–27881.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 34987.177,33208.525,35248.785,35186.160,37027.997,36211.369,35052.381 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 35186.2 | 33208.5–37028.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 248.540,264.026,257.283,249.091,272.559,312.277,326.300 -->
| goose-json | text-short | decode | 97 | 200000 | 264.0 | 248.5–326.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 106.278,112.670,118.151,103.890,101.749,134.032,142.127 -->
| goose-json | text-short | encode | 97 | 200000 | 112.7 | 101.7–142.1 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 297.732,279.061,298.772,285.236,278.439,356.991,394.695 -->
| Goose DOM | text-short | decode | 97 | 200000 | 297.7 | 278.4–394.7 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 7613.604,3775.840,4274.917,4300.690,5002.685,4163.247,3650.727 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 4274.9 | 3650.7–7613.6 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 3731.779,4646.344,3859.905,4603.304,2234.751,3532.864,4814.520 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 3859.9 | 2234.8–4814.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 33179.975,36036.093,35798.478,34762.610,32996.548,36218.512,33128.993 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 34762.6 | 32996.5–36218.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 2511.802,3021.405,2926.079,2943.452,2980.414,2016.203,2950.710 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 2943.5 | 2016.2–3021.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 931.850,2378.706,1515.541,2368.347,2153.258,1784.495,2359.713 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 2153.3 | 931.9–2378.7 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 16663.453,16617.918,17044.627,13341.453,17177.201,16241.555,16553.594 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 16617.9 | 13341.5–17177.2 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 35381.209,37855.357,32210.785,34613.588,33611.609,30243.591,33274.675 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 33611.6 | 30243.6–37855.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 24615.297,24935.905,23013.311,23556.267,24344.962,24674.813,36630.717 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 24615.3 | 23013.3–36630.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 42407.658,37337.814,40076.092,36383.882,38633.375,37469.681,34014.508 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 37469.7 | 34014.5–42407.7 | 99900000 |
<!-- samples | goose-json | wide | decode | 1089.455,1021.025,1020.554,1097.882,1122.876,998.231,1055.229 -->
| goose-json | wide | decode | 135 | 40000 | 1055.2 | 998.2–1122.9 | 33720000 |
<!-- samples | goose-json | wide | encode | 420.763,349.459,415.191,379.375,340.286,384.213,424.816 -->
| goose-json | wide | encode | 135 | 40000 | 384.2 | 340.3–424.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 752.200,807.260,770.805,706.855,797.059,781.290,856.659 -->
| Goose DOM | wide | decode | 135 | 40000 | 781.3 | 706.9–856.7 | 4777000 |
