| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 157.232,151.692,150.676,148.366,146.578,148.413,156.223 -->
| serde_json | plain | decode | 38 | 200000 | 150.7 | 146.6–157.2 | 67248000 |
<!-- samples | serde_json | plain | encode | 69.778,67.623,65.337,66.678,63.839,69.279,68.582 -->
| serde_json | plain | encode | 38 | 200000 | 67.6 | 63.8–69.8 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 157.924,160.893,155.620,156.275,154.772,155.108,155.420 -->
| sonic-rs | plain | decode | 38 | 200000 | 155.6 | 154.8–160.9 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 64.672,64.869,69.872,65.875,67.634,67.140,65.270 -->
| sonic-rs | plain | encode | 38 | 200000 | 65.9 | 64.7–69.9 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 55.238,52.660,53.330,56.269,55.532,55.157,55.946 -->
| prost (binary) | plain | decode | 11 | 200000 | 55.2 | 52.7–56.3 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 37.008,39.119,36.980,36.577,38.458,39.447,36.484 -->
| prost (binary) | plain | encode | 11 | 200000 | 37.0 | 36.5–39.4 | 92719942 |
<!-- samples | serde_json | escaped | decode | 287.469,286.152,288.671,289.223,294.347,289.266,293.206 -->
| serde_json | escaped | decode | 62 | 200000 | 289.2 | 286.2–294.3 | 85461000 |
<!-- samples | serde_json | escaped | encode | 90.165,91.139,90.228,88.911,86.569,90.698,93.142 -->
| serde_json | escaped | encode | 54 | 200000 | 90.2 | 86.6–93.1 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 295.296,298.241,301.477,299.920,295.692,296.114,297.131 -->
| sonic-rs | escaped | decode | 62 | 200000 | 297.1 | 295.3–301.5 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 142.169,138.439,140.743,138.794,139.082,137.560,145.070 -->
| sonic-rs | escaped | encode | 54 | 200000 | 139.1 | 137.6–145.1 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 71.145,69.583,69.924,68.555,72.050,68.843,68.461 -->
| prost (binary) | escaped | decode | 24 | 200000 | 69.6 | 68.5–72.0 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 34.228,33.780,33.988,33.139,35.401,34.068,33.407 -->
| prost (binary) | escaped | encode | 24 | 200000 | 34.0 | 33.1–35.4 | 181133323 |
<!-- samples | serde_json | array | decode | 14099.707,13893.243,13890.905,13878.946,14063.248,14053.070,14076.558 -->
| serde_json | array | decode | 4022 | 20000 | 14053.1 | 13878.9–14099.7 | 288627000 |
<!-- samples | serde_json | array | encode | 7595.476,7567.950,7564.786,7468.177,7537.692,7745.236,7504.782 -->
| serde_json | array | encode | 4022 | 20000 | 7564.8 | 7468.2–7745.2 | 574225548 |
<!-- samples | sonic-rs | array | decode | 16211.758,16034.458,16067.359,16168.754,16224.106,16181.925,15844.052 -->
| sonic-rs | array | decode | 4022 | 20000 | 16168.8 | 15844.1–16224.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7695.880,7761.190,7630.695,7876.640,7754.972,7743.448,7777.406 -->
| sonic-rs | array | encode | 4022 | 20000 | 7755.0 | 7630.7–7876.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4297.409,4329.805,4437.214,4494.410,4503.738,4498.914,4438.559 -->
| prost (binary) | array | decode | 1923 | 20000 | 4438.6 | 4297.4–4503.7 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6703.598,6701.316,6846.079,6756.882,6712.410,6667.410,6774.126 -->
| prost (binary) | array | encode | 1923 | 20000 | 6712.4 | 6667.4–6846.1 | 284551620 |
<!-- samples | serde_json | floats | decode | 6739.859,6712.837,6718.576,6779.051,6851.268,6879.935,6913.163 -->
| serde_json | floats | decode | 1581 | 2000 | 6779.1 | 6712.8–6913.2 | 3825000 |
<!-- samples | serde_json | floats | encode | 9205.479,9406.215,9622.106,9525.555,9405.075,9547.841,8915.755 -->
| serde_json | floats | encode | 1581 | 2000 | 9406.2 | 8915.8–9622.1 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 6887.735,6414.010,6585.825,6615.742,6768.823,6690.743,6825.389 -->
| sonic-rs | floats | decode | 1581 | 2000 | 6690.7 | 6414.0–6887.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 12024.172,11713.800,11835.711,11963.666,11733.679,11607.375,11547.381 -->
| sonic-rs | floats | encode | 1581 | 2000 | 11733.7 | 11547.4–12024.2 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 778.789,750.705,742.696,701.264,757.370,816.516,1097.695 -->
| prost (binary) | floats | decode | 2051 | 2000 | 757.4 | 701.3–1097.7 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 545.453,545.236,545.176,545.295,545.302,545.808,544.330 -->
| prost (binary) | floats | encode | 2051 | 2000 | 545.3 | 544.3–545.8 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 22155.217,21809.280,21582.919,21547.631,21068.216,21576.619,21210.660 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21576.6 | 21068.2–22155.2 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8837.766,8653.318,8559.664,8704.485,8896.555,8559.136,8751.818 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8704.5 | 8559.1–8896.6 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 15373.678,15279.135,15528.715,14973.272,15265.757,15713.177,15196.083 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15279.1 | 14973.3–15713.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9152.334,9076.351,9222.106,8966.083,8950.321,8909.988,9137.826 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9076.4 | 8910.0–9222.1 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 679.726,950.745,746.170,740.586,769.454,753.882,898.269 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 753.9 | 679.7–950.7 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 544.632,546.493,566.281,552.057,580.115,545.321,546.990 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 547.0 | 544.6–580.1 | 32664305 |
<!-- samples | serde_json | text-ascii | decode | 2210.611,2137.276,2047.329,2079.035,2062.912,2184.512,2098.584 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2098.6 | 2047.3–2210.6 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4551.465,4378.459,4358.355,4348.169,4468.260,4186.901,4338.702 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4358.4 | 4186.9–4551.5 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1003.670,978.865,983.828,1018.338,1062.372,1076.741,1006.784 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1006.8 | 978.9–1076.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 494.632,494.625,500.614,513.539,526.231,532.347,554.850 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 513.5 | 494.6–554.8 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 506.524,507.000,508.147,506.394,507.231,495.353,480.829 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 506.5 | 480.8–508.1 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 181.207,184.840,182.196,182.857,183.708,180.264,180.190 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 182.2 | 180.2–184.8 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 20835.201,21580.897,22503.111,22702.625,22445.187,21919.583,21416.625 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 21919.6 | 20835.2–22702.6 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 13447.036,13461.884,13378.903,13063.180,13266.415,13377.333,13441.901 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 13378.9 | 13063.2–13461.9 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 12740.511,12924.013,13031.103,13341.560,13185.525,12998.352,12584.434 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 12998.4 | 12584.4–13341.6 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8070.263,8043.216,8018.330,8123.446,7864.632,8170.420,7940.873 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8043.2 | 7864.6–8170.4 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 7977.997,7707.953,8263.413,8270.218,7435.264,7665.288,7378.160 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 7708.0 | 7378.2–8270.2 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 153.744,148.762,149.457,149.350,148.759,147.277,150.169 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 149.3 | 147.3–153.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 1444.821,1427.714,1453.843,1479.170,1419.015,1447.581,1435.240 -->
| serde_json | wide | decode | 135 | 40000 | 1444.8 | 1419.0–1479.2 | 33720000 |
<!-- samples | serde_json | wide | encode | 396.589,406.597,392.199,391.641,410.625,398.652,396.391 -->
| serde_json | wide | encode | 135 | 40000 | 396.6 | 391.6–410.6 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 958.308,925.253,895.177,889.015,881.939,877.903,880.836 -->
| sonic-rs | wide | decode | 135 | 40000 | 889.0 | 877.9–958.3 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 378.708,385.542,370.542,381.775,379.135,352.748,384.570 -->
| sonic-rs | wide | encode | 135 | 40000 | 379.1 | 352.7–385.5 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 127.882,123.576,131.384,124.275,125.583,130.844,130.656 -->
| prost (binary) | wide | decode | 31 | 40000 | 127.9 | 123.6–131.4 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 143.994,141.810,138.865,154.639,162.891,128.783,151.315 -->
| prost (binary) | wide | encode | 31 | 40000 | 144.0 | 128.8–162.9 | 19595809 |
