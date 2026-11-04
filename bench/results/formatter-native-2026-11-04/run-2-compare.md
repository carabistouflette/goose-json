| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 104.970,111.239,112.379,106.724,102.745,101.180,105.267 -->
| serde_json | plain | decode | 38 | 200000 | 105.3 | 101.2–112.4 | 67248000 |
<!-- samples | serde_json | plain | encode | 53.966,53.669,51.653,51.273,51.426,51.690,51.323 -->
| serde_json | plain | encode | 38 | 200000 | 51.7 | 51.3–54.0 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 181.709,174.435,180.831,189.328,183.936,184.026,184.950 -->
| sonic-rs | plain | decode | 38 | 200000 | 183.9 | 174.4–189.3 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 55.643,53.791,53.831,53.487,53.604,53.715,53.329 -->
| sonic-rs | plain | encode | 38 | 200000 | 53.7 | 53.3–55.6 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 39.218,39.211,39.329,39.125,39.317,39.400,40.346 -->
| prost (binary) | plain | decode | 11 | 200000 | 39.3 | 39.1–40.3 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 22.259,22.597,22.786,22.563,23.102,23.188,23.840 -->
| prost (binary) | plain | encode | 11 | 200000 | 22.8 | 22.3–23.8 | 92719942 |
<!-- samples | serde_json | escaped | decode | 215.964,210.049,213.850,207.258,200.885,199.014,204.348 -->
| serde_json | escaped | decode | 62 | 200000 | 207.3 | 199.0–216.0 | 85461000 |
<!-- samples | serde_json | escaped | encode | 64.550,63.639,63.372,61.653,63.271,62.092,61.677 -->
| serde_json | escaped | encode | 54 | 200000 | 63.3 | 61.7–64.5 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 290.540,291.609,296.407,301.196,289.648,297.634,293.896 -->
| sonic-rs | escaped | decode | 62 | 200000 | 293.9 | 289.6–301.2 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 104.503,103.468,99.821,99.847,100.085,107.821,112.998 -->
| sonic-rs | escaped | encode | 54 | 200000 | 103.5 | 99.8–113.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 48.308,48.534,48.378,48.680,48.153,48.099,48.228 -->
| prost (binary) | escaped | decode | 24 | 200000 | 48.3 | 48.1–48.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 21.969,21.653,21.930,22.461,21.885,21.835,22.086 -->
| prost (binary) | escaped | encode | 24 | 200000 | 21.9 | 21.7–22.5 | 181133323 |
<!-- samples | serde_json | array | decode | 12954.864,13467.856,12907.717,13124.953,12451.425,13204.864,12870.945 -->
| serde_json | array | decode | 4022 | 20000 | 12954.9 | 12451.4–13467.9 | 288627000 |
<!-- samples | serde_json | array | encode | 6111.169,6287.820,6380.994,6409.059,6325.814,6356.915,6338.446 -->
| serde_json | array | encode | 4022 | 20000 | 6338.4 | 6111.2–6409.1 | 574225548 |
<!-- samples | sonic-rs | array | decode | 18547.513,18072.256,19596.390,18514.196,18665.358,19024.493,19680.237 -->
| sonic-rs | array | decode | 4022 | 20000 | 18665.4 | 18072.3–19680.2 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7057.310,6957.408,6904.785,6915.398,6774.402,6688.742,7044.253 -->
| sonic-rs | array | encode | 4022 | 20000 | 6915.4 | 6688.7–7057.3 | 574225548 |
<!-- samples | prost (binary) | array | decode | 2991.912,2979.291,2959.125,3219.942,3774.693,3340.424,4492.432 -->
| prost (binary) | array | decode | 1923 | 20000 | 3219.9 | 2959.1–4492.4 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7854.958,5758.431,5598.075,5668.638,5891.505,6363.044,5791.924 -->
| prost (binary) | array | encode | 1923 | 20000 | 5791.9 | 5598.1–7855.0 | 284551620 |
<!-- samples | serde_json | floats | decode | 5072.251,5029.108,5172.547,5324.327,5444.511,5350.694,5157.491 -->
| serde_json | floats | decode | 1581 | 2000 | 5172.5 | 5029.1–5444.5 | 3825000 |
<!-- samples | serde_json | floats | encode | 6423.343,6426.660,6298.993,6189.883,6233.586,6331.957,6498.726 -->
| serde_json | floats | encode | 1581 | 2000 | 6332.0 | 6189.9–6498.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5463.986,5436.037,5436.020,5418.114,5429.067,5464.123,5430.939 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5436.0 | 5418.1–5464.1 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10005.066,9954.368,9940.662,9951.249,10214.810,10357.651,10251.192 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10005.1 | 9940.7–10357.7 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 662.897,667.979,675.179,684.657,676.895,698.977,692.888 -->
| prost (binary) | floats | decode | 2051 | 2000 | 676.9 | 662.9–699.0 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 271.176,269.586,282.163,269.813,273.121,269.458,271.626 -->
| prost (binary) | floats | encode | 2051 | 2000 | 271.2 | 269.5–282.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 15091.258,14873.937,14797.862,15034.832,15528.824,15211.611,15137.561 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 15091.3 | 14797.9–15528.8 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 5992.482,6011.450,6162.938,6221.969,6026.188,5988.451,6009.557 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 6011.5 | 5988.5–6222.0 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 10437.546,10401.972,10435.996,10397.291,10371.713,10709.228,10497.099 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 10436.0 | 10371.7–10709.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 10623.824,10615.667,11498.897,11385.557,11010.222,11022.604,10876.487 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 11010.2 | 10615.7–11498.9 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 637.878,637.809,658.893,659.692,664.360,669.494,661.505 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 659.7 | 637.8–669.5 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 284.909,280.748,295.247,282.974,281.913,284.690,280.752 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 283.0 | 280.7–295.2 | 32664305 |
<!-- samples | serde_json | text-short | decode | 107.201,106.618,110.394,110.505,110.388,119.686,113.502 -->
| serde_json | text-short | decode | 97 | 200000 | 110.4 | 106.6–119.7 | 149907000 |
<!-- samples | serde_json | text-short | encode | 90.915,88.999,86.877,84.961,84.651,84.649,84.835 -->
| serde_json | text-short | encode | 97 | 200000 | 85.0 | 84.6–90.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 128.904,129.800,129.208,129.904,129.296,128.756,128.312 -->
| sonic-rs | text-short | decode | 97 | 200000 | 129.2 | 128.3–129.9 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 93.489,98.568,97.308,97.003,94.648,93.465,93.404 -->
| sonic-rs | text-short | encode | 97 | 200000 | 94.6 | 93.4–98.6 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 37.728,38.197,40.441,40.621,39.208,39.005,38.969 -->
| prost (binary) | text-short | decode | 70 | 200000 | 39.0 | 37.7–40.6 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 22.898,22.876,22.881,22.405,22.728,22.883,22.954 -->
| prost (binary) | text-short | encode | 70 | 200000 | 22.9 | 22.4–23.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2091.470,2188.640,2204.447,2201.820,2207.061,2121.702,2117.920 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2188.6 | 2091.5–2207.1 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 6802.449,6698.551,6691.399,6490.390,6579.635,6694.747,6498.404 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 6691.4 | 6490.4–6802.4 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1579.145,1578.862,1576.809,1576.210,1578.827,1582.109,1578.476 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1578.8 | 1576.2–1582.1 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 470.637,468.820,469.345,469.501,468.620,467.113,469.580 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 469.3 | 467.1–470.6 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 478.322,478.577,477.328,472.504,474.095,480.611,479.826 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 478.3 | 472.5–480.6 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 241.787,244.034,241.609,245.519,241.637,246.195,240.736 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 241.8 | 240.7–246.2 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1436.674,1503.286,1574.597,1585.966,1572.907,1582.090,1628.334 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1574.6 | 1436.7–1628.3 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 7987.829,8605.818,8185.307,7697.557,7103.525,6772.569,6596.602 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 7697.6 | 6596.6–8605.8 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1194.765,1192.579,1191.978,1193.868,1191.041,1194.619,1192.056 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1192.6 | 1191.0–1194.8 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 469.880,469.611,468.332,469.459,468.954,469.006,468.589 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 469.0 | 468.3–469.9 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 479.984,480.637,471.011,471.435,472.021,471.454,471.442 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 471.5 | 471.0–480.6 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 244.738,243.137,243.889,243.103,247.217,243.520,245.541 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 243.9 | 243.1–247.2 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 19086.994,21092.273,20000.784,19877.881,19152.150,19276.330,18843.499 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 19276.3 | 18843.5–21092.3 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 8948.974,8945.156,8947.480,8946.800,8945.675,8940.567,8941.262 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 8945.7 | 8940.6–8949.0 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 14271.548,14602.806,14816.508,14946.306,15695.807,15759.589,15173.156 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 14946.3 | 14271.5–15759.6 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 5800.065,5699.466,5581.868,5580.704,5578.530,5582.632,5583.490 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 5582.6 | 5578.5–5800.1 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 5297.975,5495.000,5501.382,5498.547,5490.649,5368.331,5285.728 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 5490.6 | 5285.7–5501.4 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 214.071,217.595,213.923,216.547,213.927,214.760,217.001 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 214.8 | 213.9–217.6 | 101649504 |
<!-- samples | serde_json | wide | decode | 549.806,526.268,527.701,523.660,525.347,523.759,522.500 -->
| serde_json | wide | decode | 135 | 40000 | 525.3 | 522.5–549.8 | 33720000 |
<!-- samples | serde_json | wide | encode | 296.509,297.025,296.779,296.488,288.505,288.318,285.726 -->
| serde_json | wide | encode | 135 | 40000 | 296.5 | 285.7–297.0 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 604.564,610.560,604.921,634.874,665.695,655.837,654.906 -->
| sonic-rs | wide | decode | 135 | 40000 | 634.9 | 604.6–665.7 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 305.881,305.981,324.145,314.056,310.740,300.648,296.634 -->
| sonic-rs | wide | encode | 135 | 40000 | 306.0 | 296.6–324.1 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 99.319,99.654,98.854,99.866,99.033,99.955,98.782 -->
| prost (binary) | wide | decode | 31 | 40000 | 99.3 | 98.8–100.0 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 93.559,93.103,92.824,93.017,93.011,93.348,92.878 -->
| prost (binary) | wide | encode | 31 | 40000 | 93.0 | 92.8–93.6 | 19595809 |
