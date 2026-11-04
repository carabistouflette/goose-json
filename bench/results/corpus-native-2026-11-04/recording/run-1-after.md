| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 79.893,77.084,72.333,77.819,79.184,75.055,77.841 -->
| goose-json | plain | decode | 38 | 200000 | 77.8 | 72.3–79.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 35.880,34.638,34.550,36.039,36.558,34.457,35.096 -->
| goose-json | plain | encode | 38 | 200000 | 35.1 | 34.5–36.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.562,55.189,57.057,55.337,57.259,56.173,55.384 -->
| Goose DOM | plain | decode | 38 | 200000 | 56.2 | 55.2–57.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 140.857,143.772,141.660,154.764,144.388,141.867,149.479 -->
| goose-json | escaped | decode | 62 | 200000 | 143.8 | 140.9–154.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 66.927,68.943,73.705,71.483,65.993,69.992,70.494 -->
| goose-json | escaped | encode | 54 | 200000 | 70.0 | 66.0–73.7 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 97.238,93.840,102.527,95.065,90.433,94.993,112.789 -->
| Goose DOM | escaped | decode | 62 | 200000 | 95.1 | 90.4–112.8 | 30822000 |
<!-- samples | goose-json | array | decode | 7901.635,7990.557,11108.610,7264.799,8531.169,7788.396,7450.045 -->
| goose-json | array | decode | 4022 | 20000 | 7901.6 | 7264.8–11108.6 | 288627000 |
<!-- samples | goose-json | array | encode | 3945.530,4019.614,5598.725,3848.650,4338.236,3848.484,3983.159 -->
| goose-json | array | encode | 4022 | 20000 | 3983.2 | 3848.5–5598.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 14189.302,16910.634,13449.905,12545.221,11845.789,11479.244,11924.682 -->
| Goose DOM | array | decode | 4022 | 20000 | 12545.2 | 11479.2–16910.6 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 7314.473,7657.171,7353.970,7377.056,7532.254,7021.622,7070.972 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7354.0 | 7021.6–7657.2 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 4849.593,4689.157,5979.038,4737.009,4853.159,4724.810,4979.915 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4849.6 | 4689.2–5979.0 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 12263.250,12540.237,12845.978,11976.356,11904.754,12376.418,12361.194 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 12361.2 | 11904.8–12846.0 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 21697.320,23094.748,21249.534,21545.044,21327.431,21676.460,22069.261 -->
| goose-json | array-wide | decode | 19771 | 20000 | 21676.5 | 21249.5–23094.7 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 24483.279,23829.621,25191.273,23803.326,24112.416,26480.011,24023.644 -->
| goose-json | array-wide | encode | 19770 | 20000 | 24112.4 | 23803.3–26480.0 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 35108.051,33705.990,37810.813,34470.062,34189.260,34601.556,34625.740 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 34601.6 | 33706.0–37810.8 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1558.751,1562.530,1674.240,1551.677,1708.516,1600.548,1620.065 -->
| goose-json | mixed | decode | 1187 | 20000 | 1600.5 | 1551.7–1708.5 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1764.700,1838.563,1833.815,1787.477,1954.653,1864.506,1793.557 -->
| goose-json | mixed | encode | 1186 | 20000 | 1833.8 | 1764.7–1954.7 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1757.670,1813.391,1752.733,1880.372,1852.332,1893.818,1788.755 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1813.4 | 1752.7–1893.8 | 83331000 |
<!-- samples | goose-json | floats | decode | 3172.198,3170.428,3168.831,3170.633,3180.671,3303.970,3302.818 -->
| goose-json | floats | decode | 1581 | 2000 | 3172.2 | 3168.8–3304.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 7277.989,7275.623,7267.856,7267.484,7331.752,7558.035,7549.810 -->
| goose-json | floats | encode | 1581 | 2000 | 7278.0 | 7267.5–7558.0 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3091.715,3074.600,3069.805,3091.749,3205.090,3235.071,3208.543 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3091.7 | 3069.8–3235.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5500.696,8729.894,6324.976,6961.195,7321.523,8340.823,6550.485 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 6961.2 | 5500.7–8729.9 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 9138.308,11029.756,8642.368,8861.246,11668.386,9910.031,8580.444 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 9138.3 | 8580.4–11668.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 15790.334,13123.447,12650.200,11738.817,16198.421,12828.022,10919.251 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 12828.0 | 10919.3–16198.4 | 3870000 |
<!-- samples | goose-json | text-short | decode | 93.943,96.316,87.172,82.189,93.784,107.558,87.534 -->
| goose-json | text-short | decode | 97 | 200000 | 93.8 | 82.2–107.6 | 149907000 |
<!-- samples | goose-json | text-short | encode | 37.984,39.721,35.215,33.869,42.460,39.446,34.011 -->
| goose-json | text-short | encode | 97 | 200000 | 38.0 | 33.9–42.5 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 106.837,100.459,91.297,98.929,117.428,98.906,88.922 -->
| Goose DOM | text-short | decode | 97 | 200000 | 98.9 | 88.9–117.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1252.504,1248.803,1238.645,1273.024,1222.176,1223.501,1225.928 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1238.6 | 1222.2–1273.0 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1175.699,1179.581,1178.800,1223.160,1174.478,1175.638,1177.284 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1177.3 | 1174.5–1223.2 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 9757.246,9675.088,9815.503,9768.620,9682.258,9687.636,9679.942 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 9687.6 | 9675.1–9815.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 861.072,878.245,955.707,913.376,910.486,863.218,860.860 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 878.2 | 860.9–955.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 528.113,546.082,586.239,565.264,544.386,544.218,546.014 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 546.0 | 528.1–586.2 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4883.903,4903.400,5201.691,5060.963,4879.148,4874.542,4900.787 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4900.8 | 4874.5–5201.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9674.337,9288.743,9305.381,11274.860,15870.788,15712.330,10979.433 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 10979.4 | 9288.7–15870.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7367.869,7098.077,7719.971,10604.543,11967.697,11510.226,7779.931 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7779.9 | 7098.1–11967.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 10941.072,10831.481,11575.341,17735.854,18018.768,15142.990,11490.882 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11575.3 | 10831.5–18018.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 316.204,318.874,320.627,307.000,319.809,308.188,304.957 -->
| goose-json | wide | decode | 135 | 40000 | 316.2 | 305.0–320.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 124.001,113.172,115.816,116.082,114.810,112.853,119.747 -->
| goose-json | wide | encode | 135 | 40000 | 115.8 | 112.9–124.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 246.080,236.956,234.624,235.291,233.643,228.534,230.629 -->
| Goose DOM | wide | decode | 135 | 40000 | 234.6 | 228.5–246.1 | 4777000 |
