| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 150.357,148.011,147.399,147.461,147.503,147.349,146.236 -->
| serde_json | plain | decode | 38 | 200000 | 147.5 | 146.2–150.4 | 67248000 |
<!-- samples | serde_json | plain | encode | 74.456,74.162,74.406,73.937,74.082,74.563,74.068 -->
| serde_json | plain | encode | 38 | 200000 | 74.2 | 73.9–74.6 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 269.355,273.584,283.997,273.883,267.180,267.122,266.178 -->
| sonic-rs | plain | decode | 38 | 200000 | 269.4 | 266.2–284.0 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 79.359,79.655,79.541,79.384,79.586,79.770,79.450 -->
| sonic-rs | plain | encode | 38 | 200000 | 79.5 | 79.4–79.8 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 60.102,60.451,60.737,60.623,60.001,60.111,60.705 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.5 | 60.0–60.7 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 33.894,33.821,33.574,33.821,33.847,33.863,33.592 -->
| prost (binary) | plain | encode | 11 | 200000 | 33.8 | 33.6–33.9 | 92719942 |
<!-- samples | serde_json | escaped | decode | 319.519,319.423,318.905,318.562,329.865,321.103,320.755 -->
| serde_json | escaped | decode | 62 | 200000 | 319.5 | 318.6–329.9 | 85461000 |
<!-- samples | serde_json | escaped | encode | 94.585,94.404,94.478,94.721,94.447,94.503,94.477 -->
| serde_json | escaped | encode | 54 | 200000 | 94.5 | 94.4–94.7 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 462.899,463.415,464.848,461.389,464.126,461.170,459.395 -->
| sonic-rs | escaped | decode | 62 | 200000 | 462.9 | 459.4–464.8 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 168.285,169.416,169.039,169.523,169.269,169.613,170.033 -->
| sonic-rs | escaped | encode | 54 | 200000 | 169.4 | 168.3–170.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 71.746,71.869,72.023,74.540,77.841,80.971,82.757 -->
| prost (binary) | escaped | decode | 24 | 200000 | 74.5 | 71.7–82.8 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 40.397,40.773,40.327,40.607,40.622,40.339,40.753 -->
| prost (binary) | escaped | encode | 24 | 200000 | 40.6 | 40.3–40.8 | 181133323 |
<!-- samples | serde_json | array | decode | 19775.477,19308.889,19331.092,19767.076,19503.107,19902.481,20943.448 -->
| serde_json | array | decode | 4022 | 20000 | 19767.1 | 19308.9–20943.4 | 288627000 |
<!-- samples | serde_json | array | encode | 9709.352,9677.861,9635.610,10350.087,9596.115,9652.217,9094.730 -->
| serde_json | array | encode | 4022 | 20000 | 9652.2 | 9094.7–10350.1 | 574225548 |
<!-- samples | sonic-rs | array | decode | 25187.368,25789.006,25697.443,25731.777,26215.927,25699.256,25764.735 -->
| sonic-rs | array | decode | 4022 | 20000 | 25731.8 | 25187.4–26215.9 | 288627000 |
<!-- samples | sonic-rs | array | encode | 10258.481,10237.378,10223.385,10191.604,10202.173,10272.780,10194.596 -->
| sonic-rs | array | encode | 4022 | 20000 | 10223.4 | 10191.6–10272.8 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5600.383,5915.279,5930.823,5773.271,5605.769,5632.512,5815.869 -->
| prost (binary) | array | decode | 1923 | 20000 | 5773.3 | 5600.4–5930.8 | 288627000 |
<!-- samples | prost (binary) | array | encode | 8903.414,9048.245,9235.546,9011.033,9011.506,9544.687,9632.513 -->
| prost (binary) | array | encode | 1923 | 20000 | 9048.2 | 8903.4–9632.5 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 19767.695,18852.405,19118.757,20080.536,20328.568,20226.852,19893.798 -->
| serde_json | array-signed | decode | 4538 | 20000 | 19893.8 | 18852.4–20328.6 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 8976.214,8979.141,8973.718,8980.454,8974.326,8986.360,8975.562 -->
| serde_json | array-signed | encode | 4537 | 20000 | 8976.2 | 8973.7–8986.4 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 25514.346,25633.944,25552.065,25495.449,25506.733,25959.246,28324.289 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 25552.1 | 25495.4–28324.3 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 9057.121,9073.245,9042.228,9036.786,9060.092,9023.040,9007.008 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 9042.2 | 9007.0–9073.2 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 7705.842,7740.854,7743.417,7726.204,7704.276,7706.099,7703.633 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 7706.1 | 7703.6–7743.4 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 21726.980,21723.924,22180.421,21741.642,21758.992,21736.534,21757.445 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 21741.6 | 21723.9–22180.4 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 44208.341,42199.117,42126.506,44733.224,46896.538,43726.679,42596.949 -->
| serde_json | array-wide | decode | 19771 | 20000 | 43726.7 | 42126.5–46896.5 | 101943000 |
<!-- samples | serde_json | array-wide | encode | 16470.611,16119.486,16168.982,16141.273,16801.444,16789.233,16194.277 -->
| serde_json | array-wide | encode | 19770 | 20000 | 16194.3 | 16119.5–16801.4 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 31323.608,31176.095,31353.919,31346.270,31657.597,31780.074,31813.473 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 31353.9 | 31176.1–31813.5 | 101943000 |
<!-- samples | sonic-rs | array-wide | encode | 18007.577,17787.779,17486.658,17507.687,18108.819,18447.477,18454.195 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 18007.6 | 17486.7–18454.2 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 10292.078,10328.921,10328.199,10337.203,10268.122,10319.562,10399.343 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 10328.2 | 10268.1–10399.3 | 101943000 |
<!-- samples | prost (binary) | array-wide | encode | 31124.275,30690.608,31571.601,31062.205,30827.468,30686.416,30657.424 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 30827.5 | 30657.4–31571.6 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4182.630,4129.074,4133.103,4311.647,4324.349,4331.644,4343.452 -->
| serde_json | mixed | decode | 1187 | 20000 | 4311.6 | 4129.1–4343.5 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2582.720,2588.284,2594.983,2591.662,2598.034,2738.885,2709.367 -->
| serde_json | mixed | encode | 1186 | 20000 | 2595.0 | 2582.7–2738.9 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4231.221,4256.051,4103.072,4005.368,3941.434,3906.768,3903.723 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 4005.4 | 3903.7–4256.1 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3008.165,3106.536,3149.315,3193.581,3178.410,3114.421,3189.746 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3149.3 | 3008.2–3193.6 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1293.635,1296.677,1282.328,1350.424,1307.495,1280.181,1275.116 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1293.6 | 1275.1–1350.4 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 588.612,589.133,599.136,597.509,584.167,586.816,575.211 -->
| prost (binary) | mixed | encode | 954 | 20000 | 588.6 | 575.2–599.1 | 149207284 |
<!-- samples | serde_json | floats | decode | 7224.935,7155.461,7491.338,7470.090,7463.374,7457.972,7418.500 -->
| serde_json | floats | decode | 1581 | 2000 | 7458.0 | 7155.5–7491.3 | 3825000 |
<!-- samples | serde_json | floats | encode | 9511.442,9486.014,9512.664,9473.327,9492.097,9514.322,9507.030 -->
| serde_json | floats | encode | 1581 | 2000 | 9507.0 | 9473.3–9514.3 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 8083.730,7964.136,8299.869,8309.615,8306.598,8158.219,8331.580 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8299.9 | 7964.1–8331.6 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 14480.949,15226.077,15187.961,14964.896,14392.899,14507.159,14346.141 -->
| sonic-rs | floats | encode | 1581 | 2000 | 14507.2 | 14346.1–15226.1 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 758.010,762.252,798.222,819.583,782.099,768.169,777.507 -->
| prost (binary) | floats | decode | 2051 | 2000 | 777.5 | 758.0–819.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 397.688,398.555,388.207,412.134,397.695,392.699,392.568 -->
| prost (binary) | floats | encode | 2051 | 2000 | 397.7 | 388.2–412.1 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 20376.299,20691.559,20854.854,20926.533,21559.025,21555.963,21428.892 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 20926.5 | 20376.3–21559.0 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9172.877,9224.353,9211.881,9204.966,9249.938,9260.131,9239.747 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9224.4 | 9172.9–9260.1 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 15805.942,15891.918,15905.303,15894.814,15843.545,15907.681,15830.921 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15891.9 | 15805.9–15907.7 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 16287.202,16348.392,16319.229,16351.661,16326.773,16298.046,16314.455 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 16319.2 | 16287.2–16351.7 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 1020.982,997.996,1011.063,1003.833,1008.354,1010.472,1018.394 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 1010.5 | 998.0–1021.0 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 408.075,405.935,401.142,406.544,408.260,425.891,405.719 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 406.5 | 401.1–425.9 | 32664305 |
<!-- samples | serde_json | text-short | decode | 160.627,162.805,162.029,160.541,153.509,161.604,158.864 -->
| serde_json | text-short | decode | 97 | 200000 | 160.6 | 153.5–162.8 | 149907000 |
<!-- samples | serde_json | text-short | encode | 128.063,130.224,129.832,130.144,130.660,136.487,138.938 -->
| serde_json | text-short | encode | 97 | 200000 | 130.2 | 128.1–138.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 230.262,237.838,234.611,223.897,223.420,221.566,221.010 -->
| sonic-rs | text-short | decode | 97 | 200000 | 223.9 | 221.0–237.8 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 141.975,146.472,141.263,140.823,140.181,141.539,145.052 -->
| sonic-rs | text-short | encode | 97 | 200000 | 141.5 | 140.2–146.5 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 60.617,60.642,60.560,60.731,60.747,59.742,59.296 -->
| prost (binary) | text-short | decode | 70 | 200000 | 60.6 | 59.3–60.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 33.215,32.048,31.926,31.837,31.930,31.959,31.948 -->
| prost (binary) | text-short | encode | 70 | 200000 | 31.9 | 31.8–33.2 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3054.425,3120.866,3015.155,2952.579,2946.977,3100.806,2933.363 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3015.2 | 2933.4–3120.9 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5381.438,5424.434,5371.331,5386.125,5377.739,5356.945,5376.628 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5377.7 | 5356.9–5424.4 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2411.211,2418.066,2386.789,2421.030,2396.427,2385.088,2412.673 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2411.2 | 2385.1–2421.0 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 683.446,688.410,684.904,689.066,693.062,685.076,702.013 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 688.4 | 683.4–702.0 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 706.739,704.700,703.722,705.761,704.172,699.678,701.976 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 704.2 | 699.7–706.7 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 359.605,363.817,366.483,361.699,358.779,367.067,370.291 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 363.8 | 358.8–370.3 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2102.544,2139.720,2220.163,2228.619,2246.192,2245.043,2239.094 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2228.6 | 2102.5–2246.2 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5332.597,5287.207,5487.463,5582.440,5568.073,5655.771,5538.327 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5538.3 | 5287.2–5655.8 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1937.434,1943.255,1961.657,1942.788,1941.159,1950.591,1949.400 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1943.3 | 1937.4–1961.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 760.713,744.702,756.966,746.321,758.178,741.699,751.934 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 751.9 | 741.7–760.7 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 776.283,776.385,774.912,790.874,775.864,784.896,782.935 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 776.4 | 774.9–790.9 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 412.555,416.818,409.438,414.599,410.635,410.455,417.793 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 412.6 | 409.4–417.8 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 31301.553,31712.406,31615.328,31913.846,33250.154,38721.336,33406.752 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 31913.8 | 31301.6–38721.3 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 10971.627,10971.641,11027.688,10989.941,10970.956,10988.191,11001.795 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 10988.2 | 10971.0–11027.7 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 20752.928,20689.663,20628.116,20778.541,20797.741,20648.547,20735.983 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 20736.0 | 20628.1–20797.7 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8489.546,8474.856,8522.114,8526.416,8525.548,8509.756,8517.025 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8517.0 | 8474.9–8526.4 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 7541.993,7559.780,7567.109,7622.975,7579.739,7574.232,7577.329 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 7574.2 | 7542.0–7623.0 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 329.314,324.658,333.639,334.604,323.468,326.117,329.037 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 329.0 | 323.5–334.6 | 101649504 |
<!-- samples | serde_json | wide | decode | 826.774,823.727,823.371,823.721,826.025,822.650,823.050 -->
| serde_json | wide | decode | 135 | 40000 | 823.7 | 822.6–826.8 | 33720000 |
<!-- samples | serde_json | wide | encode | 443.024,443.312,444.327,441.954,441.809,442.464,441.527 -->
| serde_json | wide | encode | 135 | 40000 | 442.5 | 441.5–444.3 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1004.533,1013.332,1013.442,1014.115,1014.695,1000.599,1004.461 -->
| sonic-rs | wide | decode | 135 | 40000 | 1013.3 | 1000.6–1014.7 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 442.302,443.789,443.593,441.610,440.372,471.998,476.199 -->
| sonic-rs | wide | encode | 135 | 40000 | 443.6 | 440.4–476.2 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 148.503,149.400,147.309,147.402,145.770,147.747,147.282 -->
| prost (binary) | wide | decode | 31 | 40000 | 147.4 | 145.8–149.4 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 134.850,138.275,133.573,130.563,131.345,130.120,138.117 -->
| prost (binary) | wide | encode | 31 | 40000 | 133.6 | 130.1–138.3 | 19595809 |
