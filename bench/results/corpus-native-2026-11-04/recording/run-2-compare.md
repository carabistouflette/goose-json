| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 121.438,109.146,102.662,105.518,108.993,102.970,103.478 -->
| serde_json | plain | decode | 38 | 200000 | 105.5 | 102.7–121.4 | 67248000 |
<!-- samples | serde_json | plain | encode | 53.339,54.140,53.425,51.454,50.919,49.738,49.105 -->
| serde_json | plain | encode | 38 | 200000 | 51.5 | 49.1–54.1 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 190.640,180.231,187.368,195.035,203.027,188.880,185.943 -->
| sonic-rs | plain | decode | 38 | 200000 | 188.9 | 180.2–203.0 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 57.013,60.330,66.047,72.323,77.453,78.437,80.047 -->
| sonic-rs | plain | encode | 38 | 200000 | 72.3 | 57.0–80.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 60.500,60.164,60.104,60.177,60.082,62.756,61.129 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.2 | 60.1–62.8 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 32.993,32.900,32.558,31.420,30.247,28.898,28.871 -->
| prost (binary) | plain | encode | 11 | 200000 | 31.4 | 28.9–33.0 | 92719942 |
<!-- samples | serde_json | escaped | decode | 295.617,253.598,235.561,234.857,219.823,238.862,239.962 -->
| serde_json | escaped | decode | 62 | 200000 | 238.9 | 219.8–295.6 | 85461000 |
<!-- samples | serde_json | escaped | encode | 72.347,70.682,75.779,74.003,72.327,74.103,73.020 -->
| serde_json | escaped | encode | 54 | 200000 | 73.0 | 70.7–75.8 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 357.578,379.554,394.843,340.844,346.257,367.629,365.853 -->
| sonic-rs | escaped | decode | 62 | 200000 | 365.9 | 340.8–394.8 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 123.204,140.536,140.394,139.106,125.007,123.287,128.780 -->
| sonic-rs | escaped | encode | 54 | 200000 | 128.8 | 123.2–140.5 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 55.263,53.641,53.345,54.887,57.231,56.314,55.412 -->
| prost (binary) | escaped | decode | 24 | 200000 | 55.3 | 53.3–57.2 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 26.735,25.976,25.378,25.557,24.787,25.832,26.471 -->
| prost (binary) | escaped | encode | 24 | 200000 | 25.8 | 24.8–26.7 | 181133323 |
<!-- samples | serde_json | array | decode | 15741.081,14793.264,18751.201,19563.913,16696.939,16362.131,15304.600 -->
| serde_json | array | decode | 4022 | 20000 | 16362.1 | 14793.3–19563.9 | 288627000 |
<!-- samples | serde_json | array | encode | 7347.646,7028.547,7467.009,7162.068,7326.394,6865.805,7227.963 -->
| serde_json | array | encode | 4022 | 20000 | 7228.0 | 6865.8–7467.0 | 574225548 |
<!-- samples | sonic-rs | array | decode | 21226.248,19336.299,20725.036,19593.918,19044.554,19102.948,21902.098 -->
| sonic-rs | array | decode | 4022 | 20000 | 19593.9 | 19044.6–21902.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7130.632,7452.005,7173.156,7174.014,6959.401,7494.441,7845.710 -->
| sonic-rs | array | encode | 4022 | 20000 | 7174.0 | 6959.4–7845.7 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5232.725,5357.474,4321.712,4352.611,4201.887,4278.008,4053.542 -->
| prost (binary) | array | decode | 1923 | 20000 | 4321.7 | 4053.5–5357.5 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6531.977,6218.149,6855.706,8245.314,6719.788,6768.801,7630.855 -->
| prost (binary) | array | encode | 1923 | 20000 | 6768.8 | 6218.1–8245.3 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 16750.683,14608.655,14828.035,16658.507,13361.443,13507.943,14192.092 -->
| serde_json | array-signed | decode | 4538 | 20000 | 14608.7 | 13361.4–16750.7 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 6108.630,6296.698,6089.012,6055.705,5930.190,6055.801,6297.377 -->
| serde_json | array-signed | encode | 4537 | 20000 | 6089.0 | 5930.2–6297.4 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 19489.797,18544.581,22777.878,23500.531,22195.732,20026.892,18866.520 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 20026.9 | 18544.6–23500.5 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 8916.093,7261.305,6914.470,6485.543,6365.424,6384.668,6447.094 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6485.5 | 6365.4–8916.1 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5926.470,5497.597,5490.385,5326.994,5246.984,5523.021,5502.704 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 5497.6 | 5247.0–5926.5 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 15520.906,15649.094,16906.728,18265.196,16370.638,15873.163,15504.257 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 15873.2 | 15504.3–18265.2 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 37042.803,35290.732,41254.900,33971.653,32162.030,37948.209,38639.936 -->
| serde_json | array-wide | decode | 19771 | 20000 | 37042.8 | 32162.0–41254.9 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 11581.128,11957.003,11646.298,12566.334,13698.356,13676.539,12414.825 -->
| serde_json | array-wide | encode | 19770 | 20000 | 12414.8 | 11581.1–13698.4 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 25825.750,23438.925,24892.400,25407.230,22778.044,24806.082,22638.343 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 24806.1 | 22638.3–25825.8 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 14053.984,12842.769,13446.695,12636.334,12766.134,13097.193,15851.165 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 13097.2 | 12636.3–15851.2 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 8395.095,7431.922,7028.459,7489.515,7299.042,7192.170,7337.000 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 7337.0 | 7028.5–8395.1 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 25315.913,25292.329,23492.906,25198.629,22656.585,22883.852,24018.904 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 24018.9 | 22656.6–25315.9 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 3461.151,3341.518,3188.715,3343.149,3365.244,3193.643,3249.451 -->
| serde_json | mixed | decode | 1187 | 20000 | 3341.5 | 3188.7–3461.2 | 227997000 |
<!-- samples | serde_json | mixed | encode | 1913.777,1787.976,1768.941,1704.648,1789.963,1672.680,1746.041 -->
| serde_json | mixed | encode | 1186 | 20000 | 1768.9 | 1672.7–1913.8 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 2810.138,3157.910,2988.031,2886.228,3247.972,3319.581,2862.125 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 2988.0 | 2810.1–3319.6 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 2165.883,2189.596,2120.945,2255.013,2951.487,2585.649,2375.632 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 2255.0 | 2120.9–2951.5 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 987.492,982.280,933.409,893.136,914.032,900.668,893.210 -->
| prost (binary) | mixed | decode | 954 | 20000 | 914.0 | 893.1–987.5 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 406.814,402.278,403.348,386.883,399.854,413.542,400.780 -->
| prost (binary) | mixed | encode | 954 | 20000 | 402.3 | 386.9–413.5 | 149207284 |
<!-- samples | serde_json | floats | decode | 5208.636,5136.420,4982.722,4917.456,5625.007,7268.636,7961.256 -->
| serde_json | floats | decode | 1581 | 2000 | 5208.6 | 4917.5–7961.3 | 3825000 |
<!-- samples | serde_json | floats | encode | 11557.337,12164.082,11242.348,10103.374,9593.792,9077.885,8354.976 -->
| serde_json | floats | encode | 1581 | 2000 | 10103.4 | 8355.0–12164.1 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 6582.781,6522.915,6404.216,6161.117,5872.197,5706.015,5605.705 -->
| sonic-rs | floats | decode | 1581 | 2000 | 6161.1 | 5605.7–6582.8 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10561.370,10499.702,10413.207,12782.113,15559.526,17176.064,17566.580 -->
| sonic-rs | floats | encode | 1581 | 2000 | 12782.1 | 10413.2–17566.6 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 1049.501,971.313,931.593,912.844,915.837,970.812,921.621 -->
| prost (binary) | floats | decode | 2051 | 2000 | 931.6 | 912.8–1049.5 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 481.874,434.016,437.566,438.433,440.933,440.460,439.266 -->
| prost (binary) | floats | encode | 2051 | 2000 | 439.3 | 434.0–481.9 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 19842.444,16541.214,15007.009,14476.552,17780.821,16576.017,15380.511 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 16541.2 | 14476.6–19842.4 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 6477.463,6642.222,6678.435,6509.221,6339.094,6253.139,6149.740 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 6477.5 | 6149.7–6678.4 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 10807.907,12342.326,11296.862,11036.733,10998.787,10617.603,10402.963 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 10998.8 | 10403.0–12342.3 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 11146.220,10821.347,10657.936,11485.290,11209.980,10780.973,11240.683 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 11146.2 | 10657.9–11485.3 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 567.921,581.827,571.493,567.905,571.514,589.024,567.855 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 571.5 | 567.9–589.0 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 292.600,288.097,292.076,288.565,291.478,291.748,288.613 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 291.5 | 288.1–292.6 | 32664305 |
<!-- samples | serde_json | text-short | decode | 111.705,106.826,114.167,114.328,107.861,115.141,112.116 -->
| serde_json | text-short | decode | 97 | 200000 | 112.1 | 106.8–115.1 | 149907000 |
<!-- samples | serde_json | text-short | encode | 71.206,71.236,72.519,78.628,77.049,74.526,72.618 -->
| serde_json | text-short | encode | 97 | 200000 | 72.6 | 71.2–78.6 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 153.720,159.704,158.299,156.532,147.233,153.208,150.226 -->
| sonic-rs | text-short | decode | 97 | 200000 | 153.7 | 147.2–159.7 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 108.624,105.989,100.642,98.894,104.529,108.758,104.355 -->
| sonic-rs | text-short | encode | 97 | 200000 | 104.5 | 98.9–108.8 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 42.659,44.585,46.181,49.509,50.179,48.453,47.924 -->
| prost (binary) | text-short | decode | 70 | 200000 | 47.9 | 42.7–50.2 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 28.504,28.136,27.856,27.385,27.086,27.127,29.400 -->
| prost (binary) | text-short | encode | 70 | 200000 | 27.9 | 27.1–29.4 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3104.910,3171.390,3097.523,3123.009,3135.760,3059.865,3032.363 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3104.9 | 3032.4–3171.4 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5807.337,5724.525,7021.385,6424.807,6055.526,6084.242,6142.557 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 6084.2 | 5724.5–7021.4 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2912.948,3032.444,3120.157,3312.858,2997.756,2994.581,3034.515 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 3032.4 | 2912.9–3312.9 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 835.818,815.840,820.042,827.525,800.667,785.024,781.356 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 815.8 | 781.4–835.8 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 789.447,794.021,789.354,786.997,791.605,788.913,786.458 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 789.4 | 786.5–794.0 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 403.844,407.999,407.954,408.093,428.373,407.952,404.815 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 408.0 | 403.8–428.4 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2376.144,2382.461,2398.927,2337.227,2216.451,2230.537,2234.435 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2337.2 | 2216.5–2398.9 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5245.447,5347.716,5215.718,5174.243,5049.703,4701.226,4514.382 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5174.2 | 4514.4–5347.7 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1645.825,1636.126,1710.726,1787.605,1791.023,1811.708,1797.326 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1787.6 | 1636.1–1811.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 707.402,707.359,700.461,706.754,697.639,711.296,702.668 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 706.8 | 697.6–711.3 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 732.497,731.127,737.710,752.516,779.904,798.562,791.939 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 752.5 | 731.1–798.6 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 411.394,406.330,415.482,410.945,411.758,409.350,412.250 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 411.4 | 406.3–415.5 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 32787.087,32501.948,28347.753,23059.784,22405.439,23617.159,25624.549 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 25624.5 | 22405.4–32787.1 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 8703.216,7795.774,7636.592,7639.071,9399.851,10304.195,9255.165 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 8703.2 | 7636.6–10304.2 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 17251.266,16075.613,15753.357,15678.140,16443.422,15392.352,16792.225 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 16075.6 | 15392.4–17251.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 6654.127,7368.530,8450.694,8562.871,9064.826,8656.110,8326.431 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8450.7 | 6654.1–9064.8 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 9128.697,9267.835,9299.095,9067.822,8719.622,8561.215,7789.138 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 9067.8 | 7789.1–9299.1 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 262.164,268.140,261.856,266.651,263.136,266.548,267.050 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 266.5 | 261.9–268.1 | 101649504 |
<!-- samples | serde_json | wide | decode | 733.230,829.669,857.184,847.833,863.162,868.051,835.086 -->
| serde_json | wide | decode | 135 | 40000 | 847.8 | 733.2–868.1 | 33720000 |
<!-- samples | serde_json | wide | encode | 471.951,461.589,441.656,428.360,404.223,435.148,441.628 -->
| serde_json | wide | encode | 135 | 40000 | 441.6 | 404.2–472.0 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1006.860,1071.561,1103.506,1087.948,1076.349,1058.869,953.135 -->
| sonic-rs | wide | decode | 135 | 40000 | 1071.6 | 953.1–1103.5 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 393.681,385.652,384.116,422.451,476.656,503.120,511.815 -->
| sonic-rs | wide | encode | 135 | 40000 | 422.5 | 384.1–511.8 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 155.836,154.034,156.449,155.684,155.397,160.691,163.133 -->
| prost (binary) | wide | decode | 31 | 40000 | 155.8 | 154.0–163.1 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 192.675,193.005,204.049,210.735,219.483,229.689,225.866 -->
| prost (binary) | wide | encode | 31 | 40000 | 210.7 | 192.7–229.7 | 19595809 |
