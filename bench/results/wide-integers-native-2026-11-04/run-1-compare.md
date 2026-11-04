| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 154.511,150.618,149.649,148.831,149.398,149.251,148.853 -->
| serde_json | plain | decode | 38 | 200000 | 149.4 | 148.8–154.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 75.253,75.615,75.238,74.711,74.922,74.712,74.748 -->
| serde_json | plain | encode | 38 | 200000 | 74.9 | 74.7–75.6 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 275.504,280.819,270.716,274.769,270.084,273.115,284.921 -->
| sonic-rs | plain | decode | 38 | 200000 | 274.8 | 270.1–284.9 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 80.746,80.010,79.367,79.741,79.507,79.519,79.613 -->
| sonic-rs | plain | encode | 38 | 200000 | 79.6 | 79.4–80.7 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 60.458,60.262,60.273,60.248,60.241,60.162,60.244 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.2 | 60.2–60.5 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 33.773,33.532,33.858,35.328,35.669,36.070,35.910 -->
| prost (binary) | plain | encode | 11 | 200000 | 35.3 | 33.5–36.1 | 92719942 |
<!-- samples | serde_json | escaped | decode | 329.107,322.585,337.021,343.396,326.769,315.312,322.036 -->
| serde_json | escaped | decode | 62 | 200000 | 326.8 | 315.3–343.4 | 85461000 |
<!-- samples | serde_json | escaped | encode | 95.451,95.873,95.427,95.514,100.691,101.241,101.346 -->
| serde_json | escaped | encode | 54 | 200000 | 95.9 | 95.4–101.3 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 509.854,488.333,479.377,477.839,480.073,482.826,489.417 -->
| sonic-rs | escaped | decode | 62 | 200000 | 482.8 | 477.8–509.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 167.130,167.309,168.111,168.994,169.963,167.867,167.938 -->
| sonic-rs | escaped | encode | 54 | 200000 | 167.9 | 167.1–170.0 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 70.384,70.639,70.602,70.948,70.258,70.487,70.339 -->
| prost (binary) | escaped | decode | 24 | 200000 | 70.5 | 70.3–70.9 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.445,33.280,33.554,35.255,35.194,35.390,35.151 -->
| prost (binary) | escaped | encode | 24 | 200000 | 35.2 | 33.3–35.4 | 181133323 |
<!-- samples | serde_json | array | decode | 20158.668,19938.403,19680.786,19408.620,19563.443,19763.360,19510.204 -->
| serde_json | array | decode | 4022 | 20000 | 19680.8 | 19408.6–20158.7 | 288627000 |
<!-- samples | serde_json | array | encode | 9696.015,10081.750,9990.223,9642.376,9644.673,9877.046,9605.266 -->
| serde_json | array | encode | 4022 | 20000 | 9696.0 | 9605.3–10081.8 | 574225548 |
<!-- samples | sonic-rs | array | decode | 27836.641,28022.325,28052.672,31091.210,28043.948,27673.446,29135.892 -->
| sonic-rs | array | decode | 4022 | 20000 | 28043.9 | 27673.4–31091.2 | 288627000 |
<!-- samples | sonic-rs | array | encode | 10305.736,10596.590,10224.503,10176.064,10260.597,10187.806,10154.471 -->
| sonic-rs | array | encode | 4022 | 20000 | 10224.5 | 10154.5–10596.6 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5617.359,5626.075,5619.404,5597.182,5607.880,5698.845,5884.224 -->
| prost (binary) | array | decode | 1923 | 20000 | 5619.4 | 5597.2–5884.2 | 288627000 |
<!-- samples | prost (binary) | array | encode | 8832.831,9127.285,8903.764,8800.074,9803.156,9569.960,8934.004 -->
| prost (binary) | array | encode | 1923 | 20000 | 8934.0 | 8800.1–9803.2 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 20097.472,20245.544,19965.690,20438.872,20371.103,19910.162,20439.538 -->
| serde_json | array-signed | decode | 4538 | 20000 | 20245.5 | 19910.2–20439.5 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 9111.987,9493.661,9448.782,9250.403,9269.903,9035.520,9223.112 -->
| serde_json | array-signed | encode | 4537 | 20000 | 9250.4 | 9035.5–9493.7 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 27821.607,28705.233,28154.145,30755.532,28151.070,26930.162,27082.184 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 28151.1 | 26930.2–30755.5 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 9033.471,9036.086,9210.729,9120.392,9268.024,9187.406,9361.262 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 9187.4 | 9033.5–9361.3 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 8044.727,7714.431,7724.484,7723.766,7751.555,7736.121,7774.288 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 7736.1 | 7714.4–8044.7 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 22611.340,22030.466,22352.123,22562.724,21901.305,22015.930,22136.050 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 22136.1 | 21901.3–22611.3 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 45566.765,47673.357,44707.071,44764.205,46255.661,46436.905,45978.506 -->
| serde_json | array-wide | decode | 19771 | 20000 | 45978.5 | 44707.1–47673.4 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 17351.281,17335.365,17334.640,17014.252,18136.126,19794.184,18407.969 -->
| serde_json | array-wide | encode | 19770 | 20000 | 17351.3 | 17014.3–19794.2 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 33730.929,33423.404,33818.405,33794.410,33091.236,35194.192,35045.585 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 33794.4 | 33091.2–35194.2 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 19128.313,19600.443,19675.275,19414.601,18484.999,19163.346,18684.923 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 19163.3 | 18485.0–19675.3 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 10325.692,10383.307,10429.223,10550.647,10433.814,10570.054,10535.172 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 10433.8 | 10325.7–10570.1 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 32860.426,33694.984,33575.136,32927.110,33496.154,35671.592,33166.051 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 33496.2 | 32860.4–35671.6 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4817.809,4700.570,4710.779,4715.695,4707.147,4640.605,4767.906 -->
| serde_json | mixed | decode | 1187 | 20000 | 4710.8 | 4640.6–4817.8 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2556.897,2560.880,2592.349,2602.971,2700.261,2569.676,2572.815 -->
| serde_json | mixed | encode | 1186 | 20000 | 2572.8 | 2556.9–2700.3 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4498.245,4387.976,4314.872,4336.171,4308.595,4305.129,4291.812 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 4314.9 | 4291.8–4498.2 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3212.666,3208.512,3212.724,3218.552,3204.318,3214.514,3208.844 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3212.7 | 3204.3–3218.6 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 1392.142,1395.200,1393.032,1384.914,1387.294,1372.908,1450.142 -->
| prost (binary) | mixed | decode | 954 | 20000 | 1392.1 | 1372.9–1450.1 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 652.509,631.313,644.378,643.269,634.997,605.095,597.291 -->
| prost (binary) | mixed | encode | 954 | 20000 | 635.0 | 597.3–652.5 | 149207284 |
<!-- samples | serde_json | floats | decode | 7668.387,7477.516,7378.241,7408.385,7543.109,7339.286,7411.149 -->
| serde_json | floats | decode | 1581 | 2000 | 7411.1 | 7339.3–7668.4 | 3825000 |
<!-- samples | serde_json | floats | encode | 10175.924,9857.347,9538.419,9563.212,9578.797,9556.272,9572.507 -->
| serde_json | floats | encode | 1581 | 2000 | 9572.5 | 9538.4–10175.9 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 8398.921,8418.960,8387.219,8379.797,8397.496,8366.906,8405.621 -->
| sonic-rs | floats | decode | 1581 | 2000 | 8397.5 | 8366.9–8419.0 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 15412.784,16122.328,16108.778,15790.582,15548.898,15261.336,15241.914 -->
| sonic-rs | floats | encode | 1581 | 2000 | 15548.9 | 15241.9–16122.3 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 1063.953,1083.252,1107.018,1079.334,1088.318,1081.969,1078.483 -->
| prost (binary) | floats | decode | 2051 | 2000 | 1082.0 | 1064.0–1107.0 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 422.007,418.757,422.386,420.604,422.284,424.180,425.682 -->
| prost (binary) | floats | encode | 2051 | 2000 | 422.3 | 418.8–425.7 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 21461.020,21459.228,22677.871,21716.974,21406.091,21422.578,21344.326 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21459.2 | 21344.3–22677.9 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 9209.558,9216.469,9253.912,9188.098,9218.219,9200.321,9190.448 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 9209.6 | 9188.1–9253.9 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 16156.938,16164.517,16147.913,16101.775,16116.044,16952.164,16040.253 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 16147.9 | 16040.3–16952.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 16734.558,16317.109,16401.856,16270.478,16293.952,16293.119,16484.298 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 16317.1 | 16270.5–16734.6 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 773.082,766.356,756.330,757.058,759.117,753.202,787.489 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 759.1 | 753.2–787.5 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 393.318,392.127,385.663,394.280,394.582,391.005,390.647 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 392.1 | 385.7–394.6 | 32664305 |
<!-- samples | serde_json | text-short | decode | 161.969,162.019,159.600,160.400,161.417,160.998,161.043 -->
| serde_json | text-short | decode | 97 | 200000 | 161.0 | 159.6–162.0 | 149907000 |
<!-- samples | serde_json | text-short | encode | 107.815,107.936,108.221,108.093,107.727,108.307,113.427 -->
| serde_json | text-short | encode | 97 | 200000 | 108.1 | 107.7–113.4 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 220.957,216.724,217.990,217.665,218.340,217.613,218.496 -->
| sonic-rs | text-short | decode | 97 | 200000 | 218.0 | 216.7–221.0 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 147.078,146.989,147.255,146.946,146.455,153.856,155.141 -->
| sonic-rs | text-short | encode | 97 | 200000 | 147.1 | 146.5–155.1 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 63.705,60.890,61.519,64.769,64.428,64.256,61.208 -->
| prost (binary) | text-short | decode | 70 | 200000 | 63.7 | 60.9–64.8 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 33.592,33.289,33.473,33.498,33.961,33.268,33.357 -->
| prost (binary) | text-short | encode | 70 | 200000 | 33.5 | 33.3–34.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 3200.753,3157.637,3160.943,3217.289,3151.490,3168.599,3178.735 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 3168.6 | 3151.5–3217.3 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 6071.011,6083.468,5959.504,5946.815,5701.705,5703.625,5673.217 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 5946.8 | 5673.2–6083.5 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2730.090,2673.039,2657.051,2664.213,2647.318,2685.106,2651.333 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 2664.2 | 2647.3–2730.1 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 735.332,727.967,728.255,724.453,730.278,719.591,723.239 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 728.0 | 719.6–735.3 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 747.023,757.538,757.812,741.279,760.005,749.442,763.298 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 757.5 | 741.3–763.3 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 380.000,381.848,376.089,373.497,376.695,377.978,379.055 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 378.0 | 373.5–381.8 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2259.802,2252.518,2253.539,2258.224,2228.686,2239.529,2282.097 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2253.5 | 2228.7–2282.1 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 5211.652,5299.454,5188.605,5247.359,5239.559,5251.167,5275.154 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5247.4 | 5188.6–5299.5 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1813.792,1857.401,1905.016,1831.341,1839.624,1835.484,1819.761 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1835.5 | 1813.8–1905.0 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 700.587,714.956,709.189,707.126,715.601,706.452,711.684 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 709.2 | 700.6–715.6 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 738.391,737.949,743.795,729.037,730.543,747.436,741.892 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 738.4 | 729.0–747.4 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 381.363,380.791,377.976,382.401,382.830,384.683,378.012 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 381.4 | 378.0–384.7 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 33089.916,32298.754,32497.731,32584.911,32827.777,33025.594,32878.505 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 32827.8 | 32298.8–33089.9 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 10370.825,10711.151,10301.073,10703.020,10108.470,10167.350,10782.140 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 10370.8 | 10108.5–10782.1 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 22834.838,22652.168,22899.759,22950.610,22523.630,22949.156,23043.539 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 22899.8 | 22523.6–23043.5 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8549.878,8562.136,8511.449,8544.710,8535.980,8496.957,8547.524 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8544.7 | 8497.0–8562.1 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 9113.509,9165.691,9436.756,9591.205,9167.162,9190.243,9169.231 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 9169.2 | 9113.5–9591.2 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 330.676,322.805,331.522,331.947,326.611,330.637,334.658 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 330.7 | 322.8–334.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 860.790,861.479,863.223,862.411,863.239,881.431,885.254 -->
| serde_json | wide | decode | 135 | 40000 | 863.2 | 860.8–885.3 | 33720000 |
<!-- samples | serde_json | wide | encode | 452.855,471.091,471.420,461.292,467.478,469.527,471.271 -->
| serde_json | wide | encode | 135 | 40000 | 469.5 | 452.9–471.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 1083.828,1043.295,1010.877,1019.058,1032.978,1014.279,1005.331 -->
| sonic-rs | wide | decode | 135 | 40000 | 1019.1 | 1005.3–1083.8 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 440.120,445.380,453.305,465.567,444.779,448.786,455.962 -->
| sonic-rs | wide | encode | 135 | 40000 | 448.8 | 440.1–465.6 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 146.953,148.591,152.416,154.162,147.910,145.857,148.204 -->
| prost (binary) | wide | decode | 31 | 40000 | 148.2 | 145.9–154.2 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 140.357,140.025,140.685,140.195,140.033,141.828,141.111 -->
| prost (binary) | wide | encode | 31 | 40000 | 140.4 | 140.0–141.8 | 19595809 |
