| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.508,143.902,125.711,112.909,104.640,109.658,111.591 -->
| serde_json | plain | decode | 38 | 200000 | 112.9 | 104.6–158.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 56.209,54.420,52.528,52.673,62.712,71.336,74.437 -->
| serde_json | plain | encode | 38 | 200000 | 56.2 | 52.5–74.4 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 283.280,286.417,287.721,288.471,279.475,281.980,239.891 -->
| sonic-rs | plain | decode | 38 | 200000 | 283.3 | 239.9–288.5 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 67.379,69.182,64.880,62.515,64.567,67.482,64.916 -->
| sonic-rs | plain | encode | 38 | 200000 | 64.9 | 62.5–69.2 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 52.855,55.157,54.859,58.319,57.390,60.025,60.517 -->
| prost (binary) | plain | decode | 11 | 200000 | 57.4 | 52.9–60.5 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 34.025,33.863,32.321,32.199,31.874,31.215,28.878 -->
| prost (binary) | plain | encode | 11 | 200000 | 32.2 | 28.9–34.0 | 92719942 |
<!-- samples | serde_json | escaped | decode | 255.319,224.766,219.543,236.134,247.736,308.313,328.917 -->
| serde_json | escaped | decode | 62 | 200000 | 247.7 | 219.5–328.9 | 85461000 |
<!-- samples | serde_json | escaped | encode | 91.268,94.007,87.555,77.533,71.965,74.718,74.443 -->
| serde_json | escaped | encode | 54 | 200000 | 77.5 | 72.0–94.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 378.338,326.516,316.350,317.108,323.904,316.195,323.374 -->
| sonic-rs | escaped | decode | 62 | 200000 | 323.4 | 316.2–378.3 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 109.286,109.218,106.440,108.543,108.321,110.291,112.142 -->
| sonic-rs | escaped | encode | 54 | 200000 | 109.2 | 106.4–112.1 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 47.935,48.721,52.759,61.735,69.585,70.504,74.156 -->
| prost (binary) | escaped | decode | 24 | 200000 | 61.7 | 47.9–74.2 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 35.456,35.913,35.621,35.940,35.667,35.592,35.990 -->
| prost (binary) | escaped | encode | 24 | 200000 | 35.7 | 35.5–36.0 | 181133323 |
<!-- samples | serde_json | array | decode | 15267.068,13426.455,13402.271,14336.875,13720.182,14419.567,14339.662 -->
| serde_json | array | decode | 4022 | 20000 | 14336.9 | 13402.3–15267.1 | 288627000 |
<!-- samples | serde_json | array | encode | 6608.562,6617.350,6660.734,6423.360,6814.549,6479.090,6471.823 -->
| serde_json | array | encode | 4022 | 20000 | 6608.6 | 6423.4–6814.5 | 574225548 |
<!-- samples | sonic-rs | array | decode | 18591.116,18123.724,19595.842,27867.105,22185.275,23028.405,23875.239 -->
| sonic-rs | array | decode | 4022 | 20000 | 22185.3 | 18123.7–27867.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7486.387,9533.990,10018.289,7751.745,8095.946,8255.384,8472.739 -->
| sonic-rs | array | encode | 4022 | 20000 | 8255.4 | 7486.4–10018.3 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5429.689,4792.730,4509.927,4969.080,4745.259,4326.130,4251.998 -->
| prost (binary) | array | decode | 1923 | 20000 | 4745.3 | 4252.0–5429.7 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6218.464,8298.241,9777.763,9616.103,9549.602,7163.435,6795.982 -->
| prost (binary) | array | encode | 1923 | 20000 | 8298.2 | 6218.5–9777.8 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 17199.813,16625.073,17066.355,16113.930,15008.931,14603.816,14556.435 -->
| serde_json | array-signed | decode | 4538 | 20000 | 16113.9 | 14556.4–17199.8 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 5992.142,6260.403,6172.672,6263.592,6128.983,6440.297,6376.270 -->
| serde_json | array-signed | encode | 4537 | 20000 | 6260.4 | 5992.1–6440.3 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 18098.229,18367.224,18889.153,18251.090,19823.543,24783.707,22698.458 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 18889.2 | 18098.2–24783.7 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 7164.061,7058.522,6235.213,6496.546,6737.702,7372.499,6610.194 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6737.7 | 6235.2–7372.5 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5483.145,5732.803,5487.134,5112.003,5507.117,6488.098,6160.342 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 5507.1 | 5112.0–6488.1 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 15438.422,15965.374,15824.872,16521.004,14829.799,20273.970,15457.599 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 15824.9 | 14829.8–20274.0 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 34232.171,30778.647,30660.728,33085.163,35787.086,46115.192,49826.111 -->
| serde_json | array-wide | decode | 19771 | 20000 | 34232.2 | 30660.7–49826.1 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 17979.857,16050.882,16060.996,17238.196,16786.426,14665.098,16735.096 -->
| serde_json | array-wide | encode | 19770 | 20000 | 16735.1 | 14665.1–17979.9 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 31988.699,30980.667,24296.089,25750.133,25307.540,23553.065,24220.487 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 25307.5 | 23553.1–31988.7 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 15607.877,16517.673,13011.455,13299.903,13333.829,12961.546,16575.456 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 13333.8 | 12961.5–16575.5 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 11467.551,11527.870,10564.528,9990.617,9818.702,11408.456,11100.822 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 11100.8 | 9818.7–11527.9 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 32441.038,34299.683,33491.303,34456.558,36735.987,32401.573,27956.530 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 33491.3 | 27956.5–36736.0 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4844.388,4693.257,4748.332,4649.688,4423.834,3896.493,3198.646 -->
| serde_json | mixed | decode | 1187 | 20000 | 4649.7 | 3198.6–4844.4 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2219.644,2290.451,1959.423,2323.402,2453.256,2383.737,2294.437 -->
| serde_json | mixed | encode | 1186 | 20000 | 2294.4 | 1959.4–2453.3 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 3669.997,4585.556,4423.381,3713.584,3970.129,3381.888,2922.920 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 3713.6 | 2922.9–4585.6 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 2092.262,2138.045,2086.298,2020.280,2148.979,2524.678,2519.870 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 2138.0 | 2020.3–2524.7 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1062.767,1054.084,1039.851,1070.570,1131.443,1170.737,1261.475 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1070.6 | 1039.9–1261.5 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 524.037,517.022,494.435,474.298,471.358,453.727,438.755 -->
| prost (binary) | mixed | encode | 954 | 20000 | 474.3 | 438.8–524.0 | 149207284 |
<!-- samples | serde_json | floats | decode | 5100.235,5027.836,4914.993,4924.862,4923.377,4912.491,4899.807 -->
| serde_json | floats | decode | 1581 | 2000 | 4923.4 | 4899.8–5100.2 | 3825000 |
<!-- samples | serde_json | floats | encode | 6307.514,6314.507,6680.129,7006.739,6706.294,6579.263,6521.414 -->
| serde_json | floats | encode | 1581 | 2000 | 6579.3 | 6307.5–7006.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5904.877,5709.713,5692.556,5984.973,6537.822,6856.338,7649.226 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5985.0 | 5692.6–7649.2 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 14586.044,15313.189,14533.508,15104.233,13252.270,11722.346,10955.658 -->
| sonic-rs | floats | encode | 1581 | 2000 | 14533.5 | 10955.7–15313.2 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 838.279,837.957,853.803,847.540,852.716,855.587,815.946 -->
| prost (binary) | floats | decode | 2051 | 2000 | 847.5 | 815.9–855.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 326.080,331.336,331.135,325.940,332.185,332.138,332.519 -->
| prost (binary) | floats | encode | 2051 | 2000 | 331.3 | 325.9–332.5 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 15479.887,14551.241,14384.079,14393.794,14327.272,14012.917,13843.608 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 14384.1 | 13843.6–15479.9 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 5780.156,5819.829,5989.413,6124.679,6679.271,7176.352,7735.938 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 6124.7 | 5780.2–7735.9 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 13997.229,13430.270,12148.183,11206.262,10755.298,10536.731,10731.100 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 11206.3 | 10536.7–13997.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 12624.285,15577.015,16380.851,16524.646,17488.623,17304.322,17257.465 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 16524.6 | 12624.3–17488.6 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 875.036,839.340,844.167,831.837,906.351,930.583,949.853 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 875.0 | 831.8–949.9 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 460.582,460.423,476.637,485.500,485.329,481.632,487.108 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 481.6 | 460.4–487.1 | 32664305 |
<!-- samples | serde_json | text-short | decode | 195.881,174.489,169.257,170.551,165.355,170.639,170.005 -->
| serde_json | text-short | decode | 97 | 200000 | 170.6 | 165.4–195.9 | 149907000 |
<!-- samples | serde_json | text-short | encode | 114.986,114.299,114.514,114.036,206.130,179.607,115.834 -->
| serde_json | text-short | encode | 97 | 200000 | 115.0 | 114.0–206.1 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 237.162,244.036,232.495,231.040,215.993,179.394,210.724 -->
| sonic-rs | text-short | decode | 97 | 200000 | 231.0 | 179.4–244.0 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 149.173,160.047,157.042,154.985,154.259,256.117,150.096 -->
| sonic-rs | text-short | encode | 97 | 200000 | 155.0 | 149.2–256.1 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 64.506,64.284,64.836,64.633,68.666,68.476,68.566 -->
| prost (binary) | text-short | decode | 70 | 200000 | 64.8 | 64.3–68.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 37.435,36.523,35.981,34.291,33.914,31.850,32.855 -->
| prost (binary) | text-short | encode | 70 | 200000 | 34.3 | 31.9–37.4 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3080.514,3059.570,2904.820,2795.259,2649.242,2615.993,2533.540 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2795.3 | 2533.5–3080.5 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4429.765,4375.847,4257.312,4223.653,4139.123,4099.226,4685.834 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4257.3 | 4099.2–4685.8 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2327.578,2332.661,2402.644,2485.657,2495.401,2577.177,2652.861 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2485.7 | 2327.6–2652.9 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 730.978,732.837,738.089,745.769,763.546,743.333,750.540 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 743.3 | 731.0–763.5 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 750.812,772.679,787.902,783.830,797.631,770.545,786.387 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 783.8 | 750.8–797.6 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 397.974,408.484,408.854,409.266,407.128,413.159,402.875 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 408.5 | 398.0–413.2 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2322.465,2222.387,2243.429,2235.788,2219.291,2119.860,2115.788 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2222.4 | 2115.8–2322.5 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5229.078,5210.672,5194.342,5209.066,5209.065,5202.864,5194.175 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5209.1 | 5194.2–5229.1 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1839.459,1872.730,1869.788,1870.489,1807.018,1827.754,1817.840 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1839.5 | 1807.0–1872.7 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 701.188,728.866,706.263,702.912,708.063,705.006,705.857 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 705.9 | 701.2–728.9 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 731.730,729.561,741.433,737.093,725.984,726.215,723.052 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 729.6 | 723.1–741.4 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 387.820,381.676,385.213,386.248,383.310,374.621,391.642 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 385.2 | 374.6–391.6 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 30136.705,27435.985,23324.447,23522.630,22320.675,20657.156,24271.285 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23522.6 | 20657.2–30136.7 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 10732.799,10505.338,10330.646,10262.525,9743.717,8652.105,7781.739 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 10262.5 | 7781.7–10732.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 16657.939,17927.187,18459.354,21027.806,19716.703,18584.364,18886.454 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 18584.4 | 16657.9–21027.8 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 6751.039,6693.560,7148.202,8209.080,8202.806,7394.635,6795.072 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 7148.2 | 6693.6–8209.1 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 6761.702,6481.654,6312.671,6234.964,6197.757,6198.095,6013.338 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 6235.0 | 6013.3–6761.7 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 218.663,214.974,218.543,214.982,217.649,214.985,215.245 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 215.2 | 215.0–218.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 543.699,544.757,549.836,613.564,627.349,664.968,628.990 -->
| serde_json | wide | decode | 135 | 40000 | 613.6 | 543.7–665.0 | 33720000 |
<!-- samples | serde_json | wide | encode | 354.239,388.167,392.071,366.721,348.626,332.033,318.742 -->
| serde_json | wide | encode | 135 | 40000 | 354.2 | 318.7–392.1 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 683.667,710.506,804.644,880.822,967.968,933.899,868.873 -->
| sonic-rs | wide | decode | 135 | 40000 | 868.9 | 683.7–968.0 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 373.123,368.213,363.302,355.157,352.859,348.700,352.951 -->
| sonic-rs | wide | encode | 135 | 40000 | 355.2 | 348.7–373.1 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 115.578,113.424,115.354,114.774,115.916,113.110,112.146 -->
| prost (binary) | wide | decode | 31 | 40000 | 114.8 | 112.1–115.9 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 116.126,118.489,120.363,130.495,140.233,148.872,146.550 -->
| prost (binary) | wide | encode | 31 | 40000 | 130.5 | 116.1–148.9 | 19595809 |
