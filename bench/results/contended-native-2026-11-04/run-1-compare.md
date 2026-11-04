| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 162.507,159.976,162.771,164.471,162.238,163.085,164.440 -->
| serde_json | plain | decode | 38 | 200000 | 162.8 | 160.0–164.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 73.996,74.370,71.824,69.493,71.142,71.993,73.359 -->
| serde_json | plain | encode | 38 | 200000 | 72.0 | 69.5–74.4 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 176.097,173.725,172.002,178.670,172.951,172.343,170.515 -->
| sonic-rs | plain | decode | 38 | 200000 | 173.0 | 170.5–178.7 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 70.111,70.739,69.818,70.398,70.922,71.410,71.220 -->
| sonic-rs | plain | encode | 38 | 200000 | 70.7 | 69.8–71.4 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 59.588,59.098,60.297,60.968,59.276,59.443,59.568 -->
| prost (binary) | plain | decode | 11 | 200000 | 59.6 | 59.1–61.0 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 40.838,41.559,41.190,44.441,42.984,42.146,44.263 -->
| prost (binary) | plain | encode | 11 | 200000 | 42.1 | 40.8–44.4 | 92719942 |
<!-- samples | serde_json | escaped | decode | 311.743,303.973,310.437,313.890,309.306,314.758,310.463 -->
| serde_json | escaped | decode | 62 | 200000 | 310.5 | 304.0–314.8 | 85461000 |
<!-- samples | serde_json | escaped | encode | 96.821,95.611,98.860,94.898,96.942,96.722,97.162 -->
| serde_json | escaped | encode | 54 | 200000 | 96.8 | 94.9–98.9 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 314.263,307.492,316.360,311.920,314.462,324.011,322.120 -->
| sonic-rs | escaped | decode | 62 | 200000 | 314.5 | 307.5–324.0 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 146.988,145.009,139.920,142.858,146.002,141.489,150.643 -->
| sonic-rs | escaped | encode | 54 | 200000 | 145.0 | 139.9–150.6 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 71.684,70.416,70.680,68.592,70.332,72.632,74.182 -->
| prost (binary) | escaped | decode | 24 | 200000 | 70.7 | 68.6–74.2 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 36.020,36.969,35.535,36.747,34.981,35.647,34.015 -->
| prost (binary) | escaped | encode | 24 | 200000 | 35.6 | 34.0–37.0 | 181133323 |
<!-- samples | serde_json | array | decode | 15071.573,15020.227,14726.280,14779.572,15099.269,14806.876,15024.240 -->
| serde_json | array | decode | 4022 | 20000 | 15020.2 | 14726.3–15099.3 | 288627000 |
<!-- samples | serde_json | array | encode | 7973.045,7932.096,8121.437,8093.554,8152.135,8185.778,8273.655 -->
| serde_json | array | encode | 4022 | 20000 | 8121.4 | 7932.1–8273.7 | 574225548 |
<!-- samples | sonic-rs | array | decode | 17205.662,17298.587,17533.691,17414.075,17362.025,17627.728,17657.695 -->
| sonic-rs | array | decode | 4022 | 20000 | 17414.1 | 17205.7–17657.7 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8169.125,8738.607,8327.554,8214.619,8303.393,8149.569,8180.038 -->
| sonic-rs | array | encode | 4022 | 20000 | 8214.6 | 8149.6–8738.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4669.340,4576.911,4724.939,4724.288,4823.410,4834.884,4828.422 -->
| prost (binary) | array | decode | 1923 | 20000 | 4724.9 | 4576.9–4834.9 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7293.605,7384.926,7317.305,7155.019,7174.217,7190.181,7213.120 -->
| prost (binary) | array | encode | 1923 | 20000 | 7213.1 | 7155.0–7384.9 | 284551620 |
<!-- samples | serde_json | floats | decode | 7046.336,7511.685,7202.061,7574.796,7284.297,7363.404,7148.893 -->
| serde_json | floats | decode | 1581 | 2000 | 7284.3 | 7046.3–7574.8 | 3825000 |
<!-- samples | serde_json | floats | encode | 10113.654,10076.926,10128.620,10127.683,9956.866,10057.692,9755.741 -->
| serde_json | floats | encode | 1581 | 2000 | 10076.9 | 9755.7–10128.6 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 6837.734,7131.328,7424.283,7257.615,7234.238,7097.898,7216.254 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7216.3 | 6837.7–7424.3 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10667.359,10638.174,10262.879,10495.930,10185.622,10328.996,10202.185 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10329.0 | 10185.6–10667.4 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 739.362,770.558,896.514,803.399,809.193,845.759,827.968 -->
| prost (binary) | floats | decode | 2051 | 2000 | 809.2 | 739.4–896.5 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 582.125,584.341,589.212,582.548,581.160,582.208,550.409 -->
| prost (binary) | floats | encode | 2051 | 2000 | 582.2 | 550.4–589.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 22947.128,23265.286,23423.031,22966.864,23259.476,23117.739,23176.501 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 23176.5 | 22947.1–23423.0 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9779.936,9983.522,9932.138,10005.522,10035.806,10146.199,9883.504 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9983.5 | 9779.9–10146.2 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16638.110,17007.571,16544.642,17015.329,16305.861,16228.828,16190.649 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16544.6 | 16190.6–17015.3 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9995.181,9926.037,10484.613,10420.709,10235.730,10626.232,10396.381 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 10396.4 | 9926.0–10626.2 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 782.982,855.671,778.432,925.767,1017.617,834.860,943.228 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 855.7 | 778.4–1017.6 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 583.033,586.096,561.061,546.034,546.343,572.483,582.480 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 572.5 | 546.0–586.1 | 32664305 |
<!-- samples | serde_json | text-short | decode | 180.635,182.988,180.328,180.284,174.772,174.552,177.443 -->
| serde_json | text-short | decode | 97 | 200000 | 180.3 | 174.6–183.0 | 149907000 |
<!-- samples | serde_json | text-short | encode | 130.780,127.774,126.073,130.348,129.691,130.743,133.071 -->
| serde_json | text-short | encode | 97 | 200000 | 130.3 | 126.1–133.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 201.352,199.619,198.740,201.353,202.098,199.747,200.965 -->
| sonic-rs | text-short | decode | 97 | 200000 | 201.0 | 198.7–202.1 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 132.575,132.465,135.558,130.038,136.013,138.387,136.108 -->
| sonic-rs | text-short | encode | 97 | 200000 | 135.6 | 130.0–138.4 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 64.718,63.117,64.551,63.422,64.137,63.531,62.631 -->
| prost (binary) | text-short | decode | 70 | 200000 | 63.5 | 62.6–64.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 41.793,43.723,44.651,44.649,44.488,44.186,44.402 -->
| prost (binary) | text-short | encode | 70 | 200000 | 44.4 | 41.8–44.7 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2866.195,2952.856,2955.539,2951.429,2924.477,2953.742,2957.443 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2952.9 | 2866.2–2957.4 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5040.528,4993.959,5012.620,4990.041,5124.356,5070.966,5117.614 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5040.5 | 4990.0–5124.4 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1755.313,1666.701,1542.251,1696.647,1569.787,1680.684,1618.123 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1666.7 | 1542.3–1755.3 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 637.817,635.555,632.010,626.577,633.508,629.666,641.363 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 633.5 | 626.6–641.4 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 550.252,552.069,552.857,553.744,550.994,550.237,519.849 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 551.0 | 519.8–553.7 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 185.945,184.052,186.196,179.689,180.826,182.778,179.400 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 182.8 | 179.4–186.2 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2327.983,2323.561,2277.953,2226.066,2377.117,2332.656,2231.664 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2323.6 | 2226.1–2377.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4787.667,4520.583,4710.471,4756.047,4720.765,4703.233,4736.608 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4720.8 | 4520.6–4787.7 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1150.373,1132.159,1145.341,1068.166,1063.678,1067.222,1069.608 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1069.6 | 1063.7–1150.4 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 546.070,543.322,547.508,557.788,554.372,545.332,544.308 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 546.1 | 543.3–557.8 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 525.136,542.720,543.119,545.135,546.275,522.511,510.600 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 542.7 | 510.6–546.3 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 184.571,182.297,184.396,196.763,194.720,193.593,194.970 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 193.6 | 182.3–196.8 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 23440.500,24463.788,23983.411,23711.842,24152.107,24033.294,24246.324 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 24033.3 | 23440.5–24463.8 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 13556.551,13434.815,13877.658,13764.347,13846.153,14082.264,13782.209 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 13782.2 | 13434.8–14082.3 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13673.667,14489.612,14252.933,14194.698,14504.967,14230.985,13771.247 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 14231.0 | 13673.7–14505.0 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8698.899,8667.511,8491.213,8632.010,8630.162,8584.451,8716.192 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8632.0 | 8491.2–8716.2 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8262.780,8506.311,8308.051,8452.878,8277.418,8316.043,8342.210 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8316.0 | 8262.8–8506.3 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 159.155,158.523,158.798,157.083,160.762,158.785,157.403 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 158.8 | 157.1–160.8 | 101649504 |
<!-- samples | serde_json | wide | decode | 1545.051,1561.383,1562.030,1540.217,1564.428,1535.009,1541.707 -->
| serde_json | wide | decode | 135 | 40000 | 1545.1 | 1535.0–1564.4 | 33720000 |
<!-- samples | serde_json | wide | encode | 416.488,425.855,428.823,427.557,416.203,419.616,428.003 -->
| serde_json | wide | encode | 135 | 40000 | 425.9 | 416.2–428.8 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 975.181,978.198,971.898,975.286,948.848,943.674,957.834 -->
| sonic-rs | wide | decode | 135 | 40000 | 971.9 | 943.7–978.2 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 409.511,405.114,421.238,426.902,420.193,420.235,408.574 -->
| sonic-rs | wide | encode | 135 | 40000 | 420.2 | 405.1–426.9 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 143.120,136.064,141.585,143.231,136.946,141.332,134.468 -->
| prost (binary) | wide | decode | 31 | 40000 | 141.3 | 134.5–143.2 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 133.339,176.095,138.533,173.850,165.780,159.385,143.445 -->
| prost (binary) | wide | encode | 31 | 40000 | 159.4 | 133.3–176.1 | 19595809 |
