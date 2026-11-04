| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 81.915,77.879,76.905,77.338,75.844,79.246,81.833 -->
| goose-json | plain | decode | 38 | 200000 | 77.9 | 75.8–81.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 37.200,35.191,37.119,36.687,36.500,36.664,44.546 -->
| goose-json | plain | encode | 38 | 200000 | 36.7 | 35.2–44.5 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.485,55.373,57.130,56.935,59.076,57.684,75.613 -->
| Goose DOM | plain | decode | 38 | 200000 | 57.5 | 55.4–75.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 181.687,155.563,150.362,145.280,146.580,153.350,152.460 -->
| goose-json | escaped | decode | 62 | 200000 | 152.5 | 145.3–181.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 75.877,70.491,70.951,69.261,70.555,77.572,75.773 -->
| goose-json | escaped | encode | 54 | 200000 | 71.0 | 69.3–77.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 105.911,97.206,101.621,96.268,98.349,104.271,115.758 -->
| Goose DOM | escaped | decode | 62 | 200000 | 101.6 | 96.3–115.8 | 30822000 |
<!-- samples | goose-json | array | decode | 8391.782,10472.514,11786.773,11410.097,7962.049,7795.651,7901.637 -->
| goose-json | array | decode | 4022 | 20000 | 8391.8 | 7795.7–11786.8 | 288627000 |
<!-- samples | goose-json | array | encode | 5259.919,4209.297,6136.507,5619.633,4386.513,4103.806,4795.223 -->
| goose-json | array | encode | 4022 | 20000 | 4795.2 | 4103.8–6136.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12778.456,11945.615,18992.450,12218.212,13593.599,11822.791,12168.304 -->
| Goose DOM | array | decode | 4022 | 20000 | 12218.2 | 11822.8–18992.5 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 7446.315,8360.887,7631.424,7706.430,7447.713,8875.796,7541.013 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7631.4 | 7446.3–8875.8 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 4966.299,5919.106,4987.773,6612.768,5116.651,6605.688,4935.505 -->
| goose-json | array-signed | encode | 4537 | 20000 | 5116.7 | 4935.5–6612.8 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 13458.550,13466.782,12609.883,14382.684,14357.250,12533.232,12800.064 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 13458.6 | 12533.2–14382.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 22418.977,22562.459,23126.492,22082.317,24412.373,22258.179,23676.009 -->
| goose-json | array-wide | decode | 19771 | 20000 | 22562.5 | 22082.3–24412.4 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 21625.134,19619.904,22987.188,19435.084,23192.815,21741.965,20291.730 -->
| goose-json | array-wide | encode | 19770 | 20000 | 21625.1 | 19435.1–23192.8 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 34868.346,36768.516,36019.381,37829.807,38594.283,36219.372,35708.556 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 36219.4 | 34868.3–38594.3 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1752.738,1747.178,1647.575,1627.218,1653.047,2202.089,1695.963 -->
| goose-json | mixed | decode | 1187 | 20000 | 1696.0 | 1627.2–2202.1 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2230.002,1849.611,1837.778,1844.332,1893.836,2315.296,1838.851 -->
| goose-json | mixed | encode | 1186 | 20000 | 1849.6 | 1837.8–2315.3 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2512.099,1957.640,1965.764,1962.230,2105.191,2124.061,2088.410 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2088.4 | 1957.6–2512.1 | 83331000 |
<!-- samples | goose-json | floats | decode | 3332.512,3311.072,3292.818,3307.122,3286.940,3331.032,3397.671 -->
| goose-json | floats | decode | 1581 | 2000 | 3311.1 | 3286.9–3397.7 | 3825000 |
<!-- samples | goose-json | floats | encode | 7551.910,7558.948,7552.785,7550.009,7464.217,7548.422,7599.861 -->
| goose-json | floats | encode | 1581 | 2000 | 7551.9 | 7464.2–7599.9 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3223.336,3270.832,3228.562,3223.220,3241.877,3218.267,3285.513 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3228.6 | 3218.3–3285.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5911.538,6634.816,6005.393,5963.904,5908.617,5787.289,5802.360 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5911.5 | 5787.3–6634.8 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 9103.874,8653.774,8189.543,8168.611,7876.344,7848.029,7875.615 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8168.6 | 7848.0–9103.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 13076.621,11142.509,11005.397,11025.454,10633.048,10679.615,11157.601 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 11025.5 | 10633.0–13076.6 | 3870000 |
<!-- samples | goose-json | text-short | decode | 86.339,86.251,84.069,93.703,87.794,95.161,101.568 -->
| goose-json | text-short | decode | 97 | 200000 | 87.8 | 84.1–101.6 | 149907000 |
<!-- samples | goose-json | text-short | encode | 35.501,35.582,34.188,38.989,36.433,42.469,40.033 -->
| goose-json | text-short | encode | 97 | 200000 | 36.4 | 34.2–42.5 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 93.839,90.369,98.660,100.066,95.949,115.448,97.648 -->
| Goose DOM | text-short | decode | 97 | 200000 | 97.6 | 90.4–115.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1375.725,1345.591,1329.350,1277.777,1277.167,1277.900,1275.842 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1277.9 | 1275.8–1375.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1326.135,1277.865,1272.196,1230.232,1229.016,1225.328,1224.169 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1230.2 | 1224.2–1326.1 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 10734.330,10492.242,10369.029,10057.076,10090.836,10058.153,10095.261 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10095.3 | 10057.1–10734.3 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 859.122,862.550,862.288,862.827,863.133,859.135,888.278 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 862.5 | 859.1–888.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 542.337,543.231,543.645,543.669,543.960,543.309,562.100 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 543.6 | 542.3–562.1 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4891.740,4884.227,4894.268,4893.748,4896.240,4882.706,5064.176 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4893.7 | 4882.7–5064.2 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 10364.029,9654.485,9659.597,9924.844,10031.534,9922.792,10849.421 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9924.8 | 9654.5–10849.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7675.259,7373.060,7379.967,8320.704,7627.199,7444.220,7970.272 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7627.2 | 7373.1–8320.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 11552.761,11430.420,11284.152,12791.526,11489.945,11786.748,11907.674 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11552.8 | 11284.2–12791.5 | 99900000 |
<!-- samples | goose-json | wide | decode | 327.866,320.433,343.946,339.979,329.410,327.336,327.606 -->
| goose-json | wide | decode | 135 | 40000 | 327.9 | 320.4–343.9 | 33720000 |
<!-- samples | goose-json | wide | encode | 130.323,135.642,128.397,140.263,146.733,145.953,145.233 -->
| goose-json | wide | encode | 135 | 40000 | 140.3 | 128.4–146.7 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 242.751,267.024,250.785,257.713,248.351,246.621,246.920 -->
| Goose DOM | wide | decode | 135 | 40000 | 248.4 | 242.8–267.0 | 4777000 |
