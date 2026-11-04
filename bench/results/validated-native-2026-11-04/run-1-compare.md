| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 164.395,158.290,164.483,165.275,158.058,165.232,164.101 -->
| serde_json | plain | decode | 38 | 200000 | 164.4 | 158.1–165.3 | 67248000 |
<!-- samples | serde_json | plain | encode | 72.765,69.538,72.863,71.962,70.200,70.400,70.105 -->
| serde_json | plain | encode | 38 | 200000 | 70.4 | 69.5–72.9 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 176.372,170.963,167.824,169.437,172.173,174.829,168.275 -->
| sonic-rs | plain | decode | 38 | 200000 | 171.0 | 167.8–176.4 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 70.647,70.374,70.151,66.216,68.237,68.544,65.723 -->
| sonic-rs | plain | encode | 38 | 200000 | 68.5 | 65.7–70.6 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 56.636,55.092,59.165,57.234,55.055,54.674,55.096 -->
| prost (binary) | plain | decode | 11 | 200000 | 55.1 | 54.7–59.2 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 39.892,39.449,39.875,39.903,39.231,39.035,39.643 -->
| prost (binary) | plain | encode | 11 | 200000 | 39.6 | 39.0–39.9 | 92719942 |
<!-- samples | serde_json | escaped | decode | 299.454,306.191,324.288,319.200,310.272,309.553,305.149 -->
| serde_json | escaped | decode | 62 | 200000 | 309.6 | 299.5–324.3 | 85461000 |
<!-- samples | serde_json | escaped | encode | 95.798,95.280,95.246,91.233,91.270,91.876,88.144 -->
| serde_json | escaped | encode | 54 | 200000 | 91.9 | 88.1–95.8 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 297.486,282.914,288.784,300.807,307.184,301.757,289.857 -->
| sonic-rs | escaped | decode | 62 | 200000 | 297.5 | 282.9–307.2 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 132.261,139.452,129.449,129.307,129.707,130.840,132.659 -->
| sonic-rs | escaped | encode | 54 | 200000 | 130.8 | 129.3–139.5 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 64.325,62.137,58.167,58.669,57.574,64.219,67.390 -->
| prost (binary) | escaped | decode | 24 | 200000 | 62.1 | 57.6–67.4 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.372,31.617,32.829,36.781,36.529,33.668,35.873 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.7 | 31.6–36.8 | 181133323 |
<!-- samples | serde_json | array | decode | 15458.909,14988.027,15308.076,15426.417,15992.970,15052.766,15256.832 -->
| serde_json | array | decode | 4022 | 20000 | 15308.1 | 14988.0–15993.0 | 288627000 |
<!-- samples | serde_json | array | encode | 7866.749,7858.712,7858.995,7882.731,7878.898,7910.382,7905.783 -->
| serde_json | array | encode | 4022 | 20000 | 7878.9 | 7858.7–7910.4 | 574225548 |
<!-- samples | sonic-rs | array | decode | 17224.666,17246.043,17181.971,17177.707,17208.192,17017.145,17117.365 -->
| sonic-rs | array | decode | 4022 | 20000 | 17182.0 | 17017.1–17246.0 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7939.315,7862.427,7891.128,7884.210,7889.102,7821.168,7969.944 -->
| sonic-rs | array | encode | 4022 | 20000 | 7889.1 | 7821.2–7969.9 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4739.703,4717.334,4700.477,4713.360,4585.712,4461.043,4441.377 -->
| prost (binary) | array | decode | 1923 | 20000 | 4700.5 | 4441.4–4739.7 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6610.708,6707.609,6663.349,6711.863,6933.889,6919.350,6889.970 -->
| prost (binary) | array | encode | 1923 | 20000 | 6711.9 | 6610.7–6933.9 | 284551620 |
<!-- samples | serde_json | floats | decode | 6830.008,6925.030,6887.395,6994.664,7272.024,6830.657,6889.436 -->
| serde_json | floats | decode | 1581 | 2000 | 6889.4 | 6830.0–7272.0 | 3825000 |
<!-- samples | serde_json | floats | encode | 9602.547,9574.865,9570.025,9568.641,9584.801,9585.342,9640.631 -->
| serde_json | floats | encode | 1581 | 2000 | 9584.8 | 9568.6–9640.6 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 6801.589,6885.221,6820.123,6783.215,6780.517,6873.962,6745.814 -->
| sonic-rs | floats | decode | 1581 | 2000 | 6801.6 | 6745.8–6885.2 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10083.102,10008.413,10003.718,10108.977,10064.833,10138.097,10019.713 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10064.8 | 10003.7–10138.1 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 739.125,780.682,800.535,780.146,729.508,946.359,732.519 -->
| prost (binary) | floats | decode | 2051 | 2000 | 780.1 | 729.5–946.4 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 547.733,545.172,544.482,544.078,544.642,550.130,580.963 -->
| prost (binary) | floats | encode | 2051 | 2000 | 545.2 | 544.1–581.0 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 22188.972,21984.952,22186.701,21944.637,22960.847,22569.317,22153.626 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22186.7 | 21944.6–22960.8 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 10381.733,10482.267,10390.887,10394.477,10439.342,10418.621,11020.976 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 10418.6 | 10381.7–11021.0 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16906.164,16568.753,17718.268,17591.709,16790.919,16991.172,16424.335 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16906.2 | 16424.3–17718.3 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9630.015,9628.142,9650.439,9582.137,9694.096,9503.770,9583.194 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9628.1 | 9503.8–9694.1 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 736.765,754.653,907.609,749.894,770.570,826.337,991.515 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 770.6 | 736.8–991.5 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 544.609,543.831,547.034,544.520,549.448,571.282,569.098 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 547.0 | 543.8–571.3 | 32664305 |
<!-- samples | serde_json | text-short | decode | 175.671,175.287,175.246,173.948,174.697,174.397,178.585 -->
| serde_json | text-short | decode | 97 | 200000 | 175.2 | 173.9–178.6 | 149907000 |
<!-- samples | serde_json | text-short | encode | 133.074,132.703,133.002,133.238,129.290,125.982,126.280 -->
| serde_json | text-short | encode | 97 | 200000 | 132.7 | 126.0–133.2 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 191.306,188.954,189.420,190.789,188.930,190.191,189.178 -->
| sonic-rs | text-short | decode | 97 | 200000 | 189.4 | 188.9–191.3 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 129.816,129.440,134.981,130.373,128.252,130.354,130.336 -->
| sonic-rs | text-short | encode | 97 | 200000 | 130.3 | 128.3–135.0 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 62.335,63.836,62.000,60.755,60.506,62.543,63.323 -->
| prost (binary) | text-short | decode | 70 | 200000 | 62.3 | 60.5–63.8 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 40.442,40.906,41.084,40.452,40.236,40.675,40.312 -->
| prost (binary) | text-short | encode | 70 | 200000 | 40.5 | 40.2–41.1 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2777.715,2762.934,2762.762,2764.032,2763.538,2826.222,2764.401 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2764.0 | 2762.8–2826.2 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4796.053,4926.988,4786.481,4770.173,4808.217,4816.624,4848.057 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4808.2 | 4770.2–4927.0 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1668.258,1661.072,1765.628,1484.674,1503.876,1628.310,1547.145 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1628.3 | 1484.7–1765.6 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 640.409,628.745,643.167,670.620,681.237,683.620,679.067 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 670.6 | 628.7–683.6 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 553.799,551.702,551.295,539.856,519.568,520.702,518.429 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 539.9 | 518.4–553.8 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 182.512,185.318,182.011,183.073,185.857,180.121,181.551 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 182.5 | 180.1–185.9 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2287.733,2334.566,2210.014,2314.790,2328.133,2243.039,2312.107 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2312.1 | 2210.0–2334.6 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4664.444,4542.802,4517.514,4602.289,4648.242,4557.163,4628.185 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4602.3 | 4517.5–4664.4 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1095.014,1069.345,1072.456,1077.820,1069.326,1077.223,1061.690 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1072.5 | 1061.7–1095.0 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 541.907,542.094,541.798,540.024,548.552,542.150,541.166 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 541.9 | 540.0–548.6 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 509.155,509.538,508.693,507.638,507.334,505.923,508.507 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 508.5 | 505.9–509.5 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 181.686,183.940,179.892,182.952,181.547,180.110,183.630 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 181.7 | 179.9–183.9 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 22705.416,23179.930,23571.804,23332.149,23114.417,22809.883,23244.818 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23179.9 | 22705.4–23571.8 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12275.638,12623.147,12724.240,12813.712,13021.886,12777.238,12954.129 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12777.2 | 12275.6–13021.9 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 14376.706,14070.860,14191.841,14360.872,14411.558,13740.254,13099.921 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 14191.8 | 13099.9–14411.6 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8524.903,8477.513,8740.124,8642.222,8806.427,8681.373,8830.857 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8681.4 | 8477.5–8830.9 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8178.729,8528.177,8253.460,8054.162,8697.214,8638.313,8525.871 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8525.9 | 8054.2–8697.2 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 158.526,167.380,175.184,177.664,175.832,176.305,168.488 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 175.2 | 158.5–177.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 1596.468,1580.710,1579.179,1565.527,1563.188,1577.416,1552.933 -->
| serde_json | wide | decode | 135 | 40000 | 1577.4 | 1552.9–1596.5 | 33720000 |
<!-- samples | serde_json | wide | encode | 417.984,419.289,421.657,425.109,413.129,422.909,414.429 -->
| serde_json | wide | encode | 135 | 40000 | 419.3 | 413.1–425.1 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 967.090,966.761,983.334,991.769,976.031,992.813,991.180 -->
| sonic-rs | wide | decode | 135 | 40000 | 983.3 | 966.8–992.8 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 438.046,435.000,450.316,441.579,448.082,436.624,410.199 -->
| sonic-rs | wide | encode | 135 | 40000 | 438.0 | 410.2–450.3 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 140.635,139.477,136.989,136.273,137.304,134.252,137.703 -->
| prost (binary) | wide | decode | 31 | 40000 | 137.3 | 134.3–140.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 145.071,162.416,167.580,167.243,186.442,138.486,168.891 -->
| prost (binary) | wide | encode | 31 | 40000 | 167.2 | 138.5–186.4 | 19595809 |
