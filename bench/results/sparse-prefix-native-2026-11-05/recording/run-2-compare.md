| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 159.252,156.885,156.060,158.388,149.666,155.734,155.325 -->
| serde_json | plain | decode | 38 | 200000 | 156.1 | 149.7–159.3 | 67248000 |
<!-- samples | serde_json | plain | encode | 123.393,194.738,83.151,80.725,78.818,78.073,78.884 -->
| serde_json | plain | encode | 38 | 200000 | 80.7 | 78.1–194.7 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 295.570,336.951,288.693,294.493,304.307,286.415,290.549 -->
| sonic-rs | plain | decode | 38 | 200000 | 294.5 | 286.4–337.0 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 84.461,84.124,84.449,84.173,84.707,84.288,84.733 -->
| sonic-rs | plain | encode | 38 | 200000 | 84.4 | 84.1–84.7 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 83.358,175.028,80.394,71.995,125.584,69.966,68.011 -->
| prost (binary) | plain | decode | 11 | 200000 | 80.4 | 68.0–175.0 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 34.851,38.615,35.121,36.560,36.832,60.072,35.687 -->
| prost (binary) | plain | encode | 11 | 200000 | 36.6 | 34.9–60.1 | 92719942 |
<!-- samples | serde_json | escaped | decode | 344.961,343.373,365.676,366.275,342.536,363.112,360.513 -->
| serde_json | escaped | decode | 62 | 200000 | 360.5 | 342.5–366.3 | 85461000 |
<!-- samples | serde_json | escaped | encode | 99.919,100.025,102.264,97.957,93.031,84.756,78.213 -->
| serde_json | escaped | encode | 54 | 200000 | 98.0 | 78.2–102.3 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 388.141,413.490,490.656,495.172,471.218,473.916,463.365 -->
| sonic-rs | escaped | decode | 62 | 200000 | 471.2 | 388.1–495.2 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 168.817,153.207,134.810,131.915,130.798,145.394,162.089 -->
| sonic-rs | escaped | encode | 54 | 200000 | 145.4 | 130.8–168.8 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 70.190,73.811,74.748,71.490,69.529,67.802,66.643 -->
| prost (binary) | escaped | decode | 24 | 200000 | 70.2 | 66.6–74.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 31.925,32.971,32.991,31.399,29.996,28.613,27.530 -->
| prost (binary) | escaped | encode | 24 | 200000 | 31.4 | 27.5–33.0 | 181133323 |
<!-- samples | serde_json | array | decode | 20450.297,28998.725,20365.867,19137.176,19695.960,16188.589,19673.829 -->
| serde_json | array | decode | 4022 | 20000 | 19696.0 | 16188.6–28998.7 | 288627000 |
<!-- samples | serde_json | array | encode | 9437.980,10106.953,10676.915,8987.399,9119.773,9650.350,9760.737 -->
| serde_json | array | encode | 4022 | 20000 | 9650.4 | 8987.4–10676.9 | 574225548 |
<!-- samples | sonic-rs | array | decode | 24096.898,24435.111,24107.618,25959.518,27571.046,27579.019,27959.900 -->
| sonic-rs | array | decode | 4022 | 20000 | 25959.5 | 24096.9–27959.9 | 288627000 |
<!-- samples | sonic-rs | array | encode | 10166.314,10287.042,9873.163,7645.203,7562.074,7421.284,6982.275 -->
| sonic-rs | array | encode | 4022 | 20000 | 7645.2 | 6982.3–10287.0 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4049.863,3743.727,3797.787,3876.634,3847.126,3821.277,3739.815 -->
| prost (binary) | array | decode | 1923 | 20000 | 3821.3 | 3739.8–4049.9 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6149.808,6278.041,8000.559,8478.624,6398.796,6427.890,7315.973 -->
| prost (binary) | array | encode | 1923 | 20000 | 6427.9 | 6149.8–8478.6 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 17199.356,13598.896,14674.795,27286.203,20153.903,19063.635,21768.957 -->
| serde_json | array-signed | decode | 4538 | 20000 | 19063.6 | 13598.9–27286.2 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 9077.494,9221.742,9412.715,9050.513,9407.027,9338.644,9497.373 -->
| serde_json | array-signed | encode | 4537 | 20000 | 9338.6 | 9050.5–9497.4 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 27199.986,23165.703,26769.054,29751.628,44127.451,26889.726,25201.984 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 26889.7 | 23165.7–44127.5 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 6567.248,6186.037,7177.883,6851.388,6405.796,6739.068,6532.251 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6567.2 | 6186.0–7177.9 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 6290.924,7849.694,8049.436,6546.719,6812.954,7586.690,7487.175 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 7487.2 | 6290.9–8049.4 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 20120.698,19425.826,17326.606,18983.889,18507.675,17865.344,19484.083 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 18983.9 | 17326.6–20120.7 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 36529.448,40278.736,34228.294,39603.705,43991.509,41899.833,34507.308 -->
| serde_json | array-wide | decode | 19771 | 20000 | 39603.7 | 34228.3–43991.5 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 12735.371,11736.971,17499.475,17312.605,15935.614,16761.202,17586.548 -->
| serde_json | array-wide | encode | 19770 | 20000 | 16761.2 | 11737.0–17586.5 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 34503.970,35104.611,33967.586,33943.083,32377.806,30669.730,29349.472 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 33943.1 | 29349.5–35104.6 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 15761.490,18181.899,14217.509,15664.778,14838.684,15595.065,62365.891 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 15664.8 | 14217.5–62365.9 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 50468.271,31651.435,10149.733,8823.817,55066.632,59627.516,18483.368 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 31651.4 | 8823.8–59627.5 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 34940.222,30532.964,25260.689,28771.994,29050.572,28665.488,25092.019 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 28772.0 | 25092.0–34940.2 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 3490.723,3129.309,2999.886,3068.893,2894.702,3049.854,3040.542 -->
| serde_json | mixed | decode | 1187 | 20000 | 3049.9 | 2894.7–3490.7 | 227997000 |
<!-- samples | serde_json | mixed | encode | 1672.113,1616.342,1606.334,1602.732,1683.485,1820.436,1699.069 -->
| serde_json | mixed | encode | 1186 | 20000 | 1672.1 | 1602.7–1820.4 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 3388.049,4380.757,4268.624,4302.086,3433.093,11488.706,27481.773 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 4302.1 | 3388.0–27481.8 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 22335.065,20925.000,14043.840,9424.445,7708.251,7249.637,4012.689 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 9424.4 | 4012.7–22335.1 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1532.306,1521.521,1487.777,1480.824,1481.643,1499.561,1475.607 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1487.8 | 1475.6–1532.3 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 660.933,640.990,658.377,639.803,656.016,664.728,659.740 -->
| prost (binary) | mixed | encode | 954 | 20000 | 658.4 | 639.8–664.7 | 149207284 |
<!-- samples | serde_json | floats | decode | 7861.881,7822.819,7847.787,7838.529,7903.859,7906.318,7844.278 -->
| serde_json | floats | decode | 1581 | 2000 | 7847.8 | 7822.8–7906.3 | 3825000 |
<!-- samples | serde_json | floats | encode | 10498.242,10620.514,10622.883,10646.101,10633.082,10637.047,10617.980 -->
| serde_json | floats | encode | 1581 | 2000 | 10622.9 | 10498.2–10646.1 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 9286.677,9640.142,10054.644,10100.351,10513.591,10116.836,10743.971 -->
| sonic-rs | floats | decode | 1581 | 2000 | 10100.4 | 9286.7–10744.0 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 19689.144,37700.876,17534.132,16547.121,16153.870,16034.808,17069.076 -->
| sonic-rs | floats | encode | 1581 | 2000 | 17069.1 | 16034.8–37700.9 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 899.872,908.463,907.384,892.426,916.625,907.280,974.386 -->
| prost (binary) | floats | decode | 2051 | 2000 | 907.4 | 892.4–974.4 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 502.409,498.154,495.876,494.947,461.339,466.678,469.283 -->
| prost (binary) | floats | encode | 2051 | 2000 | 494.9 | 461.3–502.4 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 23514.624,21819.290,21867.561,21393.465,21334.415,20989.456,18865.847 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21393.5 | 18865.8–23514.6 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8698.251,8883.599,8800.660,8916.595,9588.163,9688.939,9719.845 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8916.6 | 8698.3–9719.8 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16758.757,17067.940,17712.172,16820.904,15769.220,15788.924,15443.904 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16758.8 | 15443.9–17712.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 16231.337,16197.086,16134.213,14991.090,12641.396,11513.430,11067.691 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 14991.1 | 11067.7–16231.3 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 528.216,527.441,516.091,511.149,509.643,509.796,510.240 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 511.1 | 509.6–528.2 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 269.940,268.820,268.029,270.222,268.003,270.696,266.604 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 268.8 | 266.6–270.7 | 32664305 |
<!-- samples | serde_json | text-short | decode | 126.362,152.391,147.796,151.417,160.643,160.891,162.231 -->
| serde_json | text-short | decode | 97 | 200000 | 152.4 | 126.4–162.2 | 149907000 |
<!-- samples | serde_json | text-short | encode | 108.580,100.873,89.324,91.603,97.051,96.158,106.577 -->
| serde_json | text-short | encode | 97 | 200000 | 97.1 | 89.3–108.6 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 215.714,216.290,213.869,201.570,216.706,180.426,156.406 -->
| sonic-rs | text-short | decode | 97 | 200000 | 213.9 | 156.4–216.7 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 105.561,103.526,101.406,108.060,114.995,117.098,129.345 -->
| sonic-rs | text-short | encode | 97 | 200000 | 108.1 | 101.4–129.3 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 59.909,58.508,55.640,57.211,57.206,57.887,60.805 -->
| prost (binary) | text-short | decode | 70 | 200000 | 57.9 | 55.6–60.8 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 32.839,31.224,30.281,29.281,28.037,27.652,28.030 -->
| prost (binary) | text-short | encode | 70 | 200000 | 29.3 | 27.7–32.8 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2776.116,3071.145,3147.254,3136.220,3132.166,3143.852,3136.558 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3136.2 | 2776.1–3147.3 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5741.931,5608.298,5682.853,5583.876,5354.149,5348.619,5420.000 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5583.9 | 5348.6–5741.9 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2726.531,2826.376,2868.477,2833.832,2692.134,2740.059,2715.620 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2740.1 | 2692.1–2868.5 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 721.931,718.294,719.855,731.104,725.649,727.787,723.300 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 723.3 | 718.3–731.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 762.030,752.824,767.061,755.409,769.628,751.366,764.684 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 762.0 | 751.4–769.6 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 377.921,379.288,378.809,401.036,399.349,400.503,398.366 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 398.4 | 377.9–401.0 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2402.936,2378.934,2367.022,2362.427,2317.526,2213.680,2223.191 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2362.4 | 2213.7–2402.9 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5230.695,5295.328,5567.279,5685.958,5533.161,5577.528,5610.335 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5567.3 | 5230.7–5686.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1934.959,1928.226,1936.027,1928.409,1926.803,1917.091,1938.734 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1928.4 | 1917.1–1938.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 745.636,761.602,758.362,767.153,758.041,764.371,795.154 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 761.6 | 745.6–795.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 845.059,838.077,836.787,840.582,841.778,879.549,901.601 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 841.8 | 836.8–901.6 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 465.096,466.875,465.086,458.149,460.594,461.500,463.228 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 463.2 | 458.1–466.9 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 35852.707,32282.471,28660.620,29865.901,27931.304,24982.355,26304.542 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 28660.6 | 24982.4–35852.7 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 9676.640,10731.418,10498.215,10959.198,10708.190,10570.726,10978.843 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 10708.2 | 9676.6–10978.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 23880.739,18983.656,16780.447,18472.102,22574.575,22862.043,20164.167 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 20164.2 | 16780.4–23880.7 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 7643.654,8446.758,8668.829,8471.575,8503.007,8495.408,8456.318 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8471.6 | 7643.7–8668.8 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8903.942,9085.435,9525.074,9441.983,9618.979,9429.069,9552.836 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 9442.0 | 8903.9–9619.0 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 342.829,339.500,335.276,341.015,341.935,335.036,343.279 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 341.0 | 335.0–343.3 | 101649504 |
<!-- samples | serde_json | wide | decode | 896.349,858.518,867.859,878.487,852.114,760.115,830.010 -->
| serde_json | wide | decode | 135 | 40000 | 858.5 | 760.1–896.3 | 33720000 |
<!-- samples | serde_json | wide | encode | 458.289,456.191,462.238,490.068,481.395,482.775,482.442 -->
| serde_json | wide | encode | 135 | 40000 | 481.4 | 456.2–490.1 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1103.811,1097.599,1070.936,1012.030,1009.996,1012.075,1009.710 -->
| sonic-rs | wide | decode | 135 | 40000 | 1012.1 | 1009.7–1103.8 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 440.069,440.665,458.263,446.452,451.415,469.420,467.347 -->
| sonic-rs | wide | encode | 135 | 40000 | 451.4 | 440.1–469.4 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 155.053,148.338,145.364,147.825,146.880,149.087,148.077 -->
| prost (binary) | wide | decode | 31 | 40000 | 148.1 | 145.4–155.1 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 139.311,140.060,140.001,139.976,139.673,139.070,139.065 -->
| prost (binary) | wide | encode | 31 | 40000 | 139.7 | 139.1–140.1 | 19595809 |
