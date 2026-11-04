| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 165.108,157.419,154.790,153.018,159.189,154.849,145.532 -->
| serde_json | plain | decode | 38 | 100000 | 154.8 | 145.5–165.1 | 33648000 |
<!-- samples | serde_json | plain | encode | 65.290,67.785,67.664,67.485,64.294,63.240,60.729 -->
| serde_json | plain | encode | 38 | 100000 | 65.3 | 60.7–67.8 | 83806357 |
<!-- samples | sonic-rs | plain | decode | 138.688,141.834,150.927,154.028,155.121,151.658,155.637 -->
| sonic-rs | plain | decode | 38 | 100000 | 151.7 | 138.7–155.6 | 33648000 |
<!-- samples | sonic-rs | plain | encode | 64.740,66.551,65.795,61.552,55.474,62.055,65.918 -->
| sonic-rs | plain | encode | 38 | 100000 | 64.7 | 55.5–66.6 | 83806357 |
<!-- samples | prost (binary) | plain | decode | 55.808,53.986,53.538,48.879,48.577,54.355,52.853 -->
| prost (binary) | plain | decode | 11 | 100000 | 53.5 | 48.6–55.8 | 33648000 |
<!-- samples | prost (binary) | plain | encode | 37.018,35.449,31.845,33.504,36.619,35.119,36.605 -->
| prost (binary) | plain | encode | 11 | 100000 | 35.4 | 31.8–37.0 | 46393088 |
<!-- samples | serde_json | escaped | decode | 247.248,260.950,296.514,299.084,296.575,282.557,282.930 -->
| serde_json | escaped | decode | 62 | 100000 | 282.9 | 247.2–299.1 | 42761000 |
<!-- samples | serde_json | escaped | encode | 89.002,87.111,84.471,77.186,88.501,86.191,91.046 -->
| serde_json | escaped | encode | 54 | 100000 | 87.1 | 77.2–91.0 | 107718681 |
<!-- samples | sonic-rs | escaped | decode | 297.662,302.582,302.301,304.798,300.307,281.515,299.562 -->
| sonic-rs | escaped | decode | 62 | 100000 | 300.3 | 281.5–304.8 | 42761000 |
<!-- samples | sonic-rs | escaped | encode | 142.064,133.116,134.023,139.820,143.074,145.609,143.099 -->
| sonic-rs | escaped | encode | 54 | 100000 | 142.1 | 133.1–145.6 | 107718681 |
<!-- samples | prost (binary) | escaped | decode | 67.863,68.021,70.502,68.050,66.476,66.438,64.673 -->
| prost (binary) | escaped | decode | 24 | 100000 | 67.9 | 64.7–70.5 | 42761000 |
<!-- samples | prost (binary) | escaped | encode | 29.006,29.047,30.612,31.706,30.794,28.472,35.598 -->
| prost (binary) | escaped | encode | 24 | 100000 | 30.6 | 28.5–35.6 | 90629805 |
<!-- samples | serde_json | array | decode | 13831.272,13759.665,14822.490,14803.350,14108.610,13114.637,13647.040 -->
| serde_json | array | decode | 4022 | 10000 | 13831.3 | 13114.6–14822.5 | 145337000 |
<!-- samples | serde_json | array | encode | 7587.087,7525.739,7615.961,7862.596,7956.502,7701.566,7956.985 -->
| serde_json | array | encode | 4022 | 10000 | 7701.6 | 7525.7–7957.0 | 289142183 |
<!-- samples | sonic-rs | array | decode | 15699.962,16535.283,16140.750,15673.586,15048.626,16765.785,16706.115 -->
| sonic-rs | array | decode | 4022 | 10000 | 16140.8 | 15048.6–16765.8 | 145337000 |
<!-- samples | sonic-rs | array | encode | 7604.223,8028.044,8003.519,7894.687,8157.880,7967.153,7833.506 -->
| sonic-rs | array | encode | 4022 | 10000 | 7967.2 | 7604.2–8157.9 | 289142183 |
<!-- samples | prost (binary) | array | decode | 4457.323,4431.601,4388.527,4407.494,4454.805,4459.053,4462.043 -->
| prost (binary) | array | decode | 1923 | 10000 | 4454.8 | 4388.5–4462.0 | 145337000 |
<!-- samples | prost (binary) | array | encode | 7034.474,7070.400,7052.154,7211.765,7054.635,7030.797,7212.301 -->
| prost (binary) | array | encode | 1923 | 10000 | 7054.6 | 7030.8–7212.3 | 143272958 |
<!-- samples | serde_json | floats | decode | 7149.284,6977.712,7262.668,7204.155,7096.215,6950.630,7127.142 -->
| serde_json | floats | decode | 1581 | 1000 | 7127.1 | 6950.6–7262.7 | 2040000 |
<!-- samples | serde_json | floats | encode | 10110.378,10252.729,10147.592,10149.077,10002.303,10127.975,10078.296 -->
| serde_json | floats | encode | 1581 | 1000 | 10128.0 | 10002.3–10252.7 | 13042088 |
<!-- samples | sonic-rs | floats | decode | 6866.053,7159.832,7139.947,7221.320,7236.571,7371.287,6922.163 -->
| sonic-rs | floats | decode | 1581 | 1000 | 7159.8 | 6866.1–7371.3 | 2040000 |
<!-- samples | sonic-rs | floats | encode | 12198.182,12455.002,12406.823,12274.137,10037.768,10392.433,10382.731 -->
| sonic-rs | floats | encode | 1581 | 1000 | 12198.2 | 10037.8–12455.0 | 13042088 |
<!-- samples | prost (binary) | floats | decode | 839.363,917.275,962.256,1103.295,1025.569,820.835,761.959 -->
| prost (binary) | floats | decode | 2051 | 1000 | 917.3 | 762.0–1103.3 | 2040000 |
<!-- samples | prost (binary) | floats | encode | 550.416,543.143,548.021,543.101,549.134,542.832,546.276 -->
| prost (binary) | floats | encode | 2051 | 1000 | 546.3 | 542.8–550.4 | 16714104 |
<!-- samples | serde_json | floats-wide | decode | 22595.548,22494.722,22628.428,22810.306,22401.300,23170.359,22536.127 -->
| serde_json | floats-wide | decode | 5975 | 1000 | 22595.5 | 22401.3–23170.4 | 2136000 |
<!-- samples | serde_json | floats-wide | encode | 9659.960,9503.726,9557.378,9890.715,9840.590,9269.030,9842.452 -->
| serde_json | floats-wide | encode | 5971 | 1000 | 9660.0 | 9269.0–9890.7 | 48196792 |
<!-- samples | sonic-rs | floats-wide | decode | 16636.775,17154.721,16897.419,17161.548,16148.091,16579.152,16447.047 -->
| sonic-rs | floats-wide | decode | 5975 | 1000 | 16636.8 | 16148.1–17161.5 | 2136000 |
<!-- samples | sonic-rs | floats-wide | encode | 10295.285,10181.951,10323.487,10353.491,9804.408,10209.475,10132.683 -->
| sonic-rs | floats-wide | encode | 5971 | 1000 | 10209.5 | 9804.4–10353.5 | 48196792 |
<!-- samples | prost (binary) | floats-wide | decode | 798.473,838.694,982.349,1115.317,1091.010,773.194,814.974 -->
| prost (binary) | floats-wide | decode | 2051 | 1000 | 838.7 | 773.2–1115.3 | 2136000 |
<!-- samples | prost (binary) | floats-wide | encode | 549.306,547.679,542.948,551.494,584.749,578.829,585.137 -->
| prost (binary) | floats-wide | encode | 2051 | 1000 | 551.5 | 542.9–585.1 | 17415288 |
<!-- samples | serde_json | text-short | decode | 184.215,181.593,182.031,185.105,181.193,183.713,184.698 -->
| serde_json | text-short | decode | 97 | 100000 | 183.7 | 181.2–185.1 | 75007000 |
<!-- samples | serde_json | text-short | encode | 135.414,136.313,135.168,133.602,127.834,131.278,130.657 -->
| serde_json | text-short | encode | 97 | 100000 | 133.6 | 127.8–136.3 | 133196708 |
<!-- samples | sonic-rs | text-short | decode | 196.179,198.414,199.549,200.182,196.397,199.927,201.831 -->
| sonic-rs | text-short | decode | 97 | 100000 | 199.5 | 196.2–201.8 | 75007000 |
<!-- samples | sonic-rs | text-short | encode | 135.109,137.766,133.041,135.947,135.168,131.386,134.727 -->
| sonic-rs | text-short | encode | 97 | 100000 | 135.1 | 131.4–137.8 | 133196708 |
<!-- samples | prost (binary) | text-short | decode | 63.992,63.037,63.835,61.298,61.607,64.830,61.013 -->
| prost (binary) | text-short | decode | 70 | 100000 | 63.0 | 61.0–64.8 | 75007000 |
<!-- samples | prost (binary) | text-short | encode | 41.141,43.164,42.338,40.535,40.256,39.971,40.448 -->
| prost (binary) | text-short | encode | 70 | 100000 | 40.5 | 40.0–43.2 | 115052424 |
<!-- samples | serde_json | text-sparse | decode | 2833.647,2956.170,2954.170,2950.454,2887.201,2761.191,2767.515 -->
| serde_json | text-sparse | decode | 8233 | 1000 | 2887.2 | 2761.2–2956.2 | 65928000 |
<!-- samples | serde_json | text-sparse | encode | 4800.345,5104.093,4912.965,4779.637,4872.872,4799.033,5016.241 -->
| serde_json | text-sparse | encode | 8233 | 1000 | 4872.9 | 4779.6–5104.1 | 66662496 |
<!-- samples | sonic-rs | text-sparse | decode | 1494.746,1660.553,1623.375,1663.499,1830.111,1545.954,1631.004 -->
| sonic-rs | text-sparse | decode | 8233 | 1000 | 1631.0 | 1494.7–1830.1 | 65928000 |
<!-- samples | sonic-rs | text-sparse | encode | 678.306,672.191,663.848,636.898,634.444,636.262,636.429 -->
| sonic-rs | text-sparse | encode | 8233 | 1000 | 636.9 | 634.4–678.3 | 66662496 |
<!-- samples | prost (binary) | text-sparse | decode | 519.930,512.463,519.221,512.893,519.849,533.021,555.856 -->
| prost (binary) | text-sparse | decode | 8205 | 1000 | 519.8 | 512.5–555.9 | 65928000 |
<!-- samples | prost (binary) | text-sparse | encode | 194.645,191.276,197.269,195.060,191.442,192.214,193.946 -->
| prost (binary) | text-sparse | encode | 8205 | 1000 | 193.9 | 191.3–197.3 | 66440672 |
<!-- samples | serde_json | text-ascii | decode | 2245.395,2270.827,2347.245,2256.743,2330.757,2338.460,2195.758 -->
| serde_json | text-ascii | decode | 8225 | 1000 | 2270.8 | 2195.8–2347.2 | 65880000 |
<!-- samples | serde_json | text-ascii | encode | 4564.521,4523.688,4614.928,4572.932,4490.519,4627.689,4598.824 -->
| serde_json | text-ascii | encode | 8225 | 1000 | 4572.9 | 4490.5–4627.7 | 66598496 |
<!-- samples | sonic-rs | text-ascii | decode | 1061.291,1066.888,1069.277,1065.473,1064.236,1069.377,1129.667 -->
| sonic-rs | text-ascii | decode | 8225 | 1000 | 1066.9 | 1061.3–1129.7 | 65880000 |
<!-- samples | sonic-rs | text-ascii | encode | 542.099,549.751,541.958,547.925,542.205,548.332,543.381 -->
| sonic-rs | text-ascii | encode | 8225 | 1000 | 543.4 | 542.0–549.8 | 66598496 |
<!-- samples | prost (binary) | text-ascii | decode | 507.903,513.424,513.796,502.528,508.862,506.522,512.034 -->
| prost (binary) | text-ascii | decode | 8199 | 1000 | 508.9 | 502.5–513.8 | 65880000 |
<!-- samples | prost (binary) | text-ascii | encode | 182.623,195.616,191.902,203.125,192.879,190.229,183.935 -->
| prost (binary) | text-ascii | encode | 8199 | 1000 | 191.9 | 182.6–203.1 | 66392624 |
<!-- samples | serde_json | text-escaped | decode | 22876.112,23256.267,24433.517,23681.073,23774.460,22726.204,22987.406 -->
| serde_json | text-escaped | decode | 8737 | 1000 | 23256.3 | 22726.2–24433.5 | 53592000 |
<!-- samples | serde_json | text-escaped | encode | 11941.892,11969.098,12370.980,12760.976,12420.839,12139.725,12152.618 -->
| serde_json | text-escaped | encode | 8737 | 1000 | 12152.6 | 11941.9–12761.0 | 70853440 |
<!-- samples | sonic-rs | text-escaped | decode | 13471.608,13628.720,13739.086,13854.589,13189.414,13794.566,13471.387 -->
| sonic-rs | text-escaped | decode | 8737 | 1000 | 13628.7 | 13189.4–13854.6 | 53592000 |
<!-- samples | sonic-rs | text-escaped | encode | 8484.922,8518.737,8346.087,8412.942,8404.982,8334.581,8539.413 -->
| sonic-rs | text-escaped | encode | 8737 | 1000 | 8412.9 | 8334.6–8539.4 | 70853440 |
<!-- samples | prost (binary) | text-escaped | decode | 8529.751,8120.931,8324.868,8330.594,8351.818,8373.231,8576.140 -->
| prost (binary) | text-escaped | decode | 6663 | 1000 | 8351.8 | 8120.9–8576.1 | 53592000 |
<!-- samples | prost (binary) | text-escaped | encode | 209.777,177.118,167.639,168.452,170.793,176.670,168.512 -->
| prost (binary) | text-escaped | encode | 6663 | 1000 | 170.8 | 167.6–209.8 | 54209944 |
<!-- samples | serde_json | wide | decode | 1597.896,1592.672,1484.298,1464.470,1483.637,1449.059,1475.548 -->
| serde_json | wide | decode | 135 | 20000 | 1483.6 | 1449.1–1597.9 | 16920000 |
<!-- samples | serde_json | wide | encode | 407.556,415.964,410.796,422.471,414.466,394.278,405.837 -->
| serde_json | wide | encode | 135 | 20000 | 410.8 | 394.3–422.5 | 26639006 |
<!-- samples | sonic-rs | wide | decode | 927.424,967.107,957.336,969.858,964.681,957.003,931.021 -->
| sonic-rs | wide | decode | 135 | 20000 | 957.3 | 927.4–969.9 | 16920000 |
<!-- samples | sonic-rs | wide | encode | 397.104,406.824,405.458,414.708,398.290,423.036,426.815 -->
| sonic-rs | wide | encode | 135 | 20000 | 406.8 | 397.1–426.8 | 26639006 |
<!-- samples | prost (binary) | wide | decode | 140.390,139.535,138.647,145.541,139.785,133.841,138.034 -->
| prost (binary) | wide | decode | 31 | 20000 | 139.5 | 133.8–145.5 | 16920000 |
<!-- samples | prost (binary) | wide | encode | 140.804,181.498,162.513,186.923,140.923,146.066,156.693 -->
| prost (binary) | wide | encode | 31 | 20000 | 156.7 | 140.8–186.9 | 9832594 |
