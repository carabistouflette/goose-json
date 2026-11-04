| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 127.431,115.613,122.609,126.339,157.294,156.609,149.899 -->
| goose-json | plain | decode | 38 | 200000 | 127.4 | 115.6–157.3 | 67248000 |
<!-- samples | goose-json | plain | encode | 57.743,55.552,55.455,55.989,56.327,55.751,54.294 -->
| goose-json | plain | encode | 38 | 200000 | 55.8 | 54.3–57.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 87.782,89.293,89.250,91.636,89.246,87.455,87.649 -->
| Goose DOM | plain | decode | 38 | 200000 | 89.2 | 87.5–91.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 280.993,250.046,270.917,213.515,237.405,224.857,254.498 -->
| goose-json | escaped | decode | 62 | 200000 | 250.0 | 213.5–281.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 114.457,112.848,101.186,106.079,102.166,113.355,107.309 -->
| goose-json | escaped | encode | 54 | 200000 | 107.3 | 101.2–114.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 158.415,151.548,148.345,148.682,146.201,160.844,149.921 -->
| Goose DOM | escaped | decode | 62 | 200000 | 149.9 | 146.2–160.8 | 30822000 |
<!-- samples | goose-json | array | decode | 12025.947,10778.058,64992.546,12337.607,25269.149,11947.635,11449.776 -->
| goose-json | array | decode | 4022 | 20000 | 12025.9 | 10778.1–64992.5 | 288627000 |
<!-- samples | goose-json | array | encode | 6174.855,6277.824,31030.808,6971.007,5865.396,6427.561,6770.848 -->
| goose-json | array | encode | 4022 | 20000 | 6427.6 | 5865.4–31030.8 | 574225548 |
<!-- samples | Goose DOM | array | decode | 20106.070,22149.268,57909.655,128627.061,19138.046,17561.253,20821.383 -->
| Goose DOM | array | decode | 4022 | 20000 | 20821.4 | 17561.3–128627.1 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11800.932,12745.505,10605.024,12679.535,27633.482,10424.318,12763.974 -->
| goose-json | array-signed | decode | 4538 | 20000 | 12679.5 | 10424.3–27633.5 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 7384.034,7830.376,7899.843,7809.407,66205.117,6860.332,7692.250 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7809.4 | 6860.3–66205.1 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 19519.492,18991.433,19854.294,21212.183,56914.220,21923.778,19548.691 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19854.3 | 18991.4–56914.2 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 33738.772,33930.208,34456.585,35337.747,36532.511,33937.459,33825.993 -->
| goose-json | array-wide | decode | 19771 | 20000 | 33937.5 | 33738.8–36532.5 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 27264.850,30766.739,30798.000,30453.659,29858.082,27962.212,30578.790 -->
| goose-json | array-wide | encode | 19770 | 20000 | 30453.7 | 27264.8–30798.0 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 53670.767,54824.548,67819.222,56611.781,53656.215,55539.910,56054.792 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 55539.9 | 53656.2–67819.2 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2699.049,2700.943,2616.519,2609.199,2541.699,2683.554,2532.156 -->
| goose-json | mixed | decode | 1187 | 20000 | 2616.5 | 2532.2–2700.9 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2877.096,2983.755,2962.214,2969.732,2821.981,2878.549,2837.062 -->
| goose-json | mixed | encode | 1186 | 20000 | 2878.5 | 2822.0–2983.8 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 3126.265,3092.977,3042.948,3018.022,3172.008,3193.279,3161.033 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 3126.3 | 3018.0–3193.3 | 83331000 |
<!-- samples | goose-json | floats | decode | 5528.796,5551.131,5811.797,5822.261,5371.549,5346.805,5252.699 -->
| goose-json | floats | decode | 1581 | 2000 | 5528.8 | 5252.7–5822.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 12746.388,12954.762,12939.503,12639.813,12150.498,12169.197,11596.697 -->
| goose-json | floats | encode | 1581 | 2000 | 12639.8 | 11596.7–12954.8 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5236.591,5644.405,5672.815,5276.731,5274.958,5240.271,5201.377 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5275.0 | 5201.4–5672.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8612.752,8945.719,9212.910,9216.774,8843.653,8685.843,9067.472 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8945.7 | 8612.8–9216.8 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11842.331,12731.720,11975.420,12849.305,12722.825,11511.068,11899.181 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11975.4 | 11511.1–12849.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16159.500,17041.142,16408.599,16235.333,16759.476,17062.681,16570.850 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16570.8 | 16159.5–17062.7 | 3870000 |
<!-- samples | goose-json | text-short | decode | 146.168,160.824,149.215,126.810,128.150,127.331,126.615 -->
| goose-json | text-short | decode | 97 | 200000 | 128.1 | 126.6–160.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 52.946,55.907,51.519,52.460,53.825,53.962,55.711 -->
| goose-json | text-short | encode | 97 | 200000 | 53.8 | 51.5–55.9 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 138.095,143.366,134.392,139.325,142.874,135.796,143.176 -->
| Goose DOM | text-short | decode | 97 | 200000 | 139.3 | 134.4–143.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2050.377,2075.695,2040.558,1983.097,1923.518,1888.383,1963.073 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1983.1 | 1888.4–2075.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1979.836,2117.081,1999.242,1879.800,1858.631,1749.547,1959.751 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1959.8 | 1749.5–2117.1 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 16239.911,16276.379,16065.329,16223.016,15216.267,14917.361,16226.893 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 16223.0 | 14917.4–16276.4 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1385.376,1384.943,1396.748,1296.091,1308.035,1393.830,1382.575 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1384.9 | 1296.1–1396.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 871.878,871.583,868.345,815.104,859.045,885.020,871.726 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 871.6 | 815.1–885.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7864.420,7841.306,7798.322,7416.338,7868.372,7845.590,7824.503 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7841.3 | 7416.3–7868.4 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 14874.032,14482.106,15229.173,15658.665,16304.159,15839.230,16363.839 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 15658.7 | 14482.1–16363.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11530.614,11206.648,11279.292,12040.911,11558.448,12110.090,12597.412 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11558.4 | 11206.6–12597.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 17152.504,17340.086,17585.464,18923.221,17845.360,19050.846,19374.020 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17845.4 | 17152.5–19374.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 552.533,555.367,538.341,550.336,542.160,500.886,487.322 -->
| goose-json | wide | decode | 135 | 40000 | 542.2 | 487.3–555.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 197.428,200.530,186.944,209.938,196.674,186.694,172.337 -->
| goose-json | wide | encode | 135 | 40000 | 196.7 | 172.3–209.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 408.323,421.415,396.942,409.534,378.218,360.185,334.989 -->
| Goose DOM | wide | decode | 135 | 40000 | 396.9 | 335.0–421.4 | 4777000 |
