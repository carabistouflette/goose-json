| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 109.286,117.388,111.423,107.891,102.619,102.022,106.276 -->
| serde_json | plain | decode | 38 | 200000 | 107.9 | 102.0–117.4 | 67248000 |
<!-- samples | serde_json | plain | encode | 52.576,51.398,51.513,51.024,49.616,52.102,59.784 -->
| serde_json | plain | encode | 38 | 200000 | 51.5 | 49.6–59.8 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 196.410,181.024,173.642,173.100,182.062,178.644,177.025 -->
| sonic-rs | plain | decode | 38 | 200000 | 178.6 | 173.1–196.4 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 53.158,52.357,52.240,54.953,53.150,53.235,53.997 -->
| sonic-rs | plain | encode | 38 | 200000 | 53.2 | 52.2–55.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 43.202,44.871,47.337,50.244,51.487,54.229,50.029 -->
| prost (binary) | plain | decode | 11 | 200000 | 50.0 | 43.2–54.2 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 27.160,25.606,25.821,24.730,24.630,23.745,24.100 -->
| prost (binary) | plain | encode | 11 | 200000 | 24.7 | 23.7–27.2 | 92719942 |
<!-- samples | serde_json | escaped | decode | 220.457,211.126,234.722,227.071,210.714,209.948,209.932 -->
| serde_json | escaped | decode | 62 | 200000 | 211.1 | 209.9–234.7 | 85461000 |
<!-- samples | serde_json | escaped | encode | 69.605,74.938,82.482,88.133,86.013,85.165,93.991 -->
| serde_json | escaped | encode | 54 | 200000 | 85.2 | 69.6–94.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 375.396,353.058,329.532,298.610,312.108,298.413,293.261 -->
| sonic-rs | escaped | decode | 62 | 200000 | 312.1 | 293.3–375.4 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 105.853,106.803,113.264,115.129,115.057,113.171,109.797 -->
| sonic-rs | escaped | encode | 54 | 200000 | 113.2 | 105.9–115.1 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 46.740,46.165,46.218,47.681,46.420,46.134,46.495 -->
| prost (binary) | escaped | decode | 24 | 200000 | 46.4 | 46.1–47.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 21.941,22.378,22.749,22.715,22.098,22.017,22.212 -->
| prost (binary) | escaped | encode | 24 | 200000 | 22.2 | 21.9–22.7 | 181133323 |
<!-- samples | serde_json | array | decode | 13858.734,14122.433,13389.838,14172.956,12653.664,12750.264,13228.842 -->
| serde_json | array | decode | 4022 | 20000 | 13389.8 | 12653.7–14173.0 | 288627000 |
<!-- samples | serde_json | array | encode | 6592.855,6061.899,6273.338,6147.875,6147.349,6138.577,6063.229 -->
| serde_json | array | encode | 4022 | 20000 | 6147.3 | 6061.9–6592.9 | 574225548 |
<!-- samples | sonic-rs | array | decode | 18125.842,18822.101,18495.301,19111.078,18234.872,18478.572,17557.412 -->
| sonic-rs | array | decode | 4022 | 20000 | 18478.6 | 17557.4–19111.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8497.878,8111.540,7046.686,7353.807,6719.432,6600.477,6804.678 -->
| sonic-rs | array | encode | 4022 | 20000 | 7046.7 | 6600.5–8497.9 | 574225548 |
<!-- samples | prost (binary) | array | decode | 3128.190,3007.370,2939.287,3045.168,2985.920,2876.431,2826.919 -->
| prost (binary) | array | decode | 1923 | 20000 | 2985.9 | 2826.9–3128.2 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6958.892,6983.170,6417.351,6432.296,6635.654,6490.667,5816.330 -->
| prost (binary) | array | encode | 1923 | 20000 | 6490.7 | 5816.3–6983.2 | 284551620 |
<!-- samples | serde_json | floats | decode | 4718.989,4712.569,4711.471,4819.809,4895.220,4945.781,4824.245 -->
| serde_json | floats | decode | 1581 | 2000 | 4819.8 | 4711.5–4945.8 | 3825000 |
<!-- samples | serde_json | floats | encode | 5957.721,6071.217,6199.004,6246.707,6276.256,6249.400,6095.945 -->
| serde_json | floats | encode | 1581 | 2000 | 6199.0 | 5957.7–6276.3 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5187.155,5198.269,5209.128,5198.569,5480.861,5611.972,5579.213 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5209.1 | 5187.2–5612.0 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 9876.235,9837.448,9874.484,9911.223,9861.595,9864.939,9869.517 -->
| sonic-rs | floats | encode | 1581 | 2000 | 9869.5 | 9837.4–9911.2 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 476.245,491.971,474.603,475.459,474.592,491.647,477.986 -->
| prost (binary) | floats | decode | 2051 | 2000 | 476.2 | 474.6–492.0 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 277.219,274.508,276.776,276.725,282.538,276.798,274.450 -->
| prost (binary) | floats | encode | 2051 | 2000 | 276.8 | 274.4–282.5 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 14383.349,15724.444,15024.313,14430.325,15058.694,14973.674,14498.117 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 14973.7 | 14383.3–15724.4 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 6401.788,7294.131,7893.631,8892.155,8601.879,8367.647,7569.347 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 7893.6 | 6401.8–8892.2 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 11428.810,10867.698,10511.069,10360.947,10346.503,10367.705,10763.704 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 10511.1 | 10346.5–11428.8 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 11228.067,11018.428,11307.526,11637.971,11168.459,10813.950,11448.005 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 11228.1 | 10813.9–11638.0 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 504.568,506.258,525.774,512.480,512.353,514.009,538.760 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 512.5 | 504.6–538.8 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 297.788,292.389,298.125,292.312,296.837,296.930,302.593 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 296.9 | 292.3–302.6 | 32664305 |
<!-- samples | serde_json | text-short | decode | 111.144,110.473,114.341,110.810,107.139,110.768,108.604 -->
| serde_json | text-short | decode | 97 | 200000 | 110.8 | 107.1–114.3 | 149907000 |
<!-- samples | serde_json | text-short | encode | 87.928,87.643,87.326,85.367,84.575,84.528,84.675 -->
| serde_json | text-short | encode | 97 | 200000 | 85.4 | 84.5–87.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 128.913,129.085,128.006,128.186,127.607,128.115,127.730 -->
| sonic-rs | text-short | decode | 97 | 200000 | 128.1 | 127.6–129.1 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 98.514,100.132,98.694,95.892,95.907,98.836,105.994 -->
| sonic-rs | text-short | encode | 97 | 200000 | 98.7 | 95.9–106.0 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 44.023,42.280,40.967,40.387,39.995,38.905,38.945 -->
| prost (binary) | text-short | decode | 70 | 200000 | 40.4 | 38.9–44.0 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 22.404,22.887,22.824,21.802,21.581,21.501,21.473 -->
| prost (binary) | text-short | encode | 70 | 200000 | 21.8 | 21.5–22.9 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2101.501,2097.789,2095.937,2067.660,1973.744,1974.733,1977.691 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2067.7 | 1973.7–2101.5 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 6446.456,6442.989,6445.487,6451.588,6455.307,6445.323,6609.757 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 6446.5 | 6443.0–6609.8 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1588.994,1622.682,1647.094,1648.342,1647.033,1623.858,1593.620 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1623.9 | 1589.0–1648.3 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 471.123,468.832,468.443,468.979,468.242,469.293,468.690 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 468.8 | 468.2–471.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 475.527,475.168,474.721,474.014,475.663,474.031,473.865 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 474.7 | 473.9–475.7 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 240.754,238.649,241.199,239.648,241.246,239.649,241.356 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 240.8 | 238.6–241.4 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1411.994,1413.366,1409.599,1414.091,1410.669,1411.417,1410.979 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1411.4 | 1409.6–1414.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 6209.675,6215.996,6207.312,6209.744,6205.426,6207.785,6205.436 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 6207.8 | 6205.4–6216.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1154.536,1156.037,1153.751,1153.786,1155.745,1154.053,1154.057 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1154.1 | 1153.8–1156.0 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 452.760,453.577,450.522,451.135,452.493,452.270,452.168 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 452.3 | 450.5–453.6 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 462.356,464.716,464.709,464.938,464.241,464.341,466.170 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 464.7 | 462.4–466.2 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 243.573,240.399,241.944,239.675,243.142,241.137,243.044 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 241.9 | 239.7–243.6 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 19392.103,20221.619,19747.543,20087.757,20833.170,19719.211,18978.028 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 19747.5 | 18978.0–20833.2 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 8953.159,9628.700,9662.835,9485.464,9281.258,9284.514,9277.220 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 9284.5 | 8953.2–9662.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 15394.502,15462.823,15443.923,15406.401,15760.832,15987.859,15418.771 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 15443.9 | 15394.5–15987.9 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 5582.507,5579.663,5596.577,5814.620,6020.747,6857.042,7368.733 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 5814.6 | 5579.7–7368.7 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8052.822,8340.041,8517.248,8605.829,8589.897,8577.192,8347.309 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8517.2 | 8052.8–8605.8 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 333.571,329.110,332.464,333.791,328.368,332.476,334.199 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 332.5 | 328.4–334.2 | 101649504 |
<!-- samples | serde_json | wide | decode | 811.360,763.156,786.777,761.537,776.279,797.809,750.531 -->
| serde_json | wide | decode | 135 | 40000 | 776.3 | 750.5–811.4 | 33720000 |
<!-- samples | serde_json | wide | encode | 418.340,379.611,349.813,330.029,316.835,309.341,327.408 -->
| serde_json | wide | encode | 135 | 40000 | 330.0 | 309.3–418.3 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 793.438,865.786,737.191,662.532,630.099,665.927,652.579 -->
| sonic-rs | wide | decode | 135 | 40000 | 665.9 | 630.1–865.8 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 300.079,303.023,297.159,297.834,292.740,297.817,293.633 -->
| sonic-rs | wide | encode | 135 | 40000 | 297.8 | 292.7–303.0 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 96.218,95.444,96.637,95.512,95.282,95.075,95.845 -->
| prost (binary) | wide | decode | 31 | 40000 | 95.5 | 95.1–96.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 89.881,90.061,89.880,89.486,89.464,89.378,89.483 -->
| prost (binary) | wide | encode | 31 | 40000 | 89.5 | 89.4–90.1 | 19595809 |
