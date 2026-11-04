| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 104.713,106.933,107.853,106.046,111.742,119.015,111.088 -->
| goose-json | plain | decode | 38 | 200000 | 107.9 | 104.7–119.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 43.276,42.874,43.281,44.107,43.921,44.116,45.856 -->
| goose-json | plain | encode | 38 | 200000 | 43.9 | 42.9–45.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.035,119.183,119.919,120.968,123.707,120.051,120.672 -->
| Goose DOM | plain | decode | 38 | 200000 | 120.7 | 119.2–123.7 | 5604000 |
<!-- samples | goose-json | escaped | decode | 211.572,211.717,215.840,217.105,215.011,217.615,218.795 -->
| goose-json | escaped | decode | 62 | 200000 | 215.8 | 211.6–218.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 99.136,104.730,102.887,102.446,102.155,101.032,100.318 -->
| goose-json | escaped | encode | 54 | 200000 | 102.2 | 99.1–104.7 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 161.965,166.697,168.007,165.375,165.953,169.016,166.481 -->
| Goose DOM | escaped | decode | 62 | 200000 | 166.5 | 162.0–169.0 | 30822000 |
<!-- samples | goose-json | array | decode | 9444.100,9697.459,9877.196,9861.510,9502.038,9517.283,9470.916 -->
| goose-json | array | decode | 4022 | 20000 | 9517.3 | 9444.1–9877.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5846.748,5845.476,6087.926,5968.485,5828.795,5863.194,5791.993 -->
| goose-json | array | encode | 4022 | 20000 | 5846.7 | 5792.0–6087.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 25029.601,24904.828,25527.923,25429.450,25096.270,25064.971,24960.653 -->
| Goose DOM | array | decode | 4022 | 20000 | 25065.0 | 24904.8–25527.9 | 144666000 |
<!-- samples | goose-json | floats | decode | 4955.957,4950.427,4951.860,4977.168,5177.459,5019.036,5267.311 -->
| goose-json | floats | decode | 1581 | 2000 | 4977.2 | 4950.4–5267.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 10227.915,10176.787,10203.949,10541.218,10393.432,10480.050,10698.093 -->
| goose-json | floats | encode | 1581 | 2000 | 10393.4 | 10176.8–10698.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6583.590,6684.903,6619.383,6796.725,6629.030,6984.194,6842.000 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6684.9 | 6583.6–6984.2 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8704.463,8573.346,8544.127,8559.119,8432.057,8578.957,8455.743 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8559.1 | 8432.1–8704.5 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11587.257,11561.169,11614.855,11622.623,11564.707,11708.903,11601.616 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11601.6 | 11561.2–11708.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17637.018,17693.469,17879.377,17669.117,17661.578,17664.580,17648.890 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17664.6 | 17637.0–17879.4 | 3870000 |
<!-- samples | goose-json | text-short | decode | 117.796,112.194,116.115,113.158,109.747,115.879,113.639 -->
| goose-json | text-short | decode | 97 | 200000 | 113.6 | 109.7–117.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 42.419,44.775,42.272,42.040,41.958,42.036,42.852 -->
| goose-json | text-short | encode | 97 | 200000 | 42.3 | 42.0–44.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 182.503,182.698,182.032,180.866,180.714,181.287,186.456 -->
| Goose DOM | text-short | decode | 97 | 200000 | 182.0 | 180.7–186.5 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2372.881,2500.681,2326.937,2337.954,2393.930,2343.780,2361.455 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2361.5 | 2326.9–2500.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1991.532,2069.765,2083.948,2000.101,2006.512,2000.635,2003.479 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 2003.5 | 1991.5–2083.9 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15673.105,15648.020,15354.925,15135.272,15261.820,15168.218,15541.373 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15354.9 | 15135.3–15673.1 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 955.346,1003.291,970.514,1074.433,957.863,1016.229,989.511 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 989.5 | 955.3–1074.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 639.861,637.962,638.159,679.855,640.527,684.257,640.041 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 640.0 | 638.0–684.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7158.257,7128.476,7313.650,7292.707,7320.880,7322.381,7217.002 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7292.7 | 7128.5–7322.4 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13145.429,12889.192,13047.824,12811.692,12857.010,13023.651,12935.047 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12935.0 | 12811.7–13145.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10563.189,10550.621,10241.069,10184.361,10303.234,10527.962,10218.783 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10303.2 | 10184.4–10563.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14821.907,15160.219,14236.701,14713.722,14996.490,14824.814,14831.480 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14824.8 | 14236.7–15160.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 801.678,812.599,788.075,755.842,770.128,797.790,794.324 -->
| goose-json | wide | decode | 135 | 40000 | 794.3 | 755.8–812.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 190.812,199.007,191.095,187.491,179.470,188.852,191.555 -->
| goose-json | wide | encode | 135 | 40000 | 190.8 | 179.5–199.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 416.646,425.762,409.777,412.349,425.601,426.610,429.031 -->
| Goose DOM | wide | decode | 135 | 40000 | 425.6 | 409.8–429.0 | 4777000 |
