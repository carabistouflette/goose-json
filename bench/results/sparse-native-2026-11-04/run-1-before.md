| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 113.242,116.019,111.175,110.969,113.603,107.737,99.444 -->
| goose-json | plain | decode | 38 | 200000 | 111.2 | 99.4–116.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 43.802,42.886,43.135,43.027,43.136,42.908,42.037 -->
| goose-json | plain | encode | 38 | 200000 | 43.0 | 42.0–43.8 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.029,121.133,121.089,121.243,119.090,121.484,108.823 -->
| Goose DOM | plain | decode | 38 | 200000 | 121.1 | 108.8–121.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 193.526,202.736,201.612,202.935,195.805,194.549,188.151 -->
| goose-json | escaped | decode | 62 | 200000 | 195.8 | 188.2–202.9 | 85461000 |
<!-- samples | goose-json | escaped | encode | 93.756,100.067,94.693,94.861,81.857,91.603,93.415 -->
| goose-json | escaped | encode | 54 | 200000 | 93.8 | 81.9–100.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 160.792,163.447,165.101,146.965,149.967,143.971,150.293 -->
| Goose DOM | escaped | decode | 62 | 200000 | 150.3 | 144.0–165.1 | 30822000 |
<!-- samples | goose-json | array | decode | 8855.366,8955.424,9179.044,8648.757,8927.444,9387.151,8775.948 -->
| goose-json | array | decode | 4022 | 20000 | 8927.4 | 8648.8–9387.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5102.055,4915.958,5431.901,5124.534,5161.393,5673.190,5256.932 -->
| goose-json | array | encode | 4022 | 20000 | 5161.4 | 4916.0–5673.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 22419.454,21231.453,23220.443,22154.724,22498.648,22262.787,22621.045 -->
| Goose DOM | array | decode | 4022 | 20000 | 22419.5 | 21231.5–23220.4 | 144666000 |
<!-- samples | goose-json | floats | decode | 4609.372,4868.449,4995.511,4617.310,4865.235,4595.828,4622.977 -->
| goose-json | floats | decode | 1581 | 2000 | 4623.0 | 4595.8–4995.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 9998.596,10162.138,9899.253,9676.044,9754.099,9757.192,9993.342 -->
| goose-json | floats | encode | 1581 | 2000 | 9899.3 | 9676.0–10162.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6430.970,6336.110,6079.886,6053.712,6159.490,6020.695,6073.311 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6079.9 | 6020.7–6431.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8074.019,8322.046,8436.909,8522.624,8690.363,8802.996,8988.146 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8522.6 | 8074.0–8988.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 10830.052,10791.683,10740.525,10961.924,10918.042,11527.553,11885.926 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 10918.0 | 10740.5–11885.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17320.346,17317.785,17163.982,17421.142,16465.316,18152.393,18706.238 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17320.3 | 16465.3–18706.2 | 3870000 |
<!-- samples | goose-json | text-short | decode | 127.772,115.447,119.437,116.897,113.219,112.369,111.998 -->
| goose-json | text-short | decode | 97 | 200000 | 115.4 | 112.0–127.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 46.046,43.176,45.288,44.329,43.015,44.650,44.949 -->
| goose-json | text-short | encode | 97 | 200000 | 44.7 | 43.0–46.0 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 192.225,183.242,182.744,183.986,182.428,190.740,191.183 -->
| Goose DOM | text-short | decode | 97 | 200000 | 184.0 | 182.4–192.2 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2321.765,2516.439,2337.723,2344.756,2370.502,2322.292,2462.639 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2344.8 | 2321.8–2516.4 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1979.209,2032.955,2033.592,1978.682,1973.732,1973.090,2079.273 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1979.2 | 1973.1–2079.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15971.461,15659.617,15275.524,15033.222,14985.801,15385.752,15564.005 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15385.8 | 14985.8–15971.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 919.645,841.418,870.181,844.046,841.439,818.732,872.316 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 844.0 | 818.7–919.6 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 539.023,503.519,506.264,506.468,541.162,517.032,542.014 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 517.0 | 503.5–542.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7072.485,7142.454,7087.052,7074.395,7292.501,7300.551,7501.720 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7142.5 | 7072.5–7501.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13113.275,13210.185,13283.784,13380.268,13273.370,13013.751,12746.332 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13210.2 | 12746.3–13380.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9909.197,10041.333,10028.591,9932.667,9516.674,9577.889,9523.794 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9909.2 | 9516.7–10041.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15226.990,15239.916,15351.972,15106.065,15410.869,14620.365,14950.287 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15227.0 | 14620.4–15410.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 817.406,831.220,821.006,773.268,826.127,769.073,767.596 -->
| goose-json | wide | decode | 135 | 40000 | 817.4 | 767.6–831.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 188.852,183.111,193.382,189.220,193.576,184.543,185.513 -->
| goose-json | wide | encode | 135 | 40000 | 188.9 | 183.1–193.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 412.800,431.737,412.376,429.470,427.504,411.446,415.980 -->
| Goose DOM | wide | decode | 135 | 40000 | 416.0 | 411.4–431.7 | 4777000 |
