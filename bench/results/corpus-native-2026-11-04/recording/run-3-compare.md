| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 154.111,140.348,115.849,110.329,111.746,108.936,109.371 -->
| serde_json | plain | decode | 38 | 200000 | 111.7 | 108.9–154.1 | 67248000 |
<!-- samples | serde_json | plain | encode | 55.245,53.411,53.001,53.457,52.156,51.373,52.985 -->
| serde_json | plain | encode | 38 | 200000 | 53.0 | 51.4–55.2 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 195.616,197.986,187.949,187.720,209.550,206.163,190.849 -->
| sonic-rs | plain | decode | 38 | 200000 | 195.6 | 187.7–209.6 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 58.106,59.150,57.953,57.602,58.025,56.566,56.246 -->
| sonic-rs | plain | encode | 38 | 200000 | 58.0 | 56.2–59.1 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 44.799,49.373,53.211,51.925,49.158,46.888,45.379 -->
| prost (binary) | plain | decode | 11 | 200000 | 49.2 | 44.8–53.2 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 24.851,25.488,24.976,24.867,25.655,25.827,25.655 -->
| prost (binary) | plain | encode | 11 | 200000 | 25.5 | 24.9–25.8 | 92719942 |
<!-- samples | serde_json | escaped | decode | 235.071,245.158,241.821,227.299,231.975,238.719,242.919 -->
| serde_json | escaped | decode | 62 | 200000 | 238.7 | 227.3–245.2 | 85461000 |
<!-- samples | serde_json | escaped | encode | 74.865,71.222,68.339,66.831,66.595,68.680,68.882 -->
| serde_json | escaped | encode | 54 | 200000 | 68.7 | 66.6–74.9 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 327.735,355.609,391.264,364.097,345.250,361.576,336.932 -->
| sonic-rs | escaped | decode | 62 | 200000 | 355.6 | 327.7–391.3 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 122.904,121.262,129.271,131.009,135.382,132.728,125.603 -->
| sonic-rs | escaped | encode | 54 | 200000 | 129.3 | 121.3–135.4 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 50.959,49.525,49.238,50.241,50.306,48.895,48.400 -->
| prost (binary) | escaped | decode | 24 | 200000 | 49.5 | 48.4–51.0 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 22.675,22.656,21.866,21.704,21.961,21.826,21.711 -->
| prost (binary) | escaped | encode | 24 | 200000 | 21.9 | 21.7–22.7 | 181133323 |
<!-- samples | serde_json | array | decode | 13443.071,14639.060,14885.630,14658.728,15635.536,14277.386,14186.146 -->
| serde_json | array | decode | 4022 | 20000 | 14639.1 | 13443.1–15635.5 | 288627000 |
<!-- samples | serde_json | array | encode | 6789.456,6942.332,6788.835,6452.445,6449.874,7669.728,8523.464 -->
| serde_json | array | encode | 4022 | 20000 | 6789.5 | 6449.9–8523.5 | 574225548 |
<!-- samples | sonic-rs | array | decode | 20260.878,21098.115,19379.118,19871.139,21083.714,19723.686,25453.738 -->
| sonic-rs | array | decode | 4022 | 20000 | 20260.9 | 19379.1–25453.7 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8324.886,10163.640,9125.979,8295.318,7743.784,7354.308,8434.713 -->
| sonic-rs | array | encode | 4022 | 20000 | 8324.9 | 7354.3–10163.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4335.890,4452.709,4171.657,4045.887,4379.156,3923.723,4019.969 -->
| prost (binary) | array | decode | 1923 | 20000 | 4171.7 | 3923.7–4452.7 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7767.019,6482.585,6112.525,6316.866,7241.063,7431.414,7185.145 -->
| prost (binary) | array | encode | 1923 | 20000 | 7185.1 | 6112.5–7767.0 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 14473.313,13668.470,13680.121,14286.921,14043.971,15462.403,15840.196 -->
| serde_json | array-signed | decode | 4538 | 20000 | 14286.9 | 13668.5–15840.2 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 6626.532,6133.917,6471.813,6216.920,6072.586,6134.820,6068.487 -->
| serde_json | array-signed | encode | 4537 | 20000 | 6134.8 | 6068.5–6626.5 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 20309.659,19320.514,19186.666,19639.159,19390.322,18841.966,22987.327 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 19390.3 | 18842.0–22987.3 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 9524.495,9467.939,9488.476,9264.178,7986.495,8007.651,6826.910 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 9264.2 | 6826.9–9524.5 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5440.450,5200.484,5122.978,5006.069,5173.447,5222.602,4961.291 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 5173.4 | 4961.3–5440.4 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 17237.568,14821.970,14419.336,14477.867,14365.099,14317.529,15178.591 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 14477.9 | 14317.5–17237.6 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 28593.451,30692.843,28667.406,29206.938,34502.701,30222.891,37962.512 -->
| serde_json | array-wide | decode | 19771 | 20000 | 30222.9 | 28593.5–37962.5 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 16696.390,13633.370,13434.373,12475.214,11671.917,11274.254,14437.390 -->
| serde_json | array-wide | encode | 19770 | 20000 | 13434.4 | 11274.3–16696.4 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 21880.531,25707.431,25681.554,24005.253,26395.154,23827.971,22764.277 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 24005.3 | 21880.5–26395.2 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 11635.692,11970.692,12109.240,11943.414,11936.786,11707.162,11680.880 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 11936.8 | 11635.7–12109.2 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 6862.371,6561.862,6501.349,6567.279,6711.595,6538.320,6624.405 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 6567.3 | 6501.3–6862.4 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 20689.711,21116.616,22050.656,21683.580,21842.209,23281.970,22108.017 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 21842.2 | 20689.7–23282.0 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 2890.135,3000.867,2886.877,3079.416,3100.004,2919.883,2924.554 -->
| serde_json | mixed | decode | 1187 | 20000 | 2924.6 | 2886.9–3100.0 | 227997000 |
<!-- samples | serde_json | mixed | encode | 1633.258,1611.241,1631.226,1705.592,1700.867,1926.998,1717.425 -->
| serde_json | mixed | encode | 1186 | 20000 | 1700.9 | 1611.2–1927.0 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 2804.394,2828.912,2884.323,2812.612,2831.136,2702.870,2709.891 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 2812.6 | 2702.9–2884.3 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 2025.298,2023.827,2023.374,2028.803,2107.548,2069.140,2023.981 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 2025.3 | 2023.4–2107.5 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 901.741,894.082,893.528,949.930,991.585,972.327,943.353 -->
| prost (binary) | mixed | decode | 954 | 20000 | 943.4 | 893.5–991.6 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 393.748,395.470,395.554,387.051,368.655,377.794,383.110 -->
| prost (binary) | mixed | encode | 954 | 20000 | 387.1 | 368.7–395.6 | 149207284 |
<!-- samples | serde_json | floats | decode | 4610.553,4607.567,4608.507,4609.198,4597.202,4606.123,4610.726 -->
| serde_json | floats | decode | 1581 | 2000 | 4608.5 | 4597.2–4610.7 | 3825000 |
<!-- samples | serde_json | floats | encode | 6252.037,6264.779,6111.315,6031.357,6103.162,6194.050,6029.413 -->
| serde_json | floats | encode | 1581 | 2000 | 6111.3 | 6029.4–6264.8 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5260.782,5239.845,5240.722,5241.884,5233.738,5229.244,5243.824 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5240.7 | 5229.2–5260.8 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10114.459,9956.145,9958.929,10461.338,10387.565,10019.120,9892.344 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10019.1 | 9892.3–10461.3 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 692.116,690.581,692.978,681.899,680.175,680.858,681.128 -->
| prost (binary) | floats | decode | 2051 | 2000 | 681.9 | 680.2–693.0 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 253.356,256.094,252.133,253.846,252.131,252.694,251.272 -->
| prost (binary) | floats | encode | 2051 | 2000 | 252.7 | 251.3–256.1 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 13843.462,13836.763,14455.319,14531.715,14875.641,14070.262,13853.013 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 14070.3 | 13836.8–14875.6 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 5802.903,5903.019,5785.894,5778.677,5783.770,6016.052,6093.085 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 5802.9 | 5778.7–6093.1 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 10338.187,10083.929,9992.137,9954.108,9963.835,9956.409,9961.370 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 9963.8 | 9954.1–10338.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 10358.294,10678.190,12837.563,12181.477,11140.221,10986.986,11362.543 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 11140.2 | 10358.3–12837.6 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 827.261,829.117,837.740,849.533,847.534,857.008,854.497 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 847.5 | 827.3–857.0 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 266.396,268.957,265.557,266.820,265.368,266.365,265.531 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 266.4 | 265.4–269.0 | 32664305 |
<!-- samples | serde_json | text-short | decode | 105.371,110.827,113.088,109.614,105.287,102.680,102.749 -->
| serde_json | text-short | decode | 97 | 200000 | 105.4 | 102.7–113.1 | 149907000 |
<!-- samples | serde_json | text-short | encode | 69.308,68.310,68.514,69.901,73.912,72.531,72.862 -->
| serde_json | text-short | encode | 97 | 200000 | 69.9 | 68.3–73.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 144.606,138.052,136.832,136.650,135.892,136.327,136.407 -->
| sonic-rs | text-short | decode | 97 | 200000 | 136.7 | 135.9–144.6 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 93.111,92.801,92.801,92.910,92.797,92.915,92.832 -->
| sonic-rs | text-short | encode | 97 | 200000 | 92.8 | 92.8–93.1 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 38.700,38.623,38.603,38.504,38.637,38.498,38.551 -->
| prost (binary) | text-short | decode | 70 | 200000 | 38.6 | 38.5–38.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 21.614,21.990,23.069,23.907,23.971,23.871,22.917 -->
| prost (binary) | text-short | encode | 70 | 200000 | 23.1 | 21.6–24.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2257.414,2257.778,2250.510,2246.343,2208.481,2160.026,2161.371 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2246.3 | 2160.0–2257.8 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 3690.751,3683.825,3627.680,3549.610,3555.119,3552.801,3592.213 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 3592.2 | 3549.6–3690.8 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1734.498,1734.547,1710.995,1708.472,1719.494,1727.207,1702.441 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1719.5 | 1702.4–1734.5 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 461.065,460.764,460.976,461.505,460.741,460.226,459.245 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 460.8 | 459.2–461.5 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 470.527,470.030,470.363,471.705,470.668,470.052,470.202 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 470.4 | 470.0–471.7 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 247.124,243.648,253.487,243.546,245.708,243.433,245.462 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 245.5 | 243.4–253.5 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1419.984,1416.041,1419.611,1414.458,1419.299,1415.061,1411.970 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1416.0 | 1412.0–1420.0 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 3277.662,3302.079,3275.256,3441.068,3518.721,3399.787,3390.883 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 3390.9 | 3275.3–3518.7 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1192.716,1191.039,1195.697,1193.146,1189.824,1192.233,1157.986 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1192.2 | 1158.0–1195.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 448.055,445.853,446.077,443.969,445.873,446.101,450.171 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 446.1 | 444.0–450.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 467.849,462.952,481.622,481.161,500.409,486.036,484.171 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 481.6 | 463.0–500.4 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 250.330,254.643,250.031,255.221,250.012,253.415,250.019 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 250.3 | 250.0–255.2 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 19839.718,19943.854,19722.369,19818.025,19362.004,19383.909,19401.153 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 19722.4 | 19362.0–19943.9 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 6954.019,7133.993,7241.357,6767.496,6863.530,6765.530,6541.346 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 6863.5 | 6541.3–7241.4 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 14691.386,14323.745,14178.594,14297.539,14392.127,15139.790,15543.318 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 14392.1 | 14178.6–15543.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 5595.119,5585.586,5579.385,5582.650,5457.007,5376.091,5397.630 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 5579.4 | 5376.1–5595.1 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 5765.324,5746.887,5750.873,5782.328,5831.450,6185.529,6078.124 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 5782.3 | 5746.9–6185.5 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 217.071,215.375,216.387,215.369,216.481,215.538,216.122 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 216.1 | 215.4–217.1 | 101649504 |
<!-- samples | serde_json | wide | decode | 543.596,542.376,524.365,525.095,523.380,523.235,530.680 -->
| serde_json | wide | decode | 135 | 40000 | 525.1 | 523.2–543.6 | 33720000 |
<!-- samples | serde_json | wide | encode | 302.645,300.016,289.794,289.135,285.849,278.525,278.290 -->
| serde_json | wide | encode | 135 | 40000 | 289.1 | 278.3–302.6 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 628.839,632.539,697.931,822.934,920.250,771.844,690.275 -->
| sonic-rs | wide | decode | 135 | 40000 | 697.9 | 628.8–920.3 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 294.033,289.736,289.135,281.447,278.456,279.369,293.464 -->
| sonic-rs | wide | encode | 135 | 40000 | 289.1 | 278.5–294.0 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 101.382,100.034,101.845,100.342,97.159,96.028,98.162 -->
| prost (binary) | wide | decode | 31 | 40000 | 100.0 | 96.0–101.8 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 93.366,93.506,93.412,92.608,93.178,93.385,93.092 -->
| prost (binary) | wide | encode | 31 | 40000 | 93.4 | 92.6–93.5 | 19595809 |
