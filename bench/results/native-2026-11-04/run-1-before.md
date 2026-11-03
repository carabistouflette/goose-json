| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 145.013,140.130,137.990,135.840,134.022,140.501,144.526 -->
| goose-json | plain | decode | 38 | 200000 | 140.1 | 134.0–145.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 48.999,48.242,49.742,47.850,48.789,44.999,48.622 -->
| goose-json | plain | encode | 38 | 200000 | 48.6 | 45.0–49.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.528,117.510,121.235,117.841,122.408,120.557,132.726 -->
| Goose DOM | plain | decode | 38 | 200000 | 121.2 | 117.5–132.7 | 5604000 |
<!-- samples | goose-json | escaped | decode | 278.030,278.539,268.014,273.546,276.075,277.915,277.246 -->
| goose-json | escaped | decode | 62 | 200000 | 277.2 | 268.0–278.5 | 85461000 |
<!-- samples | goose-json | escaped | encode | 111.972,113.061,112.664,117.303,115.776,119.057,119.482 -->
| goose-json | escaped | encode | 54 | 200000 | 115.8 | 112.0–119.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 171.467,172.593,168.757,175.945,177.108,175.966,171.099 -->
| Goose DOM | escaped | decode | 62 | 200000 | 172.6 | 168.8–177.1 | 30822000 |
<!-- samples | goose-json | array | decode | 14503.233,14650.992,16012.866,16534.387,15952.892,16473.926,18180.113 -->
| goose-json | array | decode | 4022 | 20000 | 16012.9 | 14503.2–18180.1 | 288627000 |
<!-- samples | goose-json | array | encode | 5238.237,5753.342,5753.120,6091.766,5974.354,6322.029,7844.650 -->
| goose-json | array | encode | 4022 | 20000 | 5974.4 | 5238.2–7844.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 21990.382,23565.243,25005.316,25799.518,24992.819,26235.263,32056.389 -->
| Goose DOM | array | decode | 4022 | 20000 | 25005.3 | 21990.4–32056.4 | 144666000 |
<!-- samples | goose-json | floats | decode | 9684.460,9531.197,8412.682,9087.144,9838.253,9620.515,9353.825 -->
| goose-json | floats | decode | 1581 | 2000 | 9531.2 | 8412.7–9838.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 38436.758,34321.796,33273.938,36427.506,39864.077,36711.185,36850.135 -->
| goose-json | floats | encode | 1581 | 2000 | 36711.2 | 33273.9–39864.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 8246.727,7231.865,7601.842,8499.215,8365.381,8041.428,7959.710 -->
| Goose DOM | floats | decode | 1581 | 2000 | 8041.4 | 7231.9–8499.2 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 12994.676,13718.805,12944.036,12329.724,11797.791,11406.331,11469.371 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 12329.7 | 11406.3–13718.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 13467.692,13459.527,14509.409,12094.749,12083.478,11942.226,12034.531 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 12094.7 | 11942.2–14509.4 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 8175.970,7973.300,8151.736,7445.083,7340.007,7263.370,7286.463 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7445.1 | 7263.4–8176.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 36561.063,37343.901,37428.721,38678.998,38357.920,37906.203,38779.442 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 37906.2 | 36561.1–38779.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 34150.711,33652.621,34060.982,33916.603,34220.911,33541.045,34367.984 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 34061.0 | 33541.0–34368.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15347.251,15115.376,14636.236,15307.124,14975.858,15255.063,15449.058 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15255.1 | 14636.2–15449.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 850.116,861.369,862.897,865.292,876.432,874.104,863.413 -->
| goose-json | wide | decode | 135 | 40000 | 863.4 | 850.1–876.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 231.932,223.409,234.762,233.163,214.604,227.608,204.909 -->
| goose-json | wide | encode | 135 | 40000 | 227.6 | 204.9–234.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 451.066,448.348,448.203,456.905,448.136,443.170,443.137 -->
| Goose DOM | wide | decode | 135 | 40000 | 448.2 | 443.1–456.9 | 4777000 |
