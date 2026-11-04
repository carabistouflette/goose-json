| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 147.521,149.717,148.224,149.375,149.026,157.440,156.632 -->
| goose-json | plain | decode | 38 | 200000 | 149.4 | 147.5–157.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 53.289,53.286,54.304,52.532,55.272,56.721,55.131 -->
| goose-json | plain | encode | 38 | 200000 | 54.3 | 52.5–56.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 83.861,83.899,84.748,83.979,88.005,88.519,85.833 -->
| Goose DOM | plain | decode | 38 | 200000 | 84.7 | 83.9–88.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 253.180,264.992,265.196,232.368,216.154,218.558,220.130 -->
| goose-json | escaped | decode | 62 | 200000 | 232.4 | 216.2–265.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 103.508,104.642,108.964,104.525,103.854,105.139,101.890 -->
| goose-json | escaped | encode | 54 | 200000 | 104.5 | 101.9–109.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 135.798,141.198,153.554,131.372,140.390,142.420,143.296 -->
| Goose DOM | escaped | decode | 62 | 200000 | 141.2 | 131.4–153.6 | 30822000 |
<!-- samples | goose-json | array | decode | 11736.890,11725.693,11805.873,11690.156,11793.458,12644.452,12070.742 -->
| goose-json | array | decode | 4022 | 20000 | 11793.5 | 11690.2–12644.5 | 288627000 |
<!-- samples | goose-json | array | encode | 6184.882,6423.034,6375.235,6375.563,6182.923,6211.740,6460.172 -->
| goose-json | array | encode | 4022 | 20000 | 6375.2 | 6182.9–6460.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19401.965,20672.902,19393.804,20144.974,20298.848,20160.601,20868.720 -->
| Goose DOM | array | decode | 4022 | 20000 | 20160.6 | 19393.8–20868.7 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 12009.616,13637.996,12214.380,11672.517,11480.958,11883.300,12113.337 -->
| goose-json | array-signed | decode | 4538 | 20000 | 12009.6 | 11481.0–13638.0 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6647.083,6360.296,7800.905,5643.493,6038.659,6577.871,6447.539 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6447.5 | 5643.5–7800.9 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 28209.862,21915.482,22191.508,20632.937,20033.012,21586.147,19500.016 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 21586.1 | 19500.0–28209.9 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 31910.472,34818.837,38275.723,38516.421,34163.281,34427.752,44870.052 -->
| goose-json | array-wide | decode | 19771 | 20000 | 34818.8 | 31910.5–44870.1 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 16090.296,17382.798,17778.028,17591.319,17040.855,17588.716,17197.736 -->
| goose-json | array-wide | encode | 19770 | 20000 | 17382.8 | 16090.3–17778.0 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 58731.364,54307.308,56071.276,56180.647,54228.867,57690.909,55211.913 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 56071.3 | 54228.9–58731.4 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2559.339,2588.572,2524.735,2610.235,2553.387,2796.716,2553.147 -->
| goose-json | mixed | decode | 1187 | 20000 | 2559.3 | 2524.7–2796.7 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2838.608,2874.360,2691.911,2799.057,2681.108,2852.608,2675.303 -->
| goose-json | mixed | encode | 1186 | 20000 | 2799.1 | 2675.3–2874.4 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2835.542,2855.209,2769.872,2778.940,2863.539,2955.618,2769.163 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2835.5 | 2769.2–2955.6 | 83331000 |
<!-- samples | goose-json | floats | decode | 5334.013,5317.053,5112.132,5066.611,5382.584,5169.353,5310.720 -->
| goose-json | floats | decode | 1581 | 2000 | 5310.7 | 5066.6–5382.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 11969.482,11964.766,11547.876,11822.513,12206.942,11924.146,12207.621 -->
| goose-json | floats | encode | 1581 | 2000 | 11964.8 | 11547.9–12207.6 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5200.519,5023.047,4795.550,5144.575,5085.051,5119.734,5087.213 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5087.2 | 4795.6–5200.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 9226.611,9065.731,9215.664,8776.971,9274.567,9417.890,8817.988 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 9215.7 | 8777.0–9417.9 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 12688.171,12147.814,12609.433,12015.184,12545.664,12677.034,12137.631 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12545.7 | 12015.2–12688.2 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17178.741,16970.617,16402.343,17188.893,16619.752,16719.804,17253.155 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16970.6 | 16402.3–17253.2 | 3870000 |
<!-- samples | goose-json | text-short | decode | 128.258,128.869,128.671,127.131,128.344,125.324,127.104 -->
| goose-json | text-short | decode | 97 | 200000 | 128.3 | 125.3–128.9 | 149907000 |
<!-- samples | goose-json | text-short | encode | 54.236,54.124,54.079,52.946,53.785,54.195,53.582 -->
| goose-json | text-short | encode | 97 | 200000 | 54.1 | 52.9–54.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 142.865,142.871,142.187,134.527,142.587,141.913,138.129 -->
| Goose DOM | text-short | decode | 97 | 200000 | 142.2 | 134.5–142.9 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1997.011,1974.109,2041.802,1965.335,1938.750,1921.940,1905.078 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1965.3 | 1905.1–2041.8 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1910.817,1884.687,1971.323,1871.900,1855.728,1855.828,1884.506 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1884.5 | 1855.7–1971.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15431.346,15495.452,15590.049,15255.031,15297.401,15291.067,15484.388 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15431.3 | 15255.0–15590.0 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1299.583,1335.545,1320.158,1309.485,1327.973,1369.916,1311.524 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1320.2 | 1299.6–1369.9 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 824.049,828.583,824.575,831.008,830.639,865.874,820.250 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 828.6 | 820.2–865.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7475.139,7525.181,7399.593,7445.921,7437.128,7409.795,7412.454 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7437.1 | 7399.6–7525.2 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 14898.551,14787.053,14784.174,15017.190,14868.772,15277.066,14835.581 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14868.8 | 14784.2–15277.1 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11494.382,11525.295,11486.966,11567.392,11587.627,11930.438,11518.326 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11525.3 | 11487.0–11930.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 16950.244,17484.517,17026.310,17645.278,17834.847,17597.589,17533.708 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17533.7 | 16950.2–17834.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 501.898,480.179,477.790,481.471,505.143,514.976,512.467 -->
| goose-json | wide | decode | 135 | 40000 | 501.9 | 477.8–515.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 185.973,176.251,181.310,175.571,184.393,183.733,186.277 -->
| goose-json | wide | encode | 135 | 40000 | 183.7 | 175.6–186.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 375.370,361.899,364.090,370.829,384.811,385.439,385.316 -->
| Goose DOM | wide | decode | 135 | 40000 | 375.4 | 361.9–385.4 | 4777000 |
