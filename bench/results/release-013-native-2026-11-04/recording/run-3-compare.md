| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 162.430,159.842,156.704,157.077,158.148,157.400,156.602 -->
| serde_json | plain | decode | 38 | 200000 | 157.4 | 156.6–162.4 | 67248000 |
<!-- samples | serde_json | plain | encode | 78.776,80.095,76.614,76.266,79.028,78.566,79.601 -->
| serde_json | plain | encode | 38 | 200000 | 78.8 | 76.3–80.1 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 280.734,282.654,281.618,281.102,274.722,263.279,263.118 -->
| sonic-rs | plain | decode | 38 | 200000 | 280.7 | 263.1–282.7 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 80.640,79.522,79.628,79.591,79.161,79.683,85.039 -->
| sonic-rs | plain | encode | 38 | 200000 | 79.6 | 79.2–85.0 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 63.858,63.726,77.565,64.035,63.624,63.610,64.000 -->
| prost (binary) | plain | decode | 11 | 200000 | 63.9 | 63.6–77.6 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 35.592,36.203,35.800,35.626,35.970,35.769,36.189 -->
| prost (binary) | plain | encode | 11 | 200000 | 35.8 | 35.6–36.2 | 92719942 |
<!-- samples | serde_json | escaped | decode | 337.426,337.360,337.278,320.966,311.739,296.252,285.747 -->
| serde_json | escaped | decode | 62 | 200000 | 321.0 | 285.7–337.4 | 85461000 |
<!-- samples | serde_json | escaped | encode | 80.365,83.777,93.816,92.482,81.952,75.708,73.313 -->
| serde_json | escaped | encode | 54 | 200000 | 82.0 | 73.3–93.8 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 354.949,464.630,449.779,405.314,341.791,324.646,318.466 -->
| sonic-rs | escaped | decode | 62 | 200000 | 354.9 | 318.5–464.6 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 119.531,116.562,112.833,110.303,109.714,110.085,110.053 -->
| sonic-rs | escaped | encode | 54 | 200000 | 110.3 | 109.7–119.5 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 46.920,48.160,48.841,50.347,49.730,50.423,53.704 -->
| prost (binary) | escaped | decode | 24 | 200000 | 49.7 | 46.9–53.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 25.808,24.924,24.094,24.287,23.975,23.472,23.105 -->
| prost (binary) | escaped | encode | 24 | 200000 | 24.1 | 23.1–25.8 | 181133323 |
<!-- samples | serde_json | array | decode | 14033.927,17182.230,17810.347,20564.802,20263.279,16714.755,17473.580 -->
| serde_json | array | decode | 4022 | 20000 | 17473.6 | 14033.9–20564.8 | 288627000 |
<!-- samples | serde_json | array | encode | 9279.147,9535.305,7424.623,8957.441,9515.515,9840.325,10147.683 -->
| serde_json | array | encode | 4022 | 20000 | 9515.5 | 7424.6–10147.7 | 574225548 |
<!-- samples | sonic-rs | array | decode | 27089.373,26624.956,29365.090,27545.511,26974.213,28020.472,28336.433 -->
| sonic-rs | array | decode | 4022 | 20000 | 27545.5 | 26625.0–29365.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 10053.278,9294.029,10232.597,9617.322,9811.243,9755.649,9296.277 -->
| sonic-rs | array | encode | 4022 | 20000 | 9755.6 | 9294.0–10232.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5097.540,5212.795,5729.132,5689.765,5401.771,5177.501,5790.709 -->
| prost (binary) | array | decode | 1923 | 20000 | 5401.8 | 5097.5–5790.7 | 288627000 |
<!-- samples | prost (binary) | array | encode | 9695.933,10154.856,9954.097,8184.778,6792.743,6724.501,6811.514 -->
| prost (binary) | array | encode | 1923 | 20000 | 8184.8 | 6724.5–10154.9 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 15060.145,13999.267,13315.177,13974.076,13610.203,13590.903,13601.903 -->
| serde_json | array-signed | decode | 4538 | 20000 | 13610.2 | 13315.2–15060.1 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 6085.461,6481.657,6797.181,7101.320,6502.959,6240.731,6347.130 -->
| serde_json | array-signed | encode | 4537 | 20000 | 6481.7 | 6085.5–7101.3 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 19134.411,19386.518,20178.242,21492.109,21841.312,18184.214,18655.294 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 19386.5 | 18184.2–21841.3 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 6275.187,6336.781,6600.027,6841.493,6541.224,9535.362,8457.875 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 6600.0 | 6275.2–9535.4 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5942.604,7077.663,5835.080,5529.367,5383.123,5102.205,5253.368 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 5529.4 | 5102.2–7077.7 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 15916.794,16299.151,21329.675,16281.467,17654.017,16348.921,15359.132 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 16299.2 | 15359.1–21329.7 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 37940.651,36314.006,40590.167,36126.836,33355.593,32903.465,35997.397 -->
| serde_json | array-wide | decode | 19771 | 20000 | 36126.8 | 32903.5–40590.2 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 12929.421,12702.617,12231.426,12200.267,15203.322,17661.547,20550.151 -->
| serde_json | array-wide | encode | 19770 | 20000 | 12929.4 | 12200.3–20550.2 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 37540.217,33615.592,33049.617,30750.517,30321.873,30234.000,30657.522 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 30750.5 | 30234.0–37540.2 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 19298.711,19156.508,17322.956,16986.947,16341.295,15888.926,18655.424 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 17323.0 | 15888.9–19298.7 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 11266.937,11100.846,10798.693,10852.987,11191.503,11145.030,10832.096 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 11100.8 | 10798.7–11266.9 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 34021.707,33565.676,34074.327,34011.526,33720.530,31978.083,31532.545 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 33720.5 | 31532.5–34074.3 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 5260.356,4782.016,4689.152,4548.965,4609.312,4433.685,4685.674 -->
| serde_json | mixed | decode | 1187 | 20000 | 4685.7 | 4433.7–5260.4 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2639.277,2756.590,2612.386,2476.215,2465.099,2463.535,2439.239 -->
| serde_json | mixed | encode | 1186 | 20000 | 2476.2 | 2439.2–2756.6 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4225.301,4505.130,4516.696,4434.739,4460.940,4298.257,4545.520 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 4460.9 | 4225.3–4545.5 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3162.826,3132.657,3335.155,3239.854,3167.055,3211.603,3351.623 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3211.6 | 3132.7–3351.6 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1474.540,1469.574,1462.572,1455.377,1406.700,1386.239,1386.222 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1455.4 | 1386.2–1474.5 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 601.400,617.477,614.312,620.406,617.682,615.174,591.960 -->
| prost (binary) | mixed | encode | 954 | 20000 | 615.2 | 592.0–620.4 | 149207284 |
<!-- samples | serde_json | floats | decode | 7112.542,7128.989,7040.995,6962.828,6825.275,6899.252,6939.691 -->
| serde_json | floats | decode | 1581 | 2000 | 6962.8 | 6825.3–7129.0 | 3825000 |
<!-- samples | serde_json | floats | encode | 9020.233,9054.693,8836.266,9092.703,8967.180,8425.877,8121.966 -->
| serde_json | floats | encode | 1581 | 2000 | 8967.2 | 8122.0–9092.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7012.262,7150.305,7479.880,8034.962,8339.696,8312.408,8242.613 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8035.0 | 7012.3–8339.7 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 14240.428,14408.329,14676.872,14498.744,14823.764,14776.555,15005.169 -->
| sonic-rs | floats | encode | 1581 | 2000 | 14676.9 | 14240.4–15005.2 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 1144.603,1112.762,1076.133,1074.495,1063.418,1076.900,1067.522 -->
| prost (binary) | floats | decode | 2051 | 2000 | 1076.1 | 1063.4–1144.6 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 379.001,379.800,377.349,376.236,373.550,379.093,406.249 -->
| prost (binary) | floats | encode | 2051 | 2000 | 379.0 | 373.6–406.2 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 21242.272,22367.040,23077.678,23045.555,22859.581,21731.969,22669.436 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22669.4 | 21242.3–23077.7 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 18324.134,18597.145,17032.370,16612.843,16486.244,16667.593,16656.679 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 16667.6 | 16486.2–18597.1 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16953.372,16696.859,16058.063,15910.884,15808.756,15962.435,15660.754 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15962.4 | 15660.8–16953.4 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 17924.274,17909.295,17724.946,17167.641,17591.841,16891.993,16854.313 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 17591.8 | 16854.3–17924.3 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 778.090,807.365,814.606,807.067,765.663,755.533,761.971 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 778.1 | 755.5–814.6 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 391.545,393.200,388.106,390.950,395.133,396.538,394.873 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 393.2 | 388.1–396.5 | 32664305 |
<!-- samples | serde_json | text-short | decode | 170.633,172.521,171.723,169.740,172.906,163.874,163.580 -->
| serde_json | text-short | decode | 97 | 200000 | 170.6 | 163.6–172.9 | 149907000 |
<!-- samples | serde_json | text-short | encode | 114.057,114.782,115.314,113.733,108.915,109.066,110.168 -->
| serde_json | text-short | encode | 97 | 200000 | 113.7 | 108.9–115.3 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 201.204,196.643,216.744,256.252,286.764,292.018,247.561 -->
| sonic-rs | text-short | decode | 97 | 200000 | 247.6 | 196.6–292.0 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 154.833,154.935,154.368,156.420,182.486,260.629,197.266 -->
| sonic-rs | text-short | encode | 97 | 200000 | 156.4 | 154.4–260.6 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 71.685,69.694,64.437,64.712,64.626,64.991,66.011 -->
| prost (binary) | text-short | decode | 70 | 200000 | 65.0 | 64.4–71.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 36.164,35.442,35.361,35.239,35.130,35.699,37.488 -->
| prost (binary) | text-short | encode | 70 | 200000 | 35.4 | 35.1–37.5 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3882.646,3646.197,3310.875,3299.079,3510.941,3272.622,3175.280 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3310.9 | 3175.3–3882.6 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 5694.218,5720.252,5787.248,5757.796,5713.986,5743.383,5638.611 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5720.3 | 5638.6–5787.2 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2695.153,2636.597,2576.347,2640.922,2551.282,2569.152,2706.691 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2636.6 | 2551.3–2706.7 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 745.086,722.634,721.861,701.394,717.918,707.675,709.923 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 717.9 | 701.4–745.1 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 740.714,745.620,753.990,751.742,737.025,745.430,736.712 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 745.4 | 736.7–754.0 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 385.027,377.993,383.069,388.603,393.963,384.109,390.863 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 385.0 | 378.0–394.0 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2235.452,2256.399,2292.289,2380.492,2350.972,2219.128,2275.372 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2275.4 | 2219.1–2380.5 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5295.845,5513.904,5603.707,5588.521,5579.688,5392.693,5416.400 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5513.9 | 5295.8–5603.7 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1923.774,1924.147,1906.809,1864.114,1935.620,1905.161,1814.588 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1906.8 | 1814.6–1935.6 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 707.554,711.132,718.312,714.237,703.337,714.441,709.823 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 711.1 | 703.3–718.3 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 766.434,776.242,765.400,770.418,727.470,758.096,749.669 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 765.4 | 727.5–776.2 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 408.274,410.940,404.449,415.042,414.962,416.296,415.324 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 415.0 | 404.4–416.3 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 31101.962,31787.065,31646.948,30897.933,30410.815,29996.775,31539.331 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 31102.0 | 29996.8–31787.1 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 10011.018,10002.700,10666.975,11002.133,10582.707,9910.555,10453.988 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 10454.0 | 9910.6–11002.1 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 24533.431,24686.898,24954.055,25719.107,25112.226,24683.147,24711.826 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 24711.8 | 24533.4–25719.1 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 9034.916,8973.511,8883.522,8943.907,8926.755,8469.837,8663.058 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8926.8 | 8469.8–9034.9 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 9498.022,9513.701,9499.417,9430.933,9495.531,9550.676,10084.062 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 9499.4 | 9430.9–10084.1 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 364.834,361.557,363.428,358.568,362.823,365.368,364.205 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 363.4 | 358.6–365.4 | 101649504 |
<!-- samples | serde_json | wide | decode | 909.825,880.755,864.961,883.628,902.101,934.111,901.580 -->
| serde_json | wide | decode | 135 | 40000 | 901.6 | 865.0–934.1 | 33720000 |
<!-- samples | serde_json | wide | encode | 456.487,471.435,471.433,470.649,466.963,466.734,466.369 -->
| serde_json | wide | encode | 135 | 40000 | 467.0 | 456.5–471.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1099.308,1093.584,1080.213,1048.132,990.810,968.362,1015.973 -->
| sonic-rs | wide | decode | 135 | 40000 | 1048.1 | 968.4–1099.3 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 460.094,472.147,472.586,471.693,470.965,474.088,467.229 -->
| sonic-rs | wide | encode | 135 | 40000 | 471.7 | 460.1–474.1 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 147.882,145.597,144.886,142.230,152.572,154.512,155.281 -->
| prost (binary) | wide | decode | 31 | 40000 | 147.9 | 142.2–155.3 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 149.323,150.716,151.876,151.535,158.333,151.385,151.066 -->
| prost (binary) | wide | encode | 31 | 40000 | 151.4 | 149.3–158.3 | 19595809 |
