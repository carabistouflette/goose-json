| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 108.201,110.114,112.932,106.405,109.489,114.152,118.897 -->
| goose-json | plain | decode | 38 | 200000 | 110.1 | 106.4–118.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 45.321,45.063,42.913,42.874,42.883,43.779,45.674 -->
| goose-json | plain | encode | 38 | 200000 | 43.8 | 42.9–45.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 120.646,119.750,121.921,119.154,119.833,124.315,122.428 -->
| Goose DOM | plain | decode | 38 | 200000 | 120.6 | 119.2–124.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 215.098,212.650,213.468,212.338,212.915,219.313,216.506 -->
| goose-json | escaped | decode | 62 | 200000 | 213.5 | 212.3–219.3 | 85461000 |
<!-- samples | goose-json | escaped | encode | 102.871,103.291,102.838,103.133,102.784,106.078,103.147 -->
| goose-json | escaped | encode | 54 | 200000 | 103.1 | 102.8–106.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 165.721,165.878,165.139,165.710,166.400,172.295,166.573 -->
| Goose DOM | escaped | decode | 62 | 200000 | 165.9 | 165.1–172.3 | 30822000 |
<!-- samples | goose-json | array | decode | 9459.456,9713.210,9595.156,9474.126,9701.951,9561.029,9670.818 -->
| goose-json | array | decode | 4022 | 20000 | 9595.2 | 9459.5–9713.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5751.484,5828.401,5707.041,5630.646,5634.961,5597.389,5780.827 -->
| goose-json | array | encode | 4022 | 20000 | 5707.0 | 5597.4–5828.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24387.223,24455.445,24460.015,24766.597,24512.024,24326.539,24501.830 -->
| Goose DOM | array | decode | 4022 | 20000 | 24460.0 | 24326.5–24766.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 4906.755,5054.678,5166.763,4943.245,5121.659,5075.855,5090.658 -->
| goose-json | floats | decode | 1581 | 2000 | 5075.9 | 4906.8–5166.8 | 3825000 |
<!-- samples | goose-json | floats | encode | 10663.799,10791.376,10820.049,10517.818,10776.715,10676.970,10593.907 -->
| goose-json | floats | encode | 1581 | 2000 | 10677.0 | 10517.8–10820.0 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6667.628,6849.095,6633.378,6723.405,6922.720,6841.913,6802.645 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6802.6 | 6633.4–6922.7 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8663.257,8958.450,9054.185,8745.368,8812.692,8841.431,8550.272 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8812.7 | 8550.3–9054.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11556.293,11336.943,11187.092,11321.269,11193.230,10923.083,10903.009 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11193.2 | 10903.0–11556.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 18469.388,17915.439,18186.051,19772.994,17554.829,17487.634,17561.715 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17915.4 | 17487.6–19773.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 119.500,105.074,113.347,117.737,109.990,109.756,116.873 -->
| goose-json | text-short | decode | 97 | 200000 | 113.3 | 105.1–119.5 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.047,43.205,43.002,43.191,42.948,45.754,43.954 -->
| goose-json | text-short | encode | 97 | 200000 | 43.2 | 42.9–45.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 177.618,178.708,179.091,178.055,184.130,184.253,181.955 -->
| Goose DOM | text-short | decode | 97 | 200000 | 179.1 | 177.6–184.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2340.708,2360.102,2325.810,2437.223,2457.230,2424.580,2441.372 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2424.6 | 2325.8–2457.2 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1930.046,1930.765,1930.736,2058.829,1995.005,2066.441,2068.340 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1995.0 | 1930.0–2068.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15526.350,15353.463,15754.736,16108.300,15706.822,15729.142,15839.775 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15729.1 | 15353.5–16108.3 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 888.984,908.448,890.513,872.604,901.778,847.498,892.039 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 890.5 | 847.5–908.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 522.501,523.337,520.852,504.866,521.197,489.014,523.078 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 521.2 | 489.0–523.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7531.137,7588.349,7358.248,7503.964,7457.412,7557.476,7199.337 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7504.0 | 7199.3–7588.3 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13397.929,13398.224,13372.264,13130.404,12888.049,13082.154,13221.584 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13221.6 | 12888.0–13398.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9553.872,9898.927,10026.257,9577.453,9914.894,9792.960,9803.174 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9803.2 | 9553.9–10026.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14771.507,14814.233,14986.518,14676.864,15366.130,15142.289,14845.053 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14845.1 | 14676.9–15366.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 788.405,800.909,800.786,803.269,788.348,793.505,788.761 -->
| goose-json | wide | decode | 135 | 40000 | 793.5 | 788.3–803.3 | 33720000 |
<!-- samples | goose-json | wide | encode | 190.031,179.417,195.847,198.851,195.644,184.181,205.288 -->
| goose-json | wide | encode | 135 | 40000 | 195.6 | 179.4–205.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 436.265,428.709,433.680,427.899,414.312,429.755,424.851 -->
| Goose DOM | wide | decode | 135 | 40000 | 428.7 | 414.3–436.3 | 4777000 |
