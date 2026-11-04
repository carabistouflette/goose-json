| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 79.266,76.797,81.573,73.794,71.313,71.125,71.403 -->
| goose-json | plain | decode | 38 | 200000 | 73.8 | 71.1–81.6 | 67248000 |
<!-- samples | goose-json | plain | encode | 35.942,37.734,36.153,35.176,33.219,33.502,33.383 -->
| goose-json | plain | encode | 38 | 200000 | 35.2 | 33.2–37.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 56.854,62.343,56.647,54.714,53.209,53.453,53.207 -->
| Goose DOM | plain | decode | 38 | 200000 | 54.7 | 53.2–62.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 141.425,145.258,139.787,145.203,138.195,137.613,143.844 -->
| goose-json | escaped | decode | 62 | 200000 | 141.4 | 137.6–145.3 | 85461000 |
<!-- samples | goose-json | escaped | encode | 65.613,68.864,66.620,67.973,66.619,66.140,68.394 -->
| goose-json | escaped | encode | 54 | 200000 | 66.6 | 65.6–68.9 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 91.866,92.030,90.886,89.932,89.659,89.287,93.803 -->
| Goose DOM | escaped | decode | 62 | 200000 | 90.9 | 89.3–93.8 | 30822000 |
<!-- samples | goose-json | array | decode | 7997.817,7493.727,7588.485,8838.192,7525.431,7504.078,7947.488 -->
| goose-json | array | decode | 4022 | 20000 | 7588.5 | 7493.7–8838.2 | 288627000 |
<!-- samples | goose-json | array | encode | 3995.001,3890.146,4073.317,4801.802,4182.292,3914.854,3985.618 -->
| goose-json | array | encode | 4022 | 20000 | 3995.0 | 3890.1–4801.8 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12039.937,12168.255,12124.351,13607.246,12965.055,13453.434,11328.061 -->
| Goose DOM | array | decode | 4022 | 20000 | 12168.3 | 11328.1–13607.2 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 8118.692,7279.502,7324.908,7192.159,7035.944,7281.940,7060.514 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7279.5 | 7035.9–8118.7 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 4881.483,4963.425,4692.306,5465.278,4687.999,5181.744,4821.401 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4881.5 | 4688.0–5465.3 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 12090.643,12186.331,12445.203,12351.086,12106.088,12063.922,11960.756 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 12106.1 | 11960.8–12445.2 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 21691.809,20951.246,21086.460,20990.954,21646.674,21460.685,22578.464 -->
| goose-json | array-wide | decode | 19771 | 20000 | 21460.7 | 20951.2–22578.5 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 18479.340,18909.811,22315.230,21506.624,18578.581,18484.784,23935.836 -->
| goose-json | array-wide | encode | 19770 | 20000 | 18909.8 | 18479.3–23935.8 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 36904.544,34149.442,35571.924,33997.165,34536.976,34100.265,35192.593 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 34537.0 | 33997.2–36904.5 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1620.977,1633.886,1736.840,1619.962,1691.745,2307.549,2142.084 -->
| goose-json | mixed | decode | 1187 | 20000 | 1691.7 | 1620.0–2307.5 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1880.042,1777.654,1865.387,1959.205,1836.165,2865.969,2165.460 -->
| goose-json | mixed | encode | 1186 | 20000 | 1880.0 | 1777.7–2866.0 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1986.350,1898.723,1993.845,2108.364,1986.068,2917.570,2381.099 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1993.8 | 1898.7–2917.6 | 83331000 |
<!-- samples | goose-json | floats | decode | 3739.006,3815.117,3871.328,3733.776,3468.655,3310.166,3315.181 -->
| goose-json | floats | decode | 1581 | 2000 | 3733.8 | 3310.2–3871.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 8670.673,8333.840,8658.310,8049.335,7609.111,7559.508,7746.795 -->
| goose-json | floats | encode | 1581 | 2000 | 8049.3 | 7559.5–8670.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3731.774,3533.396,3678.219,3336.537,3187.873,3219.041,3761.940 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3533.4 | 3187.9–3761.9 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5940.585,5741.670,5717.257,5488.185,5492.060,5484.627,6847.615 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5717.3 | 5484.6–6847.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8083.131,7889.808,7701.641,7572.105,7569.401,7581.917,9009.921 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 7701.6 | 7569.4–9009.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10762.754,10837.765,10434.726,10419.078,10425.198,11635.867,11953.794 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10762.8 | 10419.1–11953.8 | 3870000 |
<!-- samples | goose-json | text-short | decode | 86.510,82.938,86.619,91.789,87.227,79.194,77.200 -->
| goose-json | text-short | decode | 97 | 200000 | 86.5 | 77.2–91.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 35.204,34.423,41.354,36.934,36.128,34.266,32.891 -->
| goose-json | text-short | encode | 97 | 200000 | 35.2 | 32.9–41.4 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 90.457,87.857,110.356,92.995,92.114,87.053,85.501 -->
| Goose DOM | text-short | decode | 97 | 200000 | 90.5 | 85.5–110.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1237.197,1232.167,1233.129,1232.345,1231.187,1235.507,1235.213 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1233.1 | 1231.2–1237.2 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1174.517,1181.209,1179.742,1182.262,1185.134,1176.410,1177.178 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1179.7 | 1174.5–1185.1 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 9673.924,9677.994,9691.386,9676.650,9682.975,9690.698,9670.327 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 9678.0 | 9670.3–9691.4 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 827.621,829.168,827.284,827.775,827.697,827.915,837.158 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 827.8 | 827.3–837.2 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 529.497,528.505,527.603,527.466,527.513,526.337,529.962 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 527.6 | 526.3–530.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4706.409,4704.325,4695.438,4698.111,4695.925,4693.136,4820.726 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4698.1 | 4693.1–4820.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9699.470,9838.191,9767.666,9704.458,9677.510,9697.485,10085.807 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9704.5 | 9677.5–10085.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7827.158,7107.684,7101.487,7090.941,7075.515,7080.886,7471.459 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7101.5 | 7075.5–7827.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 11761.917,10873.740,10783.164,10744.220,10780.683,11129.637,11448.104 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 10873.7 | 10744.2–11761.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 321.948,313.163,317.024,309.299,304.266,318.954,327.811 -->
| goose-json | wide | decode | 135 | 40000 | 317.0 | 304.3–327.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 135.207,134.948,131.190,119.875,133.248,134.856,142.753 -->
| goose-json | wide | encode | 135 | 40000 | 134.9 | 119.9–142.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 239.243,238.065,229.575,228.545,239.272,237.904,255.975 -->
| Goose DOM | wide | decode | 135 | 40000 | 238.1 | 228.5–256.0 | 4777000 |
