| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 105.199,101.722,99.896,97.468,96.467,101.175,106.482 -->
| serde_json | plain | decode | 38 | 200000 | 101.2 | 96.5–106.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 49.008,49.040,49.321,48.954,48.933,48.234,47.385 -->
| serde_json | plain | encode | 38 | 200000 | 49.0 | 47.4–49.3 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 175.936,169.500,171.297,170.896,170.968,173.812,176.043 -->
| sonic-rs | plain | decode | 38 | 200000 | 171.3 | 169.5–176.0 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 53.531,57.546,61.245,59.162,57.192,55.560,54.023 -->
| sonic-rs | plain | encode | 38 | 200000 | 57.2 | 53.5–61.2 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 41.259,39.825,39.656,39.542,39.714,39.654,38.664 -->
| prost (binary) | plain | decode | 11 | 200000 | 39.7 | 38.7–41.3 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 21.447,21.720,22.374,21.487,21.046,21.154,21.319 -->
| prost (binary) | plain | encode | 11 | 200000 | 21.4 | 21.0–22.4 | 92719942 |
<!-- samples | serde_json | escaped | decode | 200.792,217.075,213.381,206.664,207.984,207.205,206.592 -->
| serde_json | escaped | decode | 62 | 200000 | 207.2 | 200.8–217.1 | 85461000 |
<!-- samples | serde_json | escaped | encode | 63.602,63.309,62.739,62.771,62.485,62.790,62.907 -->
| serde_json | escaped | encode | 54 | 200000 | 62.8 | 62.5–63.6 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 328.977,340.116,354.580,321.341,305.327,308.704,310.593 -->
| sonic-rs | escaped | decode | 62 | 200000 | 321.3 | 305.3–354.6 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 110.514,110.580,113.737,114.964,112.993,111.002,110.393 -->
| sonic-rs | escaped | encode | 54 | 200000 | 111.0 | 110.4–115.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 48.617,48.673,48.737,48.654,48.435,48.443,48.493 -->
| prost (binary) | escaped | decode | 24 | 200000 | 48.6 | 48.4–48.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 21.844,21.741,21.655,21.992,22.416,22.426,21.736 -->
| prost (binary) | escaped | encode | 24 | 200000 | 21.8 | 21.7–22.4 | 181133323 |
<!-- samples | serde_json | array | decode | 13344.917,18213.282,16502.590,16430.749,15834.633,17766.250,17704.694 -->
| serde_json | array | decode | 4022 | 20000 | 16502.6 | 13344.9–18213.3 | 288627000 |
<!-- samples | serde_json | array | encode | 7291.369,6775.844,8341.064,8320.420,9330.855,9765.710,9642.613 -->
| serde_json | array | encode | 4022 | 20000 | 8341.1 | 6775.8–9765.7 | 574225548 |
<!-- samples | sonic-rs | array | decode | 26014.866,27738.424,20986.639,28294.709,26372.267,24979.862,29238.141 -->
| sonic-rs | array | decode | 4022 | 20000 | 26372.3 | 20986.6–29238.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 10361.946,10572.932,11465.474,10195.621,10212.869,9454.013,7416.950 -->
| sonic-rs | array | encode | 4022 | 20000 | 10212.9 | 7417.0–11465.5 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5316.294,5701.512,5506.181,5948.299,5832.053,5318.182,5808.683 -->
| prost (binary) | array | decode | 1923 | 20000 | 5701.5 | 5316.3–5948.3 | 288627000 |
<!-- samples | prost (binary) | array | encode | 9360.511,8897.477,9185.867,9300.407,9485.175,9507.810,9877.538 -->
| prost (binary) | array | encode | 1923 | 20000 | 9360.5 | 8897.5–9877.5 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 23723.335,20715.113,20240.292,20583.942,20675.557,20169.395,17445.015 -->
| serde_json | array-signed | decode | 4538 | 20000 | 20583.9 | 17445.0–23723.3 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 9063.026,8371.196,9507.593,9420.130,7909.550,8068.436,8191.842 -->
| serde_json | array-signed | encode | 4537 | 20000 | 8371.2 | 7909.6–9507.6 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 26232.233,22314.155,26759.166,27164.557,24503.469,24904.783,23357.707 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 24904.8 | 22314.2–27164.6 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 9264.541,10254.241,10650.457,9845.974,9585.940,9477.073,9782.691 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 9782.7 | 9264.5–10650.5 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 8144.029,7559.351,7978.321,8158.372,8142.040,8247.184,8086.877 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 8142.0 | 7559.4–8247.2 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 21983.217,21595.004,22790.257,22094.411,21432.418,21858.605,23071.043 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 21983.2 | 21432.4–23071.0 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 45446.259,44973.620,46485.259,45085.401,45087.942,43546.781,47505.649 -->
| serde_json | array-wide | decode | 19771 | 20000 | 45087.9 | 43546.8–47505.6 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 17896.666,16940.090,15509.331,17195.874,16671.561,15299.981,18500.726 -->
| serde_json | array-wide | encode | 19770 | 20000 | 16940.1 | 15300.0–18500.7 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 41153.511,33874.256,32868.895,32367.257,32760.557,31648.238,32482.029 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 32760.6 | 31648.2–41153.5 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 18670.464,15902.292,16191.386,16511.021,18755.715,16747.900,18229.376 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 16747.9 | 15902.3–18755.7 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 10266.121,10323.563,10021.024,10289.084,9704.883,9120.476,9664.799 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 10021.0 | 9120.5–10323.6 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 30079.677,29610.445,30080.667,26685.055,30500.631,29651.326,33796.226 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 30079.7 | 26685.1–33796.2 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4801.032,4791.743,4693.367,4766.876,4499.911,4518.570,4564.941 -->
| serde_json | mixed | decode | 1187 | 20000 | 4693.4 | 4499.9–4801.0 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2629.446,2474.196,2533.214,2491.053,2401.980,2449.831,2516.704 -->
| serde_json | mixed | encode | 1186 | 20000 | 2491.1 | 2402.0–2629.4 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4129.809,3689.773,3711.130,3764.202,3527.879,3474.562,4607.889 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 3711.1 | 3474.6–4607.9 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3197.442,3271.687,3121.757,3084.443,3180.421,3211.974,3474.468 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3197.4 | 3084.4–3474.5 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1644.553,1564.218,1474.566,1444.390,1424.294,1434.032,1441.038 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1444.4 | 1424.3–1644.6 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 608.154,603.759,604.385,612.641,602.539,611.311,622.730 -->
| prost (binary) | mixed | encode | 954 | 20000 | 608.2 | 602.5–622.7 | 149207284 |
<!-- samples | serde_json | floats | decode | 7321.367,7483.962,7348.449,7512.312,7750.617,7780.783,7784.432 -->
| serde_json | floats | decode | 1581 | 2000 | 7512.3 | 7321.4–7784.4 | 3825000 |
<!-- samples | serde_json | floats | encode | 10145.933,10640.735,10101.339,9889.685,9840.207,10060.898,10062.788 -->
| serde_json | floats | encode | 1581 | 2000 | 10062.8 | 9840.2–10640.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 8752.661,8850.369,8423.654,8268.114,8401.849,8322.417,8375.067 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8401.8 | 8268.1–8850.4 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 15641.400,15623.922,15612.561,15938.693,16648.186,17267.002,16391.942 -->
| sonic-rs | floats | encode | 1581 | 2000 | 15938.7 | 15612.6–17267.0 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 1268.581,1252.113,1255.639,1246.838,1239.517,1224.184,1206.790 -->
| prost (binary) | floats | decode | 2051 | 2000 | 1246.8 | 1206.8–1268.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 444.231,435.767,416.055,413.647,419.885,418.755,420.029 -->
| prost (binary) | floats | encode | 2051 | 2000 | 419.9 | 413.6–444.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 23153.412,22825.343,22149.771,23015.978,23197.198,23029.108,24571.463 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 23029.1 | 22149.8–24571.5 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 10667.558,10425.738,10148.669,9719.192,9605.658,9672.494,9711.958 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9719.2 | 9605.7–10667.6 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 17456.654,19437.739,17167.162,17162.301,17961.096,20152.539,21238.635 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 17961.1 | 17162.3–21238.6 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 35554.460,67133.374,24875.230,19053.089,17176.140,17253.062,17216.706 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 19053.1 | 17176.1–67133.4 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 1198.547,898.364,899.763,858.093,820.080,912.255,822.330 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 898.4 | 820.1–1198.5 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 416.113,415.885,414.863,413.845,417.349,419.517,414.548 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 415.9 | 413.8–419.5 | 32664305 |
<!-- samples | serde_json | text-short | decode | 169.492,173.120,173.010,184.505,188.522,184.371,190.550 -->
| serde_json | text-short | decode | 97 | 200000 | 184.4 | 169.5–190.6 | 149907000 |
<!-- samples | serde_json | text-short | encode | 126.114,122.442,124.185,115.134,114.334,113.779,114.424 -->
| serde_json | text-short | encode | 97 | 200000 | 115.1 | 113.8–126.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 243.007,225.776,234.377,227.432,223.323,220.049,215.289 -->
| sonic-rs | text-short | decode | 97 | 200000 | 225.8 | 215.3–243.0 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 155.736,147.742,145.274,152.920,154.831,154.439,154.605 -->
| sonic-rs | text-short | encode | 97 | 200000 | 154.4 | 145.3–155.7 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 64.512,64.338,64.458,63.276,61.326,64.218,64.526 -->
| prost (binary) | text-short | decode | 70 | 200000 | 64.3 | 61.3–64.5 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 35.517,35.454,35.562,36.113,35.848,35.375,35.392 -->
| prost (binary) | text-short | encode | 70 | 200000 | 35.5 | 35.4–36.1 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3416.023,3352.826,3345.061,3326.579,3390.714,3305.030,3365.287 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3352.8 | 3305.0–3416.0 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 6050.431,5734.594,5697.413,5808.030,5952.382,6036.983,6053.700 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5952.4 | 5697.4–6053.7 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2825.125,2873.905,2862.949,2843.234,2851.851,2857.537,2926.948 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2857.5 | 2825.1–2926.9 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 775.590,783.081,770.766,778.891,770.650,775.562,773.430 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 775.6 | 770.7–783.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 796.559,796.044,807.486,812.551,803.603,805.328,782.487 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 803.6 | 782.5–812.6 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 407.577,405.610,402.349,408.603,406.900,408.293,410.295 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 407.6 | 402.3–410.3 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2379.133,2352.735,2371.606,2364.814,2299.878,2214.294,2227.385 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2352.7 | 2214.3–2379.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5455.770,5512.832,5455.547,5545.648,5635.336,5565.609,5633.712 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5545.6 | 5455.5–5635.3 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1970.189,1941.193,2007.585,1957.331,1957.281,1941.046,1929.291 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1957.3 | 1929.3–2007.6 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 749.792,756.877,749.421,740.861,809.163,751.501,740.905 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 749.8 | 740.9–809.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 774.270,771.746,781.222,780.048,790.037,796.216,768.924 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 780.0 | 768.9–796.2 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 461.420,417.664,417.820,416.019,412.477,412.841,408.615 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 416.0 | 408.6–461.4 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 31173.010,28206.769,27735.833,25684.960,24685.605,24268.753,26196.175 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 26196.2 | 24268.8–31173.0 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 11021.488,10732.007,10972.013,11003.556,11020.504,11864.949,11625.013 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 11020.5 | 10732.0–11864.9 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 23298.389,23528.766,24368.869,25317.336,24391.217,22983.048,24482.273 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 24368.9 | 22983.0–25317.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 9232.782,9103.334,9033.145,9107.334,9076.184,9143.465,9345.504 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 9107.3 | 9033.1–9345.5 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 10838.594,10045.587,9445.482,9517.162,9501.787,9477.344,9442.306 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 9501.8 | 9442.3–10838.6 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 346.363,348.977,344.548,350.704,346.947,341.391,346.882 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 346.9 | 341.4–350.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 891.231,884.640,858.941,822.611,833.265,831.661,787.043 -->
| serde_json | wide | decode | 135 | 40000 | 833.3 | 787.0–891.2 | 33720000 |
<!-- samples | serde_json | wide | encode | 394.582,391.980,400.166,402.142,406.667,399.464,412.016 -->
| serde_json | wide | encode | 135 | 40000 | 400.2 | 392.0–412.0 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 953.972,971.722,1024.778,1071.098,1039.483,1009.426,1016.752 -->
| sonic-rs | wide | decode | 135 | 40000 | 1016.8 | 954.0–1071.1 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 467.338,450.575,457.372,463.293,442.215,466.500,469.308 -->
| sonic-rs | wide | encode | 135 | 40000 | 463.3 | 442.2–469.3 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 155.848,155.600,158.090,154.098,146.384,147.236,144.115 -->
| prost (binary) | wide | decode | 31 | 40000 | 154.1 | 144.1–158.1 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 141.833,142.048,142.873,141.126,142.237,142.569,142.869 -->
| prost (binary) | wide | encode | 31 | 40000 | 142.2 | 141.1–142.9 | 19595809 |
