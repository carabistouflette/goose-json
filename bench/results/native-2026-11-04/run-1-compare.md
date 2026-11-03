| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 343.508,315.027,309.698,309.035,332.745,326.662,321.357 -->
| serde_json | plain | decode | 38 | 200000 | 321.4 | 309.0–343.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 141.637,137.455,139.529,141.269,147.747,135.918,159.139 -->
| serde_json | plain | encode | 38 | 200000 | 141.3 | 135.9–159.1 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 334.188,355.051,363.241,353.254,334.937,344.212,356.821 -->
| sonic-rs | plain | decode | 38 | 200000 | 353.3 | 334.2–363.2 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 160.719,148.405,150.309,141.970,162.337,151.144,147.574 -->
| sonic-rs | plain | encode | 38 | 200000 | 150.3 | 142.0–162.3 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 133.200,122.229,122.019,121.790,122.113,121.637,134.139 -->
| prost (binary) | plain | decode | 11 | 200000 | 122.1 | 121.6–134.1 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 93.021,73.409,99.184,79.059,98.254,79.487,98.527 -->
| prost (binary) | plain | encode | 11 | 200000 | 93.0 | 73.4–99.2 | 92719942 |
<!-- samples | serde_json | escaped | decode | 647.067,679.148,651.665,622.277,619.083,646.592,652.239 -->
| serde_json | escaped | decode | 62 | 200000 | 647.1 | 619.1–679.1 | 85461000 |
<!-- samples | serde_json | escaped | encode | 192.129,194.003,172.802,188.825,181.006,184.021,184.407 -->
| serde_json | escaped | encode | 54 | 200000 | 184.4 | 172.8–194.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 623.502,649.377,642.333,634.991,637.237,622.435,665.837 -->
| sonic-rs | escaped | decode | 62 | 200000 | 637.2 | 622.4–665.8 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 292.668,308.972,289.517,320.702,304.377,311.798,295.342 -->
| sonic-rs | escaped | encode | 54 | 200000 | 304.4 | 289.5–320.7 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 150.137,155.067,151.551,151.465,145.161,155.025,146.775 -->
| prost (binary) | escaped | decode | 24 | 200000 | 151.5 | 145.2–155.1 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 84.522,73.679,78.245,83.922,74.969,66.815,78.189 -->
| prost (binary) | escaped | encode | 24 | 200000 | 78.2 | 66.8–84.5 | 181133323 |
<!-- samples | serde_json | array | decode | 34891.268,46257.682,46802.621,48400.190,47795.703,50898.842,55718.840 -->
| serde_json | array | decode | 4022 | 20000 | 47795.7 | 34891.3–55718.8 | 288627000 |
<!-- samples | serde_json | array | encode | 27132.767,25884.065,28177.333,30450.814,28644.043,24262.176,23816.026 -->
| serde_json | array | encode | 4022 | 20000 | 27132.8 | 23816.0–30450.8 | 574225548 |
<!-- samples | sonic-rs | array | decode | 49782.859,40200.291,34591.133,21674.587,17826.997,16845.236,17170.613 -->
| sonic-rs | array | decode | 4022 | 20000 | 21674.6 | 16845.2–49782.9 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8321.251,7756.312,7647.851,7813.848,7781.632,7652.609,7688.663 -->
| sonic-rs | array | encode | 4022 | 20000 | 7756.3 | 7647.9–8321.3 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4340.903,4535.553,4484.944,4486.779,4551.082,4569.300,4432.949 -->
| prost (binary) | array | decode | 1923 | 20000 | 4486.8 | 4340.9–4569.3 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6560.104,6641.237,6694.698,6723.626,6814.809,7179.653,7509.702 -->
| prost (binary) | array | encode | 1923 | 20000 | 6723.6 | 6560.1–7509.7 | 284551620 |
<!-- samples | serde_json | floats | decode | 7548.835,7540.618,7430.050,7572.995,7328.115,7191.767,7236.457 -->
| serde_json | floats | decode | 1581 | 2000 | 7430.0 | 7191.8–7573.0 | 3825000 |
<!-- samples | serde_json | floats | encode | 9872.794,9888.782,9874.402,9628.718,9790.229,9552.521,9721.073 -->
| serde_json | floats | encode | 1581 | 2000 | 9790.2 | 9552.5–9888.8 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7139.914,7129.180,7104.123,7196.900,7060.215,7502.444,7190.196 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7139.9 | 7060.2–7502.4 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10457.024,10341.853,10463.866,10447.499,10555.368,10513.825,10525.010 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10463.9 | 10341.9–10555.4 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 796.061,762.815,650.298,668.175,1002.554,705.793,802.840 -->
| prost (binary) | floats | decode | 2051 | 2000 | 762.8 | 650.3–1002.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 547.513,709.903,524.744,547.695,546.684,546.544,546.856 -->
| prost (binary) | floats | encode | 2051 | 2000 | 546.9 | 524.7–709.9 | 31234057 |
<!-- samples | serde_json | text-ascii | decode | 2174.718,2285.357,2330.249,2108.844,2354.124,2341.496,2201.168 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2285.4 | 2108.8–2354.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4701.450,4807.658,4613.510,4442.444,4744.129,4678.225,4439.773 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4678.2 | 4439.8–4807.7 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1139.978,1017.516,1013.444,1202.433,1069.930,1107.400,1081.382 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1081.4 | 1013.4–1202.4 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 564.803,565.865,587.809,563.707,562.435,714.965,567.661 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 565.9 | 562.4–715.0 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 516.091,517.593,516.197,512.100,647.092,504.500,501.249 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 516.1 | 501.2–647.1 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 170.768,171.056,181.382,182.218,184.061,182.325,180.535 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 181.4 | 170.8–184.1 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 23233.769,24012.018,23603.973,23625.454,24088.669,23999.519,24443.689 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23999.5 | 23233.8–24443.7 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 13256.239,14181.155,14204.908,14041.433,13671.244,13740.579,14062.129 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 14041.4 | 13256.2–14204.9 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13689.537,13239.122,13617.094,14000.239,13119.510,13190.397,13324.762 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13324.8 | 13119.5–14000.2 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8423.191,8763.208,8386.888,8315.699,8381.240,8326.449,8151.088 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8381.2 | 8151.1–8763.2 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8671.834,8230.974,8033.326,8323.654,8065.669,7892.139,8242.161 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8231.0 | 7892.1–8671.8 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 180.245,160.376,163.114,156.311,157.641,160.423,316.291 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 160.4 | 156.3–316.3 | 101649504 |
<!-- samples | serde_json | wide | decode | 1567.090,1655.434,1653.067,1639.188,1586.695,1587.367,1556.683 -->
| serde_json | wide | decode | 135 | 40000 | 1587.4 | 1556.7–1655.4 | 33720000 |
<!-- samples | serde_json | wide | encode | 419.732,435.567,402.775,431.379,419.851,417.719,421.462 -->
| serde_json | wide | encode | 135 | 40000 | 419.9 | 402.8–435.6 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 946.289,949.697,926.275,947.095,970.377,963.651,964.076 -->
| sonic-rs | wide | decode | 135 | 40000 | 949.7 | 926.3–970.4 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 413.547,417.146,398.048,410.565,391.863,417.861,409.074 -->
| sonic-rs | wide | encode | 135 | 40000 | 410.6 | 391.9–417.9 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 137.235,134.046,138.818,134.328,140.768,142.569,139.291 -->
| prost (binary) | wide | decode | 31 | 40000 | 138.8 | 134.0–142.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 152.304,187.538,132.208,162.441,154.168,142.551,141.113 -->
| prost (binary) | wide | encode | 31 | 40000 | 152.3 | 132.2–187.5 | 19595809 |
