| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 174.417,174.686,194.188,203.834,202.762,188.677,173.703 -->
| serde_json | plain | decode | 38 | 200000 | 188.7 | 173.7–203.8 | 67248000 |
<!-- samples | serde_json | plain | encode | 75.276,72.056,68.812,69.976,69.749,69.234,68.914 -->
| serde_json | plain | encode | 38 | 200000 | 69.7 | 68.8–75.3 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 169.656,171.260,172.400,171.201,172.335,172.406,179.975 -->
| sonic-rs | plain | decode | 38 | 200000 | 172.3 | 169.7–180.0 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 74.602,72.187,72.081,73.073,74.056,74.019,77.251 -->
| sonic-rs | plain | encode | 38 | 200000 | 74.0 | 72.1–77.3 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 62.373,61.287,62.487,60.217,59.998,60.480,62.111 -->
| prost (binary) | plain | decode | 11 | 200000 | 61.3 | 60.0–62.5 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 41.654,43.758,41.485,42.038,42.369,42.140,42.777 -->
| prost (binary) | plain | encode | 11 | 200000 | 42.1 | 41.5–43.8 | 92719942 |
<!-- samples | serde_json | escaped | decode | 327.942,317.210,315.912,314.967,309.890,294.821,292.946 -->
| serde_json | escaped | decode | 62 | 200000 | 315.0 | 292.9–327.9 | 85461000 |
<!-- samples | serde_json | escaped | encode | 89.831,95.694,97.615,95.332,91.803,97.972,98.111 -->
| serde_json | escaped | encode | 54 | 200000 | 95.7 | 89.8–98.1 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 305.743,304.791,306.472,311.746,319.960,317.277,306.503 -->
| sonic-rs | escaped | decode | 62 | 200000 | 306.5 | 304.8–320.0 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 146.421,141.390,150.361,146.487,153.427,147.914,155.349 -->
| sonic-rs | escaped | encode | 54 | 200000 | 147.9 | 141.4–155.3 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 73.855,75.500,74.029,78.788,74.770,75.544,73.376 -->
| prost (binary) | escaped | decode | 24 | 200000 | 74.8 | 73.4–78.8 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 37.427,34.458,34.803,33.400,31.873,34.920,35.420 -->
| prost (binary) | escaped | encode | 24 | 200000 | 34.8 | 31.9–37.4 | 181133323 |
<!-- samples | serde_json | array | decode | 15638.158,15781.691,15570.848,15477.641,15222.103,15695.666,15537.066 -->
| serde_json | array | decode | 4022 | 20000 | 15570.8 | 15222.1–15781.7 | 288627000 |
<!-- samples | serde_json | array | encode | 8408.149,8387.461,8437.518,8500.772,8689.352,8458.894,8485.251 -->
| serde_json | array | encode | 4022 | 20000 | 8458.9 | 8387.5–8689.4 | 574225548 |
<!-- samples | sonic-rs | array | decode | 17845.147,17674.789,17922.471,17916.574,17455.879,18350.703,18224.869 -->
| sonic-rs | array | decode | 4022 | 20000 | 17916.6 | 17455.9–18350.7 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8726.407,8625.415,8567.803,8568.406,8546.818,8569.289,8551.802 -->
| sonic-rs | array | encode | 4022 | 20000 | 8568.4 | 8546.8–8726.4 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4867.836,4813.299,4908.461,4911.775,4894.530,5115.151,4929.235 -->
| prost (binary) | array | decode | 1923 | 20000 | 4908.5 | 4813.3–5115.2 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7598.440,7549.579,7670.552,8260.270,7405.575,7384.780,7213.096 -->
| prost (binary) | array | encode | 1923 | 20000 | 7549.6 | 7213.1–8260.3 | 284551620 |
<!-- samples | serde_json | floats | decode | 7560.306,7394.095,7449.315,7331.894,7425.493,7417.267,7647.234 -->
| serde_json | floats | decode | 1581 | 2000 | 7425.5 | 7331.9–7647.2 | 3825000 |
<!-- samples | serde_json | floats | encode | 11147.669,11414.377,11540.336,11546.148,11638.836,11680.947,11695.023 -->
| serde_json | floats | encode | 1581 | 2000 | 11546.1 | 11147.7–11695.0 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7378.886,7425.528,7450.668,7316.675,7399.409,7400.589,7335.541 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7399.4 | 7316.7–7450.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 21657.885,21680.360,21817.405,18585.689,10632.961,10561.217,10618.218 -->
| sonic-rs | floats | encode | 1581 | 2000 | 18585.7 | 10561.2–21817.4 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 898.173,815.763,921.556,1013.341,800.223,822.428,880.244 -->
| prost (binary) | floats | decode | 2051 | 2000 | 880.2 | 800.2–1013.3 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 581.971,583.325,584.240,582.083,553.186,546.130,545.683 -->
| prost (binary) | floats | encode | 2051 | 2000 | 582.0 | 545.7–584.2 | 31234057 |
<!-- samples | serde_json | text-ascii | decode | 2190.368,2182.650,2214.203,2245.780,2330.829,2318.990,2209.159 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2214.2 | 2182.7–2330.8 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4732.437,4829.145,4958.002,4956.334,4814.578,4934.543,4838.361 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4838.4 | 4732.4–4958.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1157.979,1158.271,1141.928,1114.193,1167.047,1113.749,1129.892 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1141.9 | 1113.7–1167.0 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 600.990,616.737,619.707,606.173,605.403,598.219,601.379 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 605.4 | 598.2–619.7 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 510.700,505.945,529.251,540.043,539.503,541.056,529.797 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 529.8 | 505.9–541.1 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 182.236,183.285,192.532,194.677,190.620,197.012,189.766 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 190.6 | 182.2–197.0 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 24592.610,24100.336,22809.534,22770.991,23559.886,23972.855,24158.739 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23972.9 | 22771.0–24592.6 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 13981.844,14785.026,15134.293,14657.413,13197.230,12965.593,13129.145 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 13981.8 | 12965.6–15134.3 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13728.119,13353.855,13574.355,13392.013,13722.210,13625.733,13531.166 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13574.4 | 13353.9–13728.1 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8598.263,8483.525,8617.656,8461.486,8523.556,8736.458,7950.239 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8523.6 | 7950.2–8736.5 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8486.342,8490.216,8473.290,8361.410,8570.574,7831.449,7934.721 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8473.3 | 7831.4–8570.6 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 178.850,157.774,157.800,158.472,157.802,157.966,158.633 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 158.0 | 157.8–178.8 | 101649504 |
<!-- samples | serde_json | wide | decode | 1520.050,1484.463,1557.389,1603.992,1609.843,1520.393,1514.660 -->
| serde_json | wide | decode | 135 | 40000 | 1520.4 | 1484.5–1609.8 | 33720000 |
<!-- samples | serde_json | wide | encode | 443.671,431.291,437.381,417.858,430.220,432.419,438.373 -->
| serde_json | wide | encode | 135 | 40000 | 432.4 | 417.9–443.7 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 974.560,1000.631,1002.405,981.566,982.843,1005.610,979.247 -->
| sonic-rs | wide | decode | 135 | 40000 | 982.8 | 974.6–1005.6 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 423.210,413.286,416.768,424.457,439.237,453.877,425.005 -->
| sonic-rs | wide | encode | 135 | 40000 | 424.5 | 413.3–453.9 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 143.554,149.294,145.231,143.941,137.393,141.068,140.332 -->
| prost (binary) | wide | decode | 31 | 40000 | 143.6 | 137.4–149.3 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 152.919,142.258,134.510,155.251,142.274,156.225,152.123 -->
| prost (binary) | wide | encode | 31 | 40000 | 152.1 | 134.5–156.2 | 19595809 |
