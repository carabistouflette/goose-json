| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 81.696,77.829,76.456,74.511,71.332,77.723,74.690 -->
| goose-json | plain | decode | 38 | 200000 | 76.5 | 71.3–81.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 36.103,38.108,35.664,33.982,34.658,35.017,34.441 -->
| goose-json | plain | encode | 38 | 200000 | 35.0 | 34.0–38.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 55.732,58.034,55.276,53.203,53.367,55.213,53.221 -->
| Goose DOM | plain | decode | 38 | 200000 | 55.2 | 53.2–58.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 144.398,138.549,138.503,142.146,138.249,144.176,145.227 -->
| goose-json | escaped | decode | 62 | 200000 | 142.1 | 138.2–145.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 67.980,67.721,67.238,68.827,67.612,73.966,68.025 -->
| goose-json | escaped | encode | 54 | 200000 | 68.0 | 67.2–74.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 94.827,92.087,96.246,93.835,90.593,100.232,90.257 -->
| Goose DOM | escaped | decode | 62 | 200000 | 93.8 | 90.3–100.2 | 30822000 |
<!-- samples | goose-json | array | decode | 7871.193,7419.528,7881.543,7332.362,7633.539,7446.926,7217.527 -->
| goose-json | array | decode | 4022 | 20000 | 7446.9 | 7217.5–7881.5 | 288627000 |
<!-- samples | goose-json | array | encode | 4050.719,3978.588,3886.557,3909.495,4121.684,3954.800,3994.944 -->
| goose-json | array | encode | 4022 | 20000 | 3978.6 | 3886.6–4121.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12322.377,12264.453,12085.768,12106.982,12240.157,12041.446,12593.631 -->
| Goose DOM | array | decode | 4022 | 20000 | 12240.2 | 12041.4–12593.6 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 6972.990,6998.169,9130.320,8325.561,11278.208,7176.774,7455.670 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7455.7 | 6973.0–11278.2 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 4854.762,4819.477,5458.785,4850.854,6927.238,4725.972,4674.774 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4850.9 | 4674.8–6927.2 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 13027.972,13377.506,13387.826,14131.323,15678.936,12093.048,12238.255 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 13377.5 | 12093.0–15678.9 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 20976.296,32440.413,22367.860,23360.604,22097.133,21025.042,21560.432 -->
| goose-json | array-wide | decode | 19771 | 20000 | 22097.1 | 20976.3–32440.4 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 19222.692,20795.746,18195.541,18993.550,18651.655,18306.613,18724.292 -->
| goose-json | array-wide | encode | 19770 | 20000 | 18724.3 | 18195.5–20795.7 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 38226.431,34139.834,33743.496,33842.959,34493.266,33483.865,33684.595 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 33843.0 | 33483.9–38226.4 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1564.049,1599.048,1567.361,1665.568,1588.134,1690.306,1614.594 -->
| goose-json | mixed | decode | 1187 | 20000 | 1599.0 | 1564.0–1690.3 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1767.090,1867.528,1808.311,1842.374,1889.650,1829.515,1801.033 -->
| goose-json | mixed | encode | 1186 | 20000 | 1829.5 | 1767.1–1889.6 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1738.573,1767.275,1786.388,1792.924,2140.879,1909.920,1773.986 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1786.4 | 1738.6–2140.9 | 83331000 |
<!-- samples | goose-json | floats | decode | 3299.564,3309.483,3261.834,3169.061,3170.997,3169.951,3185.173 -->
| goose-json | floats | decode | 1581 | 2000 | 3185.2 | 3169.1–3309.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 7754.401,7533.197,7259.158,7276.373,7259.691,7258.842,7275.266 -->
| goose-json | floats | encode | 1581 | 2000 | 7275.3 | 7258.8–7754.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3239.419,3219.251,3096.787,3113.541,3084.443,3097.680,3073.360 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3097.7 | 3073.4–3239.4 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5569.810,5497.572,5493.452,5483.544,5517.743,5508.776,5714.743 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5508.8 | 5483.5–5714.7 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 7594.556,7576.396,7576.422,7588.461,7578.032,7670.176,7879.951 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 7588.5 | 7576.4–7880.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10169.620,10167.797,10144.274,10170.281,10178.370,10580.096,10597.156 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10170.3 | 10144.3–10597.2 | 3870000 |
<!-- samples | goose-json | text-short | decode | 83.659,83.993,88.010,84.955,79.534,77.581,80.256 -->
| goose-json | text-short | decode | 97 | 200000 | 83.7 | 77.6–88.0 | 149907000 |
<!-- samples | goose-json | text-short | encode | 34.935,34.470,36.576,35.638,35.082,32.598,32.242 -->
| goose-json | text-short | encode | 97 | 200000 | 34.9 | 32.2–36.6 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 89.750,91.375,91.738,90.719,87.216,87.833,85.522 -->
| Goose DOM | text-short | decode | 97 | 200000 | 89.8 | 85.5–91.7 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1225.667,1218.792,1220.833,1218.843,1225.021,1223.478,1225.176 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1223.5 | 1218.8–1225.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1174.153,1175.351,1174.641,1174.447,1175.358,1172.251,1176.367 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1174.6 | 1172.3–1176.4 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 9673.808,9694.661,9681.213,9677.567,9678.163,9670.355,9708.025 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 9678.2 | 9670.4–9708.0 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 865.125,939.160,1016.285,1199.738,1331.993,1296.307,1270.947 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1199.7 | 865.1–1332.0 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 559.095,590.506,649.117,788.062,816.518,818.939,772.162 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 772.2 | 559.1–818.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5257.637,5549.904,6207.606,7325.007,7387.695,7355.431,6550.364 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6550.4 | 5257.6–7387.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 10954.407,10563.872,9661.284,9652.071,9258.260,9259.790,10279.942 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9661.3 | 9258.3–10954.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 8165.993,7890.199,7626.069,7320.097,7104.366,7101.501,8055.401 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7626.1 | 7101.5–8166.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 12212.757,11724.280,11251.386,11119.672,10806.327,10928.662,12081.660 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11251.4 | 10806.3–12212.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 352.642,338.403,335.095,320.659,317.527,306.750,306.900 -->
| goose-json | wide | decode | 135 | 40000 | 320.7 | 306.8–352.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 117.687,120.885,119.437,117.136,116.621,110.928,116.406 -->
| goose-json | wide | encode | 135 | 40000 | 117.1 | 110.9–120.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 241.517,247.504,246.849,237.672,228.735,227.708,228.512 -->
| Goose DOM | wide | decode | 135 | 40000 | 237.7 | 227.7–247.5 | 4777000 |
