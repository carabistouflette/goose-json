| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 160.783,158.758,161.198,162.925,164.619,162.005,166.497 -->
| serde_json | plain | decode | 38 | 200000 | 162.0 | 158.8–166.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 71.510,71.831,70.631,71.482,75.626,72.830,73.294 -->
| serde_json | plain | encode | 38 | 200000 | 71.8 | 70.6–75.6 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 175.672,174.074,175.379,170.075,169.441,167.735,168.033 -->
| sonic-rs | plain | decode | 38 | 200000 | 170.1 | 167.7–175.7 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 69.774,75.473,72.923,73.027,72.363,70.612,69.693 -->
| sonic-rs | plain | encode | 38 | 200000 | 72.4 | 69.7–75.5 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 59.109,59.505,60.988,60.178,60.614,60.196,61.696 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.2 | 59.1–61.7 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 41.594,40.367,40.282,39.867,39.704,40.136,40.002 -->
| prost (binary) | plain | encode | 11 | 200000 | 40.1 | 39.7–41.6 | 92719942 |
<!-- samples | serde_json | escaped | decode | 300.584,305.770,300.279,302.065,302.228,303.444,308.983 -->
| serde_json | escaped | decode | 62 | 200000 | 302.2 | 300.3–309.0 | 85461000 |
<!-- samples | serde_json | escaped | encode | 94.052,99.685,100.777,98.011,99.758,100.219,99.017 -->
| serde_json | escaped | encode | 54 | 200000 | 99.7 | 94.1–100.8 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 320.723,323.943,319.226,318.835,315.375,315.844,317.660 -->
| sonic-rs | escaped | decode | 62 | 200000 | 318.8 | 315.4–323.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 151.924,154.662,159.817,156.195,158.352,159.116,159.946 -->
| sonic-rs | escaped | encode | 54 | 200000 | 158.4 | 151.9–159.9 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 75.735,73.203,74.510,76.270,77.009,73.535,73.407 -->
| prost (binary) | escaped | decode | 24 | 200000 | 74.5 | 73.2–77.0 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 32.738,37.178,35.983,34.497,33.957,32.822,35.596 -->
| prost (binary) | escaped | encode | 24 | 200000 | 34.5 | 32.7–37.2 | 181133323 |
<!-- samples | serde_json | array | decode | 15285.213,15475.032,15325.757,14826.790,14556.721,14551.350,14760.862 -->
| serde_json | array | decode | 4022 | 20000 | 14826.8 | 14551.4–15475.0 | 288627000 |
<!-- samples | serde_json | array | encode | 7986.625,8220.244,8196.179,8177.359,8136.738,8152.389,8151.890 -->
| serde_json | array | encode | 4022 | 20000 | 8152.4 | 7986.6–8220.2 | 574225548 |
<!-- samples | sonic-rs | array | decode | 17606.020,17802.731,17020.224,16680.652,16775.633,17266.011,17113.713 -->
| sonic-rs | array | decode | 4022 | 20000 | 17113.7 | 16680.7–17802.7 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7994.912,7962.978,7940.501,8021.558,8001.760,7937.587,7904.771 -->
| sonic-rs | array | encode | 4022 | 20000 | 7963.0 | 7904.8–8021.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4562.243,4550.362,4522.371,4564.345,4564.257,4577.756,4573.816 -->
| prost (binary) | array | decode | 1923 | 20000 | 4564.3 | 4522.4–4577.8 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7037.450,7222.393,7350.426,7200.005,7208.770,7263.356,7335.524 -->
| prost (binary) | array | encode | 1923 | 20000 | 7222.4 | 7037.5–7350.4 | 284551620 |
<!-- samples | serde_json | floats | decode | 7590.814,7437.226,7442.654,7174.137,7372.980,7536.271,7350.828 -->
| serde_json | floats | decode | 1581 | 2000 | 7437.2 | 7174.1–7590.8 | 3825000 |
<!-- samples | serde_json | floats | encode | 9925.943,10188.135,10170.909,10170.798,9995.539,10050.595,9796.961 -->
| serde_json | floats | encode | 1581 | 2000 | 10050.6 | 9797.0–10188.1 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7287.520,7237.694,7199.440,7341.055,7048.060,7147.275,7137.620 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7199.4 | 7048.1–7341.1 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10269.677,10151.657,9966.206,10111.081,9798.712,9634.841,9381.043 -->
| sonic-rs | floats | encode | 1581 | 2000 | 9966.2 | 9381.0–10269.7 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 695.287,716.067,853.571,805.471,747.018,718.654,749.917 -->
| prost (binary) | floats | decode | 2051 | 2000 | 747.0 | 695.3–853.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 546.092,545.130,519.906,490.971,485.950,485.344,506.279 -->
| prost (binary) | floats | encode | 2051 | 2000 | 506.3 | 485.3–546.1 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 20564.398,19381.237,21494.565,21360.930,21993.287,22124.452,22395.665 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21494.6 | 19381.2–22395.7 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8983.081,8888.370,8992.599,8940.672,8699.656,8656.225,8926.692 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8926.7 | 8656.2–8992.6 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 15823.551,15759.846,15420.253,15891.626,15752.942,15831.731,15905.941 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15823.6 | 15420.3–15905.9 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9103.580,9055.262,9045.941,9199.668,9087.778,9373.403,9151.353 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9103.6 | 9045.9–9373.4 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 804.649,745.591,745.367,751.163,785.204,733.049,740.857 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 745.6 | 733.0–804.6 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 514.880,537.567,544.643,545.865,544.952,545.223,547.691 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 545.0 | 514.9–547.7 | 32664305 |
<!-- samples | serde_json | text-short | decode | 175.618,174.318,168.866,172.879,168.604,167.195,169.209 -->
| serde_json | text-short | decode | 97 | 200000 | 169.2 | 167.2–175.6 | 149907000 |
<!-- samples | serde_json | text-short | encode | 120.270,122.521,127.259,127.736,128.527,123.433,125.418 -->
| serde_json | text-short | encode | 97 | 200000 | 125.4 | 120.3–128.5 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 187.444,185.097,188.307,185.867,192.892,196.745,191.845 -->
| sonic-rs | text-short | decode | 97 | 200000 | 188.3 | 185.1–196.7 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 130.851,135.086,142.674,133.626,133.172,128.594,132.677 -->
| sonic-rs | text-short | encode | 97 | 200000 | 133.2 | 128.6–142.7 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 60.914,60.577,58.241,59.940,56.127,58.973,55.966 -->
| prost (binary) | text-short | decode | 70 | 200000 | 59.0 | 56.0–60.9 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 37.748,38.416,40.033,37.398,37.259,37.595,37.741 -->
| prost (binary) | text-short | encode | 70 | 200000 | 37.7 | 37.3–40.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2590.817,2667.123,2772.694,2594.651,2605.219,2725.785,2616.508 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2616.5 | 2590.8–2772.7 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4830.339,4777.816,4780.976,4802.912,4931.639,4856.027,4815.171 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4815.2 | 4777.8–4931.6 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1484.051,1473.939,1605.193,1739.248,1583.702,1528.741,1743.232 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1583.7 | 1473.9–1743.2 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 660.959,612.164,628.728,603.508,620.042,620.832,597.307 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 620.0 | 597.3–661.0 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 499.142,500.659,497.403,502.532,496.507,498.725,501.211 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 499.1 | 496.5–502.5 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 171.823,173.166,176.448,177.384,185.957,185.218,180.981 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 177.4 | 171.8–186.0 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2189.615,2182.334,2040.833,2080.572,2184.064,2119.452,2092.109 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2119.5 | 2040.8–2189.6 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4166.189,4530.635,4235.538,4282.533,4569.193,4480.108,4251.959 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4282.5 | 4166.2–4569.2 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 997.192,1013.496,1010.388,1019.714,1021.494,1012.361,967.524 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1012.4 | 967.5–1021.5 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 488.512,494.873,516.273,513.095,513.900,525.856,544.259 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 513.9 | 488.5–544.3 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 480.546,479.005,478.782,504.539,478.892,478.267,479.178 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 479.0 | 478.3–504.5 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 169.558,173.129,171.118,169.590,172.969,171.081,169.153 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 171.1 | 169.2–173.1 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 23125.969,22527.782,21294.593,21330.966,22903.431,21630.247,20252.380 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 21630.2 | 20252.4–23126.0 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12821.720,12290.079,12073.535,12509.651,12413.274,11955.694,12149.070 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12290.1 | 11955.7–12821.7 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 12701.880,12845.148,12404.031,12199.986,12193.555,12613.657,12969.968 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 12613.7 | 12193.6–12970.0 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8417.826,8458.934,8359.899,8407.156,8443.910,8411.394,8275.379 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8411.4 | 8275.4–8458.9 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8134.760,7914.532,8190.913,8286.969,8218.177,8167.132,8169.458 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8169.5 | 7914.5–8287.0 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 181.550,158.890,158.595,156.945,163.002,158.766,157.172 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 158.8 | 156.9–181.6 | 101649504 |
<!-- samples | serde_json | wide | decode | 1484.228,1501.242,1484.477,1506.063,1499.591,1501.244,1501.638 -->
| serde_json | wide | decode | 135 | 40000 | 1501.2 | 1484.2–1506.1 | 33720000 |
<!-- samples | serde_json | wide | encode | 409.577,411.621,402.945,414.435,404.322,403.263,393.708 -->
| serde_json | wide | encode | 135 | 40000 | 404.3 | 393.7–414.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 918.108,919.756,920.149,923.862,919.811,922.011,923.607 -->
| sonic-rs | wide | decode | 135 | 40000 | 920.1 | 918.1–923.9 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 384.624,386.146,404.760,389.199,410.460,380.443,373.735 -->
| sonic-rs | wide | encode | 135 | 40000 | 386.1 | 373.7–410.5 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 131.495,124.479,132.793,134.354,127.544,133.562,133.046 -->
| prost (binary) | wide | decode | 31 | 40000 | 132.8 | 124.5–134.4 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 154.550,153.261,149.980,153.609,150.920,157.685,148.043 -->
| prost (binary) | wide | encode | 31 | 40000 | 153.3 | 148.0–157.7 | 19595809 |
