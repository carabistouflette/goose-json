| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 114.601,113.957,112.228,117.071,116.096,120.079,113.213 -->
| goose-json | plain | decode | 38 | 200000 | 114.6 | 112.2–120.1 | 67248000 |
<!-- samples | goose-json | plain | encode | 45.370,43.946,44.665,43.617,43.119,44.314,42.966 -->
| goose-json | plain | encode | 38 | 200000 | 43.9 | 43.0–45.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 123.175,123.036,120.386,116.173,116.238,118.935,115.636 -->
| Goose DOM | plain | decode | 38 | 200000 | 118.9 | 115.6–123.2 | 5604000 |
<!-- samples | goose-json | escaped | decode | 213.364,214.044,213.091,218.430,215.765,216.230,218.939 -->
| goose-json | escaped | decode | 62 | 200000 | 215.8 | 213.1–218.9 | 85461000 |
<!-- samples | goose-json | escaped | encode | 100.944,101.842,101.971,102.534,102.578,102.360,103.462 -->
| goose-json | escaped | encode | 54 | 200000 | 102.4 | 100.9–103.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 162.171,161.414,160.954,160.870,160.202,160.650,161.122 -->
| Goose DOM | escaped | decode | 62 | 200000 | 161.0 | 160.2–162.2 | 30822000 |
<!-- samples | goose-json | array | decode | 9583.837,9426.175,9414.550,9529.677,9434.112,9429.185,9452.113 -->
| goose-json | array | decode | 4022 | 20000 | 9434.1 | 9414.6–9583.8 | 288627000 |
<!-- samples | goose-json | array | encode | 6520.926,6509.759,6515.942,6705.463,6514.205,6517.510,6514.022 -->
| goose-json | array | encode | 4022 | 20000 | 6515.9 | 6509.8–6705.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23078.927,22653.027,23078.466,22925.744,22996.817,23163.559,22974.296 -->
| Goose DOM | array | decode | 4022 | 20000 | 22996.8 | 22653.0–23163.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 4824.444,4909.357,4917.011,4942.100,4913.102,4909.471,4935.097 -->
| goose-json | floats | decode | 1581 | 2000 | 4913.1 | 4824.4–4942.1 | 3825000 |
<!-- samples | goose-json | floats | encode | 10652.190,10574.076,10586.132,10691.692,10576.957,10548.926,10633.686 -->
| goose-json | floats | encode | 1581 | 2000 | 10586.1 | 10548.9–10691.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6184.768,6222.301,6280.735,6341.549,6238.046,6322.415,6226.667 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6238.0 | 6184.8–6341.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8680.860,8576.654,8658.478,8666.662,8722.968,8586.772,8554.586 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8658.5 | 8554.6–8723.0 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 10993.858,10885.008,10874.969,10959.659,10987.996,10971.688,10901.630 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 10959.7 | 10875.0–10993.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17421.298,17290.614,17269.199,17175.017,17343.155,17525.823,17252.460 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17290.6 | 17175.0–17525.8 | 3870000 |
<!-- samples | goose-json | text-short | decode | 115.075,114.671,118.547,116.337,115.295,118.444,115.753 -->
| goose-json | text-short | decode | 97 | 200000 | 115.8 | 114.7–118.5 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.007,42.781,42.916,42.714,43.607,43.477,43.173 -->
| goose-json | text-short | encode | 97 | 200000 | 43.0 | 42.7–43.6 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 173.452,173.413,173.660,172.645,173.270,173.085,173.449 -->
| Goose DOM | text-short | decode | 97 | 200000 | 173.4 | 172.6–173.7 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2404.745,2354.525,2394.349,2389.088,2380.359,2402.535,2382.406 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2389.1 | 2354.5–2404.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1994.622,2060.644,1989.799,2014.998,2022.585,1988.508,1998.698 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1998.7 | 1988.5–2060.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15070.972,15328.621,14956.249,15190.827,15181.493,15337.707,15203.396 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15190.8 | 14956.2–15337.7 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 874.653,850.959,869.370,858.602,805.053,847.760,864.043 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 858.6 | 805.1–874.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 503.422,492.767,491.948,496.173,492.675,495.733,492.115 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 492.8 | 491.9–503.4 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7133.016,7176.692,7149.761,7219.764,7227.086,7177.358,7125.499 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7176.7 | 7125.5–7227.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12815.287,12845.243,12950.928,13039.993,13382.481,12847.080,12725.504 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12847.1 | 12725.5–13382.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9543.112,9576.566,9649.102,9528.934,10002.728,9531.549,9522.186 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9543.1 | 9522.2–10002.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14653.424,14570.444,14809.539,14716.335,14914.589,14550.351,14807.352 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14716.3 | 14550.4–14914.6 | 99900000 |
<!-- samples | goose-json | wide | decode | 772.884,759.608,793.932,803.971,791.094,797.683,801.363 -->
| goose-json | wide | decode | 135 | 40000 | 793.9 | 759.6–804.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 189.224,179.830,179.569,182.921,182.925,182.227,187.722 -->
| goose-json | wide | encode | 135 | 40000 | 182.9 | 179.6–189.2 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 428.236,426.751,427.677,423.275,424.605,426.788,424.507 -->
| Goose DOM | wide | decode | 135 | 40000 | 426.8 | 423.3–428.2 | 4777000 |
