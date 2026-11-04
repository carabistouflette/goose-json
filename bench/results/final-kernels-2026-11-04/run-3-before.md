| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 116.554,116.121,116.429,115.235,121.210,125.441,121.737 -->
| goose-json | plain | decode | 38 | 200000 | 116.6 | 115.2–125.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 42.863,44.146,43.154,42.918,44.278,44.240,43.952 -->
| goose-json | plain | encode | 38 | 200000 | 44.0 | 42.9–44.3 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.969,116.200,115.888,120.068,119.540,121.884,121.231 -->
| Goose DOM | plain | decode | 38 | 200000 | 120.1 | 115.9–122.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 247.630,247.824,244.340,245.949,236.644,240.722,233.905 -->
| goose-json | escaped | decode | 62 | 200000 | 244.3 | 233.9–247.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 105.045,106.543,107.149,107.637,102.479,104.473,102.927 -->
| goose-json | escaped | encode | 54 | 200000 | 105.0 | 102.5–107.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 170.531,168.854,164.998,166.215,162.974,161.723,159.858 -->
| Goose DOM | escaped | decode | 62 | 200000 | 165.0 | 159.9–170.5 | 30822000 |
<!-- samples | goose-json | array | decode | 10213.080,10346.560,10394.578,10258.376,10239.793,9883.732,10175.021 -->
| goose-json | array | decode | 4022 | 20000 | 10239.8 | 9883.7–10394.6 | 288627000 |
<!-- samples | goose-json | array | encode | 6445.235,6482.461,6590.029,6454.190,6489.634,6194.909,6192.759 -->
| goose-json | array | encode | 4022 | 20000 | 6454.2 | 6192.8–6590.0 | 574225548 |
<!-- samples | Goose DOM | array | decode | 22666.769,22629.876,23114.757,22705.015,22536.201,22402.052,21824.652 -->
| Goose DOM | array | decode | 4022 | 20000 | 22629.9 | 21824.7–23114.8 | 144666000 |
<!-- samples | goose-json | floats | decode | 6170.189,5981.447,5991.164,6136.666,5994.172,6354.865,6266.313 -->
| goose-json | floats | decode | 1581 | 2000 | 6136.7 | 5981.4–6354.9 | 3825000 |
<!-- samples | goose-json | floats | encode | 29346.786,29408.529,28043.638,28990.242,29173.415,30016.192,28938.944 -->
| goose-json | floats | encode | 1581 | 2000 | 29173.4 | 28043.6–30016.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6226.553,6067.146,5831.029,5965.570,5938.921,6330.914,6062.379 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6062.4 | 5831.0–6330.9 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 24806.297,24923.426,25635.573,25175.157,24687.558,24405.038,26087.373 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 24923.4 | 24405.0–26087.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 1104351.551,1048091.877,1053024.570,1072930.670,1048288.306,1050773.736,1071747.574 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 1053024.6 | 1048091.9–1104351.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16557.324,15946.704,16142.590,16007.764,16421.842,16434.265,16935.530 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16421.8 | 15946.7–16935.5 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 6775.923,6511.350,6539.157,6663.649,6373.747,6413.669,6277.419 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 6511.3 | 6277.4–6775.9 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 5388.741,5079.374,5281.463,5218.387,5083.510,4938.427,5066.820 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 5083.5 | 4938.4–5388.7 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7120.439,6942.962,6999.835,6902.616,7057.615,6731.929,6787.819 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6943.0 | 6731.9–7120.4 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 34362.424,34351.813,35048.257,35674.984,35411.846,37649.454,36546.399 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 35411.8 | 34351.8–37649.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 30660.322,30394.006,31719.776,31761.722,33079.918,33054.585,32383.354 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 31761.7 | 30394.0–33079.9 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13219.699,13978.325,13528.708,13307.120,14522.424,14096.911,14007.003 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 13978.3 | 13219.7–14522.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 738.438,721.716,731.487,742.500,711.564,744.138,713.991 -->
| goose-json | wide | decode | 135 | 40000 | 731.5 | 711.6–744.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 182.672,172.443,175.384,167.261,173.524,157.305,180.517 -->
| goose-json | wide | encode | 135 | 40000 | 173.5 | 157.3–182.7 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 413.668,422.068,433.890,403.378,430.158,403.956,413.223 -->
| Goose DOM | wide | decode | 135 | 40000 | 413.7 | 403.4–433.9 | 4777000 |
