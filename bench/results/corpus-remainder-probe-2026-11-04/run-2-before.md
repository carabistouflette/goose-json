| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 84.585,76.666,77.959,75.838,80.639,81.935,76.886 -->
| goose-json | plain | decode | 38 | 200000 | 78.0 | 75.8–84.6 | 67248000 |
<!-- samples | goose-json | plain | encode | 36.962,38.166,36.159,36.436,38.705,38.020,35.471 -->
| goose-json | plain | encode | 38 | 200000 | 37.0 | 35.5–38.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.645,55.494,55.482,56.915,62.147,57.605,55.388 -->
| Goose DOM | plain | decode | 38 | 200000 | 56.9 | 55.4–62.1 | 5604000 |
<!-- samples | goose-json | escaped | decode | 156.689,150.459,154.842,162.488,187.082,201.162,192.670 -->
| goose-json | escaped | decode | 62 | 200000 | 162.5 | 150.5–201.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 74.793,73.798,71.887,82.092,99.189,104.904,111.528 -->
| goose-json | escaped | encode | 54 | 200000 | 82.1 | 71.9–111.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 100.729,99.751,99.758,118.222,133.815,133.063,149.758 -->
| Goose DOM | escaped | decode | 62 | 200000 | 118.2 | 99.8–149.8 | 30822000 |
<!-- samples | goose-json | array | decode | 9677.776,13770.659,10581.947,8663.995,7809.869,10905.371,10031.753 -->
| goose-json | array | decode | 4022 | 20000 | 10031.8 | 7809.9–13770.7 | 288627000 |
<!-- samples | goose-json | array | encode | 4876.101,6232.440,4980.849,4097.800,4337.734,5317.181,4860.475 -->
| goose-json | array | encode | 4022 | 20000 | 4876.1 | 4097.8–6232.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 17731.259,19025.066,15323.657,12954.030,16580.878,16540.242,17432.276 -->
| Goose DOM | array | decode | 4022 | 20000 | 16580.9 | 12954.0–19025.1 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11662.436,10856.899,10823.576,11901.888,11022.159,8320.833,11701.301 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11022.2 | 8320.8–11901.9 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 7230.706,7703.864,7817.352,7560.246,6117.658,6291.575,7577.511 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7560.2 | 6117.7–7817.4 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 16829.710,19900.088,19017.010,19135.139,13117.142,16848.361,19741.815 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19017.0 | 13117.1–19900.1 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 30484.784,26926.411,23782.926,27322.238,24937.033,24679.547,25947.653 -->
| goose-json | array-wide | decode | 19771 | 20000 | 25947.7 | 23782.9–30484.8 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 20550.565,23500.910,19668.588,25401.741,21264.570,20762.051,20241.992 -->
| goose-json | array-wide | encode | 19770 | 20000 | 20762.1 | 19668.6–25401.7 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 38952.565,38880.378,41847.749,40859.292,40051.329,35510.988,40361.918 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 40051.3 | 35511.0–41847.7 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2052.378,2238.842,2342.598,2164.897,1957.123,1695.274,1625.182 -->
| goose-json | mixed | decode | 1187 | 20000 | 2052.4 | 1625.2–2342.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2532.639,2268.513,2613.619,2466.700,2079.487,2077.211,1837.593 -->
| goose-json | mixed | encode | 1186 | 20000 | 2268.5 | 1837.6–2613.6 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2838.403,2813.740,2662.017,2365.249,2084.589,2059.598,2002.394 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2365.2 | 2002.4–2838.4 | 83331000 |
<!-- samples | goose-json | floats | decode | 3349.939,3315.924,3310.223,3326.501,3722.287,4613.498,4287.521 -->
| goose-json | floats | decode | 1581 | 2000 | 3349.9 | 3310.2–4613.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 7562.659,7557.956,7561.902,7917.421,8528.102,10455.404,9016.114 -->
| goose-json | floats | encode | 1581 | 2000 | 7917.4 | 7558.0–10455.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3219.012,3250.378,3192.161,3431.211,4316.294,4276.119,3649.640 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3431.2 | 3192.2–4316.3 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5967.461,5935.546,5775.242,5775.025,6609.392,7057.779,6677.239 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5967.5 | 5775.0–7057.8 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8188.824,8027.579,7954.899,7894.944,9444.731,9376.933,8808.049 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8188.8 | 7894.9–9444.7 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10936.131,10586.643,10591.514,10898.896,12529.574,12360.210,11197.458 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10936.1 | 10586.6–12529.6 | 3870000 |
<!-- samples | goose-json | text-short | decode | 83.818,84.813,81.312,81.584,82.122,82.652,85.539 -->
| goose-json | text-short | decode | 97 | 200000 | 82.7 | 81.3–85.5 | 149907000 |
<!-- samples | goose-json | text-short | encode | 34.450,34.640,33.867,35.527,34.350,34.362,34.117 -->
| goose-json | text-short | encode | 97 | 200000 | 34.4 | 33.9–35.5 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 89.410,90.290,88.989,91.330,89.046,88.988,89.066 -->
| Goose DOM | text-short | decode | 97 | 200000 | 89.1 | 89.0–91.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1276.176,1307.910,1345.452,1325.260,1286.047,1285.131,1313.406 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1307.9 | 1276.2–1345.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1239.649,1305.489,1292.953,1248.817,1234.775,1236.237,1249.063 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1248.8 | 1234.8–1305.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 10131.531,11043.666,10480.364,10094.283,10091.497,10101.061,10351.925 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10131.5 | 10091.5–11043.7 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 863.279,887.024,897.855,934.621,934.620,1117.424,1158.531 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 934.6 | 863.3–1158.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 545.726,565.227,564.923,594.585,598.856,703.295,715.365 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 594.6 | 545.7–715.4 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4938.434,5163.525,5210.601,5289.655,5822.600,6513.954,6680.825 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 5289.7 | 4938.4–6680.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13899.343,12394.609,14608.005,16275.533,13340.653,10802.662,12559.630 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13340.7 | 10802.7–16275.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9802.002,8585.713,11296.665,11967.327,8928.043,7792.514,8308.811 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 8928.0 | 7792.5–11967.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13971.707,13585.524,17088.364,17274.913,12760.503,13691.033,12164.504 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 13691.0 | 12164.5–17274.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 328.448,326.924,321.542,324.101,342.995,344.951,331.656 -->
| goose-json | wide | decode | 135 | 40000 | 328.4 | 321.5–345.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 128.316,122.404,119.563,118.487,134.336,121.773,122.894 -->
| goose-json | wide | encode | 135 | 40000 | 122.4 | 118.5–134.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 247.560,238.404,239.662,239.172,260.786,247.706,247.461 -->
| Goose DOM | wide | decode | 135 | 40000 | 247.5 | 238.4–260.8 | 4777000 |
