| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 170.938,164.204,155.316,155.106,154.753,159.415,155.928 -->
| serde_json | plain | decode | 38 | 20000 | 155.9 | 154.8–170.9 | 6768000 |
<!-- samples | serde_json | plain | encode | 78.918,77.653,79.453,78.086,77.721,78.219,78.114 -->
| serde_json | plain | encode | 38 | 20000 | 78.1 | 77.7–79.5 | 16855732 |
<!-- samples | sonic-rs | plain | decode | 282.247,286.901,282.189,282.505,285.938,285.822,282.079 -->
| sonic-rs | plain | decode | 38 | 20000 | 282.5 | 282.1–286.9 | 6768000 |
<!-- samples | sonic-rs | plain | encode | 83.739,84.424,84.446,83.862,84.619,85.007,85.045 -->
| sonic-rs | plain | encode | 38 | 20000 | 84.4 | 83.7–85.0 | 16855732 |
<!-- samples | prost (binary) | plain | decode | 63.469,63.083,63.750,64.999,63.617,64.053,63.878 -->
| prost (binary) | plain | decode | 11 | 20000 | 63.7 | 63.1–65.0 | 6768000 |
<!-- samples | prost (binary) | plain | encode | 36.004,35.580,36.317,35.665,36.133,36.183,35.781 -->
| prost (binary) | plain | encode | 11 | 20000 | 36.0 | 35.6–36.3 | 9331168 |
<!-- samples | serde_json | escaped | decode | 337.769,342.945,331.255,337.084,340.892,337.300,338.716 -->
| serde_json | escaped | decode | 62 | 20000 | 337.8 | 331.3–342.9 | 8601000 |
<!-- samples | serde_json | escaped | encode | 100.383,100.442,99.691,101.293,100.092,101.085,100.133 -->
| serde_json | escaped | encode | 54 | 20000 | 100.4 | 99.7–101.3 | 21663705 |
<!-- samples | sonic-rs | escaped | decode | 495.666,491.175,498.515,494.956,499.412,494.094,499.285 -->
| sonic-rs | escaped | decode | 62 | 20000 | 495.7 | 491.2–499.4 | 8601000 |
<!-- samples | sonic-rs | escaped | encode | 185.440,187.034,187.467,185.329,181.049,175.421,174.892 -->
| sonic-rs | escaped | encode | 54 | 20000 | 185.3 | 174.9–187.5 | 21663705 |
<!-- samples | prost (binary) | escaped | decode | 74.708,74.905,74.362,75.319,74.605,76.568,74.092 -->
| prost (binary) | escaped | decode | 24 | 20000 | 74.7 | 74.1–76.6 | 8601000 |
<!-- samples | prost (binary) | escaped | encode | 35.094,35.128,34.697,35.087,35.105,34.725,34.908 -->
| prost (binary) | escaped | encode | 24 | 20000 | 35.1 | 34.7–35.1 | 18225823 |
<!-- samples | serde_json | array | decode | 20449.589,20532.101,21755.114,21881.575,20368.967,20426.310,20523.987 -->
| serde_json | array | decode | 4022 | 2000 | 20524.0 | 20369.0–21881.6 | 30705000 |
<!-- samples | serde_json | array | encode | 10106.151,10073.798,10079.387,10095.481,10102.287,10102.494,10081.608 -->
| serde_json | array | encode | 4022 | 2000 | 10095.5 | 10073.8–10106.2 | 61080811 |
<!-- samples | sonic-rs | array | decode | 28926.566,29920.869,30739.595,29067.493,28859.276,28795.358,28865.739 -->
| sonic-rs | array | decode | 4022 | 2000 | 28926.6 | 28795.4–30739.6 | 30705000 |
<!-- samples | sonic-rs | array | encode | 10691.469,10996.300,11032.013,11725.124,11459.007,11354.075,10853.383 -->
| sonic-rs | array | encode | 4022 | 2000 | 11032.0 | 10691.5–11725.1 | 61080811 |
<!-- samples | prost (binary) | array | decode | 5951.484,5965.718,6312.681,5965.806,5956.814,5928.974,5937.828 -->
| prost (binary) | array | decode | 1923 | 2000 | 5956.8 | 5929.0–6312.7 | 30705000 |
<!-- samples | prost (binary) | array | encode | 9376.801,10977.681,9970.350,10134.719,10518.185,10515.272,10651.714 -->
| prost (binary) | array | encode | 1923 | 2000 | 10515.3 | 9376.8–10977.7 | 30239709 |
<!-- samples | serde_json | array-signed | decode | 21036.054,21155.858,21708.971,21895.751,21048.077,21014.081,21060.690 -->
| serde_json | array-signed | decode | 4538 | 2000 | 21060.7 | 21014.1–21895.8 | 15375000 |
<!-- samples | serde_json | array-signed | encode | 9448.078,9491.583,9442.147,9413.731,9391.544,9117.507,8950.183 -->
| serde_json | array-signed | encode | 4537 | 2000 | 9413.7 | 8950.2–9491.6 | 68796382 |
<!-- samples | sonic-rs | array-signed | decode | 28486.909,28615.124,29060.674,29300.432,30636.122,30685.201,30404.182 -->
| sonic-rs | array-signed | decode | 4538 | 2000 | 29300.4 | 28486.9–30685.2 | 15375000 |
<!-- samples | sonic-rs | array-signed | encode | 9678.674,9947.873,10203.709,10150.892,10261.606,10421.533,10302.225 -->
| sonic-rs | array-signed | encode | 4537 | 2000 | 10203.7 | 9678.7–10421.5 | 68796382 |
<!-- samples | prost (binary) | array-signed | decode | 8204.440,8248.224,8259.633,8172.764,8202.327,8182.252,8247.994 -->
| prost (binary) | array-signed | decode | 6083 | 2000 | 8204.4 | 8172.8–8259.6 | 15375000 |
<!-- samples | prost (binary) | array-signed | encode | 23469.043,23268.073,23177.711,23056.421,21978.118,23291.606,23255.925 -->
| prost (binary) | array-signed | encode | 6083 | 2000 | 23255.9 | 21978.1–23469.0 | 94310580 |
<!-- samples | serde_json | array-wide | decode | 47738.391,49284.874,49845.219,49381.631,48137.681,48987.161,48922.412 -->
| serde_json | array-wide | decode | 19771 | 2000 | 48987.2 | 47738.4–49845.2 | 26205000 |
<!-- samples | serde_json | array-wide | encode | 17926.670,17894.125,18115.909,18904.483,19781.028,18755.017,19007.285 -->
| serde_json | array-wide | encode | 19770 | 2000 | 18755.0 | 17894.1–19781.0 | 297316216 |
<!-- samples | sonic-rs | array-wide | decode | 37612.901,37183.062,35251.232,35812.065,35263.365,35038.861,36567.228 -->
| sonic-rs | array-wide | decode | 19771 | 2000 | 35812.1 | 35038.9–37612.9 | 26205000 |
<!-- samples | sonic-rs | array-wide | encode | 20251.007,20850.483,20363.575,19537.240,19944.407,20350.920,19532.222 -->
| sonic-rs | array-wide | encode | 19770 | 2000 | 20251.0 | 19532.2–20850.5 | 297316216 |
<!-- samples | prost (binary) | array-wide | decode | 11212.704,11451.915,11944.365,11887.503,11489.205,11377.086,11221.582 -->
| prost (binary) | array-wide | decode | 9669 | 2000 | 11451.9 | 11212.7–11944.4 | 26205000 |
<!-- samples | prost (binary) | array-wide | encode | 34252.925,34257.469,34201.168,34197.130,34926.942,34581.066,34175.949 -->
| prost (binary) | array-wide | encode | 9669 | 2000 | 34252.9 | 34175.9–34926.9 | 147658990 |
<!-- samples | serde_json | mixed | decode | 4739.016,4807.963,4842.297,4702.611,4741.386,4693.849,4773.782 -->
| serde_json | mixed | decode | 1187 | 2000 | 4741.4 | 4693.8–4842.3 | 24255000 |
<!-- samples | serde_json | mixed | encode | 2620.472,2635.575,2634.575,2642.025,2771.817,2784.898,2730.377 -->
| serde_json | mixed | encode | 1186 | 2000 | 2642.0 | 2620.5–2784.9 | 19068985 |
<!-- samples | sonic-rs | mixed | decode | 4797.892,4461.530,4445.718,4443.566,4465.494,4506.617,4719.757 -->
| sonic-rs | mixed | decode | 1187 | 2000 | 4465.5 | 4443.6–4797.9 | 24255000 |
<!-- samples | sonic-rs | mixed | encode | 3620.037,3627.441,3632.021,3633.198,3632.141,3604.233,3611.494 -->
| sonic-rs | mixed | encode | 1186 | 2000 | 3627.4 | 3604.2–3633.2 | 19068985 |
<!-- samples | prost (binary) | mixed | decode | 1601.172,1512.288,1534.944,1574.726,1608.474,1626.088,1616.475 -->
| prost (binary) | mixed | decode | 954 | 2000 | 1601.2 | 1512.3–1626.1 | 24255000 |
<!-- samples | prost (binary) | mixed | encode | 696.367,707.309,694.490,695.168,700.350,697.458,670.991 -->
| prost (binary) | mixed | encode | 954 | 2000 | 696.4 | 671.0–707.3 | 15906263 |
<!-- samples | serde_json | floats | decode | 8387.695,8492.235,8388.490,8385.225,8504.840,8337.585,8411.015 -->
| serde_json | floats | decode | 1581 | 200 | 8388.5 | 8337.6–8504.8 | 408000 |
<!-- samples | serde_json | floats | encode | 10815.975,10826.845,10816.315,10835.045,10782.990,10817.680,10829.100 -->
| serde_json | floats | encode | 1581 | 200 | 10817.7 | 10783.0–10835.0 | 2611368 |
<!-- samples | sonic-rs | floats | decode | 9494.110,9523.285,9445.175,9536.080,9448.300,9588.150,9463.875 -->
| sonic-rs | floats | decode | 1581 | 200 | 9494.1 | 9445.2–9588.1 | 408000 |
<!-- samples | sonic-rs | floats | encode | 17395.140,17266.920,17289.190,17254.365,17142.395,17128.825,17092.625 -->
| sonic-rs | floats | encode | 1581 | 200 | 17254.4 | 17092.6–17395.1 | 2611368 |
<!-- samples | prost (binary) | floats | decode | 1111.470,1109.885,1107.740,1187.940,1142.560,1144.415,1144.185 -->
| prost (binary) | floats | decode | 2051 | 200 | 1142.6 | 1107.7–1187.9 | 408000 |
<!-- samples | prost (binary) | floats | encode | 459.215,518.425,457.035,460.260,458.700,461.470,456.800 -->
| prost (binary) | floats | encode | 2051 | 200 | 459.2 | 456.8–518.4 | 3346720 |
<!-- samples | serde_json | floats-wide | decode | 24125.360,24037.755,24035.780,23769.850,24215.850,24174.415,24119.855 -->
| serde_json | floats-wide | decode | 5975 | 200 | 24119.9 | 23769.8–24215.8 | 427200 |
<!-- samples | serde_json | floats-wide | encode | 10471.510,10387.955,10478.860,10442.435,10436.555,10379.210,10470.110 -->
| serde_json | floats-wide | encode | 5971 | 200 | 10442.4 | 10379.2–10478.9 | 9641832 |
<!-- samples | sonic-rs | floats-wide | decode | 17630.150,17868.895,18148.845,18585.695,18197.905,18106.595,18229.620 -->
| sonic-rs | floats-wide | decode | 5975 | 200 | 18148.8 | 17630.2–18585.7 | 427200 |
<!-- samples | sonic-rs | floats-wide | encode | 18588.425,18436.870,18461.070,18594.435,18775.230,18547.195,18667.590 -->
| sonic-rs | floats-wide | encode | 5971 | 200 | 18588.4 | 18436.9–18775.2 | 9641832 |
<!-- samples | prost (binary) | floats-wide | decode | 1399.060,1407.865,1392.330,1479.875,1405.205,1414.295,1447.970 -->
| prost (binary) | floats-wide | decode | 2051 | 200 | 1407.9 | 1392.3–1479.9 | 427200 |
<!-- samples | prost (binary) | floats-wide | encode | 454.600,454.440,452.705,453.025,454.410,454.680,451.310 -->
| prost (binary) | floats-wide | encode | 2051 | 200 | 454.4 | 451.3–454.7 | 3472896 |
<!-- samples | serde_json | text-short | decode | 181.565,191.118,195.975,185.950,180.626,182.407,180.359 -->
| serde_json | text-short | decode | 97 | 20000 | 182.4 | 180.4–196.0 | 15087000 |
<!-- samples | serde_json | text-short | encode | 121.042,122.520,121.723,121.280,122.485,121.087,122.073 -->
| serde_json | text-short | encode | 97 | 20000 | 121.7 | 121.0–122.5 | 26788875 |
<!-- samples | sonic-rs | text-short | decode | 238.866,236.885,245.124,245.080,244.882,238.334,247.168 -->
| sonic-rs | text-short | decode | 97 | 20000 | 244.9 | 236.9–247.2 | 15087000 |
<!-- samples | sonic-rs | text-short | encode | 164.607,165.407,164.177,167.137,165.615,163.599,163.537 -->
| sonic-rs | text-short | encode | 97 | 20000 | 164.6 | 163.5–167.1 | 26788875 |
<!-- samples | prost (binary) | text-short | decode | 68.000,68.255,69.128,68.233,68.451,68.761,68.592 -->
| prost (binary) | text-short | decode | 70 | 20000 | 68.5 | 68.0–69.1 | 15087000 |
<!-- samples | prost (binary) | text-short | encode | 37.814,38.141,37.434,37.509,37.781,37.963,37.326 -->
| prost (binary) | text-short | encode | 70 | 20000 | 37.8 | 37.3–38.1 | 23140856 |
<!-- samples | serde_json | text-sparse | decode | 3515.340,3527.995,3509.595,3539.375,3530.740,3509.595,3539.210 -->
| serde_json | text-sparse | decode | 8233 | 200 | 3528.0 | 3509.6–3539.4 | 13185600 |
<!-- samples | serde_json | text-sparse | encode | 6330.280,6353.775,6430.270,6314.420,6380.310,6376.645,6408.755 -->
| serde_json | text-sparse | encode | 8233 | 200 | 6376.6 | 6314.4–6430.3 | 13328096 |
<!-- samples | sonic-rs | text-sparse | decode | 3098.640,2991.510,2992.750,3109.035,2973.665,3049.410,2869.525 -->
| sonic-rs | text-sparse | decode | 8233 | 200 | 2992.8 | 2869.5–3109.0 | 13185600 |
<!-- samples | sonic-rs | text-sparse | encode | 764.980,768.725,763.390,761.845,802.110,760.365,760.415 -->
| sonic-rs | text-sparse | encode | 8233 | 200 | 763.4 | 760.4–802.1 | 13328096 |
<!-- samples | prost (binary) | text-sparse | decode | 776.120,784.755,835.725,790.110,788.355,781.275,784.700 -->
| prost (binary) | text-sparse | decode | 8205 | 200 | 784.8 | 776.1–835.7 | 13185600 |
<!-- samples | prost (binary) | text-sparse | encode | 408.980,408.980,460.895,405.070,403.100,404.830,405.405 -->
| prost (binary) | text-sparse | encode | 8205 | 200 | 405.4 | 403.1–460.9 | 13285472 |
<!-- samples | serde_json | text-ascii | decode | 2373.590,2321.985,2408.470,2408.120,2437.415,2353.395,2403.840 -->
| serde_json | text-ascii | decode | 8225 | 200 | 2403.8 | 2322.0–2437.4 | 13176000 |
<!-- samples | serde_json | text-ascii | encode | 5508.370,5553.510,5555.200,5571.445,5651.615,5490.445,5547.775 -->
| serde_json | text-ascii | encode | 8225 | 200 | 5553.5 | 5490.4–5651.6 | 13315296 |
<!-- samples | sonic-rs | text-ascii | decode | 1976.595,1923.640,1918.110,1975.060,1912.975,1999.025,1921.050 -->
| sonic-rs | text-ascii | decode | 8225 | 200 | 1923.6 | 1913.0–1999.0 | 13176000 |
<!-- samples | sonic-rs | text-ascii | encode | 738.535,740.725,822.530,736.755,735.895,740.555,737.120 -->
| sonic-rs | text-ascii | encode | 8225 | 200 | 738.5 | 735.9–822.5 | 13315296 |
<!-- samples | prost (binary) | text-ascii | decode | 827.680,765.420,767.760,767.050,769.420,772.285,825.965 -->
| prost (binary) | text-ascii | decode | 8199 | 200 | 769.4 | 765.4–827.7 | 13176000 |
<!-- samples | prost (binary) | text-ascii | encode | 410.810,408.440,408.210,406.470,414.740,411.235,413.080 -->
| prost (binary) | text-ascii | encode | 8199 | 200 | 410.8 | 406.5–414.7 | 13275824 |
<!-- samples | serde_json | text-escaped | decode | 32629.945,32568.825,32618.455,33665.495,35366.735,37028.680,34905.925 -->
| serde_json | text-escaped | decode | 8737 | 200 | 33665.5 | 32568.8–37028.7 | 10718400 |
<!-- samples | serde_json | text-escaped | encode | 11501.865,12670.260,12648.610,12782.160,12102.385,11489.515,11216.055 -->
| serde_json | text-escaped | encode | 8737 | 200 | 12102.4 | 11216.1–12782.2 | 14162184 |
<!-- samples | sonic-rs | text-escaped | decode | 26145.980,26160.295,26865.710,26818.440,26580.820,28058.155,28163.330 -->
| sonic-rs | text-escaped | decode | 8737 | 200 | 26818.4 | 26146.0–28163.3 | 10718400 |
<!-- samples | sonic-rs | text-escaped | encode | 10306.250,10320.030,10256.830,10294.865,10293.785,10208.015,10253.295 -->
| sonic-rs | text-escaped | encode | 8737 | 200 | 10293.8 | 10208.0–10320.0 | 14162184 |
<!-- samples | prost (binary) | text-escaped | decode | 10760.160,10760.585,10788.890,10715.820,10694.630,10743.190,10628.120 -->
| prost (binary) | text-escaped | decode | 6663 | 200 | 10743.2 | 10628.1–10788.9 | 10718400 |
<!-- samples | prost (binary) | text-escaped | encode | 389.770,389.245,389.470,365.940,364.935,366.195,365.510 -->
| prost (binary) | text-escaped | encode | 6663 | 200 | 366.2 | 364.9–389.8 | 10838584 |
<!-- samples | serde_json | wide | decode | 933.048,939.356,937.614,931.237,940.544,888.449,886.824 -->
| serde_json | wide | decode | 135 | 4000 | 933.0 | 886.8–940.5 | 3480000 |
<!-- samples | serde_json | wide | encode | 486.923,479.889,469.328,472.672,474.466,490.763,504.184 -->
| serde_json | wide | encode | 135 | 4000 | 479.9 | 469.3–504.2 | 5479021 |
<!-- samples | sonic-rs | wide | decode | 1126.534,1152.816,1154.420,1206.192,1206.011,1199.771,1196.432 -->
| sonic-rs | wide | decode | 135 | 4000 | 1196.4 | 1126.5–1206.2 | 3480000 |
<!-- samples | sonic-rs | wide | encode | 495.729,498.534,499.298,495.961,497.918,496.435,523.999 -->
| sonic-rs | wide | encode | 135 | 4000 | 497.9 | 495.7–524.0 | 5479021 |
<!-- samples | prost (binary) | wide | decode | 167.366,164.070,173.459,176.825,176.649,175.417,172.301 -->
| prost (binary) | wide | decode | 31 | 4000 | 173.5 | 164.1–176.8 | 3480000 |
<!-- samples | prost (binary) | wide | encode | 158.390,157.041,159.166,159.230,157.206,158.752,157.063 -->
| prost (binary) | wide | encode | 31 | 4000 | 158.4 | 157.0–159.2 | 2022169 |
