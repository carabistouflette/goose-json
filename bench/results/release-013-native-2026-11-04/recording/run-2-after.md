| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 139.293,149.832,152.317,152.525,114.360,113.759,104.692 -->
| goose-json | plain | decode | 38 | 200000 | 139.3 | 104.7–152.5 | 67248000 |
<!-- samples | goose-json | plain | encode | 52.319,53.376,56.125,55.786,52.743,54.457,49.314 -->
| goose-json | plain | encode | 38 | 200000 | 53.4 | 49.3–56.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 87.452,89.100,89.087,89.053,84.749,79.471,82.956 -->
| Goose DOM | plain | decode | 38 | 200000 | 87.5 | 79.5–89.1 | 5604000 |
<!-- samples | goose-json | escaped | decode | 214.871,191.633,188.831,229.017,236.817,230.127,247.837 -->
| goose-json | escaped | decode | 62 | 200000 | 229.0 | 188.8–247.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 94.870,88.018,87.086,109.943,109.617,110.381,111.125 -->
| goose-json | escaped | encode | 54 | 200000 | 109.6 | 87.1–111.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 124.524,123.253,132.540,150.110,149.525,152.936,148.439 -->
| Goose DOM | escaped | decode | 62 | 200000 | 148.4 | 123.3–152.9 | 30822000 |
<!-- samples | goose-json | array | decode | 11818.908,11467.455,10985.345,11413.483,11775.272,11867.974,10232.927 -->
| goose-json | array | decode | 4022 | 20000 | 11467.5 | 10232.9–11868.0 | 288627000 |
<!-- samples | goose-json | array | encode | 6164.240,6350.472,4878.702,6202.960,6248.070,5795.807,5393.756 -->
| goose-json | array | encode | 4022 | 20000 | 6164.2 | 4878.7–6350.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 18689.579,19472.970,17495.107,20462.144,19261.305,16859.441,19137.083 -->
| Goose DOM | array | decode | 4022 | 20000 | 19137.1 | 16859.4–20462.1 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 9333.343,10093.623,9911.249,9759.403,10082.135,11182.156,11117.410 -->
| goose-json | array-signed | decode | 4538 | 20000 | 10082.1 | 9333.3–11182.2 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 5154.595,5126.811,5293.537,5195.665,5081.088,6311.386,5708.938 -->
| goose-json | array-signed | encode | 4537 | 20000 | 5195.7 | 5081.1–6311.4 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 17867.060,16868.416,17053.066,17551.909,15931.393,18153.693,18867.286 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 17551.9 | 15931.4–18867.3 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 33495.358,39793.694,33897.813,33792.720,34682.653,36288.177,36595.004 -->
| goose-json | array-wide | decode | 19771 | 20000 | 34682.7 | 33495.4–39793.7 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 16909.077,19300.480,17456.163,17284.924,17188.936,16527.911,17994.334 -->
| goose-json | array-wide | encode | 19770 | 20000 | 17284.9 | 16527.9–19300.5 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 55162.111,56872.580,55362.730,54612.786,54730.137,54846.800,57194.703 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 55162.1 | 54612.8–57194.7 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2718.524,2612.585,2703.443,2861.997,2548.692,2693.825,2672.916 -->
| goose-json | mixed | decode | 1187 | 20000 | 2693.8 | 2548.7–2862.0 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2934.964,2832.804,2901.744,2701.557,2814.797,2720.933,2814.247 -->
| goose-json | mixed | encode | 1186 | 20000 | 2814.8 | 2701.6–2935.0 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2770.895,2953.579,3088.335,2717.531,2975.061,2872.239,3027.306 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2953.6 | 2717.5–3088.3 | 83331000 |
<!-- samples | goose-json | floats | decode | 5324.894,5452.025,5047.730,4961.217,4589.900,4624.646,4566.306 -->
| goose-json | floats | decode | 1581 | 2000 | 4961.2 | 4566.3–5452.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 12237.248,11737.101,11500.306,10818.396,10239.566,10372.565,10047.562 -->
| goose-json | floats | encode | 1581 | 2000 | 10818.4 | 10047.6–12237.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5113.614,4849.645,4812.074,4502.306,4309.770,4499.270,4565.837 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4565.8 | 4309.8–5113.6 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7971.109,8962.825,9240.449,9126.995,9199.474,8490.519,8536.703 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8962.8 | 7971.1–9240.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11079.451,12363.920,12070.375,12816.032,12118.919,11595.731,11844.145 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12070.4 | 11079.5–12816.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 15707.370,16759.079,15621.712,17149.531,16089.906,16051.335,16082.604 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16082.6 | 15621.7–17149.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 114.496,126.756,120.534,117.446,114.324,116.617,111.931 -->
| goose-json | text-short | decode | 97 | 200000 | 116.6 | 111.9–126.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 51.037,53.719,48.819,50.591,50.971,47.217,46.803 -->
| goose-json | text-short | encode | 97 | 200000 | 50.6 | 46.8–53.7 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 137.132,135.278,133.404,128.750,134.982,124.252,122.309 -->
| Goose DOM | text-short | decode | 97 | 200000 | 133.4 | 122.3–137.1 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1930.981,1750.583,1924.177,1719.105,1600.563,1727.530,1730.771 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1730.8 | 1600.6–1931.0 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1848.281,1729.619,1847.054,1619.097,1507.542,1626.940,1654.044 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1654.0 | 1507.5–1848.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 14023.083,14275.684,14561.182,12874.530,13313.602,13771.007,13890.138 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 13890.1 | 12874.5–14561.2 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1197.583,1199.271,1188.425,1207.445,1177.520,1263.239,1285.678 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1199.3 | 1177.5–1285.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 743.078,776.066,738.721,739.144,743.057,818.137,829.287 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 743.1 | 738.7–829.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6671.219,6771.463,6625.927,6514.323,6815.784,7165.258,7214.092 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6771.5 | 6514.3–7214.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 15653.614,16138.472,16901.628,15740.064,15232.690,15610.760,15825.762 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 15740.1 | 15232.7–16901.6 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 12200.682,13220.901,13052.149,11515.717,12833.314,12125.252,12870.228 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 12833.3 | 11515.7–13220.9 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 18226.620,20116.269,19288.605,17649.042,18267.999,18175.327,19118.645 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 18268.0 | 17649.0–20116.3 | 99900000 |
<!-- samples | goose-json | wide | decode | 504.752,494.880,515.225,511.913,501.178,475.139,463.014 -->
| goose-json | wide | decode | 135 | 40000 | 501.2 | 463.0–515.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 196.398,198.222,217.065,219.375,194.566,202.707,206.643 -->
| goose-json | wide | encode | 135 | 40000 | 202.7 | 194.6–219.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 363.248,383.874,385.063,367.747,381.462,345.179,386.150 -->
| Goose DOM | wide | decode | 135 | 40000 | 381.5 | 345.2–386.2 | 4777000 |
