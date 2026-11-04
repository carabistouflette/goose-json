| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.383,158.339,160.181,159.025,158.822,157.963,157.468 -->
| serde_json | plain | decode | 38 | 200000 | 158.4 | 157.5–160.2 | 67248000 |
<!-- samples | serde_json | plain | encode | 67.492,68.501,66.298,69.487,68.855,69.973,68.199 -->
| serde_json | plain | encode | 38 | 200000 | 68.5 | 66.3–70.0 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 168.591,171.369,170.481,169.699,168.435,160.728,167.508 -->
| sonic-rs | plain | decode | 38 | 200000 | 168.6 | 160.7–171.4 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 74.089,73.153,75.854,71.904,72.123,72.347,72.182 -->
| sonic-rs | plain | encode | 38 | 200000 | 72.3 | 71.9–75.9 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 59.413,59.439,60.284,59.995,61.393,61.252,61.661 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.3 | 59.4–61.7 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 42.069,41.324,39.777,39.359,39.349,39.478,39.910 -->
| prost (binary) | plain | encode | 11 | 200000 | 39.8 | 39.3–42.1 | 92719942 |
<!-- samples | serde_json | escaped | decode | 301.231,298.879,300.685,303.954,302.047,302.344,304.878 -->
| serde_json | escaped | decode | 62 | 200000 | 302.0 | 298.9–304.9 | 85461000 |
<!-- samples | serde_json | escaped | encode | 94.034,92.345,92.124,90.534,91.997,90.293,94.380 -->
| serde_json | escaped | encode | 54 | 200000 | 92.1 | 90.3–94.4 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 299.886,304.142,304.370,315.304,318.415,322.118,339.870 -->
| sonic-rs | escaped | decode | 62 | 200000 | 315.3 | 299.9–339.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 165.388,165.978,166.009,155.264,152.293,148.106,147.524 -->
| sonic-rs | escaped | encode | 54 | 200000 | 155.3 | 147.5–166.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 71.672,70.737,68.145,68.837,67.784,69.370,68.273 -->
| prost (binary) | escaped | decode | 24 | 200000 | 68.8 | 67.8–71.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.993,32.701,33.251,33.469,35.187,30.287,34.487 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.5 | 30.3–35.2 | 181133323 |
<!-- samples | serde_json | array | decode | 14575.767,14562.300,14613.565,14525.031,15031.974,14619.405,14824.897 -->
| serde_json | array | decode | 4022 | 20000 | 14613.6 | 14525.0–15032.0 | 288627000 |
<!-- samples | serde_json | array | encode | 7919.521,8126.750,7999.179,7850.531,7794.050,7797.949,7780.569 -->
| serde_json | array | encode | 4022 | 20000 | 7850.5 | 7780.6–8126.7 | 574225548 |
<!-- samples | sonic-rs | array | decode | 17075.077,17189.403,17169.742,17243.943,17853.580,17338.115,17565.137 -->
| sonic-rs | array | decode | 4022 | 20000 | 17243.9 | 17075.1–17853.6 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8007.351,8212.263,8126.565,8054.295,8055.026,8007.099,8129.451 -->
| sonic-rs | array | encode | 4022 | 20000 | 8055.0 | 8007.1–8212.3 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4563.402,4627.964,4543.029,4534.131,4513.429,4659.406,4632.003 -->
| prost (binary) | array | decode | 1923 | 20000 | 4563.4 | 4513.4–4659.4 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7304.262,7439.682,13894.736,7093.546,6961.405,7011.602,7118.835 -->
| prost (binary) | array | encode | 1923 | 20000 | 7118.8 | 6961.4–13894.7 | 284551620 |
<!-- samples | serde_json | floats | decode | 7150.649,6915.870,7134.463,7406.542,7152.506,7000.121,7058.537 -->
| serde_json | floats | decode | 1581 | 2000 | 7134.5 | 6915.9–7406.5 | 3825000 |
<!-- samples | serde_json | floats | encode | 10103.829,9725.935,9559.189,10201.551,10139.528,10148.263,10220.761 -->
| serde_json | floats | encode | 1581 | 2000 | 10139.5 | 9559.2–10220.8 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7341.421,7383.137,7347.618,7177.069,7083.374,7378.707,7424.786 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7347.6 | 7083.4–7424.8 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10409.795,10341.039,10617.714,10316.087,10084.774,10089.697,10252.828 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10316.1 | 10084.8–10617.7 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 875.135,845.620,726.609,848.678,749.361,803.043,975.135 -->
| prost (binary) | floats | decode | 2051 | 2000 | 845.6 | 726.6–975.1 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 552.460,562.241,549.073,564.322,551.360,572.227,544.651 -->
| prost (binary) | floats | encode | 2051 | 2000 | 552.5 | 544.7–572.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 22718.536,22575.935,22528.454,22090.089,22326.092,22305.916,22104.791 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22326.1 | 22090.1–22718.5 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8894.998,8950.494,8861.459,8893.053,8899.783,8871.779,8866.522 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8893.1 | 8861.5–8950.5 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16089.896,16333.473,15888.906,15915.533,15844.519,15855.461,16571.377 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15915.5 | 15844.5–16571.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 10401.116,10250.970,10008.039,10263.031,10424.496,10095.481,9975.361 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 10251.0 | 9975.4–10424.5 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 776.216,818.073,1064.183,922.025,913.552,772.324,784.730 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 818.1 | 772.3–1064.2 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 544.559,545.290,544.600,544.365,544.747,544.332,547.150 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 544.6 | 544.3–547.2 | 32664305 |
<!-- samples | serde_json | text-short | decode | 174.652,174.203,174.416,177.053,183.089,183.842,182.036 -->
| serde_json | text-short | decode | 97 | 200000 | 177.1 | 174.2–183.8 | 149907000 |
<!-- samples | serde_json | text-short | encode | 131.105,131.089,126.062,126.822,126.286,127.056,128.582 -->
| serde_json | text-short | encode | 97 | 200000 | 127.1 | 126.1–131.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 197.280,198.795,193.073,197.941,197.169,197.410,194.691 -->
| sonic-rs | text-short | decode | 97 | 200000 | 197.3 | 193.1–198.8 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 130.398,134.029,139.111,136.327,131.748,136.248,129.956 -->
| sonic-rs | text-short | encode | 97 | 200000 | 134.0 | 130.0–139.1 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 61.368,61.059,60.965,61.085,60.356,60.874,60.768 -->
| prost (binary) | text-short | decode | 70 | 200000 | 61.0 | 60.4–61.4 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 40.636,40.849,42.915,42.838,43.046,42.502,42.798 -->
| prost (binary) | text-short | encode | 70 | 200000 | 42.8 | 40.6–43.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2798.856,2783.317,2770.591,2762.128,2782.689,2783.880,2785.187 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2783.3 | 2762.1–2798.9 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4714.695,4682.865,4697.995,4824.825,4776.969,4786.877,4786.498 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4777.0 | 4682.9–4824.8 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1473.909,1507.327,1502.784,1654.553,1513.441,1401.105,1468.516 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1502.8 | 1401.1–1654.6 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 636.998,634.789,629.422,637.783,633.827,633.740,646.664 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 634.8 | 629.4–646.7 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 516.288,515.500,516.111,515.338,513.667,515.776,514.900 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 515.5 | 513.7–516.3 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 183.325,181.315,181.667,181.298,181.371,182.319,180.685 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 181.4 | 180.7–183.3 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2186.079,2182.073,2184.318,2183.441,2182.075,2189.638,2185.079 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2184.3 | 2182.1–2189.6 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4598.386,4516.807,4495.779,4574.234,4516.001,4522.711,4502.124 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4516.8 | 4495.8–4598.4 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1072.109,1067.867,1064.873,1077.575,1037.810,1061.897,1041.303 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1064.9 | 1037.8–1077.6 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 545.182,547.557,545.451,548.933,546.293,544.707,552.969 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 546.3 | 544.7–553.0 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 511.413,497.541,475.075,491.365,510.937,508.971,524.826 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 509.0 | 475.1–524.8 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 186.494,181.494,184.178,181.545,184.006,181.601,179.932 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 181.6 | 179.9–186.5 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 23215.501,22665.551,21701.870,22556.762,22526.837,22527.543,22690.063 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 22556.8 | 21701.9–23215.5 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 11922.770,12198.727,12204.330,12580.813,12707.405,12036.588,11891.863 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12198.7 | 11891.9–12707.4 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13105.676,13443.034,12970.655,13213.842,13014.720,13077.635,12478.689 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13077.6 | 12478.7–13443.0 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8223.069,8226.399,8139.260,7926.676,8299.487,8297.760,8324.665 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8226.4 | 7926.7–8324.7 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8201.844,7648.941,8224.744,8357.253,8338.787,8428.860,8037.070 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8224.7 | 7648.9–8428.9 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 139.220,141.965,147.642,153.350,149.096,156.667,166.425 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 149.1 | 139.2–166.4 | 101649504 |
<!-- samples | serde_json | wide | decode | 1435.929,1531.369,1513.972,1467.150,1481.492,1442.329,1478.766 -->
| serde_json | wide | decode | 135 | 40000 | 1478.8 | 1435.9–1531.4 | 33720000 |
<!-- samples | serde_json | wide | encode | 401.895,394.425,395.152,401.981,403.507,405.129,406.687 -->
| serde_json | wide | encode | 135 | 40000 | 402.0 | 394.4–406.7 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 905.517,916.661,920.388,901.975,903.366,903.521,916.749 -->
| sonic-rs | wide | decode | 135 | 40000 | 905.5 | 902.0–920.4 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 399.816,392.783,400.986,405.422,403.558,406.107,400.794 -->
| sonic-rs | wide | encode | 135 | 40000 | 401.0 | 392.8–406.1 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 131.960,135.667,134.266,131.783,136.062,132.905,134.326 -->
| prost (binary) | wide | decode | 31 | 40000 | 134.3 | 131.8–136.1 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 138.441,151.807,165.187,141.443,133.188,150.012,152.752 -->
| prost (binary) | wide | encode | 31 | 40000 | 150.0 | 133.2–165.2 | 19595809 |
