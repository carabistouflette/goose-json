| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.921,159.036,161.598,160.815,160.006,159.282,159.147 -->
| serde_json | plain | decode | 38 | 200000 | 159.3 | 158.9–161.6 | 67248000 |
<!-- samples | serde_json | plain | encode | 69.456,68.256,69.185,71.666,69.470,70.566,71.307 -->
| serde_json | plain | encode | 38 | 200000 | 69.5 | 68.3–71.7 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 165.813,165.215,165.427,164.620,165.481,165.107,164.458 -->
| sonic-rs | plain | decode | 38 | 200000 | 165.2 | 164.5–165.8 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 68.735,69.371,69.656,72.247,69.931,69.878,69.172 -->
| sonic-rs | plain | encode | 38 | 200000 | 69.7 | 68.7–72.2 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 58.518,57.239,57.557,59.043,57.383,59.929,58.207 -->
| prost (binary) | plain | decode | 11 | 200000 | 58.2 | 57.2–59.9 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 41.639,39.582,39.635,39.551,39.208,39.689,40.235 -->
| prost (binary) | plain | encode | 11 | 200000 | 39.6 | 39.2–41.6 | 92719942 |
<!-- samples | serde_json | escaped | decode | 302.417,303.296,305.233,302.756,308.724,308.968,306.404 -->
| serde_json | escaped | decode | 62 | 200000 | 305.2 | 302.4–309.0 | 85461000 |
<!-- samples | serde_json | escaped | encode | 94.492,96.377,95.028,94.353,95.445,96.124,96.343 -->
| serde_json | escaped | encode | 54 | 200000 | 95.4 | 94.4–96.4 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 303.185,306.188,312.673,308.496,314.616,313.959,307.939 -->
| sonic-rs | escaped | decode | 62 | 200000 | 308.5 | 303.2–314.6 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 148.334,147.972,144.935,143.698,144.436,151.429,148.472 -->
| sonic-rs | escaped | encode | 54 | 200000 | 148.0 | 143.7–151.4 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 69.006,68.877,68.146,69.236,68.424,68.651,68.074 -->
| prost (binary) | escaped | decode | 24 | 200000 | 68.7 | 68.1–69.2 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 30.308,34.375,34.616,33.585,33.698,35.087,32.021 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.7 | 30.3–35.1 | 181133323 |
<!-- samples | serde_json | array | decode | 14532.005,14775.928,14866.965,14773.693,14754.770,14811.123,14878.550 -->
| serde_json | array | decode | 4022 | 20000 | 14775.9 | 14532.0–14878.5 | 288627000 |
<!-- samples | serde_json | array | encode | 7959.969,8017.959,7933.370,7866.559,7966.166,7894.283,7801.496 -->
| serde_json | array | encode | 4022 | 20000 | 7933.4 | 7801.5–8018.0 | 574225548 |
<!-- samples | sonic-rs | array | decode | 16633.023,17008.813,16972.095,16995.425,17144.840,16937.726,16908.533 -->
| sonic-rs | array | decode | 4022 | 20000 | 16972.1 | 16633.0–17144.8 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7901.039,7972.999,7923.824,8039.468,8126.205,8007.248,8004.485 -->
| sonic-rs | array | encode | 4022 | 20000 | 8004.5 | 7901.0–8126.2 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4599.239,4544.284,4630.761,4505.120,4492.553,4527.042,4639.560 -->
| prost (binary) | array | decode | 1923 | 20000 | 4544.3 | 4492.6–4639.6 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7142.896,7068.493,7130.827,7115.601,7328.754,7364.132,7123.283 -->
| prost (binary) | array | encode | 1923 | 20000 | 7130.8 | 7068.5–7364.1 | 284551620 |
<!-- samples | serde_json | floats | decode | 6946.335,6915.575,7031.324,6876.318,7010.595,7090.846,7001.597 -->
| serde_json | floats | decode | 1581 | 2000 | 7001.6 | 6876.3–7090.8 | 3825000 |
<!-- samples | serde_json | floats | encode | 9714.573,9851.394,9657.074,9818.049,9992.394,9977.781,10073.337 -->
| serde_json | floats | encode | 1581 | 2000 | 9851.4 | 9657.1–10073.3 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7260.399,7061.391,7011.414,7147.996,7272.020,7230.778,7092.986 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7148.0 | 7011.4–7272.0 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10715.997,10668.841,10689.457,10650.567,10554.440,10762.760,10705.757 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10689.5 | 10554.4–10762.8 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 1095.568,943.588,979.087,732.005,779.271,908.134,759.729 -->
| prost (binary) | floats | decode | 2051 | 2000 | 908.1 | 732.0–1095.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 545.616,546.480,545.329,544.814,546.456,545.577,545.729 -->
| prost (binary) | floats | encode | 2051 | 2000 | 545.6 | 544.8–546.5 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 21997.007,22720.310,22843.286,22141.779,23105.357,23297.788,23121.141 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22843.3 | 21997.0–23297.8 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9840.159,10316.737,10553.293,10732.469,10554.032,10569.226,10535.144 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 10553.3 | 9840.2–10732.5 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16606.804,16921.517,16122.889,15936.630,15816.933,16122.103,16120.623 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16122.1 | 15816.9–16921.5 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9582.105,9731.290,9596.382,9823.099,9745.897,10255.524,9977.622 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9745.9 | 9582.1–10255.5 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 745.044,798.112,950.157,816.461,864.985,852.995,811.049 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 816.5 | 745.0–950.2 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 582.879,580.922,549.269,581.490,583.757,582.130,581.827 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 581.8 | 549.3–583.8 | 32664305 |
<!-- samples | serde_json | text-ascii | decode | 2272.071,2282.910,2300.557,2313.568,2321.135,2292.564,2246.498 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2292.6 | 2246.5–2321.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4687.503,4658.548,4856.415,4832.319,4738.326,4569.881,4884.461 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4738.3 | 4569.9–4884.5 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1060.294,1073.680,1065.982,1133.443,1144.654,1133.688,1101.969 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1102.0 | 1060.3–1144.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 560.168,565.979,558.047,553.573,589.438,598.425,593.090 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 566.0 | 553.6–598.4 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 509.064,507.313,509.494,507.421,508.376,513.200,510.815 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 509.1 | 507.3–513.2 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 180.690,179.972,181.561,180.868,183.335,180.151,179.451 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 180.7 | 179.5–183.3 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 23319.549,22434.070,22597.237,23070.790,22558.077,22205.430,22514.062 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 22558.1 | 22205.4–23319.5 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 13296.738,13350.918,13380.683,13316.032,13128.064,12800.049,12180.789 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 13296.7 | 12180.8–13380.7 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 12878.198,13123.933,13432.579,12855.738,12927.023,12938.097,13286.717 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 12938.1 | 12855.7–13432.6 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8465.240,8217.688,8460.887,8318.403,8350.372,8393.610,8373.159 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8373.2 | 8217.7–8465.2 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8270.189,8573.841,8188.398,8294.782,8243.424,8288.202,8484.079 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8288.2 | 8188.4–8573.8 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 184.950,166.682,170.655,168.146,166.934,170.268,168.087 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 168.1 | 166.7–184.9 | 101649504 |
<!-- samples | serde_json | wide | decode | 1520.849,1535.699,1510.705,1503.729,1513.747,1487.776,1504.114 -->
| serde_json | wide | decode | 135 | 40000 | 1510.7 | 1487.8–1535.7 | 33720000 |
<!-- samples | serde_json | wide | encode | 404.217,405.186,423.270,409.912,407.168,422.548,407.393 -->
| serde_json | wide | encode | 135 | 40000 | 407.4 | 404.2–423.3 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 930.107,934.193,934.715,936.472,928.412,923.367,942.505 -->
| sonic-rs | wide | decode | 135 | 40000 | 934.2 | 923.4–942.5 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 389.294,420.627,401.496,405.219,409.035,408.943,416.907 -->
| sonic-rs | wide | encode | 135 | 40000 | 408.9 | 389.3–420.6 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 132.104,137.268,131.310,132.994,135.862,133.025,135.818 -->
| prost (binary) | wide | decode | 31 | 40000 | 133.0 | 131.3–137.3 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 137.212,165.409,150.064,145.464,144.583,128.182,142.246 -->
| prost (binary) | wide | encode | 31 | 40000 | 144.6 | 128.2–165.4 | 19595809 |
