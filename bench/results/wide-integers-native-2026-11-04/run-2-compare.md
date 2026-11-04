| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 140.153,126.240,117.724,114.703,106.959,105.874,104.151 -->
| serde_json | plain | decode | 38 | 200000 | 114.7 | 104.2–140.2 | 67248000 |
<!-- samples | serde_json | plain | encode | 52.654,54.005,53.168,53.737,57.514,63.924,65.944 -->
| serde_json | plain | encode | 38 | 200000 | 54.0 | 52.7–65.9 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 212.309,194.275,212.434,230.246,262.874,277.286,266.491 -->
| sonic-rs | plain | decode | 38 | 200000 | 230.2 | 194.3–277.3 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 78.983,76.699,68.219,66.070,72.232,80.015,79.414 -->
| sonic-rs | plain | encode | 38 | 200000 | 76.7 | 66.1–80.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 60.425,60.295,60.970,62.355,60.435,60.045,60.095 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.4 | 60.0–62.4 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 33.240,33.203,33.294,33.555,33.367,33.362,33.444 -->
| prost (binary) | plain | encode | 11 | 200000 | 33.4 | 33.2–33.6 | 92719942 |
<!-- samples | serde_json | escaped | decode | 317.857,273.619,323.067,305.396,328.591,326.358,332.537 -->
| serde_json | escaped | decode | 62 | 200000 | 323.1 | 273.6–332.5 | 85461000 |
<!-- samples | serde_json | escaped | encode | 100.261,100.383,100.342,100.442,100.299,100.534,99.941 -->
| serde_json | escaped | encode | 54 | 200000 | 100.3 | 99.9–100.5 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 487.352,460.004,401.875,484.664,480.601,435.992,386.211 -->
| sonic-rs | escaped | decode | 62 | 200000 | 460.0 | 386.2–487.4 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 166.988,161.554,156.859,144.837,128.666,126.464,132.048 -->
| sonic-rs | escaped | encode | 54 | 200000 | 144.8 | 126.5–167.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 57.482,54.194,52.838,58.519,66.853,68.958,69.300 -->
| prost (binary) | escaped | decode | 24 | 200000 | 58.5 | 52.8–69.3 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 31.835,33.065,33.925,33.591,33.392,33.388,33.853 -->
| prost (binary) | escaped | encode | 24 | 200000 | 33.4 | 31.8–33.9 | 181133323 |
<!-- samples | serde_json | array | decode | 19297.539,19778.730,18701.087,18249.441,16236.925,16432.548,14772.066 -->
| serde_json | array | decode | 4022 | 20000 | 18249.4 | 14772.1–19778.7 | 288627000 |
<!-- samples | serde_json | array | encode | 9190.745,7331.270,6952.141,7309.795,9227.393,7276.626,6641.922 -->
| serde_json | array | encode | 4022 | 20000 | 7309.8 | 6641.9–9227.4 | 574225548 |
<!-- samples | sonic-rs | array | decode | 21640.598,28981.122,29449.170,28728.455,28110.777,27368.112,28750.305 -->
| sonic-rs | array | decode | 4022 | 20000 | 28728.5 | 21640.6–29449.2 | 288627000 |
<!-- samples | sonic-rs | array | encode | 10048.747,10747.080,10757.152,10722.007,10390.241,10504.784,10689.976 -->
| sonic-rs | array | encode | 4022 | 20000 | 10690.0 | 10048.7–10757.2 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5652.397,5669.939,8673.150,5855.601,5752.150,5996.190,5966.555 -->
| prost (binary) | array | decode | 1923 | 20000 | 5855.6 | 5652.4–8673.1 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7851.105,9218.062,9025.776,9142.783,11694.810,13194.556,12000.840 -->
| prost (binary) | array | encode | 1923 | 20000 | 9218.1 | 7851.1–13194.6 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 21565.609,20017.276,14568.576,15482.903,20801.282,19678.522,18570.368 -->
| serde_json | array-signed | decode | 4538 | 20000 | 19678.5 | 14568.6–21565.6 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 10196.114,8915.555,9201.651,8653.451,8543.988,6751.233,7228.985 -->
| serde_json | array-signed | encode | 4537 | 20000 | 8653.5 | 6751.2–10196.1 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 23212.554,25995.347,24330.722,24015.681,24181.176,26009.142,22042.850 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 24181.2 | 22042.9–26009.1 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 9161.989,9499.594,8792.746,9077.947,9213.325,7898.683,9014.490 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 9077.9 | 7898.7–9499.6 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 7394.671,9071.827,10630.841,8076.515,7142.852,7359.205,7416.178 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 7416.2 | 7142.9–10630.8 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 23064.408,22640.752,21815.609,16620.894,17974.418,17987.424,16564.065 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 17987.4 | 16564.1–23064.4 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 39227.275,35135.274,36255.783,37894.022,46383.456,40140.184,36734.006 -->
| serde_json | array-wide | decode | 19771 | 20000 | 37894.0 | 35135.3–46383.5 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 14956.992,16424.739,15997.668,14694.320,17387.621,15769.291,15804.907 -->
| serde_json | array-wide | encode | 19770 | 20000 | 15804.9 | 14694.3–17387.6 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 28994.187,26262.209,28107.237,29009.952,32205.111,28875.827,35217.600 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 28994.2 | 26262.2–35217.6 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 23638.935,19802.900,16288.920,16103.055,13568.568,13284.951,13130.757 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 16103.1 | 13130.8–23638.9 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 7984.317,7391.546,8218.205,7589.803,9565.131,8143.770,8801.602 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 8143.8 | 7391.5–9565.1 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 23775.625,23877.852,24441.638,28188.141,30107.740,27999.145,24721.375 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 24721.4 | 23775.6–30107.7 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 3290.994,3192.200,3265.079,3235.155,3568.649,3269.494,3285.018 -->
| serde_json | mixed | decode | 1187 | 20000 | 3269.5 | 3192.2–3568.6 | 227997000 |
<!-- samples | serde_json | mixed | encode | 1979.614,2344.421,1887.925,1906.712,2022.602,1796.071,1827.669 -->
| serde_json | mixed | encode | 1186 | 20000 | 1906.7 | 1796.1–2344.4 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 3383.358,3903.226,3535.644,3333.251,3110.114,3008.449,2920.209 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 3333.3 | 2920.2–3903.2 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 2190.266,2233.581,2847.689,2704.115,2440.601,2289.222,2779.854 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 2440.6 | 2190.3–2847.7 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1257.333,1186.765,1142.873,1124.893,1131.192,1439.514,1511.354 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1186.8 | 1124.9–1511.4 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 635.756,636.180,645.599,636.498,645.297,670.591,641.852 -->
| prost (binary) | mixed | encode | 954 | 20000 | 641.9 | 635.8–670.6 | 149207284 |
<!-- samples | serde_json | floats | decode | 8203.294,8642.791,8395.111,8444.166,8513.603,8867.923,8370.332 -->
| serde_json | floats | decode | 1581 | 2000 | 8444.2 | 8203.3–8867.9 | 3825000 |
<!-- samples | serde_json | floats | encode | 10101.112,10143.659,10131.385,10102.570,10055.615,10034.730,10108.113 -->
| serde_json | floats | encode | 1581 | 2000 | 10102.6 | 10034.7–10143.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 8855.395,8885.816,8864.624,8905.965,8806.936,8856.385,8819.783 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8856.4 | 8806.9–8906.0 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 28518.620,17743.056,18021.485,17746.853,15548.965,14909.753,13429.340 -->
| sonic-rs | floats | encode | 1581 | 2000 | 17743.1 | 13429.3–28518.6 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 702.332,695.587,702.164,697.770,711.450,701.158,669.619 -->
| prost (binary) | floats | decode | 2051 | 2000 | 701.2 | 669.6–711.5 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 322.589,323.962,318.876,321.527,322.072,319.489,328.827 -->
| prost (binary) | floats | encode | 2051 | 2000 | 322.1 | 318.9–328.8 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 16940.184,16393.514,16923.646,16065.442,16220.397,16492.123,16136.056 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 16393.5 | 16065.4–16940.2 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8595.287,9599.585,9913.890,9936.182,9909.553,9408.464,9305.806 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9599.6 | 8595.3–9936.2 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 17065.147,16654.316,16220.506,15395.116,15997.237,16948.143,16035.016 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16220.5 | 15395.1–17065.1 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 15188.324,15827.510,16907.721,17339.630,16856.194,15911.068,16222.729 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 16222.7 | 15188.3–17339.6 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 833.268,833.875,874.581,868.933,876.606,877.324,855.510 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 868.9 | 833.3–877.3 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 426.118,430.476,432.078,432.546,434.952,431.707,432.767 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 432.1 | 426.1–435.0 | 32664305 |
<!-- samples | serde_json | text-short | decode | 169.829,169.286,167.453,158.711,149.744,138.594,140.608 -->
| serde_json | text-short | decode | 97 | 200000 | 158.7 | 138.6–169.8 | 149907000 |
<!-- samples | serde_json | text-short | encode | 92.468,98.063,105.157,103.713,103.165,103.951,102.990 -->
| serde_json | text-short | encode | 97 | 200000 | 103.2 | 92.5–105.2 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 212.122,211.930,206.666,203.940,191.589,186.245,175.859 -->
| sonic-rs | text-short | decode | 97 | 200000 | 203.9 | 175.9–212.1 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 120.144,130.304,124.785,128.634,130.500,120.210,115.836 -->
| sonic-rs | text-short | encode | 97 | 200000 | 124.8 | 115.8–130.5 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 50.130,51.971,55.108,59.385,60.725,60.956,64.465 -->
| prost (binary) | text-short | decode | 70 | 200000 | 59.4 | 50.1–64.5 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 37.311,36.396,34.414,34.057,34.083,34.702,33.997 -->
| prost (binary) | text-short | encode | 70 | 200000 | 34.4 | 34.0–37.3 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3205.977,3414.456,3365.292,3336.488,3318.891,3323.401,3304.856 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3323.4 | 3206.0–3414.5 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5641.964,5561.736,5554.395,5701.078,5290.899,4980.664,4720.420 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5554.4 | 4720.4–5701.1 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2166.066,2179.700,2140.242,2095.585,2059.521,2061.352,1991.957 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2095.6 | 1992.0–2179.7 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 556.008,556.386,563.054,574.835,571.739,584.926,595.904 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 571.7 | 556.0–595.9 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 607.583,603.969,575.426,578.843,577.059,589.798,580.313 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 580.3 | 575.4–607.6 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 306.387,292.901,296.451,302.871,308.305,306.351,304.079 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 304.1 | 292.9–308.3 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1775.586,1735.329,1732.347,1660.544,1656.866,1661.846,1636.745 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1661.8 | 1636.7–1775.6 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 3732.519,3811.150,3773.812,3735.282,4163.290,4279.440,4392.503 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 3811.2 | 3732.5–4392.5 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1433.912,1458.677,1528.926,1602.166,1637.736,1725.754,1734.215 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1602.2 | 1433.9–1734.2 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 663.486,664.317,643.712,636.371,642.179,654.938,638.167 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 643.7 | 636.4–664.3 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 729.655,716.736,697.058,688.997,694.530,694.855,698.932 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 697.1 | 689.0–729.7 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 376.108,373.535,367.545,376.192,371.663,372.656,365.261 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 372.7 | 365.3–376.2 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 28215.516,30631.466,31182.216,30100.451,26667.483,25078.336,24589.964 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 28215.5 | 24590.0–31182.2 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 9535.915,9457.283,10490.533,10756.756,10715.311,10538.557,9894.683 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 10490.5 | 9457.3–10756.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 21235.863,21901.384,19081.175,19687.236,19334.743,18098.554,17275.552 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 19334.7 | 17275.6–21901.4 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 6703.802,6585.112,6304.561,6123.038,6257.193,6277.514,6598.361 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 6304.6 | 6123.0–6703.8 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 6946.512,6617.775,6479.283,6612.623,6457.752,6243.833,6387.682 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 6479.3 | 6243.8–6946.5 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 231.242,226.887,230.893,226.806,231.026,228.595,230.643 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 230.6 | 226.8–231.2 | 101649504 |
<!-- samples | serde_json | wide | decode | 575.811,576.200,603.020,612.895,701.372,659.754,615.543 -->
| serde_json | wide | decode | 135 | 40000 | 612.9 | 575.8–701.4 | 33720000 |
<!-- samples | serde_json | wide | encode | 317.532,313.143,314.462,314.178,302.898,313.864,333.044 -->
| serde_json | wide | encode | 135 | 40000 | 314.2 | 302.9–333.0 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 732.199,783.091,772.239,745.604,744.745,697.780,680.745 -->
| sonic-rs | wide | decode | 135 | 40000 | 744.7 | 680.7–783.1 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 304.004,300.473,324.291,321.331,333.310,337.644,347.425 -->
| sonic-rs | wide | encode | 135 | 40000 | 324.3 | 300.5–347.4 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 113.584,109.271,107.448,106.740,105.062,107.956,105.491 -->
| prost (binary) | wide | decode | 31 | 40000 | 107.4 | 105.1–113.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 101.633,101.973,101.446,98.298,99.782,101.915,100.899 -->
| prost (binary) | wide | encode | 31 | 40000 | 101.4 | 98.3–102.0 | 19595809 |
