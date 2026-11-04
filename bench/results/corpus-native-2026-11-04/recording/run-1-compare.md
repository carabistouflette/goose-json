| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 105.918,99.486,101.539,97.701,97.860,98.233,105.446 -->
| serde_json | plain | decode | 38 | 200000 | 99.5 | 97.7–105.9 | 67248000 |
<!-- samples | serde_json | plain | encode | 52.822,51.274,51.051,50.510,50.013,49.092,49.459 -->
| serde_json | plain | encode | 38 | 200000 | 50.5 | 49.1–52.8 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 186.078,188.367,194.162,181.512,176.766,168.850,170.425 -->
| sonic-rs | plain | decode | 38 | 200000 | 181.5 | 168.8–194.2 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 52.337,53.441,54.146,54.601,56.705,57.339,60.822 -->
| sonic-rs | plain | encode | 38 | 200000 | 54.6 | 52.3–60.8 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 53.710,60.170,60.228,57.458,53.733,50.351,47.500 -->
| prost (binary) | plain | decode | 11 | 200000 | 53.7 | 47.5–60.2 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 25.494,24.730,24.234,23.929,23.655,23.118,23.097 -->
| prost (binary) | plain | encode | 11 | 200000 | 23.9 | 23.1–25.5 | 92719942 |
<!-- samples | serde_json | escaped | decode | 217.105,233.190,226.680,218.314,253.193,240.269,229.230 -->
| serde_json | escaped | decode | 62 | 200000 | 229.2 | 217.1–253.2 | 85461000 |
<!-- samples | serde_json | escaped | encode | 68.219,66.730,73.615,76.932,89.439,94.901,96.037 -->
| serde_json | escaped | encode | 54 | 200000 | 76.9 | 66.7–96.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 443.897,425.126,343.650,313.572,300.408,300.534,305.124 -->
| sonic-rs | escaped | decode | 62 | 200000 | 313.6 | 300.4–443.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 109.098,109.138,108.196,105.587,107.883,106.689,124.819 -->
| sonic-rs | escaped | encode | 54 | 200000 | 108.2 | 105.6–124.8 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 53.564,52.029,50.415,51.532,52.004,50.200,48.647 -->
| prost (binary) | escaped | decode | 24 | 200000 | 51.5 | 48.6–53.6 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 22.945,22.458,22.046,21.950,22.384,22.980,22.854 -->
| prost (binary) | escaped | encode | 24 | 200000 | 22.5 | 22.0–23.0 | 181133323 |
<!-- samples | serde_json | array | decode | 13141.256,13287.202,12748.169,12384.862,12527.951,12385.896,12425.150 -->
| serde_json | array | decode | 4022 | 20000 | 12528.0 | 12384.9–13287.2 | 288627000 |
<!-- samples | serde_json | array | encode | 6264.838,8814.652,6986.612,6662.821,7529.916,7179.246,6710.544 -->
| serde_json | array | encode | 4022 | 20000 | 6986.6 | 6264.8–8814.7 | 574225548 |
<!-- samples | sonic-rs | array | decode | 19219.458,18676.773,20077.850,27764.993,23197.383,18032.534,19948.116 -->
| sonic-rs | array | decode | 4022 | 20000 | 19948.1 | 18032.5–27765.0 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7272.928,6633.541,7183.883,6526.685,6744.163,6721.737,6979.954 -->
| sonic-rs | array | encode | 4022 | 20000 | 6744.2 | 6526.7–7272.9 | 574225548 |
<!-- samples | prost (binary) | array | decode | 3998.799,4170.381,4265.724,5158.643,4282.551,3601.167,3902.324 -->
| prost (binary) | array | decode | 1923 | 20000 | 4170.4 | 3601.2–5158.6 | 288627000 |
<!-- samples | prost (binary) | array | encode | 5815.176,5814.423,5845.483,6005.662,5949.078,5812.859,6383.034 -->
| prost (binary) | array | encode | 1923 | 20000 | 5845.5 | 5812.9–6383.0 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 12972.752,12949.530,12631.324,12877.304,13443.881,13652.862,14576.843 -->
| serde_json | array-signed | decode | 4538 | 20000 | 12972.8 | 12631.3–14576.8 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 5656.811,5736.377,5800.969,6017.874,6029.144,6092.595,5736.658 -->
| serde_json | array-signed | encode | 4537 | 20000 | 5801.0 | 5656.8–6092.6 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 17484.604,22218.525,19066.925,20995.100,17917.245,17758.620,17717.874 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 17917.2 | 17484.6–22218.5 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 5817.646,6133.453,6063.438,6439.551,6132.681,5832.755,6006.036 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6063.4 | 5817.6–6439.6 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5020.301,5099.448,5336.561,4975.402,4924.563,5045.527,5247.707 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 5045.5 | 4924.6–5336.6 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 16103.986,17366.975,15102.633,14506.012,14937.647,14879.365,14263.397 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 14937.6 | 14263.4–17367.0 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 29723.303,28932.465,33596.510,30278.516,29811.356,28852.824,29081.988 -->
| serde_json | array-wide | decode | 19771 | 20000 | 29723.3 | 28852.8–33596.5 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 10888.607,10788.748,11005.473,11213.296,10866.465,11104.827,10780.918 -->
| serde_json | array-wide | encode | 19770 | 20000 | 10888.6 | 10780.9–11213.3 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 21264.802,21129.938,21051.540,25103.484,21104.832,21922.839,22930.633 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 21264.8 | 21051.5–25103.5 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 11978.715,12585.869,11963.329,12735.518,16626.581,12252.462,11765.252 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 12252.5 | 11765.3–16626.6 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 6579.379,6736.807,6696.756,6563.671,6863.300,6797.522,6561.036 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 6696.8 | 6561.0–6863.3 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 20410.485,21076.413,20603.816,20604.045,20992.744,27729.894,25010.536 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 20992.7 | 20410.5–27729.9 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 2869.241,3135.703,3182.647,2902.592,2957.400,3105.930,3053.583 -->
| serde_json | mixed | decode | 1187 | 20000 | 3053.6 | 2869.2–3182.6 | 227997000 |
<!-- samples | serde_json | mixed | encode | 1689.364,1654.135,1583.887,1564.018,1844.002,1909.805,1674.255 -->
| serde_json | mixed | encode | 1186 | 20000 | 1674.3 | 1564.0–1909.8 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 3369.677,3549.481,2879.045,3031.281,4420.518,3599.630,3229.761 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 3369.7 | 2879.0–4420.5 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 2326.757,2384.255,2365.395,2515.405,2425.428,2556.130,2407.280 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 2407.3 | 2326.8–2556.1 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 967.930,947.569,1004.316,1146.245,1097.313,1222.242,1107.056 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1097.3 | 947.6–1222.2 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 456.256,461.991,457.193,456.627,439.429,440.074,430.603 -->
| prost (binary) | mixed | encode | 954 | 20000 | 456.3 | 430.6–462.0 | 149207284 |
<!-- samples | serde_json | floats | decode | 5050.449,5031.668,4891.837,4867.967,4876.908,4846.744,4864.196 -->
| serde_json | floats | decode | 1581 | 2000 | 4876.9 | 4846.7–5050.4 | 3825000 |
<!-- samples | serde_json | floats | encode | 6279.598,6256.011,6264.385,6208.709,6195.944,6761.494,6784.525 -->
| serde_json | floats | encode | 1581 | 2000 | 6264.4 | 6195.9–6784.5 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5654.905,5511.024,5472.769,5442.381,5436.697,5422.805,5413.973 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5442.4 | 5414.0–5654.9 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10662.728,10605.953,10311.305,10146.642,9970.809,9935.073,10087.759 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10146.6 | 9935.1–10662.7 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 698.494,703.631,698.585,701.242,700.874,708.948,708.559 -->
| prost (binary) | floats | decode | 2051 | 2000 | 701.2 | 698.5–708.9 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 275.662,273.104,275.144,273.220,273.608,277.354,275.788 -->
| prost (binary) | floats | encode | 2051 | 2000 | 275.1 | 273.1–277.4 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 14055.809,14324.215,14836.167,14134.120,14063.182,15954.189,16060.197 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 14324.2 | 14055.8–16060.2 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 6542.692,6304.893,6563.214,7072.818,6924.809,6622.655,6486.358 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 6563.2 | 6304.9–7072.8 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 10502.508,10377.569,10350.665,10114.972,10437.417,11162.876,11402.317 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 10437.4 | 10115.0–11402.3 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 11926.584,11248.787,11270.830,11250.022,10966.587,10658.604,10662.199 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 11248.8 | 10658.6–11926.6 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 853.538,852.639,847.845,849.043,862.371,859.664,881.878 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 853.5 | 847.8–881.9 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 278.686,284.471,279.507,279.906,276.634,279.984,276.921 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 279.5 | 276.6–284.5 | 32664305 |
<!-- samples | serde_json | text-short | decode | 113.750,111.649,106.998,105.715,105.914,108.596,110.371 -->
| serde_json | text-short | decode | 97 | 200000 | 108.6 | 105.7–113.8 | 149907000 |
<!-- samples | serde_json | text-short | encode | 75.055,73.648,72.224,71.090,72.731,73.147,70.831 -->
| serde_json | text-short | encode | 97 | 200000 | 72.7 | 70.8–75.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 139.253,136.827,137.244,137.012,136.708,155.649,151.887 -->
| sonic-rs | text-short | decode | 97 | 200000 | 137.2 | 136.7–155.6 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 97.559,98.397,95.449,102.658,99.842,96.862,97.004 -->
| sonic-rs | text-short | encode | 97 | 200000 | 97.6 | 95.4–102.7 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 42.579,42.887,42.628,41.834,43.866,43.207,41.908 -->
| prost (binary) | text-short | decode | 70 | 200000 | 42.6 | 41.8–43.9 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 24.421,24.712,24.511,24.353,24.261,23.883,23.376 -->
| prost (binary) | text-short | encode | 70 | 200000 | 24.4 | 23.4–24.7 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2037.888,2102.448,2046.836,2036.046,2034.259,2040.070,2037.928 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2037.9 | 2034.3–2102.4 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 3854.655,3733.278,3766.358,3957.746,4133.750,4378.332,4476.438 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 3957.7 | 3733.3–4476.4 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1981.547,1961.960,1943.995,1920.305,1888.249,1948.714,1887.334 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1944.0 | 1887.3–1981.5 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 498.897,499.642,499.643,500.825,498.899,499.966,501.572 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 499.6 | 498.9–501.6 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 506.173,505.716,506.425,506.976,505.984,505.430,505.659 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 506.0 | 505.4–507.0 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 253.831,251.740,252.005,250.964,253.547,251.621,252.465 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 252.0 | 251.0–253.8 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1472.059,1475.009,1467.406,1478.003,1470.573,1465.130,1473.041 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1472.1 | 1465.1–1478.0 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 3402.045,3400.137,3333.365,3271.197,3274.745,3276.079,3274.800 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 3276.1 | 3271.2–3402.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1161.447,1149.751,1150.307,1150.647,1176.292,1173.033,1154.217 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1154.2 | 1149.8–1176.3 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 447.373,446.312,447.777,448.183,444.610,445.795,446.731 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 446.7 | 444.6–448.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 469.834,474.315,489.819,485.585,497.041,500.300,500.250 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 489.8 | 469.8–500.3 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 268.582,270.807,268.512,269.303,267.973,266.404,267.443 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 268.5 | 266.4–270.8 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 19934.254,20088.382,22541.875,20511.653,20499.438,20343.183,22394.701 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 20499.4 | 19934.3–22541.9 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 7540.128,7073.451,6452.798,6418.708,6849.283,6721.962,6897.582 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 6849.3 | 6418.7–7540.1 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 17159.343,18587.054,19183.463,18192.649,17078.453,17342.474,19206.187 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 18192.6 | 17078.5–19206.2 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 7265.975,7693.131,8002.283,8038.657,7251.327,6673.233,6286.370 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 7266.0 | 6286.4–8038.7 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 6877.117,6767.516,7397.988,8106.727,8440.981,8472.299,8550.588 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8106.7 | 6767.5–8550.6 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 329.401,329.931,324.921,328.954,328.882,324.199,329.528 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 329.0 | 324.2–329.9 | 101649504 |
<!-- samples | serde_json | wide | decode | 846.571,759.118,694.172,697.684,625.415,579.739,571.003 -->
| serde_json | wide | decode | 135 | 40000 | 694.2 | 571.0–846.6 | 33720000 |
<!-- samples | serde_json | wide | encode | 328.949,335.451,327.219,320.906,321.126,329.827,327.699 -->
| serde_json | wide | encode | 135 | 40000 | 327.7 | 320.9–335.5 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 669.771,688.334,675.366,650.900,655.508,632.149,631.948 -->
| sonic-rs | wide | decode | 135 | 40000 | 655.5 | 631.9–688.3 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 287.676,332.346,322.934,318.994,308.340,304.546,327.585 -->
| sonic-rs | wide | encode | 135 | 40000 | 319.0 | 287.7–332.3 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 109.188,105.238,104.654,104.431,101.270,100.767,100.380 -->
| prost (binary) | wide | decode | 31 | 40000 | 104.4 | 100.4–109.2 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 96.077,98.425,99.602,99.430,98.168,95.404,95.587 -->
| prost (binary) | wide | encode | 31 | 40000 | 98.2 | 95.4–99.6 | 19595809 |
