| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 74.340,97.707,97.057,95.953,110.934,131.401,132.022 -->
| goose-json | plain | decode | 38 | 200000 | 97.7 | 74.3–132.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 33.300,31.947,29.934,31.319,38.227,41.557,47.004 -->
| goose-json | plain | encode | 38 | 200000 | 33.3 | 29.9–47.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.438,55.422,54.879,59.988,71.229,77.760,83.969 -->
| Goose DOM | plain | decode | 38 | 200000 | 60.0 | 54.9–84.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 184.270,196.404,146.382,133.828,131.312,130.859,132.172 -->
| goose-json | escaped | decode | 62 | 200000 | 133.8 | 130.9–196.4 | 85461000 |
<!-- samples | goose-json | escaped | encode | 84.677,90.211,68.252,66.138,67.476,67.112,68.321 -->
| goose-json | escaped | encode | 54 | 200000 | 68.3 | 66.1–90.2 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 129.502,116.900,96.233,93.160,92.149,95.021,102.678 -->
| Goose DOM | escaped | decode | 62 | 200000 | 96.2 | 92.1–129.5 | 30822000 |
<!-- samples | goose-json | array | decode | 10203.587,9421.256,9161.072,9268.802,8975.373,9481.720,8953.698 -->
| goose-json | array | decode | 4022 | 20000 | 9268.8 | 8953.7–10203.6 | 288627000 |
<!-- samples | goose-json | array | encode | 4545.599,4130.432,4343.980,4340.235,4067.723,4402.964,4168.271 -->
| goose-json | array | encode | 4022 | 20000 | 4340.2 | 4067.7–4545.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 15523.776,12773.482,12911.521,13033.310,13261.400,12500.541,16769.781 -->
| Goose DOM | array | decode | 4022 | 20000 | 13033.3 | 12500.5–16769.8 | 144666000 |
<!-- samples | goose-json | floats | decode | 5922.953,5844.654,5866.868,5642.223,5812.634,4931.161,3821.771 -->
| goose-json | floats | decode | 1581 | 2000 | 5812.6 | 3821.8–5923.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 12132.871,12148.854,12088.262,12169.710,12030.276,9771.910,8125.959 -->
| goose-json | floats | encode | 1581 | 2000 | 12088.3 | 8126.0–12169.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5337.086,5258.098,5279.529,5223.989,5006.623,3897.236,3469.009 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5224.0 | 3469.0–5337.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5947.518,6022.673,6039.386,5901.946,5784.069,5755.953,6035.686 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5947.5 | 5756.0–6039.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8035.470,8889.439,8064.711,8189.745,7911.765,8447.357,8323.585 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8189.7 | 7911.8–8889.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10653.630,11482.196,10927.637,10589.081,10540.510,11426.760,12021.467 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10927.6 | 10540.5–12021.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 96.466,94.692,84.279,86.085,78.222,73.420,73.189 -->
| goose-json | text-short | decode | 97 | 200000 | 84.3 | 73.2–96.5 | 149907000 |
<!-- samples | goose-json | text-short | encode | 35.782,40.799,35.747,36.960,32.950,31.423,31.614 -->
| goose-json | text-short | encode | 97 | 200000 | 35.7 | 31.4–40.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 109.711,114.411,105.760,103.493,95.172,97.843,96.967 -->
| Goose DOM | text-short | decode | 97 | 200000 | 103.5 | 95.2–114.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1544.689,1430.393,1368.976,1369.874,1374.266,1667.942,1554.076 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1430.4 | 1369.0–1667.9 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1328.736,1271.046,1220.491,1224.279,1222.825,1454.466,1379.428 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1271.0 | 1220.5–1454.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 12193.395,11709.697,11399.498,11392.582,12430.369,13070.583,12606.952 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 12193.4 | 11392.6–13070.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 921.066,889.739,883.841,864.932,853.958,850.989,850.727 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 864.9 | 850.7–921.1 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 595.207,574.847,569.471,557.779,549.961,552.614,550.006 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 557.8 | 550.0–595.2 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6623.803,6460.464,6407.837,6164.886,6165.871,6168.700,6165.584 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6168.7 | 6164.9–6623.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9713.632,9955.299,10005.428,10033.035,10628.560,11876.550,10108.547 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 10033.0 | 9713.6–11876.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7128.220,7311.195,7363.105,7728.565,7747.215,8407.004,7409.026 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7409.0 | 7128.2–8407.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13793.507,14909.904,14516.477,16654.218,15045.718,15738.772,14540.907 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14909.9 | 13793.5–16654.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 302.725,299.427,301.127,302.919,442.061,488.640,465.557 -->
| goose-json | wide | decode | 135 | 40000 | 302.9 | 299.4–488.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 154.869,153.323,156.464,162.479,238.437,247.540,232.893 -->
| goose-json | wide | encode | 135 | 40000 | 162.5 | 153.3–247.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 248.365,238.669,238.915,294.792,383.312,375.253,361.706 -->
| Goose DOM | wide | decode | 135 | 40000 | 294.8 | 238.7–383.3 | 4777000 |
