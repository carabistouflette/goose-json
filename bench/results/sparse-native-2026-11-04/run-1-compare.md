| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 174.931,174.463,207.906,173.747,170.870,171.343,176.493 -->
| serde_json | plain | decode | 38 | 200000 | 174.5 | 170.9–207.9 | 67248000 |
<!-- samples | serde_json | plain | encode | 79.083,77.045,78.992,78.376,78.374,78.234,77.632 -->
| serde_json | plain | encode | 38 | 200000 | 78.4 | 77.0–79.1 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 190.823,192.441,192.799,189.582,191.920,193.172,190.696 -->
| sonic-rs | plain | decode | 38 | 200000 | 191.9 | 189.6–193.2 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 77.751,76.199,77.799,75.790,79.013,78.815,78.626 -->
| sonic-rs | plain | encode | 38 | 200000 | 77.8 | 75.8–79.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 66.020,66.132,66.388,64.824,64.334,63.861,61.729 -->
| prost (binary) | plain | decode | 11 | 200000 | 64.8 | 61.7–66.4 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 39.662,42.051,42.036,41.224,39.535,42.125,42.035 -->
| prost (binary) | plain | encode | 11 | 200000 | 42.0 | 39.5–42.1 | 92719942 |
<!-- samples | serde_json | escaped | decode | 323.671,337.276,353.393,329.567,317.338,316.135,307.352 -->
| serde_json | escaped | decode | 62 | 200000 | 323.7 | 307.4–353.4 | 85461000 |
<!-- samples | serde_json | escaped | encode | 91.115,90.864,91.246,91.270,91.279,97.293,93.812 -->
| serde_json | escaped | encode | 54 | 200000 | 91.3 | 90.9–97.3 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 302.741,305.051,308.762,310.965,308.133,301.843,304.389 -->
| sonic-rs | escaped | decode | 62 | 200000 | 305.1 | 301.8–311.0 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 145.404,144.726,140.580,143.128,141.615,146.030,143.404 -->
| sonic-rs | escaped | encode | 54 | 200000 | 143.4 | 140.6–146.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 69.714,73.902,71.552,70.502,70.712,72.073,72.260 -->
| prost (binary) | escaped | decode | 24 | 200000 | 71.6 | 69.7–73.9 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.519,36.023,35.579,34.227,34.534,34.610,36.307 -->
| prost (binary) | escaped | encode | 24 | 200000 | 34.6 | 33.5–36.3 | 181133323 |
<!-- samples | serde_json | array | decode | 15147.105,15582.204,14988.462,15540.124,15833.040,15523.237,15329.391 -->
| serde_json | array | decode | 4022 | 20000 | 15523.2 | 14988.5–15833.0 | 288627000 |
<!-- samples | serde_json | array | encode | 8686.212,10880.437,7976.358,8309.350,8691.988,8839.694,8485.794 -->
| serde_json | array | encode | 4022 | 20000 | 8686.2 | 7976.4–10880.4 | 574225548 |
<!-- samples | sonic-rs | array | decode | 18724.583,18628.607,29793.561,18390.718,17563.434,17430.011,17221.454 -->
| sonic-rs | array | decode | 4022 | 20000 | 18390.7 | 17221.5–29793.6 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8004.262,8187.308,8356.235,8309.100,8032.239,8231.903,8339.098 -->
| sonic-rs | array | encode | 4022 | 20000 | 8231.9 | 8004.3–8356.2 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4800.946,4791.228,4792.415,4448.273,4515.729,4248.202,4151.143 -->
| prost (binary) | array | decode | 1923 | 20000 | 4515.7 | 4151.1–4800.9 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6889.470,6827.368,6965.354,7160.982,6928.999,7237.831,7098.539 -->
| prost (binary) | array | encode | 1923 | 20000 | 6965.4 | 6827.4–7237.8 | 284551620 |
<!-- samples | serde_json | floats | decode | 7191.347,6981.333,6760.435,6878.538,6696.377,6839.630,6742.479 -->
| serde_json | floats | decode | 1581 | 2000 | 6839.6 | 6696.4–7191.3 | 3825000 |
<!-- samples | serde_json | floats | encode | 9371.412,9537.885,10184.032,10043.271,9456.335,9810.038,9721.877 -->
| serde_json | floats | encode | 1581 | 2000 | 9721.9 | 9371.4–10184.0 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7114.322,6961.242,7274.407,7224.773,7410.555,7097.640,6843.495 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7114.3 | 6843.5–7410.6 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10624.186,10065.561,10021.577,9896.100,10275.347,10573.355,10684.264 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10275.3 | 9896.1–10684.3 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 843.166,993.658,947.631,886.763,945.043,1117.632,911.056 -->
| prost (binary) | floats | decode | 2051 | 2000 | 945.0 | 843.2–1117.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 623.476,583.956,568.725,592.139,616.594,603.260,578.738 -->
| prost (binary) | floats | encode | 2051 | 2000 | 592.1 | 568.7–623.5 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 23341.650,21927.536,21581.932,21517.410,22114.675,22528.146,22664.251 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22114.7 | 21517.4–23341.7 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9337.195,9572.367,9433.646,9424.252,9698.482,9805.091,9662.873 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9572.4 | 9337.2–9805.1 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 15545.010,15443.124,15366.994,15470.182,15672.275,15578.737,15991.998 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15545.0 | 15367.0–15992.0 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9801.745,10497.721,10126.190,9902.361,10333.859,10329.089,10565.176 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 10329.1 | 9801.7–10565.2 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 841.651,880.942,956.074,892.051,886.590,964.434,999.619 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 892.1 | 841.7–999.6 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 557.580,589.284,591.865,609.802,555.951,545.098,545.411 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 557.6 | 545.1–609.8 | 32664305 |
<!-- samples | serde_json | text-short | decode | 175.513,177.840,181.839,182.851,183.082,180.139,181.122 -->
| serde_json | text-short | decode | 97 | 200000 | 181.1 | 175.5–183.1 | 149907000 |
<!-- samples | serde_json | text-short | encode | 132.013,129.266,131.129,129.479,127.921,127.968,127.701 -->
| serde_json | text-short | encode | 97 | 200000 | 129.3 | 127.7–132.0 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 199.905,202.827,195.848,195.623,203.082,202.412,200.557 -->
| sonic-rs | text-short | decode | 97 | 200000 | 200.6 | 195.6–203.1 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 134.560,131.945,133.135,134.746,131.933,139.946,138.468 -->
| sonic-rs | text-short | encode | 97 | 200000 | 134.6 | 131.9–139.9 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 64.846,63.922,63.817,63.006,60.831,64.383,66.870 -->
| prost (binary) | text-short | decode | 70 | 200000 | 63.9 | 60.8–66.9 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 41.744,42.028,43.284,44.811,42.677,44.010,44.163 -->
| prost (binary) | text-short | encode | 70 | 200000 | 43.3 | 41.7–44.8 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3077.001,3038.010,2927.508,2907.248,2956.492,2940.271,2916.799 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2940.3 | 2907.2–3077.0 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5009.993,5120.791,5062.652,4991.244,5192.704,4937.880,5082.628 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5062.7 | 4937.9–5192.7 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1519.960,1631.133,1574.563,1653.294,1513.852,1653.585,1541.663 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1574.6 | 1513.9–1653.6 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 682.848,684.119,658.202,645.438,634.354,663.626,675.410 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 663.6 | 634.4–684.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 521.512,509.200,490.376,515.367,540.000,569.502,572.863 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 521.5 | 490.4–572.9 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 199.360,194.135,192.333,184.216,181.754,183.683,181.033 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 184.2 | 181.0–199.4 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2174.581,2288.025,2135.452,2199.959,2142.533,2266.347,2344.930 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2200.0 | 2135.5–2344.9 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4580.864,4392.237,4633.055,4569.755,4602.328,4750.959,4509.739 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4580.9 | 4392.2–4751.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1027.043,1076.778,1150.875,1110.805,1096.439,1111.366,1072.379 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1096.4 | 1027.0–1150.9 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 511.511,537.394,557.432,561.433,563.233,512.909,515.279 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 537.4 | 511.5–563.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 500.999,517.960,522.890,517.972,500.358,479.608,467.338 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 501.0 | 467.3–522.9 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 160.845,176.770,176.984,176.696,177.400,177.124,177.030 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 177.0 | 160.8–177.4 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 22728.576,22948.713,24439.336,24167.471,23584.232,23942.120,22787.289 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23584.2 | 22728.6–24439.3 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12207.163,12241.066,12016.604,11921.296,12315.156,12099.231,11914.639 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12099.2 | 11914.6–12315.2 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13262.567,13673.632,13814.909,13547.591,13874.025,13459.156,13737.317 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13673.6 | 13262.6–13874.0 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8704.427,8786.129,8633.655,8715.684,8705.308,8708.951,8647.609 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8705.3 | 8633.7–8786.1 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8490.335,8426.136,8280.883,7960.392,8090.052,8364.974,8052.390 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8280.9 | 7960.4–8490.3 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 168.292,150.227,164.502,152.669,166.592,167.373,158.960 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 164.5 | 150.2–168.3 | 101649504 |
<!-- samples | serde_json | wide | decode | 1461.959,1541.450,1534.345,1566.295,1568.542,1564.524,1565.960 -->
| serde_json | wide | decode | 135 | 40000 | 1564.5 | 1462.0–1568.5 | 33720000 |
<!-- samples | serde_json | wide | encode | 442.713,427.777,426.275,442.632,435.844,452.344,447.410 -->
| serde_json | wide | encode | 135 | 40000 | 442.6 | 426.3–452.3 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1030.127,1024.063,1001.067,1013.736,1016.900,1017.288,1019.211 -->
| sonic-rs | wide | decode | 135 | 40000 | 1017.3 | 1001.1–1030.1 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 474.475,494.369,496.665,494.540,496.891,493.565,489.610 -->
| sonic-rs | wide | encode | 135 | 40000 | 494.4 | 474.5–496.9 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 167.002,166.728,157.998,151.094,151.255,152.516,144.037 -->
| prost (binary) | wide | decode | 31 | 40000 | 152.5 | 144.0–167.0 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 133.337,174.981,167.322,139.481,163.885,154.284,142.373 -->
| prost (binary) | wide | encode | 31 | 40000 | 154.3 | 133.3–175.0 | 19595809 |
