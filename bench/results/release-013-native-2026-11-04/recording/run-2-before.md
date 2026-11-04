| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 120.446,112.984,109.392,118.001,112.312,109.607,115.651 -->
| goose-json | plain | decode | 38 | 200000 | 113.0 | 109.4–120.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 53.561,53.636,53.869,52.111,49.675,53.648,58.110 -->
| goose-json | plain | encode | 38 | 200000 | 53.6 | 49.7–58.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 84.139,82.103,89.302,84.157,79.672,88.634,89.344 -->
| Goose DOM | plain | decode | 38 | 200000 | 84.2 | 79.7–89.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 234.739,238.909,224.085,236.324,213.476,203.833,219.944 -->
| goose-json | escaped | decode | 62 | 200000 | 224.1 | 203.8–238.9 | 85461000 |
<!-- samples | goose-json | escaped | encode | 107.166,112.191,107.624,115.746,97.633,99.674,112.681 -->
| goose-json | escaped | encode | 54 | 200000 | 107.6 | 97.6–115.7 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 172.280,157.697,164.015,151.098,129.957,142.238,152.962 -->
| Goose DOM | escaped | decode | 62 | 200000 | 153.0 | 130.0–172.3 | 30822000 |
<!-- samples | goose-json | array | decode | 11270.837,11066.487,11991.911,11816.770,11631.238,11100.049,13711.202 -->
| goose-json | array | decode | 4022 | 20000 | 11631.2 | 11066.5–13711.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5511.751,6073.254,6270.853,5821.875,6227.139,5636.332,6726.450 -->
| goose-json | array | encode | 4022 | 20000 | 6073.3 | 5511.8–6726.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 18233.571,17365.610,17709.277,17909.683,17885.663,20063.348,19773.550 -->
| Goose DOM | array | decode | 4022 | 20000 | 17909.7 | 17365.6–20063.3 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11436.811,12042.397,9172.297,11753.865,9660.494,11345.699,8626.148 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11345.7 | 8626.1–12042.4 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 8761.686,6706.868,6446.200,7762.441,6564.643,7375.231,6186.027 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6706.9 | 6186.0–8761.7 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 24238.858,17905.862,20519.991,19259.224,20714.926,19832.238,18452.584 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19832.2 | 17905.9–24238.9 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32400.926,30769.759,35466.984,28253.993,25953.143,25363.884,30281.711 -->
| goose-json | array-wide | decode | 19771 | 20000 | 30281.7 | 25363.9–35467.0 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 28003.704,29816.245,29961.803,27435.262,25317.751,22604.312,27807.483 -->
| goose-json | array-wide | encode | 19770 | 20000 | 27807.5 | 22604.3–29961.8 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 52155.623,58291.342,50907.820,44183.976,46818.737,40705.150,45046.906 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 46818.7 | 40705.1–58291.3 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2295.737,1957.119,2556.337,1940.672,1740.713,2537.313,4024.640 -->
| goose-json | mixed | decode | 1187 | 20000 | 2295.7 | 1740.7–4024.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2245.629,2115.120,2859.914,2183.131,1926.394,2980.020,3108.084 -->
| goose-json | mixed | encode | 1186 | 20000 | 2245.6 | 1926.4–3108.1 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2246.670,2380.963,2243.279,2172.248,2255.910,3340.567,3146.957 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2255.9 | 2172.2–3340.6 | 83331000 |
<!-- samples | goose-json | floats | decode | 6623.480,10474.418,6649.895,6041.104,5330.968,5325.803,5148.007 -->
| goose-json | floats | decode | 1581 | 2000 | 6041.1 | 5148.0–10474.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 14710.626,14708.209,14248.201,12342.549,12091.241,12065.016,11726.363 -->
| goose-json | floats | encode | 1581 | 2000 | 12342.5 | 11726.4–14710.6 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6694.832,6496.831,5993.083,5341.177,5248.524,4919.360,4891.355 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5341.2 | 4891.4–6694.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8307.258,9193.392,8314.858,6914.881,5786.965,5699.052,5549.708 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 6914.9 | 5549.7–9193.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11453.333,12787.086,10010.317,8908.005,7899.840,7904.030,7823.046 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8908.0 | 7823.0–12787.1 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16212.372,16946.138,13254.925,11154.445,10850.429,10586.920,10947.883 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 11154.4 | 10586.9–16946.1 | 3870000 |
<!-- samples | goose-json | text-short | decode | 84.749,88.718,88.459,88.161,82.096,85.274,86.180 -->
| goose-json | text-short | decode | 97 | 200000 | 86.2 | 82.1–88.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 36.624,35.276,36.039,35.234,33.462,34.827,33.867 -->
| goose-json | text-short | encode | 97 | 200000 | 35.2 | 33.5–36.6 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 103.035,95.059,98.486,91.905,90.412,92.227,88.680 -->
| Goose DOM | text-short | decode | 97 | 200000 | 92.2 | 88.7–103.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1275.645,1231.094,1239.685,1233.110,1442.246,1327.032,1280.976 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1275.6 | 1231.1–1442.2 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1220.168,1182.021,1179.649,1185.512,1359.332,1270.037,1220.813 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1220.2 | 1179.6–1359.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 9854.478,9698.127,9689.676,11193.123,10647.581,10112.029,10058.798 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10058.8 | 9689.7–11193.1 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 866.003,860.327,848.900,934.841,1058.973,1180.484,1181.787 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 934.8 | 848.9–1181.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 542.766,541.420,544.740,611.650,670.198,752.195,740.933 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 611.7 | 541.4–752.2 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4894.141,4837.899,5186.886,5663.714,6362.002,6666.828,6279.557 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 5663.7 | 4837.9–6666.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12223.824,11153.803,11228.087,14766.374,15573.858,15588.565,19525.873 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14766.4 | 11153.8–19525.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 8832.565,7985.256,9146.610,11364.496,12003.868,11479.881,14692.165 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11364.5 | 7985.3–14692.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13472.629,12514.030,16293.838,17796.527,18791.883,17544.865,18458.985 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17544.9 | 12514.0–18791.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 509.842,531.835,524.046,524.802,521.024,557.380,526.605 -->
| goose-json | wide | decode | 135 | 40000 | 524.8 | 509.8–557.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 184.542,220.026,217.546,214.195,217.718,184.861,183.812 -->
| goose-json | wide | encode | 135 | 40000 | 214.2 | 183.8–220.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 493.288,410.785,382.623,386.185,383.287,384.144,379.697 -->
| Goose DOM | wide | decode | 135 | 40000 | 384.1 | 379.7–493.3 | 4777000 |
