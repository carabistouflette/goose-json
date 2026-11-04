| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 164.840,165.355,163.080,163.974,165.550,160.887,158.714 -->
| serde_json | plain | decode | 38 | 200000 | 164.0 | 158.7–165.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 69.805,73.741,70.534,69.419,71.029,72.638,71.998 -->
| serde_json | plain | encode | 38 | 200000 | 71.0 | 69.4–73.7 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 171.007,173.133,172.087,168.987,172.761,170.845,171.739 -->
| sonic-rs | plain | decode | 38 | 200000 | 171.7 | 169.0–173.1 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 73.076,69.927,70.596,72.201,73.626,70.436,68.506 -->
| sonic-rs | plain | encode | 38 | 200000 | 70.6 | 68.5–73.6 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 62.620,63.022,59.628,59.852,59.771,60.403,60.922 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.4 | 59.6–63.0 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 41.317,41.895,40.516,41.109,42.148,40.246,42.377 -->
| prost (binary) | plain | encode | 11 | 200000 | 41.3 | 40.2–42.4 | 92719942 |
<!-- samples | serde_json | escaped | decode | 319.592,315.626,309.608,310.266,309.630,308.738,310.312 -->
| serde_json | escaped | decode | 62 | 200000 | 310.3 | 308.7–319.6 | 85461000 |
<!-- samples | serde_json | escaped | encode | 95.976,100.438,102.005,99.141,101.631,100.995,101.912 -->
| serde_json | escaped | encode | 54 | 200000 | 101.0 | 96.0–102.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 312.582,319.734,316.244,313.065,306.381,309.933,311.428 -->
| sonic-rs | escaped | decode | 62 | 200000 | 312.6 | 306.4–319.7 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 144.900,146.064,146.127,153.380,143.982,147.377,150.524 -->
| sonic-rs | escaped | encode | 54 | 200000 | 146.1 | 144.0–153.4 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 71.432,72.570,71.253,70.849,72.610,69.386,71.976 -->
| prost (binary) | escaped | decode | 24 | 200000 | 71.4 | 69.4–72.6 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 35.512,35.506,35.768,36.579,33.562,35.138,34.916 -->
| prost (binary) | escaped | encode | 24 | 200000 | 35.5 | 33.6–36.6 | 181133323 |
<!-- samples | serde_json | array | decode | 15001.240,15113.088,17794.814,15123.093,15041.127,15478.660,15168.060 -->
| serde_json | array | decode | 4022 | 20000 | 15123.1 | 15001.2–17794.8 | 288627000 |
<!-- samples | serde_json | array | encode | 8173.983,8187.382,8225.474,8155.293,8197.106,8120.923,8202.092 -->
| serde_json | array | encode | 4022 | 20000 | 8187.4 | 8120.9–8225.5 | 574225548 |
<!-- samples | sonic-rs | array | decode | 17573.924,17173.181,17139.176,17794.470,17650.139,17686.960,17704.054 -->
| sonic-rs | array | decode | 4022 | 20000 | 17650.1 | 17139.2–17794.5 | 288627000 |
<!-- samples | sonic-rs | array | encode | 8204.257,8155.402,8232.728,8253.380,8198.417,8153.527,8186.905 -->
| sonic-rs | array | encode | 4022 | 20000 | 8198.4 | 8153.5–8253.4 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4729.356,4727.829,4751.339,4690.962,4670.712,4750.531,4760.108 -->
| prost (binary) | array | decode | 1923 | 20000 | 4729.4 | 4670.7–4760.1 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7286.181,7465.159,7154.192,7254.093,7201.814,7294.943,7337.930 -->
| prost (binary) | array | encode | 1923 | 20000 | 7286.2 | 7154.2–7465.2 | 284551620 |
<!-- samples | serde_json | floats | decode | 7251.236,7179.408,6910.256,7287.288,7302.055,7447.910,7142.818 -->
| serde_json | floats | decode | 1581 | 2000 | 7251.2 | 6910.3–7447.9 | 3825000 |
<!-- samples | serde_json | floats | encode | 10144.597,10037.647,9897.110,9612.788,9804.601,10567.828,9890.510 -->
| serde_json | floats | encode | 1581 | 2000 | 9897.1 | 9612.8–10567.8 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7142.550,7151.303,7006.534,7080.340,7073.236,7194.413,7156.843 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7142.5 | 7006.5–7194.4 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10384.813,10666.857,10606.196,10432.131,10222.262,10568.517,10570.417 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10568.5 | 10222.3–10666.9 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 1081.839,892.389,849.282,1054.449,826.456,1096.259,844.132 -->
| prost (binary) | floats | decode | 2051 | 2000 | 892.4 | 826.5–1096.3 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 545.192,570.104,582.005,576.058,546.922,544.791,544.473 -->
| prost (binary) | floats | encode | 2051 | 2000 | 546.9 | 544.5–582.0 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 23384.548,22746.943,22688.678,22928.189,23034.150,22467.832,22075.535 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22746.9 | 22075.5–23384.5 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9431.053,9378.516,9177.908,9421.915,9481.930,9362.508,9492.305 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9421.9 | 9177.9–9492.3 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16869.967,16965.383,16759.197,16647.030,16458.977,16263.988,16663.966 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16664.0 | 16264.0–16965.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9916.026,9681.780,9368.422,9766.716,9940.672,9494.769,9850.673 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9766.7 | 9368.4–9940.7 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 732.814,861.349,830.548,760.301,836.603,849.056,800.466 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 830.5 | 732.8–861.3 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 567.747,545.308,546.366,545.452,544.936,544.802,544.816 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 545.3 | 544.8–567.7 | 32664305 |
<!-- samples | serde_json | text-short | decode | 180.709,184.017,187.511,185.460,181.635,181.279,178.150 -->
| serde_json | text-short | decode | 97 | 200000 | 181.6 | 178.1–187.5 | 149907000 |
<!-- samples | serde_json | text-short | encode | 130.261,129.545,129.590,130.050,128.209,127.358,130.699 -->
| serde_json | text-short | encode | 97 | 200000 | 129.6 | 127.4–130.7 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 196.629,193.943,199.676,201.497,198.447,193.640,193.537 -->
| sonic-rs | text-short | decode | 97 | 200000 | 196.6 | 193.5–201.5 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 137.499,135.098,129.374,129.131,131.191,137.838,135.717 -->
| sonic-rs | text-short | encode | 97 | 200000 | 135.1 | 129.1–137.8 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 65.210,63.174,65.705,61.310,63.409,61.715,64.784 -->
| prost (binary) | text-short | decode | 70 | 200000 | 63.4 | 61.3–65.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 41.658,43.597,42.808,43.409,43.125,42.151,41.181 -->
| prost (binary) | text-short | encode | 70 | 200000 | 42.8 | 41.2–43.6 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2952.622,2949.550,2953.992,2949.052,2948.178,2897.169,2763.588 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2949.1 | 2763.6–2954.0 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4944.350,5110.624,5117.983,5146.739,4957.073,5071.163,5048.648 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5071.2 | 4944.4–5146.7 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1707.897,1753.062,1424.417,1385.542,1631.540,1547.269,1427.672 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1547.3 | 1385.5–1753.1 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 679.760,680.403,672.048,674.713,679.612,673.463,676.578 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 676.6 | 672.0–680.4 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 550.904,551.567,547.002,547.516,548.025,550.991,549.202 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 549.2 | 547.0–551.6 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 195.238,193.044,192.619,212.395,215.487,206.054,193.101 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 195.2 | 192.6–215.5 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2268.443,2250.443,2200.345,2322.617,2314.630,2261.367,2328.104 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2268.4 | 2200.3–2328.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4573.560,4605.007,4533.807,4764.872,4812.169,4563.414,4536.847 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4573.6 | 4533.8–4812.2 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1063.982,1065.660,1068.921,1087.834,1149.924,1156.718,1154.561 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1087.8 | 1064.0–1156.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 582.832,580.631,585.828,581.016,577.431,550.750,542.639 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 580.6 | 542.6–585.8 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 510.354,519.482,538.745,552.494,550.737,544.134,537.615 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 538.7 | 510.4–552.5 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 184.429,183.738,184.060,182.315,183.565,183.803,182.513 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 183.7 | 182.3–184.4 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 24380.888,23826.257,23249.908,23567.368,23519.224,23134.597,23750.544 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23567.4 | 23134.6–24380.9 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12475.164,12755.171,12457.902,12529.546,12396.783,12533.690,12650.404 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12529.5 | 12396.8–12755.2 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 14181.466,13981.391,13580.052,13340.256,13094.689,13266.730,13018.195 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13340.3 | 13018.2–14181.5 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8671.937,8434.431,8781.739,8602.951,8520.334,8435.816,8844.292 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8603.0 | 8434.4–8844.3 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8302.934,8096.064,8346.968,8836.971,8648.781,8552.559,8882.968 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8552.6 | 8096.1–8883.0 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 219.662,197.409,198.134,199.350,196.817,199.889,197.552 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 198.1 | 196.8–219.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 1538.767,1528.323,1503.429,1523.583,1549.916,1541.015,1491.257 -->
| serde_json | wide | decode | 135 | 40000 | 1528.3 | 1491.3–1549.9 | 33720000 |
<!-- samples | serde_json | wide | encode | 420.610,411.022,419.991,403.017,442.324,424.638,426.290 -->
| serde_json | wide | encode | 135 | 40000 | 420.6 | 403.0–442.3 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 921.026,921.398,951.963,934.045,930.142,945.740,936.973 -->
| sonic-rs | wide | decode | 135 | 40000 | 934.0 | 921.0–952.0 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 417.614,421.130,1324.316,414.715,424.306,422.443,397.400 -->
| sonic-rs | wide | encode | 135 | 40000 | 421.1 | 397.4–1324.3 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 133.425,134.928,141.295,143.602,141.266,143.290,135.276 -->
| prost (binary) | wide | decode | 31 | 40000 | 141.3 | 133.4–143.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 178.628,162.498,145.129,141.630,151.772,174.527,149.884 -->
| prost (binary) | wide | encode | 31 | 40000 | 151.8 | 141.6–178.6 | 19595809 |
