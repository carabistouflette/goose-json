| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 117.764,111.669,117.444,115.198,114.148,110.195,114.968 -->
| serde_json | plain | decode | 38 | 200000 | 115.0 | 110.2–117.8 | 67248000 |
<!-- samples | serde_json | plain | encode | 54.999,54.608,57.295,58.742,61.507,58.876,56.105 -->
| serde_json | plain | encode | 38 | 200000 | 57.3 | 54.6–61.5 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 194.625,185.192,176.940,197.746,241.038,208.283,199.913 -->
| sonic-rs | plain | decode | 38 | 200000 | 197.7 | 176.9–241.0 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 59.519,58.041,57.080,58.061,62.780,61.018,59.037 -->
| sonic-rs | plain | encode | 38 | 200000 | 59.0 | 57.1–62.8 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 44.361,46.981,53.553,59.523,59.983,55.458,51.928 -->
| prost (binary) | plain | decode | 11 | 200000 | 53.6 | 44.4–60.0 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 30.521,29.817,30.556,30.419,29.075,28.385,27.886 -->
| prost (binary) | plain | encode | 11 | 200000 | 29.8 | 27.9–30.6 | 92719942 |
<!-- samples | serde_json | escaped | decode | 277.747,252.538,231.024,282.653,337.900,331.903,334.938 -->
| serde_json | escaped | decode | 62 | 200000 | 282.7 | 231.0–337.9 | 85461000 |
<!-- samples | serde_json | escaped | encode | 100.585,100.067,98.422,95.435,99.488,101.132,96.415 -->
| serde_json | escaped | encode | 54 | 200000 | 99.5 | 95.4–101.1 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 475.306,474.950,472.856,472.390,467.645,492.899,484.946 -->
| sonic-rs | escaped | decode | 62 | 200000 | 474.9 | 467.6–492.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 172.394,177.511,169.827,165.667,165.760,169.941,169.962 -->
| sonic-rs | escaped | encode | 54 | 200000 | 169.9 | 165.7–177.5 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 72.364,74.075,72.690,71.539,71.884,71.103,70.829 -->
| prost (binary) | escaped | decode | 24 | 200000 | 71.9 | 70.8–74.1 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 34.859,34.399,32.976,32.770,33.000,32.702,32.304 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.0 | 32.3–34.9 | 181133323 |
<!-- samples | serde_json | array | decode | 19729.171,19705.799,20110.533,19928.213,19695.910,21700.465,27090.534 -->
| serde_json | array | decode | 4022 | 20000 | 19928.2 | 19695.9–27090.5 | 288627000 |
<!-- samples | serde_json | array | encode | 8494.194,9370.414,10042.252,10230.603,10031.163,8478.328,9281.247 -->
| serde_json | array | encode | 4022 | 20000 | 9370.4 | 8478.3–10230.6 | 574225548 |
<!-- samples | sonic-rs | array | decode | 26082.189,25529.922,25127.552,26568.044,26476.782,28064.727,30234.649 -->
| sonic-rs | array | decode | 4022 | 20000 | 26476.8 | 25127.6–30234.6 | 288627000 |
<!-- samples | sonic-rs | array | encode | 11143.550,11083.380,11394.551,10483.910,10818.412,10833.814,10966.189 -->
| sonic-rs | array | encode | 4022 | 20000 | 10966.2 | 10483.9–11394.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 6017.171,6679.227,5648.107,6202.756,6116.143,5966.877,6114.832 -->
| prost (binary) | array | decode | 1923 | 20000 | 6114.8 | 5648.1–6679.2 | 288627000 |
<!-- samples | prost (binary) | array | encode | 9482.620,9828.989,9321.577,9106.513,9327.869,9358.902,9346.177 -->
| prost (binary) | array | encode | 1923 | 20000 | 9346.2 | 9106.5–9829.0 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 21101.575,21200.608,21310.563,21345.247,20911.903,21178.854,21605.677 -->
| serde_json | array-signed | decode | 4538 | 20000 | 21200.6 | 20911.9–21605.7 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 9593.865,9528.030,9749.001,9509.760,9115.690,9290.156,9362.964 -->
| serde_json | array-signed | encode | 4537 | 20000 | 9509.8 | 9115.7–9749.0 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 28439.811,29264.576,28798.446,29119.282,92507.854,70603.072,87520.074 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 29264.6 | 28439.8–92507.9 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 70107.663,25563.119,11751.183,12871.385,29791.701,20571.599,10528.302 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 20571.6 | 10528.3–70107.7 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 10243.424,9444.827,10110.699,8212.264,8165.483,8329.274,8998.280 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 8998.3 | 8165.5–10243.4 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 23977.742,25471.610,32750.209,27676.528,24672.050,25920.171,25688.917 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 25688.9 | 23977.7–32750.2 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 55390.916,48464.410,297112.069,52622.701,52813.021,46548.519,37994.353 -->
| serde_json | array-wide | decode | 19771 | 20000 | 52622.7 | 37994.4–297112.1 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 16211.122,20540.640,17284.533,16351.291,17432.410,19104.431,20184.893 -->
| serde_json | array-wide | encode | 19770 | 20000 | 17432.4 | 16211.1–20540.6 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 37141.874,35241.248,34754.547,30327.929,30784.189,38762.069,38810.518 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 35241.2 | 30327.9–38810.5 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 17950.427,17410.882,18300.956,21972.906,56910.800,40153.139,40212.153 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 21972.9 | 17410.9–56910.8 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 22014.509,25244.214,46106.424,24387.791,23969.288,23287.773,22801.674 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 23969.3 | 22014.5–46106.4 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 72220.422,77383.092,74805.178,81003.847,75538.864,73929.401,76253.015 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 75538.9 | 72220.4–81003.8 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 10797.096,10803.235,11221.662,11088.297,10420.283,10620.661,10934.988 -->
| serde_json | mixed | decode | 1187 | 20000 | 10803.2 | 10420.3–11221.7 | 227997000 |
<!-- samples | serde_json | mixed | encode | 6037.612,6056.302,6221.649,5874.679,5951.781,5476.601,5703.404 -->
| serde_json | mixed | encode | 1186 | 20000 | 5951.8 | 5476.6–6221.6 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 10009.434,10140.604,10140.123,10021.879,10326.608,9979.430,10443.616 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 10140.1 | 9979.4–10443.6 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 8935.914,8523.636,7635.672,7445.455,7726.121,7207.868,7505.058 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 7635.7 | 7207.9–8935.9 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 3367.388,3449.399,3327.307,3254.130,3021.967,3467.594,3095.280 -->
| prost (binary) | mixed | decode | 954 | 20000 | 3327.3 | 3022.0–3467.6 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 1401.799,1322.584,1455.934,1369.503,1328.381,1337.354,1343.804 -->
| prost (binary) | mixed | encode | 954 | 20000 | 1343.8 | 1322.6–1455.9 | 149207284 |
<!-- samples | serde_json | floats | decode | 16726.177,16948.048,15568.497,18152.019,15986.751,18317.773,17162.443 -->
| serde_json | floats | decode | 1581 | 2000 | 16948.0 | 15568.5–18317.8 | 3825000 |
<!-- samples | serde_json | floats | encode | 23618.237,22637.551,22210.752,23309.302,21511.939,22920.520,22515.071 -->
| serde_json | floats | encode | 1581 | 2000 | 22637.6 | 21511.9–23618.2 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 18936.940,20376.393,20221.998,18836.806,21915.742,19539.696,20046.987 -->
| sonic-rs | floats | decode | 1581 | 2000 | 20047.0 | 18836.8–21915.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 37283.495,32497.401,36656.276,37688.218,37271.327,34939.779,36510.656 -->
| sonic-rs | floats | encode | 1581 | 2000 | 36656.3 | 32497.4–37688.2 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 3810.776,1788.792,2762.903,2108.293,2527.438,2601.358,1373.931 -->
| prost (binary) | floats | decode | 2051 | 2000 | 2527.4 | 1373.9–3810.8 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 1502.918,465.420,1010.714,467.792,464.471,2357.014,466.212 -->
| prost (binary) | floats | encode | 2051 | 2000 | 467.8 | 464.5–2357.0 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 53391.761,50821.700,52029.237,55741.571,53618.054,48023.967,51056.359 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 52029.2 | 48024.0–55741.6 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 20023.339,20008.004,20599.243,21723.716,20343.112,20810.542,19289.883 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 20343.1 | 19289.9–21723.7 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 36112.241,35007.459,36809.151,37620.946,37517.796,36432.535,36915.734 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 36809.2 | 35007.5–37620.9 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 36920.974,36978.645,36657.047,36708.932,35368.046,37452.061,38293.773 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 36921.0 | 35368.0–38293.8 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 2576.427,1248.348,984.154,3321.427,2995.539,2400.293,2288.026 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 2400.3 | 984.2–3321.4 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 456.951,1877.268,459.991,968.705,1458.842,474.546,460.137 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 474.5 | 457.0–1877.3 | 32664305 |
<!-- samples | serde_json | text-short | decode | 403.159,367.403,362.783,366.208,390.871,364.258,370.928 -->
| serde_json | text-short | decode | 97 | 200000 | 367.4 | 362.8–403.2 | 149907000 |
<!-- samples | serde_json | text-short | encode | 255.140,226.960,248.823,240.290,238.606,234.391,235.313 -->
| serde_json | text-short | encode | 97 | 200000 | 238.6 | 227.0–255.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 481.231,463.113,486.040,499.215,475.400,491.747,488.573 -->
| sonic-rs | text-short | decode | 97 | 200000 | 486.0 | 463.1–499.2 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 310.737,332.602,359.420,325.910,328.178,331.330,341.893 -->
| sonic-rs | text-short | encode | 97 | 200000 | 331.3 | 310.7–359.4 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 156.935,146.275,125.228,157.572,125.413,140.816,143.680 -->
| prost (binary) | text-short | decode | 70 | 200000 | 143.7 | 125.2–157.6 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 70.086,74.095,86.027,66.912,81.154,77.180,72.327 -->
| prost (binary) | text-short | encode | 70 | 200000 | 74.1 | 66.9–86.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 6965.980,7469.249,6792.484,7007.282,8223.907,8238.770,8141.669 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 7469.2 | 6792.5–8238.8 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 15607.677,14409.000,13872.075,13171.449,13152.563,12656.454,13282.991 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 13283.0 | 12656.5–15607.7 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 6492.930,6652.150,7456.651,6390.914,5968.348,6088.204,6118.579 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 6390.9 | 5968.3–7456.7 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 2736.079,826.217,925.206,2191.102,2257.131,1341.901,1097.639 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 1341.9 | 826.2–2736.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 3333.235,1501.631,1639.790,851.219,2288.635,2298.576,851.856 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 1639.8 | 851.2–3333.2 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 1547.836,1119.509,461.868,632.959,435.328,429.474,1860.878 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 633.0 | 429.5–1860.9 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 4584.489,5438.493,5528.193,5458.492,4184.755,4915.846,4193.509 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 4915.8 | 4184.8–5528.2 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 13354.379,11240.066,10997.333,14265.971,11703.721,12500.924,13924.904 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 12500.9 | 10997.3–14266.0 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 4657.075,3686.662,4156.063,3770.691,5170.749,4381.670,4427.880 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 4381.7 | 3686.7–5170.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 1879.821,1735.304,853.973,2307.854,1365.804,3238.936,853.619 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 1735.3 | 853.6–3238.9 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 906.490,2323.369,2374.091,900.418,1700.316,901.860,3672.603 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 1700.3 | 900.4–3672.6 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 1263.133,1185.891,502.527,1406.979,1066.080,500.396,1529.736 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 1185.9 | 500.4–1529.7 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 78455.804,75798.597,79754.407,79200.473,79725.243,72601.360,79451.462 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 79200.5 | 72601.4–79754.4 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 28119.956,24822.901,24512.156,27882.138,26075.250,26275.323,26000.687 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 26075.2 | 24512.2–28120.0 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 53543.259,60024.825,56605.160,53368.377,61364.657,61542.791,54446.157 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 56605.2 | 53368.4–61542.8 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 20211.664,19850.668,21625.344,22059.595,20415.734,17256.113,20360.429 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 20360.4 | 17256.1–22059.6 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 21782.506,22277.322,25160.255,23181.960,20372.953,22210.269,20624.964 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 22210.3 | 20373.0–25160.3 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 371.284,421.829,376.693,1770.582,460.498,388.705,1837.391 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 421.8 | 371.3–1837.4 | 101649504 |
<!-- samples | serde_json | wide | decode | 2177.248,2100.418,2074.006,2034.156,1946.113,2001.991,2004.794 -->
| serde_json | wide | decode | 135 | 40000 | 2034.2 | 1946.1–2177.2 | 33720000 |
<!-- samples | serde_json | wide | encode | 1070.269,1154.673,1118.117,1244.939,1139.095,1319.043,1494.776 -->
| serde_json | wide | encode | 135 | 40000 | 1154.7 | 1070.3–1494.8 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 3081.166,2507.060,3729.991,2454.824,2291.983,2407.492,2403.115 -->
| sonic-rs | wide | decode | 135 | 40000 | 2454.8 | 2292.0–3730.0 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 988.237,1022.449,1167.875,1107.261,1119.927,1085.089,1021.434 -->
| sonic-rs | wide | encode | 135 | 40000 | 1085.1 | 988.2–1167.9 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 339.942,399.914,356.793,317.426,345.242,337.768,350.056 -->
| prost (binary) | wide | decode | 31 | 40000 | 345.2 | 317.4–399.9 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 367.255,336.204,396.127,297.724,331.732,368.631,324.030 -->
| prost (binary) | wide | encode | 31 | 40000 | 336.2 | 297.7–396.1 | 19595809 |
