| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 166.402,164.857,160.075,159.338,158.653,157.720,155.745 -->
| serde_json | plain | decode | 38 | 200000 | 159.3 | 155.7–166.4 | 67248000 |
<!-- samples | serde_json | plain | encode | 71.310,73.028,70.574,71.999,70.126,71.079,73.414 -->
| serde_json | plain | encode | 38 | 200000 | 71.3 | 70.1–73.4 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 166.538,173.623,172.021,170.961,167.215,167.063,165.873 -->
| sonic-rs | plain | decode | 38 | 200000 | 167.2 | 165.9–173.6 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 71.999,71.610,70.246,69.747,67.917,71.909,68.872 -->
| sonic-rs | plain | encode | 38 | 200000 | 70.2 | 67.9–72.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 59.365,58.444,57.730,58.437,57.961,58.115,57.701 -->
| prost (binary) | plain | decode | 11 | 200000 | 58.1 | 57.7–59.4 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 41.336,42.205,40.669,41.312,40.823,40.453,41.250 -->
| prost (binary) | plain | encode | 11 | 200000 | 41.2 | 40.5–42.2 | 92719942 |
<!-- samples | serde_json | escaped | decode | 301.602,304.556,304.507,307.577,304.435,305.105,308.624 -->
| serde_json | escaped | decode | 62 | 200000 | 304.6 | 301.6–308.6 | 85461000 |
<!-- samples | serde_json | escaped | encode | 94.443,93.792,93.552,94.859,95.104,94.262,94.900 -->
| serde_json | escaped | encode | 54 | 200000 | 94.4 | 93.6–95.1 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 301.535,305.138,304.275,302.961,306.349,307.348,304.519 -->
| sonic-rs | escaped | decode | 62 | 200000 | 304.5 | 301.5–307.3 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 145.702,139.405,143.374,141.356,139.831,137.596,138.042 -->
| sonic-rs | escaped | encode | 54 | 200000 | 139.8 | 137.6–145.7 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 70.427,68.101,71.057,70.624,72.884,70.956,68.482 -->
| prost (binary) | escaped | decode | 24 | 200000 | 70.6 | 68.1–72.9 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.712,34.802,33.172,33.678,33.894,33.548,34.519 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.7 | 33.2–34.8 | 181133323 |
<!-- samples | serde_json | array | decode | 14208.611,13999.717,14917.923,14700.134,14457.478,14389.690,14437.845 -->
| serde_json | array | decode | 4022 | 20000 | 14437.8 | 13999.7–14917.9 | 288627000 |
<!-- samples | serde_json | array | encode | 7716.349,7651.134,7660.743,7878.927,8146.087,8213.475,8039.690 -->
| serde_json | array | encode | 4022 | 20000 | 7878.9 | 7651.1–8213.5 | 574225548 |
<!-- samples | sonic-rs | array | decode | 19352.499,17133.307,17251.557,17665.488,17254.065,16981.534,17367.624 -->
| sonic-rs | array | decode | 4022 | 20000 | 17254.1 | 16981.5–19352.5 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8315.365,8017.205,8000.235,7599.376,7725.477,8042.342,7878.573 -->
| sonic-rs | array | encode | 4022 | 20000 | 8000.2 | 7599.4–8315.4 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4401.546,4408.355,4489.701,4518.192,4713.057,4717.000,4354.906 -->
| prost (binary) | array | decode | 1923 | 20000 | 4489.7 | 4354.9–4717.0 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7089.048,7067.426,6829.690,6803.223,7413.041,7331.206,7201.225 -->
| prost (binary) | array | encode | 1923 | 20000 | 7089.0 | 6803.2–7413.0 | 284551620 |
<!-- samples | serde_json | floats | decode | 7277.621,7527.851,7215.227,7229.613,7286.967,7209.690,7339.400 -->
| serde_json | floats | decode | 1581 | 2000 | 7277.6 | 7209.7–7527.9 | 3825000 |
<!-- samples | serde_json | floats | encode | 10010.266,10277.842,10342.820,10241.340,10369.381,10287.289,10447.674 -->
| serde_json | floats | encode | 1581 | 2000 | 10287.3 | 10010.3–10447.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7513.949,7336.498,7317.207,7532.371,7373.130,7553.685,7482.565 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7482.6 | 7317.2–7553.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 12316.349,12026.831,11090.239,10941.769,10761.276,10924.647,10831.665 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10941.8 | 10761.3–12316.3 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 872.886,1096.623,795.129,810.067,960.966,838.765,826.729 -->
| prost (binary) | floats | decode | 2051 | 2000 | 838.8 | 795.1–1096.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 550.064,583.878,585.476,584.106,584.163,585.240,584.407 -->
| prost (binary) | floats | encode | 2051 | 2000 | 584.2 | 550.1–585.5 | 31234057 |
<!-- samples | serde_json | text-ascii | decode | 2324.433,2207.468,2276.747,2328.436,2282.171,2290.331,2311.256 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2290.3 | 2207.5–2328.4 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4692.100,4885.614,4718.721,4905.471,4632.247,4730.492,4600.462 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4718.7 | 4600.5–4905.5 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1069.625,1065.371,1064.602,1080.811,1067.570,1070.236,1065.421 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1067.6 | 1064.6–1080.8 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 562.869,577.576,563.562,558.429,567.225,561.409,562.927 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 562.9 | 558.4–577.6 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 508.089,506.622,507.989,507.664,524.734,540.254,540.968 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 508.1 | 506.6–541.0 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 196.502,194.899,194.857,212.116,212.351,214.806,205.420 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 205.4 | 194.9–214.8 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 25138.550,24908.159,25344.273,24818.570,25434.710,25442.428,24584.052 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 25138.5 | 24584.1–25442.4 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12843.152,12717.487,12910.208,13339.253,13386.817,12980.956,13229.426 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12981.0 | 12717.5–13386.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 14326.081,13443.129,13683.138,13394.263,13507.219,13621.455,13659.680 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13621.5 | 13394.3–14326.1 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8453.820,8548.940,8517.274,8727.724,8768.243,8862.965,8536.673 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8548.9 | 8453.8–8863.0 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8615.614,8471.170,8587.112,8770.149,8811.924,8957.616,8323.354 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8615.6 | 8323.4–8957.6 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 156.721,159.441,158.229,156.327,160.471,157.875,156.401 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 157.9 | 156.3–160.5 | 101649504 |
<!-- samples | serde_json | wide | decode | 1435.953,1476.023,1484.199,1529.185,1539.760,1551.325,1469.878 -->
| serde_json | wide | decode | 135 | 40000 | 1484.2 | 1436.0–1551.3 | 33720000 |
<!-- samples | serde_json | wide | encode | 379.083,395.627,392.940,400.487,393.682,394.039,422.649 -->
| serde_json | wide | encode | 135 | 40000 | 394.0 | 379.1–422.6 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 958.456,950.956,961.842,960.021,952.356,958.786,966.327 -->
| sonic-rs | wide | decode | 135 | 40000 | 958.8 | 951.0–966.3 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 460.488,438.350,429.053,415.115,434.411,443.445,434.574 -->
| sonic-rs | wide | encode | 135 | 40000 | 434.6 | 415.1–460.5 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 143.326,139.914,143.535,141.161,143.767,132.822,129.898 -->
| prost (binary) | wide | decode | 31 | 40000 | 141.2 | 129.9–143.8 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 126.014,158.163,155.324,143.859,148.166,155.474,143.651 -->
| prost (binary) | wide | encode | 31 | 40000 | 148.2 | 126.0–158.2 | 19595809 |
