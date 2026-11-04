| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 164.299,165.170,156.397,158.414,154.671,157.387,157.982 -->
| serde_json | plain | decode | 38 | 20000 | 158.0 | 154.7–165.2 | 6768000 |
<!-- samples | serde_json | plain | encode | 79.537,80.103,82.077,82.422,84.821,84.487,84.680 -->
| serde_json | plain | encode | 38 | 20000 | 82.4 | 79.5–84.8 | 16855732 |
<!-- samples | sonic-rs | plain | decode | 303.795,304.490,302.713,306.116,306.226,303.957,302.976 -->
| sonic-rs | plain | decode | 38 | 20000 | 304.0 | 302.7–306.2 | 6768000 |
<!-- samples | sonic-rs | plain | encode | 88.889,89.351,89.422,85.417,84.254,85.661,87.239 -->
| sonic-rs | plain | encode | 38 | 20000 | 87.2 | 84.3–89.4 | 16855732 |
<!-- samples | prost (binary) | plain | decode | 63.170,63.690,64.166,63.346,63.944,63.264,63.275 -->
| prost (binary) | plain | decode | 11 | 20000 | 63.3 | 63.2–64.2 | 6768000 |
<!-- samples | prost (binary) | plain | encode | 35.253,35.790,35.191,36.263,34.733,35.604,36.090 -->
| prost (binary) | plain | encode | 11 | 20000 | 35.6 | 34.7–36.3 | 9331168 |
<!-- samples | serde_json | escaped | decode | 336.049,338.005,345.843,352.975,357.414,350.903,335.249 -->
| serde_json | escaped | decode | 62 | 20000 | 345.8 | 335.2–357.4 | 8601000 |
<!-- samples | serde_json | escaped | encode | 102.858,106.822,107.252,106.861,104.753,105.825,101.563 -->
| serde_json | escaped | encode | 54 | 20000 | 105.8 | 101.6–107.3 | 21663705 |
<!-- samples | sonic-rs | escaped | decode | 510.603,525.452,516.635,510.618,505.388,493.383,497.053 -->
| sonic-rs | escaped | decode | 62 | 20000 | 510.6 | 493.4–525.5 | 8601000 |
<!-- samples | sonic-rs | escaped | encode | 179.416,180.368,181.167,181.232,181.875,180.713,181.696 -->
| sonic-rs | escaped | encode | 54 | 20000 | 181.2 | 179.4–181.9 | 21663705 |
<!-- samples | prost (binary) | escaped | decode | 74.442,74.430,75.211,74.977,75.068,75.412,75.056 -->
| prost (binary) | escaped | decode | 24 | 20000 | 75.1 | 74.4–75.4 | 8601000 |
<!-- samples | prost (binary) | escaped | encode | 34.572,35.187,35.002,34.630,35.113,34.952,34.620 -->
| prost (binary) | escaped | encode | 24 | 20000 | 35.0 | 34.6–35.2 | 18225823 |
<!-- samples | serde_json | array | decode | 20553.231,20488.828,20471.451,20521.215,20521.689,20481.617,20485.137 -->
| serde_json | array | decode | 4022 | 2000 | 20488.8 | 20471.5–20553.2 | 30705000 |
<!-- samples | serde_json | array | encode | 10367.083,10809.870,10780.943,10756.835,10773.783,10784.397,10773.373 -->
| serde_json | array | encode | 4022 | 2000 | 10773.8 | 10367.1–10809.9 | 61080811 |
<!-- samples | sonic-rs | array | decode | 30212.401,29808.594,29416.213,30559.090,30775.581,29230.372,29109.665 -->
| sonic-rs | array | decode | 4022 | 2000 | 29808.6 | 29109.7–30775.6 | 30705000 |
<!-- samples | sonic-rs | array | encode | 10724.316,10731.348,10538.044,10819.926,11418.157,11452.743,11406.029 -->
| sonic-rs | array | encode | 4022 | 2000 | 10819.9 | 10538.0–11452.7 | 61080811 |
<!-- samples | prost (binary) | array | decode | 6214.697,6266.310,6237.413,6459.258,6334.766,6097.223,5935.035 -->
| prost (binary) | array | decode | 1923 | 2000 | 6237.4 | 5935.0–6459.3 | 30705000 |
<!-- samples | prost (binary) | array | encode | 10553.225,10392.836,10657.180,10374.932,10403.908,10313.280,10314.645 -->
| prost (binary) | array | encode | 1923 | 2000 | 10392.8 | 10313.3–10657.2 | 30239709 |
<!-- samples | serde_json | array-signed | decode | 21077.440,21110.963,21147.223,21094.292,21088.330,21428.870,23580.361 -->
| serde_json | array-signed | decode | 4538 | 2000 | 21111.0 | 21077.4–23580.4 | 15375000 |
<!-- samples | serde_json | array-signed | encode | 10799.004,10897.695,10840.031,10843.632,10823.318,10606.952,10123.610 -->
| serde_json | array-signed | encode | 4537 | 2000 | 10823.3 | 10123.6–10897.7 | 68796382 |
<!-- samples | sonic-rs | array-signed | decode | 28520.543,28540.653,27361.201,27833.966,28431.788,29200.945,29011.709 -->
| sonic-rs | array-signed | decode | 4538 | 2000 | 28520.5 | 27361.2–29200.9 | 15375000 |
<!-- samples | sonic-rs | array-signed | encode | 9831.223,10515.043,11132.658,10570.310,10543.654,10562.559,10522.115 -->
| sonic-rs | array-signed | encode | 4537 | 2000 | 10543.7 | 9831.2–11132.7 | 68796382 |
<!-- samples | prost (binary) | array-signed | decode | 8188.447,8240.282,8300.790,8468.786,8295.585,8676.120,8336.484 -->
| prost (binary) | array-signed | decode | 6083 | 2000 | 8300.8 | 8188.4–8676.1 | 15375000 |
<!-- samples | prost (binary) | array-signed | encode | 23929.992,23621.900,23979.965,25131.005,25112.062,24715.518,23283.046 -->
| prost (binary) | array-signed | encode | 6083 | 2000 | 23980.0 | 23283.0–25131.0 | 94310580 |
<!-- samples | serde_json | array-wide | decode | 47409.361,47348.266,47517.590,48324.961,50723.671,50566.054,50581.935 -->
| serde_json | array-wide | decode | 19771 | 2000 | 48325.0 | 47348.3–50723.7 | 26205000 |
<!-- samples | serde_json | array-wide | encode | 19048.570,19156.052,19111.514,19132.992,19125.009,19067.156,18460.037 -->
| serde_json | array-wide | encode | 19770 | 2000 | 19111.5 | 18460.0–19156.1 | 297316216 |
<!-- samples | sonic-rs | array-wide | decode | 37777.213,39088.413,37973.031,37530.822,37861.422,39716.854,38377.659 -->
| sonic-rs | array-wide | decode | 19771 | 2000 | 37973.0 | 37530.8–39716.9 | 26205000 |
<!-- samples | sonic-rs | array-wide | encode | 20846.253,21005.714,22004.013,21449.487,20842.273,21492.192,20810.288 -->
| sonic-rs | array-wide | encode | 19770 | 2000 | 21005.7 | 20810.3–22004.0 | 297316216 |
<!-- samples | prost (binary) | array-wide | decode | 11545.672,11524.518,11924.773,12345.013,12111.908,11274.262,11414.734 -->
| prost (binary) | array-wide | decode | 9669 | 2000 | 11545.7 | 11274.3–12345.0 | 26205000 |
<!-- samples | prost (binary) | array-wide | encode | 34741.654,37176.849,36344.624,36285.571,35926.613,35024.624,36622.024 -->
| prost (binary) | array-wide | encode | 9669 | 2000 | 36285.6 | 34741.7–37176.8 | 147658990 |
<!-- samples | serde_json | mixed | decode | 5094.408,5172.329,5177.118,5134.420,5125.832,5162.168,5153.489 -->
| serde_json | mixed | decode | 1187 | 2000 | 5153.5 | 5094.4–5177.1 | 24255000 |
<!-- samples | serde_json | mixed | encode | 2811.374,2899.370,2970.203,2969.786,2975.098,2793.417,2806.684 -->
| serde_json | mixed | encode | 1186 | 2000 | 2899.4 | 2793.4–2975.1 | 19068985 |
<!-- samples | sonic-rs | mixed | decode | 4824.055,4888.396,4689.894,4587.780,4599.378,4927.694,4887.188 -->
| sonic-rs | mixed | decode | 1187 | 2000 | 4824.1 | 4587.8–4927.7 | 24255000 |
<!-- samples | sonic-rs | mixed | encode | 3642.741,3609.280,3638.399,3643.622,3815.830,3873.282,3874.472 -->
| sonic-rs | mixed | encode | 1186 | 2000 | 3643.6 | 3609.3–3874.5 | 19068985 |
<!-- samples | prost (binary) | mixed | decode | 1709.862,1709.938,1683.825,1678.262,1598.878,1577.001,1563.651 -->
| prost (binary) | mixed | decode | 954 | 2000 | 1678.3 | 1563.7–1709.9 | 24255000 |
<!-- samples | prost (binary) | mixed | encode | 690.681,704.974,701.420,700.174,691.447,681.980,704.111 -->
| prost (binary) | mixed | encode | 954 | 2000 | 700.2 | 682.0–705.0 | 15906263 |
<!-- samples | serde_json | floats | decode | 8372.620,8378.995,8331.805,8366.965,8402.400,8354.050,8274.055 -->
| serde_json | floats | decode | 1581 | 200 | 8367.0 | 8274.1–8402.4 | 408000 |
<!-- samples | serde_json | floats | encode | 10767.430,10825.205,10760.150,10787.765,10794.825,10734.275,10771.815 -->
| serde_json | floats | encode | 1581 | 200 | 10771.8 | 10734.3–10825.2 | 2611368 |
<!-- samples | sonic-rs | floats | decode | 9545.345,9538.105,9517.035,9461.475,9490.380,9493.715,9522.730 -->
| sonic-rs | floats | decode | 1581 | 200 | 9517.0 | 9461.5–9545.3 | 408000 |
<!-- samples | sonic-rs | floats | encode | 17048.165,17022.720,16978.825,17096.295,17077.940,17086.220,17170.545 -->
| sonic-rs | floats | encode | 1581 | 200 | 17077.9 | 16978.8–17170.5 | 2611368 |
<!-- samples | prost (binary) | floats | decode | 1354.760,1303.290,1298.550,1303.455,1385.125,1298.320,1300.495 -->
| prost (binary) | floats | decode | 2051 | 200 | 1303.3 | 1298.3–1385.1 | 408000 |
<!-- samples | prost (binary) | floats | encode | 502.000,446.925,446.635,446.845,447.285,444.840,442.265 -->
| prost (binary) | floats | encode | 2051 | 200 | 446.8 | 442.3–502.0 | 3346720 |
<!-- samples | serde_json | floats-wide | decode | 24133.740,24299.360,24052.730,23800.370,23377.925,24190.125,24218.445 -->
| serde_json | floats-wide | decode | 5975 | 200 | 24133.7 | 23377.9–24299.4 | 427200 |
<!-- samples | serde_json | floats-wide | encode | 10506.635,10494.405,10582.345,10549.700,10483.130,10521.840,10407.990 -->
| serde_json | floats-wide | encode | 5971 | 200 | 10506.6 | 10408.0–10582.3 | 9641832 |
<!-- samples | sonic-rs | floats-wide | decode | 19557.505,19472.665,19217.930,18678.210,18279.565,17992.860,18164.320 -->
| sonic-rs | floats-wide | decode | 5975 | 200 | 18678.2 | 17992.9–19557.5 | 427200 |
<!-- samples | sonic-rs | floats-wide | encode | 18218.070,18261.335,18358.565,18281.380,18427.930,18364.145,18349.105 -->
| sonic-rs | floats-wide | encode | 5971 | 200 | 18349.1 | 18218.1–18427.9 | 9641832 |
<!-- samples | prost (binary) | floats-wide | decode | 1311.510,1296.655,1307.345,1346.400,1291.470,1301.065,1302.290 -->
| prost (binary) | floats-wide | decode | 2051 | 200 | 1302.3 | 1291.5–1346.4 | 427200 |
<!-- samples | prost (binary) | floats-wide | encode | 440.905,439.270,439.000,435.795,436.540,437.875,441.985 -->
| prost (binary) | floats-wide | encode | 2051 | 200 | 439.0 | 435.8–442.0 | 3472896 |
<!-- samples | serde_json | text-short | decode | 178.941,179.921,180.335,181.827,189.453,190.692,188.781 -->
| serde_json | text-short | decode | 97 | 20000 | 181.8 | 178.9–190.7 | 15087000 |
<!-- samples | serde_json | text-short | encode | 121.084,120.239,121.044,121.722,122.514,123.033,123.315 -->
| serde_json | text-short | encode | 97 | 20000 | 121.7 | 120.2–123.3 | 26788875 |
<!-- samples | sonic-rs | text-short | decode | 246.245,237.416,235.521,241.469,245.626,241.308,245.832 -->
| sonic-rs | text-short | decode | 97 | 20000 | 241.5 | 235.5–246.2 | 15087000 |
<!-- samples | sonic-rs | text-short | encode | 165.277,165.542,164.358,165.051,164.483,165.290,166.070 -->
| sonic-rs | text-short | encode | 97 | 20000 | 165.3 | 164.4–166.1 | 26788875 |
<!-- samples | prost (binary) | text-short | decode | 68.994,68.655,68.967,69.025,68.473,67.945,68.908 -->
| prost (binary) | text-short | decode | 70 | 20000 | 68.9 | 67.9–69.0 | 15087000 |
<!-- samples | prost (binary) | text-short | encode | 40.363,38.209,38.585,40.008,39.279,38.877,38.207 -->
| prost (binary) | text-short | encode | 70 | 20000 | 38.9 | 38.2–40.4 | 23140856 |
<!-- samples | serde_json | text-sparse | decode | 3878.990,3842.050,3809.065,3822.875,3760.195,3824.985,3799.690 -->
| serde_json | text-sparse | decode | 8233 | 200 | 3822.9 | 3760.2–3879.0 | 13185600 |
<!-- samples | serde_json | text-sparse | encode | 6431.240,6611.525,6699.840,6647.375,6643.935,6453.380,6506.615 -->
| serde_json | text-sparse | encode | 8233 | 200 | 6611.5 | 6431.2–6699.8 | 13328096 |
<!-- samples | sonic-rs | text-sparse | decode | 3037.375,3052.260,3025.140,2948.920,3012.490,2983.875,2986.500 -->
| sonic-rs | text-sparse | decode | 8233 | 200 | 3012.5 | 2948.9–3052.3 | 13185600 |
<!-- samples | sonic-rs | text-sparse | encode | 860.870,811.650,820.415,811.020,820.125,824.655,865.130 -->
| sonic-rs | text-sparse | encode | 8233 | 200 | 820.4 | 811.0–865.1 | 13328096 |
<!-- samples | prost (binary) | text-sparse | decode | 824.380,823.770,825.870,822.260,870.200,825.545,822.245 -->
| prost (binary) | text-sparse | decode | 8205 | 200 | 824.4 | 822.2–870.2 | 13185600 |
<!-- samples | prost (binary) | text-sparse | encode | 421.580,421.650,419.160,418.555,419.835,460.175,417.900 -->
| prost (binary) | text-sparse | encode | 8205 | 200 | 419.8 | 417.9–460.2 | 13285472 |
<!-- samples | serde_json | text-ascii | decode | 2588.365,2507.885,2572.355,2508.890,2589.545,2480.335,2552.980 -->
| serde_json | text-ascii | decode | 8225 | 200 | 2553.0 | 2480.3–2589.5 | 13176000 |
<!-- samples | serde_json | text-ascii | encode | 5923.215,5919.015,5936.825,5930.620,5854.345,5952.840,5892.070 -->
| serde_json | text-ascii | encode | 8225 | 200 | 5923.2 | 5854.3–5952.8 | 13315296 |
<!-- samples | sonic-rs | text-ascii | decode | 2038.595,2085.615,2018.920,2040.490,2134.695,2059.555,2112.565 -->
| sonic-rs | text-ascii | decode | 8225 | 200 | 2059.6 | 2018.9–2134.7 | 13176000 |
<!-- samples | sonic-rs | text-ascii | encode | 784.565,790.080,788.120,964.070,784.825,798.250,793.200 -->
| sonic-rs | text-ascii | encode | 8225 | 200 | 790.1 | 784.6–964.1 | 13315296 |
<!-- samples | prost (binary) | text-ascii | decode | 820.090,901.800,832.625,816.365,815.055,822.065,819.020 -->
| prost (binary) | text-ascii | decode | 8199 | 200 | 820.1 | 815.1–901.8 | 13176000 |
<!-- samples | prost (binary) | text-ascii | encode | 440.095,432.830,441.060,432.395,435.630,431.160,433.300 -->
| prost (binary) | text-ascii | encode | 8199 | 200 | 433.3 | 431.2–441.1 | 13275824 |
<!-- samples | serde_json | text-escaped | decode | 34094.460,33882.570,35560.120,35370.470,35226.710,34582.540,34983.540 -->
| serde_json | text-escaped | decode | 8737 | 200 | 34983.5 | 33882.6–35560.1 | 10718400 |
<!-- samples | serde_json | text-escaped | encode | 11499.365,11609.985,12430.300,11921.820,11045.280,11659.475,10708.890 -->
| serde_json | text-escaped | encode | 8737 | 200 | 11610.0 | 10708.9–12430.3 | 14162184 |
<!-- samples | sonic-rs | text-escaped | decode | 24218.310,24098.685,24038.665,24438.655,24426.295,24327.035,24533.840 -->
| sonic-rs | text-escaped | decode | 8737 | 200 | 24327.0 | 24038.7–24533.8 | 10718400 |
<!-- samples | sonic-rs | text-escaped | encode | 9613.775,9610.080,9584.485,9025.690,9539.165,9367.950,9098.630 -->
| sonic-rs | text-escaped | encode | 8737 | 200 | 9539.2 | 9025.7–9613.8 | 14162184 |
<!-- samples | prost (binary) | text-escaped | decode | 10280.815,10336.070,10339.860,10413.580,10299.355,10378.330,10314.230 -->
| prost (binary) | text-escaped | decode | 6663 | 200 | 10336.1 | 10280.8–10413.6 | 10718400 |
<!-- samples | prost (binary) | text-escaped | encode | 362.810,356.820,357.170,356.650,357.210,360.480,358.955 -->
| prost (binary) | text-escaped | encode | 6663 | 200 | 357.2 | 356.6–362.8 | 10838584 |
<!-- samples | serde_json | wide | decode | 951.312,947.317,947.148,948.443,946.781,943.067,950.086 -->
| serde_json | wide | decode | 135 | 4000 | 947.3 | 943.1–951.3 | 3480000 |
<!-- samples | serde_json | wide | encode | 473.863,468.991,485.598,480.571,497.582,499.919,501.650 -->
| serde_json | wide | encode | 135 | 4000 | 485.6 | 469.0–501.6 | 5479021 |
<!-- samples | sonic-rs | wide | decode | 1172.492,1157.481,1145.197,1154.623,1153.992,1154.742,1152.882 -->
| sonic-rs | wide | decode | 135 | 4000 | 1154.6 | 1145.2–1172.5 | 3480000 |
<!-- samples | sonic-rs | wide | encode | 495.349,495.498,501.450,500.589,505.459,500.730,499.714 -->
| sonic-rs | wide | encode | 135 | 4000 | 500.6 | 495.3–505.5 | 5479021 |
<!-- samples | prost (binary) | wide | decode | 161.917,168.976,165.386,168.788,164.988,161.698,165.749 -->
| prost (binary) | wide | decode | 31 | 4000 | 165.4 | 161.7–169.0 | 3480000 |
<!-- samples | prost (binary) | wide | encode | 157.747,157.296,158.940,158.167,155.986,157.994,157.837 -->
| prost (binary) | wide | encode | 31 | 4000 | 157.8 | 156.0–158.9 | 2022169 |
