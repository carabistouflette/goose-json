| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 109.215,97.786,93.044,96.433,96.510,97.483,98.287 -->
| goose-json | plain | decode | 38 | 200000 | 97.5 | 93.0–109.2 | 67248000 |
<!-- samples | goose-json | plain | encode | 46.956,44.942,43.438,47.126,44.445,46.964,45.952 -->
| goose-json | plain | encode | 38 | 200000 | 46.0 | 43.4–47.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 73.553,70.476,69.461,71.624,70.194,72.192,71.963 -->
| Goose DOM | plain | decode | 38 | 200000 | 71.6 | 69.5–73.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 215.629,248.813,180.447,196.606,195.397,187.854,224.326 -->
| goose-json | escaped | decode | 62 | 200000 | 196.6 | 180.4–248.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 104.844,91.008,84.604,87.100,91.583,102.835,110.764 -->
| goose-json | escaped | encode | 54 | 200000 | 91.6 | 84.6–110.8 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 142.931,120.874,116.979,121.126,125.395,143.232,152.664 -->
| Goose DOM | escaped | decode | 62 | 200000 | 125.4 | 117.0–152.7 | 30822000 |
<!-- samples | goose-json | array | decode | 11991.906,10334.230,10778.775,10599.759,11790.238,10017.319,9560.591 -->
| goose-json | array | decode | 4022 | 20000 | 10599.8 | 9560.6–11991.9 | 288627000 |
<!-- samples | goose-json | array | encode | 6435.629,5486.485,7030.146,6129.657,6019.025,5378.922,4933.182 -->
| goose-json | array | encode | 4022 | 20000 | 6019.0 | 4933.2–7030.1 | 574225548 |
<!-- samples | Goose DOM | array | decode | 22414.431,16352.598,18281.406,17836.923,17027.989,15485.285,17978.612 -->
| Goose DOM | array | decode | 4022 | 20000 | 17836.9 | 15485.3–22414.4 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11934.973,11972.057,8046.737,8544.578,9417.427,8560.924,8313.595 -->
| goose-json | array-signed | decode | 4538 | 20000 | 8560.9 | 8046.7–11972.1 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6226.556,6187.975,4663.695,4891.075,4248.365,5188.943,4109.493 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4891.1 | 4109.5–6226.6 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 20828.048,19249.965,16934.127,17691.620,13366.203,20135.036,13640.872 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 17691.6 | 13366.2–20828.0 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 21745.844,21776.276,27163.498,22043.304,26206.921,23595.501,28981.928 -->
| goose-json | array-wide | decode | 19771 | 20000 | 23595.5 | 21745.8–28981.9 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 10858.715,15819.175,15137.921,11172.713,12639.013,16245.172,10943.511 -->
| goose-json | array-wide | encode | 19770 | 20000 | 12639.0 | 10858.7–16245.2 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 39318.706,40137.944,37694.036,41916.864,35823.489,38468.575,38189.795 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 38468.6 | 35823.5–41916.9 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1584.961,1606.335,1580.510,1562.957,1565.363,1559.517,1616.556 -->
| goose-json | mixed | decode | 1187 | 20000 | 1580.5 | 1559.5–1616.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1756.925,1802.586,1726.604,1865.012,1700.234,1721.372,2091.526 -->
| goose-json | mixed | encode | 1186 | 20000 | 1756.9 | 1700.2–2091.5 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1858.844,1873.751,1805.124,1869.070,1792.746,1808.999,2142.332 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1858.8 | 1792.7–2142.3 | 83331000 |
<!-- samples | goose-json | floats | decode | 4373.874,4498.423,4501.258,3873.390,3558.351,3392.257,3310.343 -->
| goose-json | floats | decode | 1581 | 2000 | 3873.4 | 3310.3–4501.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 10276.803,10250.477,9910.048,8519.802,7846.048,7610.079,7539.079 -->
| goose-json | floats | encode | 1581 | 2000 | 8519.8 | 7539.1–10276.8 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4296.418,4303.537,3927.756,3456.481,3296.097,3170.421,3196.601 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3456.5 | 3170.4–4303.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5739.649,5958.235,5709.586,5709.200,5509.260,5734.872,5710.336 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5710.3 | 5509.3–5958.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 7814.498,8138.096,7754.006,7838.706,7552.414,7815.059,7584.188 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 7814.5 | 7552.4–8138.1 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10936.728,10513.660,10236.060,10318.271,10224.228,10503.035,10111.561 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10318.3 | 10111.6–10936.7 | 3870000 |
<!-- samples | goose-json | text-short | decode | 76.297,80.411,81.262,82.165,77.553,77.709,110.752 -->
| goose-json | text-short | decode | 97 | 200000 | 80.4 | 76.3–110.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 33.275,33.843,34.865,33.683,32.341,34.515,49.410 -->
| goose-json | text-short | encode | 97 | 200000 | 33.8 | 32.3–49.4 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 89.012,88.187,89.544,88.138,85.692,102.229,133.465 -->
| Goose DOM | text-short | decode | 97 | 200000 | 89.0 | 85.7–133.5 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1837.427,1495.149,1355.471,1273.510,1275.445,1274.125,1271.549 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1275.4 | 1271.5–1837.4 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1695.517,1435.785,1263.541,1216.527,1225.824,1217.312,1217.670 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1225.8 | 1216.5–1695.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 12921.658,11110.470,10391.381,10374.124,10114.793,10058.417,10095.921 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10374.1 | 10058.4–12921.7 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 860.179,862.390,861.946,828.355,829.012,831.465,828.125 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 831.5 | 828.1–862.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 541.133,543.574,542.318,520.753,521.313,521.899,520.986 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 521.9 | 520.8–543.6 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4875.499,4872.797,4741.261,4698.114,4696.412,4698.283,4696.789 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4698.3 | 4696.4–4875.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9295.795,9317.932,9615.434,9268.979,9264.928,9602.300,9256.723 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9295.8 | 9256.7–9615.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7243.353,7341.873,7485.017,7236.410,7329.739,7518.224,7247.926 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7329.7 | 7236.4–7518.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 10999.810,11218.727,11039.913,11076.285,11292.308,11198.909,10890.114 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11076.3 | 10890.1–11292.3 | 99900000 |
<!-- samples | goose-json | wide | decode | 295.688,321.938,337.440,318.152,320.369,304.405,297.313 -->
| goose-json | wide | decode | 135 | 40000 | 318.2 | 295.7–337.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 113.436,125.916,122.485,118.300,116.027,114.196,112.676 -->
| goose-json | wide | encode | 135 | 40000 | 116.0 | 112.7–125.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 236.547,263.989,256.292,246.631,236.519,238.056,228.996 -->
| Goose DOM | wide | decode | 135 | 40000 | 238.1 | 229.0–264.0 | 4777000 |
