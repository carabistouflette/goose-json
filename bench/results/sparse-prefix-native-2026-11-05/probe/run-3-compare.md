| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 197.581,191.503,188.093,180.866,182.139,181.307,171.003 -->
| serde_json | plain | decode | 38 | 20000 | 182.1 | 171.0–197.6 | 6768000 |
<!-- samples | serde_json | plain | encode | 82.661,82.448,83.499,84.386,83.966,84.086,84.087 -->
| serde_json | plain | encode | 38 | 20000 | 84.0 | 82.4–84.4 | 16855732 |
<!-- samples | sonic-rs | plain | decode | 312.774,326.181,314.604,304.934,305.328,297.510,292.328 -->
| sonic-rs | plain | decode | 38 | 20000 | 305.3 | 292.3–326.2 | 6768000 |
<!-- samples | sonic-rs | plain | encode | 89.245,89.480,88.749,89.348,90.326,89.433,89.787 -->
| sonic-rs | plain | encode | 38 | 20000 | 89.4 | 88.7–90.3 | 16855732 |
<!-- samples | prost (binary) | plain | decode | 67.284,67.599,67.620,67.802,68.213,63.820,63.595 -->
| prost (binary) | plain | decode | 11 | 20000 | 67.6 | 63.6–68.2 | 6768000 |
<!-- samples | prost (binary) | plain | encode | 35.296,35.123,34.881,35.099,35.222,34.947,35.250 -->
| prost (binary) | plain | encode | 11 | 20000 | 35.1 | 34.9–35.3 | 9331168 |
<!-- samples | serde_json | escaped | decode | 441.688,455.091,437.656,429.360,432.189,452.976,454.260 -->
| serde_json | escaped | decode | 62 | 20000 | 441.7 | 429.4–455.1 | 8601000 |
<!-- samples | serde_json | escaped | encode | 106.570,107.088,106.716,106.562,106.908,106.498,106.460 -->
| serde_json | escaped | encode | 54 | 20000 | 106.6 | 106.5–107.1 | 21663705 |
<!-- samples | sonic-rs | escaped | decode | 644.380,657.117,640.222,636.638,635.764,608.071,616.082 -->
| sonic-rs | escaped | decode | 62 | 20000 | 636.6 | 608.1–657.1 | 8601000 |
<!-- samples | sonic-rs | escaped | encode | 192.631,194.517,193.226,192.694,194.240,193.095,187.699 -->
| sonic-rs | escaped | encode | 54 | 20000 | 193.1 | 187.7–194.5 | 21663705 |
<!-- samples | prost (binary) | escaped | decode | 76.098,77.006,76.556,77.282,76.534,78.875,78.682 -->
| prost (binary) | escaped | decode | 24 | 20000 | 77.0 | 76.1–78.9 | 8601000 |
<!-- samples | prost (binary) | escaped | encode | 37.516,38.388,39.096,37.927,38.633,38.305,38.679 -->
| prost (binary) | escaped | encode | 24 | 20000 | 38.4 | 37.5–39.1 | 18225823 |
<!-- samples | serde_json | array | decode | 21130.623,21296.334,20482.764,21479.890,21779.668,21810.651,22001.257 -->
| serde_json | array | decode | 4022 | 2000 | 21479.9 | 20482.8–22001.3 | 30705000 |
<!-- samples | serde_json | array | encode | 11569.093,11502.376,11530.350,11358.537,11082.371,10802.569,10265.625 -->
| serde_json | array | encode | 4022 | 2000 | 11358.5 | 10265.6–11569.1 | 61080811 |
<!-- samples | sonic-rs | array | decode | 31084.995,31210.918,31688.139,31269.775,30388.870,31670.550,32587.100 -->
| sonic-rs | array | decode | 4022 | 2000 | 31269.8 | 30388.9–32587.1 | 30705000 |
<!-- samples | sonic-rs | array | encode | 11412.812,10821.106,11248.024,11452.763,11406.377,11430.060,11454.127 -->
| sonic-rs | array | encode | 4022 | 2000 | 11412.8 | 10821.1–11454.1 | 61080811 |
<!-- samples | prost (binary) | array | decode | 6336.682,6342.160,6357.976,6342.158,6337.858,6347.508,6319.090 -->
| prost (binary) | array | decode | 1923 | 2000 | 6342.2 | 6319.1–6358.0 | 30705000 |
<!-- samples | prost (binary) | array | encode | 10917.864,10876.658,10887.191,10857.710,11012.066,10895.532,10879.775 -->
| prost (binary) | array | encode | 1923 | 2000 | 10887.2 | 10857.7–11012.1 | 30239709 |
<!-- samples | serde_json | array-signed | decode | 22642.803,22522.653,21099.570,22050.845,21913.885,21651.161,21433.074 -->
| serde_json | array-signed | decode | 4538 | 2000 | 21913.9 | 21099.6–22642.8 | 15375000 |
<!-- samples | serde_json | array-signed | encode | 9465.562,9857.273,10106.211,10112.078,10118.446,10108.073,10011.216 -->
| serde_json | array-signed | encode | 4537 | 2000 | 10106.2 | 9465.6–10118.4 | 68796382 |
<!-- samples | sonic-rs | array-signed | decode | 30714.298,30971.537,31559.129,30940.156,31249.450,29953.490,29505.849 -->
| sonic-rs | array-signed | decode | 4538 | 2000 | 30940.2 | 29505.8–31559.1 | 15375000 |
<!-- samples | sonic-rs | array-signed | encode | 9869.515,9678.724,9758.549,9950.298,10267.114,9840.261,10284.776 -->
| sonic-rs | array-signed | encode | 4537 | 2000 | 9869.5 | 9678.7–10284.8 | 68796382 |
<!-- samples | prost (binary) | array-signed | decode | 8704.051,8708.617,8679.888,8721.254,8684.479,8643.728,8675.359 -->
| prost (binary) | array-signed | decode | 6083 | 2000 | 8684.5 | 8643.7–8721.3 | 15375000 |
<!-- samples | prost (binary) | array-signed | encode | 24562.665,23236.731,23240.425,24226.494,23975.999,25269.409,25714.464 -->
| prost (binary) | array-signed | encode | 6083 | 2000 | 24226.5 | 23236.7–25714.5 | 94310580 |
<!-- samples | serde_json | array-wide | decode | 49007.430,49186.971,50554.499,50059.249,47828.003,47413.167,48509.514 -->
| serde_json | array-wide | decode | 19771 | 2000 | 49007.4 | 47413.2–50554.5 | 26205000 |
<!-- samples | serde_json | array-wide | encode | 18123.044,18388.969,19027.488,19092.755,18949.374,18666.255,18010.725 -->
| serde_json | array-wide | encode | 19770 | 2000 | 18666.3 | 18010.7–19092.8 | 297316216 |
<!-- samples | sonic-rs | array-wide | decode | 37729.188,37686.338,38727.234,37987.694,36464.014,36060.277,37067.868 -->
| sonic-rs | array-wide | decode | 19771 | 2000 | 37686.3 | 36060.3–38727.2 | 26205000 |
<!-- samples | sonic-rs | array-wide | encode | 21084.277,20579.256,20195.664,19605.436,19387.023,19481.678,19613.710 -->
| sonic-rs | array-wide | encode | 19770 | 2000 | 19613.7 | 19387.0–21084.3 | 297316216 |
<!-- samples | prost (binary) | array-wide | decode | 11154.773,11387.228,11813.377,11081.019,11125.967,11087.994,11050.469 -->
| prost (binary) | array-wide | decode | 9669 | 2000 | 11126.0 | 11050.5–11813.4 | 26205000 |
<!-- samples | prost (binary) | array-wide | encode | 34710.791,34539.067,34601.136,35233.399,36155.687,35166.438,34715.196 -->
| prost (binary) | array-wide | encode | 9669 | 2000 | 34715.2 | 34539.1–36155.7 | 147658990 |
<!-- samples | serde_json | mixed | decode | 5245.359,5403.413,5590.057,5561.415,5526.231,5322.926,5202.801 -->
| serde_json | mixed | decode | 1187 | 2000 | 5403.4 | 5202.8–5590.1 | 24255000 |
<!-- samples | serde_json | mixed | encode | 2647.061,2670.076,2648.713,2636.972,2622.580,2605.404,2666.943 -->
| serde_json | mixed | encode | 1186 | 2000 | 2647.1 | 2605.4–2670.1 | 19068985 |
<!-- samples | sonic-rs | mixed | decode | 4608.303,4647.431,4667.189,4785.658,4824.655,4771.386,5091.104 -->
| sonic-rs | mixed | decode | 1187 | 2000 | 4771.4 | 4608.3–5091.1 | 24255000 |
<!-- samples | sonic-rs | mixed | encode | 3684.250,3682.677,3703.260,3694.896,3649.532,3591.776,3473.262 -->
| sonic-rs | mixed | encode | 1186 | 2000 | 3682.7 | 3473.3–3703.3 | 19068985 |
<!-- samples | prost (binary) | mixed | decode | 1794.648,1777.279,1822.699,1872.855,1875.448,1879.468,1876.671 -->
| prost (binary) | mixed | decode | 954 | 2000 | 1872.9 | 1777.3–1879.5 | 24255000 |
<!-- samples | prost (binary) | mixed | encode | 754.604,754.131,700.936,724.769,705.770,752.561,753.202 -->
| prost (binary) | mixed | encode | 954 | 2000 | 752.6 | 700.9–754.6 | 15906263 |
<!-- samples | serde_json | floats | decode | 9029.800,9034.975,9015.950,9013.045,9001.865,9098.990,8972.350 -->
| serde_json | floats | decode | 1581 | 200 | 9016.0 | 8972.4–9099.0 | 408000 |
<!-- samples | serde_json | floats | encode | 12056.940,12115.645,12493.835,13009.390,13038.240,13022.290,13021.820 -->
| serde_json | floats | encode | 1581 | 200 | 13009.4 | 12056.9–13038.2 | 2611368 |
<!-- samples | sonic-rs | floats | decode | 11140.975,11144.420,11130.310,11181.575,11074.145,11093.380,11076.455 -->
| sonic-rs | floats | decode | 1581 | 200 | 11130.3 | 11074.1–11181.6 | 408000 |
<!-- samples | sonic-rs | floats | encode | 19884.640,19879.790,19782.520,20315.140,20627.905,21317.630,20967.855 -->
| sonic-rs | floats | encode | 1581 | 200 | 20315.1 | 19782.5–21317.6 | 2611368 |
<!-- samples | prost (binary) | floats | decode | 1048.495,1035.285,1085.380,1043.965,1042.040,1037.135,1109.645 -->
| prost (binary) | floats | decode | 2051 | 200 | 1044.0 | 1035.3–1109.6 | 408000 |
<!-- samples | prost (binary) | floats | encode | 536.045,536.095,534.935,535.680,539.295,534.995,533.080 -->
| prost (binary) | floats | encode | 2051 | 200 | 535.7 | 533.1–539.3 | 3346720 |
<!-- samples | serde_json | floats-wide | decode | 30144.185,31189.265,31024.325,29952.495,31057.855,30985.325,29405.625 -->
| serde_json | floats-wide | decode | 5975 | 200 | 30985.3 | 29405.6–31189.3 | 427200 |
<!-- samples | serde_json | floats-wide | encode | 12048.730,12113.565,11978.715,12124.145,12158.750,12806.240,12892.305 -->
| serde_json | floats-wide | encode | 5971 | 200 | 12124.1 | 11978.7–12892.3 | 9641832 |
<!-- samples | sonic-rs | floats-wide | decode | 23030.520,23033.780,22564.915,21118.155,21456.115,21181.640,20969.410 -->
| sonic-rs | floats-wide | decode | 5975 | 200 | 21456.1 | 20969.4–23033.8 | 427200 |
<!-- samples | sonic-rs | floats-wide | encode | 19785.675,19709.790,19653.255,19371.480,19400.700,18163.015,18198.735 -->
| sonic-rs | floats-wide | encode | 5971 | 200 | 19400.7 | 18163.0–19785.7 | 9641832 |
<!-- samples | prost (binary) | floats-wide | decode | 961.070,914.885,916.915,929.400,923.585,913.320,955.495 -->
| prost (binary) | floats-wide | decode | 2051 | 200 | 923.6 | 913.3–961.1 | 427200 |
<!-- samples | prost (binary) | floats-wide | encode | 453.805,450.895,450.770,449.965,450.655,450.870,450.920 -->
| prost (binary) | floats-wide | encode | 2051 | 200 | 450.9 | 450.0–453.8 | 3472896 |
<!-- samples | serde_json | text-short | decode | 178.808,179.308,174.706,168.529,168.901,169.702,168.121 -->
| serde_json | text-short | decode | 97 | 20000 | 169.7 | 168.1–179.3 | 15087000 |
<!-- samples | serde_json | text-short | encode | 113.800,113.685,113.936,112.880,112.573,113.215,113.551 -->
| serde_json | text-short | encode | 97 | 20000 | 113.6 | 112.6–113.9 | 26788875 |
<!-- samples | sonic-rs | text-short | decode | 233.708,231.376,231.942,232.875,229.692,226.453,230.691 -->
| sonic-rs | text-short | decode | 97 | 20000 | 231.4 | 226.5–233.7 | 15087000 |
<!-- samples | sonic-rs | text-short | encode | 154.446,155.101,155.882,154.100,154.445,154.467,155.095 -->
| sonic-rs | text-short | encode | 97 | 20000 | 154.5 | 154.1–155.9 | 26788875 |
<!-- samples | prost (binary) | text-short | decode | 64.390,64.287,63.826,64.072,64.104,63.553,63.978 -->
| prost (binary) | text-short | decode | 70 | 20000 | 64.1 | 63.6–64.4 | 15087000 |
<!-- samples | prost (binary) | text-short | encode | 35.120,35.237,35.623,34.947,35.711,35.278,35.124 -->
| prost (binary) | text-short | encode | 70 | 20000 | 35.2 | 34.9–35.7 | 23140856 |
<!-- samples | serde_json | text-sparse | decode | 3760.565,3736.685,3707.750,3795.790,3897.910,3871.430,3816.070 -->
| serde_json | text-sparse | decode | 8233 | 200 | 3795.8 | 3707.8–3897.9 | 13185600 |
<!-- samples | serde_json | text-sparse | encode | 6093.100,5995.540,6114.585,6053.250,5975.400,6095.545,6082.210 -->
| serde_json | text-sparse | encode | 8233 | 200 | 6082.2 | 5975.4–6114.6 | 13328096 |
<!-- samples | sonic-rs | text-sparse | decode | 2728.580,2780.520,2908.720,2826.450,2936.150,2918.675,2825.235 -->
| sonic-rs | text-sparse | decode | 8233 | 200 | 2826.4 | 2728.6–2936.2 | 13185600 |
<!-- samples | sonic-rs | text-sparse | encode | 765.595,804.705,764.160,765.520,764.960,759.305,761.870 -->
| sonic-rs | text-sparse | encode | 8233 | 200 | 765.0 | 759.3–804.7 | 13328096 |
<!-- samples | prost (binary) | text-sparse | decode | 846.740,843.855,851.800,844.505,846.080,890.395,852.315 -->
| prost (binary) | text-sparse | decode | 8205 | 200 | 846.7 | 843.9–890.4 | 13185600 |
<!-- samples | prost (binary) | text-sparse | encode | 401.185,397.365,396.825,397.145,396.900,397.260,401.780 -->
| prost (binary) | text-sparse | encode | 8205 | 200 | 397.3 | 396.8–401.8 | 13285472 |
<!-- samples | serde_json | text-ascii | decode | 2439.975,2414.300,2478.670,2424.560,2477.620,2395.790,2437.020 -->
| serde_json | text-ascii | decode | 8225 | 200 | 2437.0 | 2395.8–2478.7 | 13176000 |
<!-- samples | serde_json | text-ascii | encode | 5545.020,5536.630,5570.245,5550.470,5472.750,5485.195,5583.870 -->
| serde_json | text-ascii | encode | 8225 | 200 | 5545.0 | 5472.8–5583.9 | 13315296 |
<!-- samples | sonic-rs | text-ascii | decode | 1902.360,1948.565,1893.330,1915.735,1979.295,1924.080,2005.785 -->
| sonic-rs | text-ascii | decode | 8225 | 200 | 1924.1 | 1893.3–2005.8 | 13176000 |
<!-- samples | sonic-rs | text-ascii | encode | 741.600,734.970,731.590,736.630,790.930,739.825,730.960 -->
| sonic-rs | text-ascii | encode | 8225 | 200 | 736.6 | 731.0–790.9 | 13315296 |
<!-- samples | prost (binary) | text-ascii | decode | 799.085,795.260,835.960,789.405,793.200,795.425,792.045 -->
| prost (binary) | text-ascii | decode | 8199 | 200 | 795.3 | 789.4–836.0 | 13176000 |
<!-- samples | prost (binary) | text-ascii | encode | 416.525,460.850,409.250,412.000,409.605,406.660,407.695 -->
| prost (binary) | text-ascii | encode | 8199 | 200 | 409.6 | 406.7–460.9 | 13275824 |
<!-- samples | serde_json | text-escaped | decode | 32983.335,33013.120,33107.445,33140.340,33365.180,33167.410,33100.720 -->
| serde_json | text-escaped | decode | 8737 | 200 | 33107.4 | 32983.3–33365.2 | 10718400 |
<!-- samples | serde_json | text-escaped | encode | 11719.740,11711.745,11777.190,11701.740,10668.370,11430.180,11752.025 -->
| serde_json | text-escaped | encode | 8737 | 200 | 11711.7 | 10668.4–11777.2 | 14162184 |
<!-- samples | sonic-rs | text-escaped | decode | 23905.990,24000.295,24154.450,24427.420,23992.235,24031.890,23951.920 -->
| sonic-rs | text-escaped | decode | 8737 | 200 | 24000.3 | 23906.0–24427.4 | 10718400 |
<!-- samples | sonic-rs | text-escaped | encode | 9041.765,9076.995,9016.125,9057.270,9057.430,9041.525,9011.520 -->
| sonic-rs | text-escaped | encode | 8737 | 200 | 9041.8 | 9011.5–9077.0 | 14162184 |
<!-- samples | prost (binary) | text-escaped | decode | 9779.585,9828.585,9733.055,9789.095,9786.415,9873.560,9849.255 -->
| prost (binary) | text-escaped | decode | 6663 | 200 | 9789.1 | 9733.1–9873.6 | 10718400 |
<!-- samples | prost (binary) | text-escaped | encode | 350.705,346.570,349.510,346.025,342.710,343.685,342.690 -->
| prost (binary) | text-escaped | encode | 6663 | 200 | 346.0 | 342.7–350.7 | 10838584 |
<!-- samples | serde_json | wide | decode | 882.747,882.986,881.793,885.312,924.305,946.170,941.574 -->
| serde_json | wide | decode | 135 | 4000 | 885.3 | 881.8–946.2 | 3480000 |
<!-- samples | serde_json | wide | encode | 501.125,497.613,500.639,497.544,500.180,498.165,499.111 -->
| serde_json | wide | encode | 135 | 4000 | 499.1 | 497.5–501.1 | 5479021 |
<!-- samples | sonic-rs | wide | decode | 1160.323,1161.464,1147.871,1140.166,1145.470,1154.573,1146.167 -->
| sonic-rs | wide | decode | 135 | 4000 | 1147.9 | 1140.2–1161.5 | 3480000 |
<!-- samples | sonic-rs | wide | encode | 491.800,497.461,496.816,499.669,500.916,485.021,502.894 -->
| sonic-rs | wide | encode | 135 | 4000 | 497.5 | 485.0–502.9 | 5479021 |
<!-- samples | prost (binary) | wide | decode | 161.478,166.579,170.577,168.830,164.572,162.455,166.143 -->
| prost (binary) | wide | decode | 31 | 4000 | 166.1 | 161.5–170.6 | 3480000 |
<!-- samples | prost (binary) | wide | encode | 183.008,183.939,180.422,181.980,184.631,181.875,184.919 -->
| prost (binary) | wide | encode | 31 | 4000 | 183.0 | 180.4–184.9 | 2022169 |
