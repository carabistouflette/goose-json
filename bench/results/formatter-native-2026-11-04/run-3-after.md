| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 111.179,98.231,97.464,107.515,90.118,77.047,92.677 -->
| goose-json | plain | decode | 38 | 200000 | 97.5 | 77.0–111.2 | 67248000 |
<!-- samples | goose-json | plain | encode | 49.854,45.517,46.905,50.873,38.679,34.481,45.232 -->
| goose-json | plain | encode | 38 | 200000 | 45.5 | 34.5–50.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 84.427,79.893,83.367,79.330,62.960,58.478,68.503 -->
| Goose DOM | plain | decode | 38 | 200000 | 79.3 | 58.5–84.4 | 5604000 |
<!-- samples | goose-json | escaped | decode | 165.024,139.210,139.811,149.073,143.853,150.642,143.152 -->
| goose-json | escaped | decode | 62 | 200000 | 143.9 | 139.2–165.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 74.268,69.754,72.170,72.280,69.821,72.255,77.521 -->
| goose-json | escaped | encode | 54 | 200000 | 72.3 | 69.8–77.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 100.136,99.080,108.517,98.996,100.570,97.930,108.382 -->
| Goose DOM | escaped | decode | 62 | 200000 | 100.1 | 97.9–108.5 | 30822000 |
<!-- samples | goose-json | array | decode | 9416.568,9687.688,9586.103,13282.239,13267.570,12841.194,13046.852 -->
| goose-json | array | decode | 4022 | 20000 | 12841.2 | 9416.6–13282.2 | 288627000 |
<!-- samples | goose-json | array | encode | 4272.229,5766.528,7095.808,8026.360,8288.407,11829.050,8395.460 -->
| goose-json | array | encode | 4022 | 20000 | 8026.4 | 4272.2–11829.1 | 574225548 |
<!-- samples | Goose DOM | array | decode | 14160.419,12839.395,15814.047,19240.644,18663.272,19073.035,18833.011 -->
| Goose DOM | array | decode | 4022 | 20000 | 18663.3 | 12839.4–19240.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 4476.162,4997.185,5014.694,4985.276,5029.819,4999.199,5011.284 -->
| goose-json | floats | decode | 1581 | 2000 | 4999.2 | 4476.2–5029.8 | 3825000 |
<!-- samples | goose-json | floats | encode | 10254.970,11417.283,11421.176,11431.493,11475.276,11386.398,11415.329 -->
| goose-json | floats | encode | 1581 | 2000 | 11417.3 | 10255.0–11475.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4588.618,4984.284,4994.126,4896.146,4965.616,4979.800,4968.483 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4968.5 | 4588.6–4994.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8672.792,8792.586,8801.785,8733.485,8697.995,8689.374,8752.616 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8733.5 | 8672.8–8801.8 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11908.533,11885.274,11926.886,11904.180,11872.480,11870.029,11859.146 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11885.3 | 11859.1–11926.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16110.280,16027.085,16219.207,16153.340,15973.370,16123.817,16196.811 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16123.8 | 15973.4–16219.2 | 3870000 |
<!-- samples | goose-json | text-short | decode | 123.091,109.788,99.964,99.600,105.299,104.843,103.326 -->
| goose-json | text-short | decode | 97 | 200000 | 104.8 | 99.6–123.1 | 149907000 |
<!-- samples | goose-json | text-short | encode | 52.032,52.699,48.214,50.826,54.333,51.425,54.166 -->
| goose-json | text-short | encode | 97 | 200000 | 52.0 | 48.2–54.3 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 134.096,128.062,126.744,134.526,134.194,130.192,134.410 -->
| Goose DOM | text-short | decode | 97 | 200000 | 134.1 | 126.7–134.5 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2097.550,2018.120,1755.015,2020.819,2147.260,2133.419,2167.198 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2097.6 | 1755.0–2167.2 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1854.718,1676.333,1592.010,1767.836,1840.464,1853.124,1867.430 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1840.5 | 1592.0–1867.4 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 14851.213,12587.822,13682.043,14999.076,14759.206,15246.451,15241.494 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 14851.2 | 12587.8–15246.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1291.596,1288.518,1295.659,1285.189,1279.956,1226.756,1217.431 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1285.2 | 1217.4–1295.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 822.242,832.444,823.888,823.078,826.448,779.520,791.147 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 823.1 | 779.5–832.4 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7386.423,7388.185,7370.946,7233.618,7032.596,6985.124,6990.878 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7233.6 | 6985.1–7388.2 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13545.403,14942.024,14599.712,13873.958,14449.164,13933.872,14854.899 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14449.2 | 13545.4–14942.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10839.027,11556.084,10798.066,10851.177,10842.380,10875.049,11559.297 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10851.2 | 10798.1–11559.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 16890.017,17592.012,15718.252,16554.638,16115.477,17295.675,17432.514 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 16890.0 | 15718.3–17592.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 437.708,433.748,430.301,442.502,445.516,446.672,447.336 -->
| goose-json | wide | decode | 135 | 40000 | 442.5 | 430.3–447.3 | 33720000 |
<!-- samples | goose-json | wide | encode | 171.865,158.364,162.220,165.829,161.523,162.274,170.058 -->
| goose-json | wide | encode | 135 | 40000 | 162.3 | 158.4–171.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 390.625,390.833,393.101,392.142,391.446,389.458,375.157 -->
| Goose DOM | wide | decode | 135 | 40000 | 390.8 | 375.2–393.1 | 4777000 |
