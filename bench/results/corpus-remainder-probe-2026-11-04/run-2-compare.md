| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 110.565,107.860,102.003,97.781,97.331,97.364,98.106 -->
| serde_json | plain | decode | 38 | 200000 | 98.1 | 97.3–110.6 | 67248000 |
<!-- samples | serde_json | plain | encode | 49.681,51.300,50.940,51.563,51.253,51.014,49.706 -->
| serde_json | plain | encode | 38 | 200000 | 51.0 | 49.7–51.6 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 178.075,176.909,178.312,183.557,186.606,191.105,202.274 -->
| sonic-rs | plain | decode | 38 | 200000 | 183.6 | 176.9–202.3 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 61.705,60.439,58.848,61.908,59.710,58.322,62.991 -->
| sonic-rs | plain | encode | 38 | 200000 | 60.4 | 58.3–63.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 46.599,45.978,44.451,43.217,42.774,42.896,41.821 -->
| prost (binary) | plain | decode | 11 | 200000 | 43.2 | 41.8–46.6 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 24.140,23.467,23.509,22.741,22.916,22.667,22.593 -->
| prost (binary) | plain | encode | 11 | 200000 | 22.9 | 22.6–24.1 | 92719942 |
<!-- samples | serde_json | escaped | decode | 219.150,214.869,223.842,232.845,219.530,213.764,234.637 -->
| serde_json | escaped | decode | 62 | 200000 | 219.5 | 213.8–234.6 | 85461000 |
<!-- samples | serde_json | escaped | encode | 80.405,85.774,87.703,81.879,78.578,79.792,79.572 -->
| serde_json | escaped | encode | 54 | 200000 | 80.4 | 78.6–87.7 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 355.950,352.073,400.862,393.167,326.486,332.162,336.099 -->
| sonic-rs | escaped | decode | 62 | 200000 | 352.1 | 326.5–400.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 128.390,139.872,136.367,136.224,131.406,132.361,142.802 -->
| sonic-rs | escaped | encode | 54 | 200000 | 136.2 | 128.4–142.8 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 56.030,57.591,60.466,56.638,54.323,53.804,52.438 -->
| prost (binary) | escaped | decode | 24 | 200000 | 56.0 | 52.4–60.5 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 24.438,23.943,24.556,24.799,24.813,24.753,25.772 -->
| prost (binary) | escaped | encode | 24 | 200000 | 24.8 | 23.9–25.8 | 181133323 |
<!-- samples | serde_json | array | decode | 13771.539,15681.251,16663.342,18125.474,14439.781,15591.830,16982.219 -->
| serde_json | array | decode | 4022 | 20000 | 15681.3 | 13771.5–18125.5 | 288627000 |
<!-- samples | serde_json | array | encode | 7444.230,7265.805,8213.742,9120.858,8080.589,7336.921,6948.972 -->
| serde_json | array | encode | 4022 | 20000 | 7444.2 | 6949.0–9120.9 | 574225548 |
<!-- samples | sonic-rs | array | decode | 19212.629,24973.046,25312.113,24634.967,26833.884,27428.061,24203.941 -->
| sonic-rs | array | decode | 4022 | 20000 | 24973.0 | 19212.6–27428.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7560.766,6704.067,7752.485,7232.997,9133.514,9205.094,8442.445 -->
| sonic-rs | array | encode | 4022 | 20000 | 7752.5 | 6704.1–9205.1 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4950.030,5647.463,5515.412,5426.417,5142.618,5593.276,5504.810 -->
| prost (binary) | array | decode | 1923 | 20000 | 5504.8 | 4950.0–5647.5 | 288627000 |
<!-- samples | prost (binary) | array | encode | 8765.076,9761.282,6774.165,6052.608,6115.485,6904.966,5942.948 -->
| prost (binary) | array | encode | 1923 | 20000 | 6774.2 | 5942.9–9761.3 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 14822.727,19393.093,13063.461,13742.401,14484.108,13478.652,13161.476 -->
| serde_json | array-signed | decode | 4538 | 20000 | 13742.4 | 13063.5–19393.1 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 6119.653,6006.391,6258.309,6412.995,6206.892,6641.807,6164.096 -->
| serde_json | array-signed | encode | 4537 | 20000 | 6206.9 | 6006.4–6641.8 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 18481.224,24074.499,17194.106,18000.464,17167.792,16969.814,16734.917 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 17194.1 | 16734.9–24074.5 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 6114.779,6212.797,6222.404,6096.543,6100.050,7319.991,6121.229 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6121.2 | 6096.5–7320.0 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5144.954,5552.540,5305.200,6944.530,8021.709,6968.492,9015.090 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 6944.5 | 5145.0–9015.1 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 19417.008,14903.712,14933.825,14692.643,15483.656,14821.628,14825.977 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 14903.7 | 14692.6–19417.0 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 29717.419,30883.175,30897.898,30265.819,29936.821,39313.577,44771.483 -->
| serde_json | array-wide | decode | 19771 | 20000 | 30883.2 | 29717.4–44771.5 | 101943000 |
<!-- samples | serde_json | array-wide | encode | 16802.096,16958.867,16824.096,16818.656,16811.645,16995.155,16943.260 -->
| serde_json | array-wide | encode | 19770 | 20000 | 16824.1 | 16802.1–16995.2 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 33022.251,34342.797,33663.386,32892.372,32970.980,33791.422,34337.270 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 33663.4 | 32892.4–34342.8 | 101943000 |
<!-- samples | sonic-rs | array-wide | encode | 18883.497,18673.602,18775.062,18762.044,19132.416,18953.274,18928.039 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 18883.5 | 18673.6–19132.4 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 10572.932,10815.099,10770.792,11041.112,11118.297,11109.044,10778.503 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 10815.1 | 10572.9–11118.3 | 101943000 |
<!-- samples | prost (binary) | array-wide | encode | 33687.635,33026.859,33865.193,34183.991,33681.568,33205.972,32943.750 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 33681.6 | 32943.7–34184.0 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4550.702,4414.691,4688.280,4494.340,4451.930,4586.161,4697.783 -->
| serde_json | mixed | decode | 1187 | 20000 | 4550.7 | 4414.7–4697.8 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2572.081,2564.588,2566.717,2735.559,2719.354,2560.549,2569.119 -->
| serde_json | mixed | encode | 1186 | 20000 | 2569.1 | 2560.5–2735.6 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4306.027,4351.248,4078.514,4084.358,4212.265,4123.027,4072.862 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 4123.0 | 4072.9–4351.2 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3266.367,3202.818,3199.305,3234.469,3414.823,3363.236,3322.496 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3266.4 | 3199.3–3414.8 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1307.591,1296.919,1293.110,1297.959,1298.409,1301.824,1293.504 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1298.0 | 1293.1–1307.6 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 617.930,614.593,615.282,612.199,622.180,609.634,611.038 -->
| prost (binary) | mixed | encode | 954 | 20000 | 614.6 | 609.6–622.2 | 149207284 |
<!-- samples | serde_json | floats | decode | 7451.587,7431.977,7404.904,7408.859,7447.849,7390.531,7441.701 -->
| serde_json | floats | decode | 1581 | 2000 | 7432.0 | 7390.5–7451.6 | 3825000 |
<!-- samples | serde_json | floats | encode | 9528.986,9560.591,9560.356,9586.975,9569.038,9553.565,9593.436 -->
| serde_json | floats | encode | 1581 | 2000 | 9560.6 | 9529.0–9593.4 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 8332.135,8383.093,8332.114,8388.140,8310.692,8379.775,8358.001 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8358.0 | 8310.7–8388.1 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 15418.505,15544.401,15393.456,15305.277,15403.077,15548.393,15601.003 -->
| sonic-rs | floats | encode | 1581 | 2000 | 15418.5 | 15305.3–15601.0 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 789.886,807.996,797.662,799.056,802.538,802.449,809.871 -->
| prost (binary) | floats | decode | 2051 | 2000 | 802.4 | 789.9–809.9 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 410.413,411.149,411.440,413.303,413.714,412.495,413.584 -->
| prost (binary) | floats | encode | 2051 | 2000 | 412.5 | 410.4–413.7 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 21528.272,21445.487,21457.631,21300.996,21338.542,21488.962,22497.769 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21457.6 | 21301.0–22497.8 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9962.693,9820.009,9732.096,9774.088,9744.766,9755.420,9814.502 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9774.1 | 9732.1–9962.7 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16856.900,16934.405,16790.244,16930.661,16824.031,16690.399,16333.841 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16824.0 | 16333.8–16934.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 16279.255,16276.578,17355.226,17241.838,17298.341,17302.012,17332.831 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 17298.3 | 16276.6–17355.2 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 860.156,1001.628,968.124,808.800,806.487,816.155,809.904 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 816.2 | 806.5–1001.6 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 429.995,436.947,430.336,433.554,431.897,429.450,428.317 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 430.3 | 428.3–436.9 | 32664305 |
<!-- samples | serde_json | text-short | decode | 172.000,172.762,173.265,171.135,169.562,174.314,173.010 -->
| serde_json | text-short | decode | 97 | 200000 | 172.8 | 169.6–174.3 | 149907000 |
<!-- samples | serde_json | text-short | encode | 108.516,106.881,107.285,107.412,107.903,107.640,107.705 -->
| serde_json | text-short | encode | 97 | 200000 | 107.6 | 106.9–108.5 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 223.769,223.326,222.513,221.950,223.153,224.049,223.255 -->
| sonic-rs | text-short | decode | 97 | 200000 | 223.3 | 221.9–224.0 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 145.931,146.273,146.039,146.266,146.223,145.706,146.016 -->
| sonic-rs | text-short | encode | 97 | 200000 | 146.0 | 145.7–146.3 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 60.868,60.677,60.871,60.785,61.029,60.714,60.599 -->
| prost (binary) | text-short | decode | 70 | 200000 | 60.8 | 60.6–61.0 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 34.787,34.561,34.667,34.474,34.332,34.439,34.543 -->
| prost (binary) | text-short | encode | 70 | 200000 | 34.5 | 34.3–34.8 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3156.202,3111.736,3124.816,3185.452,3107.100,3136.671,3155.296 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3136.7 | 3107.1–3185.5 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5658.096,5661.770,5670.417,5649.074,5689.528,5675.377,5649.733 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5661.8 | 5649.1–5689.5 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2597.593,2530.548,2538.588,2596.477,2546.513,2541.648,2538.642 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2541.6 | 2530.5–2597.6 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 732.354,732.545,728.497,755.627,730.803,729.038,728.624 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 730.8 | 728.5–755.6 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 737.815,748.409,740.225,745.753,737.639,756.527,760.533 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 745.8 | 737.6–760.5 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 378.812,375.014,382.307,383.800,384.139,383.974,386.594 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 383.8 | 375.0–386.6 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2220.905,2231.496,2253.892,2229.818,2239.834,2252.048,2240.894 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2239.8 | 2220.9–2253.9 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5214.554,5261.949,5239.857,5230.322,5201.596,5226.332,5269.573 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5230.3 | 5201.6–5269.6 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1847.055,1830.861,1835.761,1874.653,1843.771,1839.756,1835.730 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1839.8 | 1830.9–1874.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 699.311,709.909,725.165,715.878,703.764,709.453,708.725 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 709.5 | 699.3–725.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 733.630,734.850,743.111,729.162,727.297,735.287,731.440 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 733.6 | 727.3–743.1 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 381.072,383.244,384.604,383.661,380.799,391.096,394.461 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 383.7 | 380.8–394.5 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 32456.480,32317.600,32332.660,32330.528,32494.982,33403.900,33475.903 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 32456.5 | 32317.6–33475.9 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 11681.390,11548.921,11053.793,11086.178,11369.258,11366.525,11379.201 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 11369.3 | 11053.8–11681.4 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 21091.586,20929.974,20966.974,20891.648,20974.456,20954.524,20928.189 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 20954.5 | 20891.6–21091.6 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8523.921,8549.019,8523.751,8546.587,8552.353,8510.644,8513.198 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8523.9 | 8510.6–8552.4 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 7577.846,7560.250,7613.114,7598.127,7566.439,7583.158,7548.253 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 7577.8 | 7548.3–7613.1 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 323.841,323.562,323.329,321.289,328.985,324.750,321.881 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 323.6 | 321.3–329.0 | 101649504 |
<!-- samples | serde_json | wide | decode | 839.521,836.163,838.524,836.145,837.535,839.897,838.542 -->
| serde_json | wide | decode | 135 | 40000 | 838.5 | 836.1–839.9 | 33720000 |
<!-- samples | serde_json | wide | encode | 457.309,460.335,456.935,457.603,457.577,455.742,457.492 -->
| serde_json | wide | encode | 135 | 40000 | 457.5 | 455.7–460.3 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1005.477,996.920,999.443,1015.653,997.767,998.121,999.230 -->
| sonic-rs | wide | decode | 135 | 40000 | 999.2 | 996.9–1015.7 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 443.618,442.803,441.691,441.781,442.528,440.872,442.821 -->
| sonic-rs | wide | encode | 135 | 40000 | 442.5 | 440.9–443.6 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 144.360,147.763,146.786,147.467,152.867,148.062,146.698 -->
| prost (binary) | wide | decode | 31 | 40000 | 147.5 | 144.4–152.9 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 140.212,140.150,138.916,139.860,139.484,139.638,139.317 -->
| prost (binary) | wide | encode | 31 | 40000 | 139.6 | 138.9–140.2 | 19595809 |
