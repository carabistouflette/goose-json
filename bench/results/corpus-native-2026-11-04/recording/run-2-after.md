| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 88.969,78.367,75.065,71.754,72.524,72.642,74.383 -->
| goose-json | plain | decode | 38 | 200000 | 74.4 | 71.8–89.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 39.858,35.776,36.520,33.295,33.117,34.017,35.278 -->
| goose-json | plain | encode | 38 | 200000 | 35.3 | 33.1–39.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 59.860,56.353,54.172,53.229,53.238,53.222,55.541 -->
| Goose DOM | plain | decode | 38 | 200000 | 54.2 | 53.2–59.9 | 5604000 |
<!-- samples | goose-json | escaped | decode | 151.242,151.244,136.765,165.997,172.170,200.696,168.923 -->
| goose-json | escaped | decode | 62 | 200000 | 166.0 | 136.8–200.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 79.204,71.716,67.920,92.028,94.468,100.444,74.521 -->
| goose-json | escaped | encode | 54 | 200000 | 79.2 | 67.9–100.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 106.178,93.711,92.964,126.306,147.383,134.523,98.523 -->
| Goose DOM | escaped | decode | 62 | 200000 | 106.2 | 93.0–147.4 | 30822000 |
<!-- samples | goose-json | array | decode | 7753.832,7971.919,7878.016,7476.494,7442.060,7791.129,7443.574 -->
| goose-json | array | decode | 4022 | 20000 | 7753.8 | 7442.1–7971.9 | 288627000 |
<!-- samples | goose-json | array | encode | 4266.146,4542.465,4180.779,3863.069,3965.299,3954.087,3867.841 -->
| goose-json | array | encode | 4022 | 20000 | 3965.3 | 3863.1–4542.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12607.429,14105.363,12199.523,11402.444,11144.463,11204.221,11295.226 -->
| Goose DOM | array | decode | 4022 | 20000 | 11402.4 | 11144.5–14105.4 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 7286.070,9846.158,7369.557,7339.501,7895.892,8375.509,7027.420 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7369.6 | 7027.4–9846.2 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 4890.420,5300.674,5836.973,4749.267,4877.982,5866.706,4786.942 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4890.4 | 4749.3–5866.7 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 18338.718,14125.587,15728.098,13643.165,15284.557,13312.460,12104.096 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 14125.6 | 12104.1–18338.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 22551.749,22260.688,26511.098,24233.962,22801.961,21571.070,21860.927 -->
| goose-json | array-wide | decode | 19771 | 20000 | 22551.7 | 21571.1–26511.1 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 22649.168,18766.429,18744.251,21898.953,19463.453,18354.612,18848.072 -->
| goose-json | array-wide | encode | 19770 | 20000 | 18848.1 | 18354.6–22649.2 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 34949.055,34433.770,35811.275,40729.203,35151.352,34263.794,34366.161 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 34949.1 | 34263.8–40729.2 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1739.654,1669.562,1572.527,2419.849,1682.074,1646.449,1593.193 -->
| goose-json | mixed | decode | 1187 | 20000 | 1669.6 | 1572.5–2419.8 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1876.651,1864.480,1814.458,2316.482,1845.849,1784.450,1765.177 -->
| goose-json | mixed | encode | 1186 | 20000 | 1845.8 | 1765.2–2316.5 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1987.926,1903.964,2431.101,2021.234,1946.538,1877.168,1929.685 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1946.5 | 1877.2–2431.1 | 83331000 |
<!-- samples | goose-json | floats | decode | 3172.693,3178.497,3186.198,3314.910,3334.672,3429.304,3310.115 -->
| goose-json | floats | decode | 1581 | 2000 | 3310.1 | 3172.7–3429.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 7263.922,7263.045,7267.336,7762.607,7941.395,7535.815,7378.961 -->
| goose-json | floats | encode | 1581 | 2000 | 7379.0 | 7263.0–7941.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3093.490,3096.168,3170.008,3309.518,3339.387,3210.632,3087.923 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3170.0 | 3087.9–3339.4 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5462.485,5590.860,5568.168,5942.015,6101.462,7857.770,9315.727 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5942.0 | 5462.5–9315.7 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 7617.744,7898.792,8147.531,8057.685,8222.193,12011.327,12695.039 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8147.5 | 7617.7–12695.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10123.869,10179.018,10697.830,10617.540,12723.492,17180.121,17178.863 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10697.8 | 10123.9–17180.1 | 3870000 |
<!-- samples | goose-json | text-short | decode | 124.859,108.873,116.628,105.877,105.018,139.358,151.813 -->
| goose-json | text-short | decode | 97 | 200000 | 116.6 | 105.0–151.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 50.010,46.713,50.095,45.878,42.464,50.768,52.476 -->
| goose-json | text-short | encode | 97 | 200000 | 50.0 | 42.5–52.5 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 127.043,115.652,119.242,119.112,106.981,134.551,143.003 -->
| Goose DOM | text-short | decode | 97 | 200000 | 119.2 | 107.0–143.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2355.950,2536.284,2463.151,1950.866,1649.487,1917.336,1910.740 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1950.9 | 1649.5–2536.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 2242.149,2412.024,2267.767,1853.268,1586.859,1865.628,1845.831 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1865.6 | 1586.9–2412.0 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 19495.117,20453.483,16277.552,14574.470,14424.220,15288.603,13414.234 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15288.6 | 13414.2–20453.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1085.909,1022.899,1126.072,1121.299,1115.771,1115.986,1076.619 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1115.8 | 1022.9–1126.1 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 672.227,655.689,651.434,708.433,711.288,702.432,669.990 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 672.2 | 651.4–711.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5968.653,5639.204,6144.645,6273.843,6360.421,6177.105,5939.100 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6144.6 | 5639.2–6360.4 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12149.193,10770.539,11154.283,12052.088,10367.489,11060.282,10031.131 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 11060.3 | 10031.1–12149.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 8967.490,9161.738,8826.504,8929.888,8570.712,8125.570,7561.058 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 8826.5 | 7561.1–9161.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 12420.099,13319.395,14512.879,12556.582,13961.683,12275.927,12198.698 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 12556.6 | 12198.7–14512.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 356.361,357.822,346.633,320.296,327.006,394.223,333.253 -->
| goose-json | wide | decode | 135 | 40000 | 346.6 | 320.3–394.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 144.399,124.851,124.150,121.859,119.770,155.982,146.311 -->
| goose-json | wide | encode | 135 | 40000 | 124.9 | 119.8–156.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 278.755,258.081,255.442,243.956,259.130,269.312,258.568 -->
| Goose DOM | wide | decode | 135 | 40000 | 258.6 | 244.0–278.8 | 4777000 |
