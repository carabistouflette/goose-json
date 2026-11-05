| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 115.813,108.837,110.310,114.068,107.265,103.029,98.427 -->
| serde_json | plain | decode | 38 | 200000 | 108.8 | 98.4–115.8 | 67248000 |
<!-- samples | serde_json | plain | encode | 53.751,59.758,63.191,63.423,63.655,66.335,71.326 -->
| serde_json | plain | encode | 38 | 200000 | 63.4 | 53.8–71.3 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 250.180,215.539,198.658,181.064,175.578,176.812,190.592 -->
| sonic-rs | plain | decode | 38 | 200000 | 190.6 | 175.6–250.2 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 56.982,57.521,55.517,56.661,57.818,56.774,55.894 -->
| sonic-rs | plain | encode | 38 | 200000 | 56.8 | 55.5–57.8 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 41.472,41.425,40.742,39.805,39.706,42.634,43.665 -->
| prost (binary) | plain | decode | 11 | 200000 | 41.4 | 39.7–43.7 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 24.046,23.504,24.191,24.262,24.853,24.715,24.442 -->
| prost (binary) | plain | encode | 11 | 200000 | 24.3 | 23.5–24.9 | 92719942 |
<!-- samples | serde_json | escaped | decode | 233.288,253.314,222.468,209.807,210.561,233.817,222.823 -->
| serde_json | escaped | decode | 62 | 200000 | 222.8 | 209.8–253.3 | 85461000 |
<!-- samples | serde_json | escaped | encode | 68.360,68.256,67.702,66.246,67.333,67.121,64.979 -->
| serde_json | escaped | encode | 54 | 200000 | 67.3 | 65.0–68.4 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 316.217,307.044,322.304,315.235,321.640,374.638,404.820 -->
| sonic-rs | escaped | decode | 62 | 200000 | 321.6 | 307.0–404.8 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 161.972,143.308,125.700,118.985,120.589,118.541,116.407 -->
| sonic-rs | escaped | encode | 54 | 200000 | 120.6 | 116.4–162.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 48.843,48.315,47.083,47.182,47.030,46.892,47.012 -->
| prost (binary) | escaped | decode | 24 | 200000 | 47.1 | 46.9–48.8 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 22.149,21.881,22.309,24.005,26.014,26.115,24.870 -->
| prost (binary) | escaped | encode | 24 | 200000 | 24.0 | 21.9–26.1 | 181133323 |
<!-- samples | serde_json | array | decode | 12939.841,13501.495,17193.219,16400.215,16994.064,16602.368,16475.082 -->
| serde_json | array | decode | 4022 | 20000 | 16475.1 | 12939.8–17193.2 | 288627000 |
<!-- samples | serde_json | array | encode | 7539.579,7925.879,7114.678,6509.293,6511.517,6532.133,8893.939 -->
| serde_json | array | encode | 4022 | 20000 | 7114.7 | 6509.3–8893.9 | 574225548 |
<!-- samples | sonic-rs | array | decode | 27271.634,22107.787,20656.748,26112.250,24847.739,23778.803,24515.543 -->
| sonic-rs | array | decode | 4022 | 20000 | 24515.5 | 20656.7–27271.6 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8054.036,8870.283,9739.886,8605.293,9900.450,10495.970,8595.485 -->
| sonic-rs | array | encode | 4022 | 20000 | 8870.3 | 8054.0–10496.0 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4763.633,4799.332,4718.747,5741.577,5900.978,5465.878,5114.581 -->
| prost (binary) | array | decode | 1923 | 20000 | 5114.6 | 4718.7–5901.0 | 288627000 |
<!-- samples | prost (binary) | array | encode | 8267.575,10969.140,6801.369,6827.548,6615.309,7853.882,6790.819 -->
| prost (binary) | array | encode | 1923 | 20000 | 6827.5 | 6615.3–10969.1 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 15858.860,13512.934,13713.267,14223.033,13850.795,14890.035,16488.727 -->
| serde_json | array-signed | decode | 4538 | 20000 | 14223.0 | 13512.9–16488.7 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 6605.938,5932.602,6087.184,6075.728,6123.983,6107.635,5736.998 -->
| serde_json | array-signed | encode | 4537 | 20000 | 6087.2 | 5737.0–6605.9 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 18963.565,18087.824,18157.461,17638.651,17590.469,18623.538,17253.907 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 18087.8 | 17253.9–18963.6 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 6110.373,6786.704,6400.342,6071.178,6666.651,8041.840,9503.243 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6666.7 | 6071.2–9503.2 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 6401.324,5925.480,5537.266,5500.071,5517.035,7553.585,6371.878 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 5925.5 | 5500.1–7553.6 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 15883.381,17035.297,21258.885,18062.549,20697.993,16250.199,14406.908 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 17035.3 | 14406.9–21258.9 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 32412.212,30062.094,33971.401,31502.202,34414.808,32236.694,36037.208 -->
| serde_json | array-wide | decode | 19771 | 20000 | 32412.2 | 30062.1–36037.2 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 12700.052,12304.391,12093.501,13628.313,14809.060,12463.253,11851.140 -->
| serde_json | array-wide | encode | 19770 | 20000 | 12463.3 | 11851.1–14809.1 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 23306.141,27720.743,32483.201,23583.440,24695.454,26651.158,31583.092 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 26651.2 | 23306.1–32483.2 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 18250.836,20265.542,17206.649,16702.486,15163.427,15497.804,14663.964 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 16702.5 | 14664.0–20265.5 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 6995.856,7674.573,7789.786,8671.199,8793.512,8325.856,9043.283 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 8325.9 | 6995.9–9043.3 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 28287.389,25286.219,26027.046,27678.747,26757.836,30546.126,29848.079 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 27678.7 | 25286.2–30546.1 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 3228.546,2885.361,2913.544,3819.668,3585.920,4108.434,4214.977 -->
| serde_json | mixed | decode | 1187 | 20000 | 3585.9 | 2885.4–4215.0 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2202.785,2099.127,1807.863,1978.419,2141.224,1962.595,1841.568 -->
| serde_json | mixed | encode | 1186 | 20000 | 1978.4 | 1807.9–2202.8 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 2893.434,2803.822,3217.180,3050.613,2796.404,2922.953,4225.878 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 2923.0 | 2796.4–4225.9 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3030.661,3207.377,3287.929,3069.225,2509.681,2443.959,2979.901 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3030.7 | 2444.0–3287.9 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1277.853,1374.567,1383.942,1397.528,1452.609,1487.776,1419.830 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1397.5 | 1277.9–1487.8 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 666.375,649.457,703.553,660.866,716.122,693.909,664.773 -->
| prost (binary) | mixed | encode | 954 | 20000 | 666.4 | 649.5–716.1 | 149207284 |
<!-- samples | serde_json | floats | decode | 7859.160,8210.628,8013.525,7746.320,7671.543,7705.093,7690.581 -->
| serde_json | floats | decode | 1581 | 2000 | 7746.3 | 7671.5–8210.6 | 3825000 |
<!-- samples | serde_json | floats | encode | 10192.681,9719.710,9494.682,9573.219,9583.742,9541.678,9286.710 -->
| serde_json | floats | encode | 1581 | 2000 | 9573.2 | 9286.7–10192.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 8259.710,8412.808,8392.988,8253.576,8325.284,8275.255,8307.283 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8307.3 | 8253.6–8412.8 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 13903.023,13032.499,12803.993,13545.579,13175.310,14424.213,14444.596 -->
| sonic-rs | floats | encode | 1581 | 2000 | 13545.6 | 12804.0–14444.6 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 814.628,818.650,852.572,866.321,886.390,919.347,858.879 -->
| prost (binary) | floats | decode | 2051 | 2000 | 858.9 | 814.6–919.3 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 409.029,413.974,411.847,410.659,416.481,429.660,423.180 -->
| prost (binary) | floats | encode | 2051 | 2000 | 414.0 | 409.0–429.7 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 21190.423,22220.698,22868.090,22460.010,20852.869,19302.712,19907.997 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21190.4 | 19302.7–22868.1 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8987.156,8863.265,8636.269,8273.177,8017.378,7473.825,8103.926 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8273.2 | 7473.8–8987.2 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 12740.885,12185.449,12343.013,14738.095,15731.457,15935.148,16302.372 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 14738.1 | 12185.4–16302.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 14035.306,12524.535,12308.971,12858.603,14848.739,16101.497,15756.943 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 14035.3 | 12309.0–16101.5 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 675.960,680.227,676.088,662.895,646.833,644.811,643.713 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 662.9 | 643.7–680.2 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 361.009,356.757,350.522,346.688,360.223,338.338,330.916 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 350.5 | 330.9–361.0 | 32664305 |
<!-- samples | serde_json | text-short | decode | 132.460,162.312,164.870,152.245,138.650,141.672,147.701 -->
| serde_json | text-short | decode | 97 | 200000 | 147.7 | 132.5–164.9 | 149907000 |
<!-- samples | serde_json | text-short | encode | 101.798,102.605,100.103,106.616,107.116,107.877,99.253 -->
| serde_json | text-short | encode | 97 | 200000 | 102.6 | 99.3–107.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 208.635,210.337,212.596,214.399,216.961,220.926,225.959 -->
| sonic-rs | text-short | decode | 97 | 200000 | 214.4 | 208.6–226.0 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 156.006,155.376,156.240,156.720,142.539,140.995,144.842 -->
| sonic-rs | text-short | encode | 97 | 200000 | 155.4 | 141.0–156.7 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 56.731,52.709,49.639,51.336,60.363,64.185,64.294 -->
| prost (binary) | text-short | decode | 70 | 200000 | 56.7 | 49.6–64.3 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 36.149,36.361,36.037,35.993,35.583,33.660,33.544 -->
| prost (binary) | text-short | encode | 70 | 200000 | 36.0 | 33.5–36.4 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2889.449,2772.930,2856.289,2832.608,2748.624,2618.218,2592.428 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2772.9 | 2592.4–2889.4 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4999.445,5065.775,5264.695,5634.039,5661.965,5658.882,5471.391 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5471.4 | 4999.4–5662.0 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2525.017,2544.302,2520.134,2500.702,2465.994,2312.552,2230.701 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2500.7 | 2230.7–2544.3 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 618.101,611.765,592.095,588.100,589.485,590.331,596.278 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 592.1 | 588.1–618.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 612.221,636.807,658.892,646.270,670.895,665.573,668.682 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 658.9 | 612.2–670.9 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 335.369,333.476,331.612,329.741,344.726,343.534,340.572 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 335.4 | 329.7–344.7 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1909.009,1881.873,1813.001,1838.668,1847.709,1860.439,1911.721 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1860.4 | 1813.0–1911.7 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4724.387,4959.065,5177.989,5163.608,5175.760,5167.510,5153.744 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5163.6 | 4724.4–5178.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1804.909,1756.714,1808.788,1799.713,1709.034,1717.516,1671.882 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1756.7 | 1671.9–1808.8 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 624.067,627.214,623.742,603.401,594.755,594.524,597.173 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 603.4 | 594.5–627.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 621.668,606.109,590.620,592.726,591.769,597.686,590.360 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 592.7 | 590.4–621.7 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 302.450,292.704,295.033,292.696,296.467,295.714,292.705 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 295.0 | 292.7–302.4 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 25196.031,28934.436,24555.380,22731.311,24719.163,27776.435,30114.969 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 25196.0 | 22731.3–30115.0 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 7932.136,8020.712,9338.460,9526.608,8650.257,8342.038,7662.215 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 8342.0 | 7662.2–9526.6 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 19636.958,17857.083,16551.197,19368.706,21622.256,19092.205,16301.897 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 19092.2 | 16301.9–21622.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 5778.281,5835.135,5819.240,5911.065,5825.169,5848.047,6044.428 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 5835.1 | 5778.3–6044.4 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 6297.650,6358.378,6919.808,7460.374,7249.959,6866.123,6776.274 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 6866.1 | 6297.7–7460.4 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 255.761,254.031,256.922,253.281,265.317,264.967,267.644 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 256.9 | 253.3–267.6 | 101649504 |
<!-- samples | serde_json | wide | decode | 758.458,855.732,812.223,864.392,791.234,858.505,852.747 -->
| serde_json | wide | decode | 135 | 40000 | 852.7 | 758.5–864.4 | 33720000 |
<!-- samples | serde_json | wide | encode | 440.883,412.393,422.487,431.388,439.353,428.448,431.483 -->
| serde_json | wide | encode | 135 | 40000 | 431.4 | 412.4–440.9 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 989.796,1039.245,1043.024,1024.806,1055.710,1033.694,1062.341 -->
| sonic-rs | wide | decode | 135 | 40000 | 1039.2 | 989.8–1062.3 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 475.596,486.170,485.731,468.943,471.394,477.852,471.903 -->
| sonic-rs | wide | encode | 135 | 40000 | 475.6 | 468.9–486.2 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 153.546,146.878,157.470,154.664,156.666,154.865,156.450 -->
| prost (binary) | wide | decode | 31 | 40000 | 154.9 | 146.9–157.5 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 149.983,149.130,142.033,149.455,148.689,149.968,150.148 -->
| prost (binary) | wide | encode | 31 | 40000 | 149.5 | 142.0–150.1 | 19595809 |
