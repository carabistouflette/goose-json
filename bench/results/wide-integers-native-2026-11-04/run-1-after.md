| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 146.884,143.228,135.942,113.286,121.011,119.800,113.114 -->
| goose-json | plain | decode | 38 | 200000 | 121.0 | 113.1–146.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 55.640,53.289,52.935,54.978,55.880,55.827,52.539 -->
| goose-json | plain | encode | 38 | 200000 | 55.0 | 52.5–55.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 88.957,84.204,83.721,85.918,89.024,86.957,88.353 -->
| Goose DOM | plain | decode | 38 | 200000 | 87.0 | 83.7–89.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 232.617,222.814,221.124,231.723,221.560,222.510,240.821 -->
| goose-json | escaped | decode | 62 | 200000 | 222.8 | 221.1–240.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 104.137,103.356,103.823,104.043,108.204,105.574,110.544 -->
| goose-json | escaped | encode | 54 | 200000 | 104.1 | 103.4–110.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 142.683,142.333,148.557,141.439,142.656,149.080,151.421 -->
| Goose DOM | escaped | decode | 62 | 200000 | 142.7 | 141.4–151.4 | 30822000 |
<!-- samples | goose-json | array | decode | 11498.099,11388.624,11473.041,11420.068,11316.409,11387.028,11537.113 -->
| goose-json | array | decode | 4022 | 20000 | 11420.1 | 11316.4–11537.1 | 288627000 |
<!-- samples | goose-json | array | encode | 6194.099,6104.471,6099.976,6106.475,6104.824,6108.781,6093.170 -->
| goose-json | array | encode | 4022 | 20000 | 6104.8 | 6093.2–6194.1 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19721.630,19225.076,19414.759,19516.994,19829.423,19470.787,19351.924 -->
| Goose DOM | array | decode | 4022 | 20000 | 19470.8 | 19225.1–19829.4 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11565.667,12043.214,12139.951,11971.457,12577.580,11649.121,13122.593 -->
| goose-json | array-signed | decode | 4538 | 20000 | 12043.2 | 11565.7–13122.6 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6141.402,6394.210,6232.934,6140.380,6138.780,6311.503,6156.768 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6156.8 | 6138.8–6394.2 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 20618.412,20489.223,20500.646,20380.843,20343.139,20545.487,21938.579 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 20500.6 | 20343.1–21938.6 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 34653.889,33338.921,33147.452,32893.274,33022.006,33516.044,33276.304 -->
| goose-json | array-wide | decode | 19771 | 20000 | 33276.3 | 32893.3–34653.9 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 16823.664,16568.104,17500.098,16592.409,17123.702,17656.031,16843.350 -->
| goose-json | array-wide | encode | 19770 | 20000 | 16843.4 | 16568.1–17656.0 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 55542.319,53261.919,53432.685,55370.440,56454.741,55068.603,53308.773 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 55068.6 | 53261.9–56454.7 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2642.665,2717.558,2568.045,2870.158,2578.202,2558.549,2549.214 -->
| goose-json | mixed | decode | 1187 | 20000 | 2578.2 | 2549.2–2870.2 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2875.840,2769.903,2728.429,2868.541,2701.015,2696.288,2830.664 -->
| goose-json | mixed | encode | 1186 | 20000 | 2769.9 | 2696.3–2875.8 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2975.890,2795.063,2979.246,2815.200,2765.827,2759.842,2936.688 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2815.2 | 2759.8–2979.2 | 83331000 |
<!-- samples | goose-json | floats | decode | 5457.997,5132.837,5081.243,5057.930,5035.333,5060.148,5051.874 -->
| goose-json | floats | decode | 1581 | 2000 | 5060.1 | 5035.3–5458.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 11651.563,11468.197,11470.697,11447.541,11469.588,11478.507,11489.337 -->
| goose-json | floats | encode | 1581 | 2000 | 11470.7 | 11447.5–11651.6 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4862.138,4831.390,4864.163,4869.342,4860.876,4902.841,4872.922 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4864.2 | 4831.4–4902.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8831.746,8804.978,8958.923,8842.967,8801.112,8726.288,9335.548 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8831.7 | 8726.3–9335.5 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11968.246,11975.327,12412.768,12159.983,11905.739,11947.172,12699.976 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11975.3 | 11905.7–12700.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16321.136,16230.857,16272.891,16291.508,16322.314,16860.317,17363.531 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16321.1 | 16230.9–17363.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 129.207,125.046,122.059,122.025,121.907,121.743,121.822 -->
| goose-json | text-short | decode | 97 | 200000 | 122.0 | 121.7–129.2 | 149907000 |
<!-- samples | goose-json | text-short | encode | 53.271,51.284,51.002,51.030,51.581,51.163,51.611 -->
| goose-json | text-short | encode | 97 | 200000 | 51.3 | 51.0–53.3 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 135.045,134.824,134.827,134.740,134.865,134.725,134.822 -->
| Goose DOM | text-short | decode | 97 | 200000 | 134.8 | 134.7–135.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2084.836,2048.889,2059.891,2041.797,1937.486,1966.830,1941.813 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2041.8 | 1937.5–2084.8 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1994.978,2003.335,1995.991,1994.274,1866.064,1859.855,1865.919 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1994.3 | 1859.9–2003.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 16152.592,16183.877,16167.779,15598.683,15284.744,15289.677,15958.805 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15958.8 | 15284.7–16183.9 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1393.757,1339.528,1387.391,1394.499,1317.236,1310.545,1313.578 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1339.5 | 1310.5–1394.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 878.051,821.678,868.552,878.646,826.808,826.840,829.964 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 830.0 | 821.7–878.6 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7618.036,7792.677,7700.458,7483.092,7400.110,7409.769,7392.583 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7483.1 | 7392.6–7792.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 14762.173,14735.147,15312.680,15709.971,15079.509,14753.439,14698.346 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14762.2 | 14698.3–15710.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11510.874,11574.801,12288.957,12079.814,11515.851,11624.180,11531.889 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11574.8 | 11510.9–12289.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 17161.081,17187.970,18184.441,17842.729,17340.551,17348.123,17301.436 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17340.6 | 17161.1–18184.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 480.017,477.542,485.218,480.803,483.437,514.013,512.282 -->
| goose-json | wide | decode | 135 | 40000 | 483.4 | 477.5–514.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 176.997,175.581,172.972,174.933,174.098,183.383,179.974 -->
| goose-json | wide | encode | 135 | 40000 | 175.6 | 173.0–183.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 361.323,366.129,363.128,363.158,364.091,382.730,365.031 -->
| Goose DOM | wide | decode | 135 | 40000 | 364.1 | 361.3–382.7 | 4777000 |
