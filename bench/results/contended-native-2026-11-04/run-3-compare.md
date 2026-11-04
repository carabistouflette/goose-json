| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.842,163.220,162.387,161.503,157.491,159.886,157.356 -->
| serde_json | plain | decode | 38 | 200000 | 159.9 | 157.4–163.2 | 67248000 |
<!-- samples | serde_json | plain | encode | 69.605,69.126,69.797,69.682,69.818,71.515,71.538 -->
| serde_json | plain | encode | 38 | 200000 | 69.8 | 69.1–71.5 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 172.946,172.409,168.644,168.197,168.595,170.707,169.469 -->
| sonic-rs | plain | decode | 38 | 200000 | 169.5 | 168.2–172.9 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 72.846,71.806,71.963,72.171,71.850,73.383,71.938 -->
| sonic-rs | plain | encode | 38 | 200000 | 72.0 | 71.8–73.4 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 58.482,58.549,58.584,59.343,59.661,57.493,58.473 -->
| prost (binary) | plain | decode | 11 | 200000 | 58.5 | 57.5–59.7 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 42.761,42.701,41.345,42.538,42.527,43.562,41.623 -->
| prost (binary) | plain | encode | 11 | 200000 | 42.5 | 41.3–43.6 | 92719942 |
<!-- samples | serde_json | escaped | decode | 306.243,309.733,308.499,310.668,310.676,305.235,307.397 -->
| serde_json | escaped | decode | 62 | 200000 | 308.5 | 305.2–310.7 | 85461000 |
<!-- samples | serde_json | escaped | encode | 96.556,98.994,98.011,97.856,97.609,97.223,97.329 -->
| serde_json | escaped | encode | 54 | 200000 | 97.6 | 96.6–99.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 318.816,309.568,311.945,311.619,306.455,312.471,312.790 -->
| sonic-rs | escaped | decode | 62 | 200000 | 311.9 | 306.5–318.8 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 146.483,142.301,147.211,151.815,147.726,145.518,146.826 -->
| sonic-rs | escaped | encode | 54 | 200000 | 146.8 | 142.3–151.8 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 71.794,73.159,71.880,69.288,68.678,67.796,72.301 -->
| prost (binary) | escaped | decode | 24 | 200000 | 71.8 | 67.8–73.2 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.972,33.698,33.674,34.468,34.974,33.735,35.148 -->
| prost (binary) | escaped | encode | 24 | 200000 | 34.0 | 33.7–35.1 | 181133323 |
<!-- samples | serde_json | array | decode | 14687.312,14462.325,14467.279,14510.790,14892.795,14593.811,14553.589 -->
| serde_json | array | decode | 4022 | 20000 | 14553.6 | 14462.3–14892.8 | 288627000 |
<!-- samples | serde_json | array | encode | 7809.522,7808.896,7753.782,7855.862,7810.732,7875.561,7813.687 -->
| serde_json | array | encode | 4022 | 20000 | 7810.7 | 7753.8–7875.6 | 574225548 |
<!-- samples | sonic-rs | array | decode | 16853.766,16709.874,16782.155,16630.300,16735.814,16725.077,17106.857 -->
| sonic-rs | array | decode | 4022 | 20000 | 16735.8 | 16630.3–17106.9 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8117.954,8061.011,8041.061,8229.592,8124.880,8105.871,8119.486 -->
| sonic-rs | array | encode | 4022 | 20000 | 8118.0 | 8041.1–8229.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4730.517,4692.751,4523.186,4827.019,4632.036,4605.276,4614.925 -->
| prost (binary) | array | decode | 1923 | 20000 | 4632.0 | 4523.2–4827.0 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6943.471,6998.042,7114.412,7095.967,7126.771,7180.555,7280.630 -->
| prost (binary) | array | encode | 1923 | 20000 | 7114.4 | 6943.5–7280.6 | 284551620 |
<!-- samples | serde_json | floats | decode | 7069.364,7126.579,7227.097,7239.578,7029.312,7052.994,7057.834 -->
| serde_json | floats | decode | 1581 | 2000 | 7069.4 | 7029.3–7239.6 | 3825000 |
<!-- samples | serde_json | floats | encode | 10987.218,10919.129,10690.775,10833.288,10664.455,10716.116,10996.155 -->
| serde_json | floats | encode | 1581 | 2000 | 10833.3 | 10664.5–10996.2 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7023.173,7453.680,7071.420,7108.215,7129.359,7150.904,6960.645 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7108.2 | 6960.6–7453.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10372.753,10346.169,10531.256,10511.182,10359.785,10185.843,10196.092 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10359.8 | 10185.8–10531.3 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 811.277,883.316,786.346,879.653,897.615,741.934,738.960 -->
| prost (binary) | floats | decode | 2051 | 2000 | 811.3 | 739.0–897.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 548.510,547.476,585.191,547.587,549.169,550.928,548.379 -->
| prost (binary) | floats | encode | 2051 | 2000 | 548.5 | 547.5–585.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 22786.006,22653.241,22587.485,22828.166,22983.156,22724.739,23206.978 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22786.0 | 22587.5–23207.0 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9124.167,9345.391,9380.665,9509.310,9031.012,9237.011,9061.367 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9237.0 | 9031.0–9509.3 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16582.046,16632.322,16636.513,16216.095,15984.135,16746.625,16352.842 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16582.0 | 15984.1–16746.6 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9861.111,9870.862,9869.132,9773.789,9514.461,10000.083,10043.582 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9869.1 | 9514.5–10043.6 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 834.460,784.790,840.143,1003.232,801.177,823.423,758.223 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 823.4 | 758.2–1003.2 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 588.317,586.403,589.501,585.852,557.777,547.665,548.019 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 585.9 | 547.7–589.5 | 32664305 |
<!-- samples | serde_json | text-short | decode | 182.746,177.242,181.101,179.104,179.183,180.488,177.901 -->
| serde_json | text-short | decode | 97 | 200000 | 179.2 | 177.2–182.7 | 149907000 |
<!-- samples | serde_json | text-short | encode | 133.325,134.966,132.741,132.352,132.516,132.097,134.252 -->
| serde_json | text-short | encode | 97 | 200000 | 132.7 | 132.1–135.0 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 196.906,196.714,191.492,198.595,192.702,198.029,193.623 -->
| sonic-rs | text-short | decode | 97 | 200000 | 196.7 | 191.5–198.6 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 139.461,130.782,128.043,131.059,135.373,132.740,132.633 -->
| sonic-rs | text-short | encode | 97 | 200000 | 132.6 | 128.0–139.5 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 61.226,61.499,63.188,61.610,62.002,62.239,61.148 -->
| prost (binary) | text-short | decode | 70 | 200000 | 61.6 | 61.1–63.2 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 43.712,43.511,44.414,43.976,42.607,44.735,44.017 -->
| prost (binary) | text-short | encode | 70 | 200000 | 44.0 | 42.6–44.7 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2881.684,2772.934,2887.724,2821.041,2871.005,2844.588,2780.499 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2844.6 | 2772.9–2887.7 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4956.155,4820.225,5002.058,5025.815,4941.256,4958.057,5152.628 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4958.1 | 4820.2–5152.6 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1695.916,1601.665,1581.888,1638.745,1534.329,1767.686,1686.879 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1638.7 | 1534.3–1767.7 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 646.154,640.529,652.986,660.634,664.689,674.754,684.144 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 660.6 | 640.5–684.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 558.646,562.072,557.995,542.236,516.687,512.146,514.504 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 542.2 | 512.1–562.1 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 180.921,185.845,179.575,181.628,185.945,181.614,183.066 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 181.6 | 179.6–185.9 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2205.692,2224.816,2241.778,2284.666,2263.332,2182.398,2228.885 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2228.9 | 2182.4–2284.7 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5086.940,5138.069,5077.577,5124.843,5085.044,5088.651,4869.046 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5086.9 | 4869.0–5138.1 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1074.670,1109.961,1091.911,1068.257,1098.479,1149.829,1139.595 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1098.5 | 1068.3–1149.8 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 706.990,716.809,742.558,723.254,712.663,709.635,709.544 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 712.7 | 707.0–742.6 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 509.632,508.623,507.238,506.669,543.384,548.175,546.538 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 509.6 | 506.7–548.2 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 458.185,456.466,445.788,429.167,428.464,425.079,427.063 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 429.2 | 425.1–458.2 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 24829.567,23965.549,24248.708,24249.056,23966.866,24035.888,24108.861 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 24108.9 | 23965.5–24829.6 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 14043.434,14281.578,14008.504,14710.047,14261.269,14818.005,14649.099 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 14281.6 | 14008.5–14818.0 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13538.412,14199.317,13962.746,13543.066,13528.915,13172.575,13694.556 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13543.1 | 13172.6–14199.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8655.285,8366.933,8389.547,8815.442,8412.283,8762.193,8796.926 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8655.3 | 8366.9–8815.4 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8411.227,8664.109,9113.012,8973.452,8888.106,8801.279,8364.779 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8801.3 | 8364.8–9113.0 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 186.395,167.133,169.049,171.260,167.569,169.368,172.004 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 169.4 | 167.1–186.4 | 101649504 |
<!-- samples | serde_json | wide | decode | 1573.207,1523.274,1561.744,1544.098,1539.541,1517.959,1522.457 -->
| serde_json | wide | decode | 135 | 40000 | 1539.5 | 1518.0–1573.2 | 33720000 |
<!-- samples | serde_json | wide | encode | 413.986,421.578,424.106,431.946,419.685,426.128,433.081 -->
| serde_json | wide | encode | 135 | 40000 | 424.1 | 414.0–433.1 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 958.903,959.207,949.697,966.756,950.351,966.182,978.007 -->
| sonic-rs | wide | decode | 135 | 40000 | 959.2 | 949.7–978.0 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 462.145,438.882,456.493,431.110,466.664,444.126,447.623 -->
| sonic-rs | wide | encode | 135 | 40000 | 447.6 | 431.1–466.7 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 137.629,132.611,137.336,134.498,143.609,142.408,134.244 -->
| prost (binary) | wide | decode | 31 | 40000 | 137.3 | 132.6–143.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 150.475,167.762,149.179,155.931,148.691,155.449,155.454 -->
| prost (binary) | wide | encode | 31 | 40000 | 155.4 | 148.7–167.8 | 19595809 |
