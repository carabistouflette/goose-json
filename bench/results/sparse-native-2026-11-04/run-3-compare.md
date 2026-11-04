| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 155.402,156.470,155.003,159.733,160.654,157.825,156.765 -->
| serde_json | plain | decode | 38 | 200000 | 156.8 | 155.0–160.7 | 67248000 |
<!-- samples | serde_json | plain | encode | 63.796,63.200,65.126,65.004,66.078,65.187,64.115 -->
| serde_json | plain | encode | 38 | 200000 | 65.0 | 63.2–66.1 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 162.149,159.327,160.164,163.685,161.875,161.010,159.441 -->
| sonic-rs | plain | decode | 38 | 200000 | 161.0 | 159.3–163.7 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 65.097,62.710,57.972,65.107,66.309,67.591,63.478 -->
| sonic-rs | plain | encode | 38 | 200000 | 65.1 | 58.0–67.6 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 57.261,57.068,57.204,57.974,59.993,59.266,60.462 -->
| prost (binary) | plain | decode | 11 | 200000 | 58.0 | 57.1–60.5 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 39.683,39.422,38.941,39.958,38.606,37.896,39.059 -->
| prost (binary) | plain | encode | 11 | 200000 | 39.1 | 37.9–40.0 | 92719942 |
<!-- samples | serde_json | escaped | decode | 289.239,288.319,283.580,294.014,301.233,312.337,306.131 -->
| serde_json | escaped | decode | 62 | 200000 | 294.0 | 283.6–312.3 | 85461000 |
<!-- samples | serde_json | escaped | encode | 95.026,97.144,96.391,92.666,92.717,94.674,96.778 -->
| serde_json | escaped | encode | 54 | 200000 | 95.0 | 92.7–97.1 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 310.899,298.570,297.706,296.569,304.874,300.717,299.425 -->
| sonic-rs | escaped | decode | 62 | 200000 | 299.4 | 296.6–310.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 138.753,145.638,139.145,143.041,142.489,146.817,145.993 -->
| sonic-rs | escaped | encode | 54 | 200000 | 143.0 | 138.8–146.8 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 69.589,69.807,67.493,67.823,67.798,62.980,65.367 -->
| prost (binary) | escaped | decode | 24 | 200000 | 67.8 | 63.0–69.8 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 32.061,34.139,33.863,33.079,33.416,34.415,32.979 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.4 | 32.1–34.4 | 181133323 |
<!-- samples | serde_json | array | decode | 13981.922,14504.486,14617.745,14812.396,14753.536,14760.375,14426.895 -->
| serde_json | array | decode | 4022 | 20000 | 14617.7 | 13981.9–14812.4 | 288627000 |
<!-- samples | serde_json | array | encode | 7899.998,7768.303,7567.404,7613.159,7366.994,7471.027,7492.267 -->
| serde_json | array | encode | 4022 | 20000 | 7567.4 | 7367.0–7900.0 | 574225548 |
<!-- samples | sonic-rs | array | decode | 15413.289,15018.202,16022.076,16698.977,15741.459,16046.012,15641.767 -->
| sonic-rs | array | decode | 4022 | 20000 | 15741.5 | 15018.2–16699.0 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8034.743,7479.936,7073.221,6789.136,7793.634,7934.562,7961.091 -->
| sonic-rs | array | encode | 4022 | 20000 | 7793.6 | 6789.1–8034.7 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4403.739,4289.230,4319.508,4171.659,4454.882,4466.260,4306.006 -->
| prost (binary) | array | decode | 1923 | 20000 | 4319.5 | 4171.7–4466.3 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6502.767,6612.282,7010.587,7229.146,7297.137,7183.125,7119.950 -->
| prost (binary) | array | encode | 1923 | 20000 | 7120.0 | 6502.8–7297.1 | 284551620 |
<!-- samples | serde_json | floats | decode | 7252.560,7372.600,7571.315,8033.838,7672.993,7830.382,7557.093 -->
| serde_json | floats | decode | 1581 | 2000 | 7571.3 | 7252.6–8033.8 | 3825000 |
<!-- samples | serde_json | floats | encode | 10080.280,10190.720,10262.316,10106.759,10179.885,10105.806,10135.441 -->
| serde_json | floats | encode | 1581 | 2000 | 10135.4 | 10080.3–10262.3 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7250.868,7262.437,7401.377,7187.423,7188.717,7394.285,7241.789 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7250.9 | 7187.4–7401.4 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 12904.717,12859.549,12828.724,12767.104,17862.546,13036.512,12757.308 -->
| sonic-rs | floats | encode | 1581 | 2000 | 12859.5 | 12757.3–17862.5 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 880.326,837.360,882.659,852.253,859.785,1097.763,853.750 -->
| prost (binary) | floats | decode | 2051 | 2000 | 859.8 | 837.4–1097.8 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 566.601,585.306,581.205,581.705,582.027,582.580,582.891 -->
| prost (binary) | floats | encode | 2051 | 2000 | 582.0 | 566.6–585.3 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 23299.574,23513.739,23212.365,23060.097,22658.668,22891.469,22511.665 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 23060.1 | 22511.7–23513.7 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 10157.052,10055.868,9977.488,10028.470,9831.370,9979.519,9880.205 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9979.5 | 9831.4–10157.1 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 17664.558,18629.338,18350.133,17932.446,18990.786,19732.354,17614.363 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 18350.1 | 17614.4–19732.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 10656.843,10206.806,10216.398,10188.801,10228.334,10073.518,10101.451 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 10206.8 | 10073.5–10656.8 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 761.972,1196.919,785.630,874.886,824.750,850.852,920.720 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 850.9 | 762.0–1196.9 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 546.175,544.448,544.657,549.280,545.667,546.579,545.462 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 545.7 | 544.4–549.3 | 32664305 |
<!-- samples | serde_json | text-short | decode | 176.388,174.842,175.558,181.030,182.742,182.920,182.049 -->
| serde_json | text-short | decode | 97 | 200000 | 181.0 | 174.8–182.9 | 149907000 |
<!-- samples | serde_json | text-short | encode | 133.981,135.111,131.263,133.824,134.088,132.741,132.854 -->
| serde_json | text-short | encode | 97 | 200000 | 133.8 | 131.3–135.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 198.490,199.109,199.828,196.792,194.947,196.705,196.999 -->
| sonic-rs | text-short | decode | 97 | 200000 | 197.0 | 194.9–199.8 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 130.361,134.184,135.804,136.324,136.211,139.514,135.475 -->
| sonic-rs | text-short | encode | 97 | 200000 | 135.8 | 130.4–139.5 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 65.520,61.547,65.506,63.744,60.751,60.646,60.665 -->
| prost (binary) | text-short | decode | 70 | 200000 | 61.5 | 60.6–65.5 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 39.910,40.199,40.621,41.002,40.338,41.148,40.747 -->
| prost (binary) | text-short | encode | 70 | 200000 | 40.6 | 39.9–41.1 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2781.483,2784.402,2800.005,2773.765,2802.354,2786.639,2771.030 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2784.4 | 2771.0–2802.4 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4806.986,4823.234,4815.994,4808.931,4799.812,4811.115,4991.382 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4811.1 | 4799.8–4991.4 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1724.841,1556.702,1644.571,1697.968,1633.274,1584.412,1633.558 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1633.6 | 1556.7–1724.8 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 640.995,636.352,632.379,643.360,628.846,634.069,630.381 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 634.1 | 628.8–643.4 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 513.398,515.287,514.639,520.468,518.272,515.139,515.250 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 515.2 | 513.4–520.5 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 183.473,181.117,181.599,182.499,182.387,185.775,179.618 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 182.4 | 179.6–185.8 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2225.437,2179.564,2183.249,2186.131,2221.445,2280.677,2326.653 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2221.4 | 2179.6–2326.7 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4787.245,4584.072,4545.409,4538.065,4495.087,4637.443,4712.301 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4584.1 | 4495.1–4787.2 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1155.625,1144.756,1137.929,1149.306,1140.712,1152.619,1147.967 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1148.0 | 1137.9–1155.6 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 580.835,577.846,580.299,580.336,579.890,581.408,579.856 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 580.3 | 577.8–581.4 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 543.985,543.902,547.588,541.785,509.777,510.574,543.390 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 543.4 | 509.8–547.6 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 192.859,195.925,193.530,195.537,193.470,192.003,196.333 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 193.5 | 192.0–196.3 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 24201.255,24423.321,23378.750,23245.539,23837.690,23394.501,23707.745 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23707.7 | 23245.5–24423.3 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12548.641,12460.511,12111.554,12163.599,12368.084,12733.574,12380.038 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12380.0 | 12111.6–12733.6 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13101.329,12801.085,12772.128,12930.810,13031.058,12840.876,13131.293 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 12930.8 | 12772.1–13131.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8482.489,8358.127,8368.179,8374.681,8376.612,8332.615,8339.297 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8368.2 | 8332.6–8482.5 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8072.943,8108.082,8346.827,8246.845,8303.424,8331.665,8260.492 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8260.5 | 8072.9–8346.8 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 175.744,156.988,161.339,156.798,157.942,161.437,156.755 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 157.9 | 156.8–175.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 1464.346,1484.227,1543.845,1484.425,1479.371,1524.960,1512.831 -->
| serde_json | wide | decode | 135 | 40000 | 1484.4 | 1464.3–1543.8 | 33720000 |
<!-- samples | serde_json | wide | encode | 414.378,407.377,405.645,402.178,396.628,404.336,400.714 -->
| serde_json | wide | encode | 135 | 40000 | 404.3 | 396.6–414.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 934.733,948.886,945.348,966.701,941.685,951.220,961.856 -->
| sonic-rs | wide | decode | 135 | 40000 | 948.9 | 934.7–966.7 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 418.214,405.603,415.063,403.396,397.897,383.768,395.620 -->
| sonic-rs | wide | encode | 135 | 40000 | 403.4 | 383.8–418.2 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 130.359,134.390,133.754,131.887,135.158,140.345,129.995 -->
| prost (binary) | wide | decode | 31 | 40000 | 133.8 | 130.0–140.3 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 165.271,144.252,139.230,133.128,148.828,144.006,143.094 -->
| prost (binary) | wide | encode | 31 | 40000 | 144.0 | 133.1–165.3 | 19595809 |
