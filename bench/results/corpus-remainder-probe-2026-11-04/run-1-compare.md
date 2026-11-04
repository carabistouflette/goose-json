| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 289.546,229.831,267.545,259.926,311.425,321.210,324.807 -->
| serde_json | plain | decode | 38 | 200000 | 289.5 | 229.8–324.8 | 67248000 |
<!-- samples | serde_json | plain | encode | 146.453,139.111,128.169,128.125,140.058,135.439,138.967 -->
| serde_json | plain | encode | 38 | 200000 | 139.0 | 128.1–146.5 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 481.627,449.659,481.444,470.141,534.205,575.191,573.780 -->
| sonic-rs | plain | decode | 38 | 200000 | 481.6 | 449.7–575.2 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 170.773,173.952,176.095,166.219,175.371,171.471,161.231 -->
| sonic-rs | plain | encode | 38 | 200000 | 171.5 | 161.2–176.1 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 137.214,136.319,125.194,137.413,126.834,134.583,103.568 -->
| prost (binary) | plain | decode | 11 | 200000 | 134.6 | 103.6–137.4 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 59.728,67.306,76.560,62.661,65.741,63.742,64.460 -->
| prost (binary) | plain | encode | 11 | 200000 | 64.5 | 59.7–76.6 | 92719942 |
<!-- samples | serde_json | escaped | decode | 580.411,600.624,615.326,565.975,622.421,585.083,536.697 -->
| serde_json | escaped | decode | 62 | 200000 | 585.1 | 536.7–622.4 | 85461000 |
<!-- samples | serde_json | escaped | encode | 166.850,168.966,154.619,189.103,184.842,157.929,180.796 -->
| serde_json | escaped | encode | 54 | 200000 | 169.0 | 154.6–189.1 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 866.125,761.930,878.084,901.890,850.960,869.230,883.856 -->
| sonic-rs | escaped | decode | 62 | 200000 | 869.2 | 761.9–901.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 338.684,381.962,326.602,300.304,294.183,309.247,318.149 -->
| sonic-rs | escaped | encode | 54 | 200000 | 318.1 | 294.2–382.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 120.733,137.900,137.567,138.248,141.914,125.453,139.107 -->
| prost (binary) | escaped | decode | 24 | 200000 | 137.9 | 120.7–141.9 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 59.235,58.436,56.592,73.289,62.145,57.000,61.465 -->
| prost (binary) | escaped | encode | 24 | 200000 | 59.2 | 56.6–73.3 | 181133323 |
<!-- samples | serde_json | array | decode | 34881.179,32743.063,35612.087,37021.577,35402.795,38079.373,36412.490 -->
| serde_json | array | decode | 4022 | 20000 | 35612.1 | 32743.1–38079.4 | 288627000 |
<!-- samples | serde_json | array | encode | 16612.842,15601.976,14925.372,15171.564,18173.881,15545.575,16183.289 -->
| serde_json | array | encode | 4022 | 20000 | 15602.0 | 14925.4–18173.9 | 574225548 |
<!-- samples | sonic-rs | array | decode | 40247.132,42795.379,46034.713,47202.670,52298.019,50809.715,41657.823 -->
| sonic-rs | array | decode | 4022 | 20000 | 46034.7 | 40247.1–52298.0 | 288627000 |
<!-- samples | sonic-rs | array | encode | 16860.754,15932.276,18772.406,18547.860,16190.207,17349.293,19310.385 -->
| sonic-rs | array | encode | 4022 | 20000 | 17349.3 | 15932.3–19310.4 | 574225548 |
<!-- samples | prost (binary) | array | decode | 11046.199,9115.408,11193.423,10523.275,11010.605,9870.711,9528.029 -->
| prost (binary) | array | decode | 1923 | 20000 | 10523.3 | 9115.4–11193.4 | 288627000 |
<!-- samples | prost (binary) | array | encode | 16436.798,9628.620,9728.960,9663.314,9659.017,9837.723,9852.867 -->
| prost (binary) | array | encode | 1923 | 20000 | 9729.0 | 9628.6–16436.8 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 20082.379,19921.106,19540.486,19617.833,19745.077,20149.377,19552.581 -->
| serde_json | array-signed | decode | 4538 | 20000 | 19745.1 | 19540.5–20149.4 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 8789.120,8729.616,8532.529,8932.423,8943.914,8711.904,8676.121 -->
| serde_json | array-signed | encode | 4537 | 20000 | 8729.6 | 8532.5–8943.9 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 25818.575,26278.534,25197.790,25392.202,25637.383,25316.219,25387.124 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 25392.2 | 25197.8–26278.5 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 8946.298,8972.089,8977.828,8544.043,8657.919,9029.799,9294.549 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 8972.1 | 8544.0–9294.5 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 7775.758,7622.552,7533.650,7055.063,7507.313,7793.812,7682.372 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 7622.6 | 7055.1–7793.8 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 22047.500,22043.323,21328.486,21084.448,20380.149,20764.927,21110.316 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 21110.3 | 20380.1–22047.5 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 42440.969,45158.726,42053.864,43190.435,43160.674,42385.714,42510.231 -->
| serde_json | array-wide | decode | 19771 | 20000 | 42510.2 | 42053.9–45158.7 | 101943000 |
<!-- samples | serde_json | array-wide | encode | 16820.875,18119.447,16866.344,16810.574,16198.130,15959.947,16240.364 -->
| serde_json | array-wide | encode | 19770 | 20000 | 16810.6 | 15959.9–18119.4 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 31434.619,31870.134,31309.755,31998.934,31943.551,29664.607,21267.573 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 31434.6 | 21267.6–31998.9 | 101943000 |
<!-- samples | sonic-rs | array-wide | encode | 12298.548,12383.569,12126.693,13059.109,12017.962,11818.689,12121.021 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 12126.7 | 11818.7–13059.1 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 6888.432,6923.711,6893.887,6857.910,6837.404,6846.009,6746.667 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 6857.9 | 6746.7–6923.7 | 101943000 |
<!-- samples | prost (binary) | array-wide | encode | 27861.727,34136.737,34900.262,34609.457,34258.979,35753.406,35811.794 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 34609.5 | 27861.7–35811.8 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4522.359,4646.017,4557.006,4595.519,5019.219,4940.501,5034.065 -->
| serde_json | mixed | decode | 1187 | 20000 | 4646.0 | 4522.4–5034.1 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2745.166,2781.905,2758.005,2724.746,2807.646,2782.915,2845.508 -->
| serde_json | mixed | encode | 1186 | 20000 | 2781.9 | 2724.7–2845.5 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4562.317,3368.996,2778.192,3036.170,3470.979,4300.767,3633.373 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 3471.0 | 2778.2–4562.3 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 2339.580,2171.192,2522.200,2549.672,2584.094,2742.816,2434.305 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 2522.2 | 2171.2–2742.8 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 971.592,988.361,913.462,881.741,854.974,846.747,852.444 -->
| prost (binary) | mixed | decode | 954 | 20000 | 881.7 | 846.7–988.4 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 396.213,395.976,396.653,402.859,401.680,420.118,433.206 -->
| prost (binary) | mixed | encode | 954 | 20000 | 401.7 | 396.0–433.2 | 149207284 |
<!-- samples | serde_json | floats | decode | 5077.431,5042.578,5045.694,4906.871,4865.953,4860.944,5047.313 -->
| serde_json | floats | decode | 1581 | 2000 | 5042.6 | 4860.9–5077.4 | 3825000 |
<!-- samples | serde_json | floats | encode | 6719.236,6520.793,6507.797,6528.637,6523.907,6351.059,6303.443 -->
| serde_json | floats | encode | 1581 | 2000 | 6520.8 | 6303.4–6719.2 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5452.374,5448.488,5437.128,5441.680,5446.260,5630.677,5621.105 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5448.5 | 5437.1–5630.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10012.940,9996.556,9920.169,9920.863,9948.531,9770.730,9739.903 -->
| sonic-rs | floats | encode | 1581 | 2000 | 9920.9 | 9739.9–10012.9 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 560.823,560.061,560.399,560.528,560.687,559.958,561.345 -->
| prost (binary) | floats | decode | 2051 | 2000 | 560.5 | 560.0–561.3 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 273.848,271.151,274.325,274.052,278.245,272.113,274.288 -->
| prost (binary) | floats | encode | 2051 | 2000 | 274.1 | 271.2–278.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 14652.921,14638.306,14612.001,14306.288,14438.399,14473.999,14426.060 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 14474.0 | 14306.3–14652.9 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 6017.538,6099.802,6481.154,6241.071,6262.288,6247.660,6231.858 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 6241.1 | 6017.5–6481.2 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 10289.528,10316.016,10291.249,10610.761,10788.435,10573.916,10281.022 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 10316.0 | 10281.0–10788.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 10671.452,10674.008,10688.348,10666.911,10664.851,10683.403,10682.905 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 10674.0 | 10664.9–10688.3 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 811.877,815.501,815.430,812.313,814.984,816.696,812.399 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 815.0 | 811.9–816.7 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 267.219,268.707,266.551,269.062,266.553,269.108,266.553 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 267.2 | 266.6–269.1 | 32664305 |
<!-- samples | serde_json | text-short | decode | 105.226,114.563,112.427,108.470,105.595,105.386,105.675 -->
| serde_json | text-short | decode | 97 | 200000 | 105.7 | 105.2–114.6 | 149907000 |
<!-- samples | serde_json | text-short | encode | 73.790,73.924,71.557,71.445,71.559,71.328,71.181 -->
| serde_json | text-short | encode | 97 | 200000 | 71.6 | 71.2–73.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 148.319,146.364,146.360,147.874,147.025,147.131,146.410 -->
| sonic-rs | text-short | decode | 97 | 200000 | 147.0 | 146.4–148.3 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 96.059,96.428,96.636,99.085,98.072,97.334,97.978 -->
| sonic-rs | text-short | encode | 97 | 200000 | 97.3 | 96.1–99.1 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 40.178,40.408,41.572,41.958,41.834,41.862,40.437 -->
| prost (binary) | text-short | decode | 70 | 200000 | 41.6 | 40.2–42.0 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 23.325,23.784,23.346,23.557,23.437,23.773,23.201 -->
| prost (binary) | text-short | encode | 70 | 200000 | 23.4 | 23.2–23.8 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2163.252,2132.783,2134.736,2130.515,2130.235,2129.040,2103.992 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2130.5 | 2104.0–2163.3 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 3756.098,3756.111,3774.875,3771.175,3816.300,3789.829,3788.548 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 3774.9 | 3756.1–3816.3 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1692.438,1656.698,1669.921,1684.316,1672.039,1661.155,1656.616 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1669.9 | 1656.6–1692.4 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 479.021,478.985,480.329,482.877,480.830,478.541,479.960 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 480.0 | 478.5–482.9 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 492.105,490.781,491.474,492.029,490.726,490.865,491.604 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 491.5 | 490.7–492.1 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 255.130,253.000,255.707,253.004,254.867,253.009,254.291 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 254.3 | 253.0–255.7 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1471.333,1468.562,1465.965,1465.844,1468.895,1469.293,1468.407 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1468.6 | 1465.8–1471.3 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 3401.655,3419.219,3411.044,3417.512,3411.785,3403.093,3420.943 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 3411.8 | 3401.7–3420.9 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1202.310,1201.352,1203.213,1210.385,1229.005,1199.170,1196.798 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1202.3 | 1196.8–1229.0 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 462.663,463.582,463.577,462.904,463.683,460.257,463.359 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 463.4 | 460.3–463.7 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 479.757,479.701,481.210,482.550,479.866,481.136,482.897 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 481.1 | 479.7–482.9 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 251.851,254.286,251.708,254.267,251.645,254.622,251.630 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 251.9 | 251.6–254.6 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 20844.890,19531.740,19714.809,19598.517,19028.592,19017.749,19020.671 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 19531.7 | 19017.7–20844.9 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 7183.605,7150.596,7185.250,7169.008,7233.695,7190.453,7176.963 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 7183.6 | 7150.6–7233.7 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 14343.044,14369.633,13910.522,13726.744,13720.817,13715.550,14113.785 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13910.5 | 13715.6–14369.6 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 5669.736,5592.084,5593.623,5612.507,5599.462,5760.561,6092.814 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 5612.5 | 5592.1–6092.8 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 5187.938,5148.096,5161.999,5153.451,5133.976,4974.906,4955.709 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 5148.1 | 4955.7–5187.9 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 215.142,218.988,218.886,215.946,217.623,216.688,219.326 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 217.6 | 215.1–219.3 | 101649504 |
<!-- samples | serde_json | wide | decode | 582.388,663.797,750.981,671.729,600.314,567.004,546.854 -->
| serde_json | wide | decode | 135 | 40000 | 600.3 | 546.9–751.0 | 33720000 |
<!-- samples | serde_json | wide | encode | 292.022,291.321,290.752,291.822,293.711,301.819,298.793 -->
| serde_json | wide | encode | 135 | 40000 | 292.0 | 290.8–301.8 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 655.523,649.107,657.999,660.530,659.082,659.743,672.583 -->
| sonic-rs | wide | decode | 135 | 40000 | 659.1 | 649.1–672.6 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 297.054,291.216,296.490,292.565,290.564,289.976,290.096 -->
| sonic-rs | wide | encode | 135 | 40000 | 291.2 | 290.0–297.1 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 97.336,96.910,97.694,96.781,94.095,94.497,96.737 -->
| prost (binary) | wide | decode | 31 | 40000 | 96.8 | 94.1–97.7 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 91.643,92.546,93.930,92.455,91.411,93.280,92.870 -->
| prost (binary) | wide | encode | 31 | 40000 | 92.5 | 91.4–93.9 | 19595809 |
