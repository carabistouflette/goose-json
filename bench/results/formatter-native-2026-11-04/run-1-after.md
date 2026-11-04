| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 70.674,68.959,66.795,72.512,77.088,101.226,110.177 -->
| goose-json | plain | decode | 38 | 200000 | 72.5 | 66.8–110.2 | 67248000 |
<!-- samples | goose-json | plain | encode | 36.651,33.437,31.605,34.671,41.314,45.799,51.367 -->
| goose-json | plain | encode | 38 | 200000 | 36.7 | 31.6–51.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.501,54.873,55.065,57.620,81.476,80.803,85.365 -->
| Goose DOM | plain | decode | 38 | 200000 | 57.6 | 54.9–85.4 | 5604000 |
<!-- samples | goose-json | escaped | decode | 195.030,145.329,137.465,136.364,142.089,134.507,137.102 -->
| goose-json | escaped | decode | 62 | 200000 | 137.5 | 134.5–195.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 81.294,69.818,66.815,66.907,69.490,71.081,67.388 -->
| goose-json | escaped | encode | 54 | 200000 | 69.5 | 66.8–81.3 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 110.397,99.531,94.559,96.479,96.780,98.917,106.100 -->
| Goose DOM | escaped | decode | 62 | 200000 | 98.9 | 94.6–110.4 | 30822000 |
<!-- samples | goose-json | array | decode | 10360.072,9384.243,9240.408,9861.388,9379.170,9072.037,9290.843 -->
| goose-json | array | decode | 4022 | 20000 | 9379.2 | 9072.0–10360.1 | 288627000 |
<!-- samples | goose-json | array | encode | 4032.080,4260.313,4028.063,4415.388,6041.853,4392.127,5533.827 -->
| goose-json | array | encode | 4022 | 20000 | 4392.1 | 4028.1–6041.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12851.807,12708.486,12416.601,12296.415,12292.300,12589.137,12663.358 -->
| Goose DOM | array | decode | 4022 | 20000 | 12589.1 | 12292.3–12851.8 | 144666000 |
<!-- samples | goose-json | floats | decode | 3190.678,3342.890,3305.604,3312.498,3315.718,3304.637,3328.928 -->
| goose-json | floats | decode | 1581 | 2000 | 3312.5 | 3190.7–3342.9 | 3825000 |
<!-- samples | goose-json | floats | encode | 7394.078,7529.735,7534.303,7532.542,7536.312,7530.140,7538.324 -->
| goose-json | floats | encode | 1581 | 2000 | 7532.5 | 7394.1–7538.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3386.922,3314.798,3289.515,3312.089,3293.948,3311.957,3285.881 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3312.0 | 3285.9–3386.9 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5756.468,5730.604,5704.519,5704.757,6200.974,5937.251,6346.587 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5756.5 | 5704.5–6346.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 7823.702,7839.720,7831.695,7806.087,8281.832,8203.836,8341.287 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 7839.7 | 7806.1–8341.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10520.114,10490.354,10519.620,11492.414,11020.426,11734.183,10964.304 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10964.3 | 10490.4–11734.2 | 3870000 |
<!-- samples | goose-json | text-short | decode | 74.258,73.712,73.585,73.651,73.668,73.265,73.660 -->
| goose-json | text-short | decode | 97 | 200000 | 73.7 | 73.3–74.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 34.180,33.699,33.908,33.777,33.721,33.975,33.889 -->
| goose-json | text-short | encode | 97 | 200000 | 33.9 | 33.7–34.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 89.128,88.672,88.912,88.488,89.029,89.124,88.972 -->
| Goose DOM | text-short | decode | 97 | 200000 | 89.0 | 88.5–89.1 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1369.695,1374.040,1438.447,1430.657,1371.862,1486.211,1546.462 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1430.7 | 1369.7–1546.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1217.563,1213.142,1279.761,1264.860,1219.601,1339.567,1322.631 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1264.9 | 1213.1–1339.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 10083.122,10743.543,10508.519,10271.641,10156.497,11718.773,10937.478 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10508.5 | 10083.1–11718.8 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 924.849,887.499,885.946,884.261,883.486,884.133,917.447 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 885.9 | 883.5–924.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 590.855,564.406,564.400,566.628,570.059,562.114,566.378 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 566.4 | 562.1–590.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5297.088,5075.764,5067.565,5066.220,5068.081,5065.345,5069.020 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 5068.1 | 5065.3–5297.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9936.326,10386.474,9816.630,9798.813,9785.818,9758.764,9746.647 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9798.8 | 9746.6–10386.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 8539.423,7705.297,7502.817,7514.374,7512.605,7607.935,8537.558 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7607.9 | 7502.8–8539.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13282.789,12038.836,11736.956,11740.127,11655.427,11802.404,17089.247 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11802.4 | 11655.4–17089.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 461.773,445.745,384.006,332.403,308.403,304.747,316.556 -->
| goose-json | wide | decode | 135 | 40000 | 332.4 | 304.7–461.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 169.406,147.274,130.375,114.435,114.600,110.314,117.078 -->
| goose-json | wide | encode | 135 | 40000 | 117.1 | 110.3–169.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 382.501,340.196,277.409,260.671,258.130,269.088,251.186 -->
| Goose DOM | wide | decode | 135 | 40000 | 269.1 | 251.2–382.5 | 4777000 |
