| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 103.828,99.510,97.400,107.856,106.277,101.310,98.038 -->
| serde_json | plain | decode | 38 | 200000 | 101.3 | 97.4–107.9 | 67248000 |
<!-- samples | serde_json | plain | encode | 51.049,51.326,50.780,49.166,49.190,50.033,53.221 -->
| serde_json | plain | encode | 38 | 200000 | 50.8 | 49.2–53.2 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 181.088,173.667,174.441,173.762,173.846,178.847,179.135 -->
| sonic-rs | plain | decode | 38 | 200000 | 174.4 | 173.7–181.1 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 53.300,54.879,58.846,56.937,55.509,55.486,53.697 -->
| sonic-rs | plain | encode | 38 | 200000 | 55.5 | 53.3–58.8 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 39.170,39.066,39.264,39.158,39.137,38.443,37.500 -->
| prost (binary) | plain | decode | 11 | 200000 | 39.1 | 37.5–39.3 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 20.777,21.022,21.545,21.446,21.055,20.777,20.906 -->
| prost (binary) | plain | encode | 11 | 200000 | 21.0 | 20.8–21.5 | 92719942 |
<!-- samples | serde_json | escaped | decode | 200.686,209.202,210.646,209.499,214.766,208.074,208.376 -->
| serde_json | escaped | decode | 62 | 200000 | 209.2 | 200.7–214.8 | 85461000 |
<!-- samples | serde_json | escaped | encode | 64.479,64.341,64.240,64.158,64.290,64.048,64.194 -->
| serde_json | escaped | encode | 54 | 200000 | 64.2 | 64.0–64.5 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 306.066,309.220,293.156,290.990,286.102,288.932,282.917 -->
| sonic-rs | escaped | decode | 62 | 200000 | 291.0 | 282.9–309.2 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 100.052,123.170,152.885,165.691,160.620,143.746,141.981 -->
| sonic-rs | escaped | encode | 54 | 200000 | 143.7 | 100.1–165.7 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 68.495,73.278,68.011,67.397,72.146,66.483,62.336 -->
| prost (binary) | escaped | decode | 24 | 200000 | 68.0 | 62.3–73.3 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 29.013,29.231,29.603,30.809,31.644,32.064,29.815 -->
| prost (binary) | escaped | encode | 24 | 200000 | 29.8 | 29.0–32.1 | 181133323 |
<!-- samples | serde_json | array | decode | 14549.783,13895.095,12543.322,12525.217,12379.842,12562.741,12497.891 -->
| serde_json | array | decode | 4022 | 20000 | 12543.3 | 12379.8–14549.8 | 288627000 |
<!-- samples | serde_json | array | encode | 6315.284,7215.220,6380.523,6359.303,6679.667,6791.183,6355.810 -->
| serde_json | array | encode | 4022 | 20000 | 6380.5 | 6315.3–7215.2 | 574225548 |
<!-- samples | sonic-rs | array | decode | 18205.722,18575.658,18092.146,20143.598,30347.294,26469.495,19914.279 -->
| sonic-rs | array | decode | 4022 | 20000 | 19914.3 | 18092.1–30347.3 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7382.522,6842.077,7666.352,6833.652,7191.934,6719.193,6739.402 -->
| sonic-rs | array | encode | 4022 | 20000 | 6842.1 | 6719.2–7666.4 | 574225548 |
<!-- samples | prost (binary) | array | decode | 2966.058,3102.532,2995.274,2993.857,3101.748,2931.123,2906.232 -->
| prost (binary) | array | decode | 1923 | 20000 | 2993.9 | 2906.2–3102.5 | 288627000 |
<!-- samples | prost (binary) | array | encode | 5983.237,5826.138,5844.084,5930.399,5750.129,6489.995,5972.710 -->
| prost (binary) | array | encode | 1923 | 20000 | 5930.4 | 5750.1–6490.0 | 284551620 |
<!-- samples | serde_json | floats | decode | 5433.519,5422.167,5355.444,5210.977,5211.511,5203.666,5198.820 -->
| serde_json | floats | decode | 1581 | 2000 | 5211.5 | 5198.8–5433.5 | 3825000 |
<!-- samples | serde_json | floats | encode | 6263.467,6254.425,6241.600,6238.283,6102.217,6131.910,6017.908 -->
| serde_json | floats | encode | 1581 | 2000 | 6238.3 | 6017.9–6263.5 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 5891.991,6024.418,6076.145,5986.116,5803.073,5801.159,5776.642 -->
| sonic-rs | floats | decode | 1581 | 2000 | 5892.0 | 5776.6–6076.1 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 9575.318,9573.888,9667.647,9955.518,9831.511,9848.795,9969.516 -->
| sonic-rs | floats | encode | 1581 | 2000 | 9831.5 | 9573.9–9969.5 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 513.201,530.777,523.384,520.891,512.711,525.283,509.345 -->
| prost (binary) | floats | decode | 2051 | 2000 | 520.9 | 509.3–530.8 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 284.004,286.106,283.800,292.603,285.295,283.784,285.143 -->
| prost (binary) | floats | encode | 2051 | 2000 | 285.1 | 283.8–292.6 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 15619.013,15187.791,15173.125,14794.306,14803.758,15388.312,14882.585 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 15173.1 | 14794.3–15619.0 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 6253.861,6725.846,6566.429,6348.876,6191.686,6175.148,6166.972 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 6253.9 | 6167.0–6725.8 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 10373.065,11492.468,11864.115,12024.301,11286.543,10947.968,11511.192 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 11492.5 | 10373.1–12024.3 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 11083.716,10893.316,10998.969,12209.802,12302.770,11356.043,10848.282 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 11083.7 | 10848.3–12302.8 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 529.944,539.458,529.615,529.477,530.283,538.169,529.548 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 529.9 | 529.5–539.5 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 262.194,264.823,262.844,273.452,262.841,265.322,263.062 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 263.1 | 262.2–273.5 | 32664305 |
<!-- samples | serde_json | text-short | decode | 108.117,107.335,105.666,102.811,106.403,106.159,105.768 -->
| serde_json | text-short | decode | 97 | 200000 | 106.2 | 102.8–108.1 | 149907000 |
<!-- samples | serde_json | text-short | encode | 88.553,87.601,97.977,95.126,96.697,92.865,90.001 -->
| serde_json | text-short | encode | 97 | 200000 | 92.9 | 87.6–98.0 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 145.981,146.866,139.560,134.208,135.032,134.295,134.139 -->
| sonic-rs | text-short | decode | 97 | 200000 | 135.0 | 134.1–146.9 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 97.127,97.385,97.039,97.406,105.810,105.606,100.720 -->
| sonic-rs | text-short | encode | 97 | 200000 | 97.4 | 97.0–105.8 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 39.048,39.835,41.269,41.430,41.701,39.233,39.207 -->
| prost (binary) | text-short | decode | 70 | 200000 | 39.8 | 39.0–41.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 22.502,22.540,22.816,22.953,22.987,23.019,23.892 -->
| prost (binary) | text-short | encode | 70 | 200000 | 23.0 | 22.5–23.9 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2422.823,2332.354,2356.798,2394.972,2403.521,2498.717,2401.987 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2402.0 | 2332.4–2498.7 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 7580.722,7191.630,6954.288,6961.577,6947.258,6827.891,6693.597 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 6954.3 | 6693.6–7580.7 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1663.440,1641.675,1651.614,1641.350,1638.516,1679.464,1707.854 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1651.6 | 1638.5–1707.9 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 508.899,506.529,513.325,507.884,507.010,507.525,515.529 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 507.9 | 506.5–515.5 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 516.576,516.337,521.603,517.088,516.908,522.271,506.480 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 516.9 | 506.5–522.3 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 270.591,264.905,267.111,269.129,273.540,281.726,289.726 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 270.6 | 264.9–289.7 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1784.237,1720.882,1719.926,1669.678,1655.459,1648.273,1637.068 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1669.7 | 1637.1–1784.2 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 6840.242,6696.310,6518.105,6436.753,6437.569,6268.399,6207.163 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 6437.6 | 6207.2–6840.2 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1150.140,1150.502,1151.656,1150.431,1148.870,1153.408,1154.138 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1150.5 | 1148.9–1154.1 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 453.498,453.149,455.423,454.052,456.038,455.661,457.156 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 455.4 | 453.1–457.2 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 470.284,472.149,471.567,471.599,471.075,469.933,465.168 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 471.1 | 465.2–472.1 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 242.452,244.026,241.859,243.746,242.161,243.564,242.190 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 242.5 | 241.9–244.0 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 18899.510,19591.136,18794.333,18687.092,19073.657,18693.184,19729.074 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 18899.5 | 18687.1–19729.1 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 9427.812,9283.932,8963.472,9053.963,9284.295,9017.001,8946.912 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 9054.0 | 8946.9–9427.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 15194.422,14697.228,14790.266,14722.274,14435.835,14260.361,14267.293 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 14697.2 | 14260.4–15194.4 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 5411.073,5581.034,5516.732,5742.386,5823.327,5802.850,5633.008 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 5633.0 | 5411.1–5823.3 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 5297.569,5288.719,5280.632,5297.537,5109.114,5094.014,5095.332 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 5280.6 | 5094.0–5297.6 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 211.201,213.365,210.785,214.021,211.032,210.772,213.716 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 211.2 | 210.8–214.0 | 101649504 |
<!-- samples | serde_json | wide | decode | 506.472,507.434,513.828,512.440,510.428,508.185,507.516 -->
| serde_json | wide | decode | 135 | 40000 | 508.2 | 506.5–513.8 | 33720000 |
<!-- samples | serde_json | wide | encode | 285.322,285.136,284.875,284.986,284.939,285.420,287.374 -->
| serde_json | wide | encode | 135 | 40000 | 285.1 | 284.9–287.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 624.111,714.211,984.880,1046.707,988.231,820.902,695.772 -->
| sonic-rs | wide | decode | 135 | 40000 | 820.9 | 624.1–1046.7 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 308.743,305.570,296.347,296.673,298.667,296.490,297.712 -->
| sonic-rs | wide | encode | 135 | 40000 | 297.7 | 296.3–308.7 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 99.544,99.729,99.165,100.255,101.914,102.024,101.142 -->
| prost (binary) | wide | decode | 31 | 40000 | 100.3 | 99.2–102.0 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 93.130,95.449,95.626,95.635,95.795,93.301,92.835 -->
| prost (binary) | wide | encode | 31 | 40000 | 95.4 | 92.8–95.8 | 19595809 |
