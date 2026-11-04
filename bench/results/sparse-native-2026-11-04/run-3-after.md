| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 103.009,94.277,102.657,102.425,111.823,106.711,106.340 -->
| goose-json | plain | decode | 38 | 200000 | 103.0 | 94.3–111.8 | 67248000 |
<!-- samples | goose-json | plain | encode | 41.409,39.392,39.933,40.503,42.960,41.954,39.539 -->
| goose-json | plain | encode | 38 | 200000 | 40.5 | 39.4–43.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 109.694,100.976,99.127,114.705,110.332,111.201,95.459 -->
| Goose DOM | plain | decode | 38 | 200000 | 109.7 | 95.5–114.7 | 5604000 |
<!-- samples | goose-json | escaped | decode | 175.092,181.629,204.252,197.748,198.960,181.830,200.336 -->
| goose-json | escaped | decode | 62 | 200000 | 197.7 | 175.1–204.3 | 85461000 |
<!-- samples | goose-json | escaped | encode | 91.652,82.847,88.693,96.914,92.321,87.409,94.967 -->
| goose-json | escaped | encode | 54 | 200000 | 91.7 | 82.8–96.9 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 132.307,145.938,137.496,154.015,139.830,140.688,143.085 -->
| Goose DOM | escaped | decode | 62 | 200000 | 140.7 | 132.3–154.0 | 30822000 |
<!-- samples | goose-json | array | decode | 8988.572,9091.864,8669.060,8593.466,8909.715,9102.424,9050.296 -->
| goose-json | array | decode | 4022 | 20000 | 8988.6 | 8593.5–9102.4 | 288627000 |
<!-- samples | goose-json | array | encode | 4997.274,5453.565,4990.660,5008.036,5427.233,5517.016,5046.557 -->
| goose-json | array | encode | 4022 | 20000 | 5046.6 | 4990.7–5517.0 | 574225548 |
<!-- samples | Goose DOM | array | decode | 20556.145,21126.593,20350.574,20217.070,22741.925,23156.206,21706.634 -->
| Goose DOM | array | decode | 4022 | 20000 | 21126.6 | 20217.1–23156.2 | 144666000 |
<!-- samples | goose-json | floats | decode | 4467.156,4660.466,4710.381,4208.186,4480.083,4332.089,4480.156 -->
| goose-json | floats | decode | 1581 | 2000 | 4480.1 | 4208.2–4710.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 9160.988,9683.165,9414.460,8548.594,9178.864,9342.752,9370.883 -->
| goose-json | floats | encode | 1581 | 2000 | 9342.8 | 8548.6–9683.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5724.523,5661.589,5654.529,5725.364,5281.511,5834.460,5780.059 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5724.5 | 5281.5–5834.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7951.075,8532.761,8046.189,8632.286,8248.196,7855.140,7897.904 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8046.2 | 7855.1–8632.3 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 9490.609,10436.638,10637.353,10414.990,10053.430,10336.789,9880.367 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 10336.8 | 9490.6–10637.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16446.074,16460.798,16554.369,17279.391,16097.118,16467.308,15777.124 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16460.8 | 15777.1–17279.4 | 3870000 |
<!-- samples | goose-json | text-short | decode | 114.756,111.559,110.694,109.937,118.940,112.846,120.947 -->
| goose-json | text-short | decode | 97 | 200000 | 112.8 | 109.9–120.9 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.130,42.293,42.420,42.792,43.064,41.013,42.560 -->
| goose-json | text-short | encode | 97 | 200000 | 42.6 | 41.0–43.1 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 164.462,170.416,166.142,171.637,172.687,169.426,171.223 -->
| Goose DOM | text-short | decode | 97 | 200000 | 170.4 | 164.5–172.7 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1104.898,1084.293,1032.617,1030.139,1077.225,1066.858,1050.762 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1066.9 | 1030.1–1104.9 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 913.311,924.958,813.189,819.265,864.020,863.772,868.798 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 864.0 | 813.2–925.0 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 14414.292,14618.827,14076.726,13704.920,14246.700,13988.674,13818.155 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 14076.7 | 13704.9–14618.8 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 733.226,865.860,852.524,847.479,812.798,861.367,773.225 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 847.5 | 733.2–865.9 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 416.096,480.797,497.346,492.074,494.050,493.562,448.430 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 492.1 | 416.1–497.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6832.725,7059.444,7066.394,7052.559,7085.729,7031.913,6619.527 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7052.6 | 6619.5–7085.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12531.135,11816.581,12815.371,13321.781,12747.952,12634.385,12174.528 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12634.4 | 11816.6–13321.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9466.803,9723.438,9702.476,9671.490,9355.230,9765.594,9160.353 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9671.5 | 9160.4–9765.6 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13573.579,14536.880,15058.635,14611.909,14283.430,14302.651,14016.388 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14302.7 | 13573.6–15058.6 | 99900000 |
<!-- samples | goose-json | wide | decode | 768.524,764.116,739.126,749.530,742.238,747.938,758.388 -->
| goose-json | wide | decode | 135 | 40000 | 749.5 | 739.1–768.5 | 33720000 |
<!-- samples | goose-json | wide | encode | 187.963,179.150,183.439,167.114,183.895,188.843,179.872 -->
| goose-json | wide | encode | 135 | 40000 | 183.4 | 167.1–188.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 426.917,426.780,426.258,399.086,425.523,425.698,425.922 -->
| Goose DOM | wide | decode | 135 | 40000 | 425.9 | 399.1–426.9 | 4777000 |
