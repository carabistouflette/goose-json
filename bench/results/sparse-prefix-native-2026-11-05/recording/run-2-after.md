| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 120.421,114.767,113.224,151.035,145.561,110.614,102.144 -->
| goose-json | plain | decode | 38 | 200000 | 114.8 | 102.1–151.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 55.458,52.156,52.110,55.227,52.843,49.489,46.890 -->
| goose-json | plain | encode | 38 | 200000 | 52.2 | 46.9–55.5 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 88.434,82.139,84.165,84.628,83.733,78.972,77.646 -->
| Goose DOM | plain | decode | 38 | 200000 | 83.7 | 77.6–88.4 | 5604000 |
<!-- samples | goose-json | escaped | decode | 206.598,173.772,154.746,156.573,200.596,232.118,242.473 -->
| goose-json | escaped | decode | 62 | 200000 | 200.6 | 154.7–242.5 | 85461000 |
<!-- samples | goose-json | escaped | encode | 97.071,74.539,70.733,70.539,111.423,112.133,115.960 -->
| goose-json | escaped | encode | 54 | 200000 | 97.1 | 70.5–116.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 127.794,96.586,95.359,93.559,148.993,147.296,150.892 -->
| Goose DOM | escaped | decode | 62 | 200000 | 127.8 | 93.6–150.9 | 30822000 |
<!-- samples | goose-json | array | decode | 12261.255,11939.314,12147.279,11594.851,12557.553,9267.013,11486.175 -->
| goose-json | array | decode | 4022 | 20000 | 11939.3 | 9267.0–12557.6 | 288627000 |
<!-- samples | goose-json | array | encode | 6808.282,5612.937,6418.468,6137.422,8133.610,5893.293,4797.040 -->
| goose-json | array | encode | 4022 | 20000 | 6137.4 | 4797.0–8133.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 22323.159,21522.214,22777.682,22648.603,22436.688,17656.373,19961.621 -->
| Goose DOM | array | decode | 4022 | 20000 | 22323.2 | 17656.4–22777.7 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11740.488,11853.250,7971.424,8764.443,8695.161,11255.363,11209.253 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11209.3 | 7971.4–11853.2 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6893.264,4493.638,4074.534,4233.172,5822.018,6108.397,5249.609 -->
| goose-json | array-signed | encode | 4537 | 20000 | 5249.6 | 4074.5–6893.3 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 23856.673,18556.729,15816.773,17111.028,22323.192,21095.596,16474.228 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 18556.7 | 15816.8–23856.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 34857.172,24471.982,26206.387,22251.321,30265.677,25224.487,24580.528 -->
| goose-json | array-wide | decode | 19771 | 20000 | 25224.5 | 22251.3–34857.2 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 11325.332,11329.262,11783.751,15763.443,11501.712,13655.219,14011.152 -->
| goose-json | array-wide | encode | 19770 | 20000 | 11783.8 | 11325.3–15763.4 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 40753.091,36586.598,35277.291,35101.842,39529.718,36607.754,40798.519 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 36607.8 | 35101.8–40798.5 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2065.776,1744.905,1731.212,2048.232,1755.597,1840.663,2057.041 -->
| goose-json | mixed | decode | 1187 | 20000 | 1840.7 | 1731.2–2065.8 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2093.087,2009.030,1759.655,2113.619,1804.253,1950.492,1903.103 -->
| goose-json | mixed | encode | 1186 | 20000 | 1950.5 | 1759.7–2113.6 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2100.801,2207.747,1958.468,2152.693,2117.930,2543.286,2126.427 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2126.4 | 1958.5–2543.3 | 83331000 |
<!-- samples | goose-json | floats | decode | 3518.385,3465.055,3455.726,3447.817,3473.649,3402.751,3309.646 -->
| goose-json | floats | decode | 1581 | 2000 | 3455.7 | 3309.6–3518.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 7999.163,7783.551,7954.175,7832.517,7728.963,7599.070,7540.623 -->
| goose-json | floats | encode | 1581 | 2000 | 7783.6 | 7540.6–7999.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3499.753,3482.848,3594.340,3533.165,3364.450,3365.331,3375.123 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3482.8 | 3364.4–3594.3 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 6220.243,6083.176,5844.953,5828.904,6430.267,6289.456,6727.834 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 6220.2 | 5828.9–6727.8 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8500.898,8117.780,7965.501,7860.555,8945.153,8159.906,8797.849 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8159.9 | 7860.6–8945.2 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 11422.479,10896.544,10674.387,11895.577,12230.479,11612.074,13108.228 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 11612.1 | 10674.4–13108.2 | 3870000 |
<!-- samples | goose-json | text-short | decode | 105.392,99.667,87.149,85.413,79.615,80.357,86.218 -->
| goose-json | text-short | decode | 97 | 200000 | 86.2 | 79.6–105.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 48.039,41.742,36.896,35.294,34.349,35.198,34.019 -->
| goose-json | text-short | encode | 97 | 200000 | 35.3 | 34.0–48.0 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 119.376,102.500,100.724,92.031,88.751,88.932,89.616 -->
| Goose DOM | text-short | decode | 97 | 200000 | 92.0 | 88.8–119.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1360.298,1666.027,1709.113,1639.345,1445.016,1321.311,1320.734 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1445.0 | 1320.7–1709.1 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1183.401,1465.932,1473.583,1446.883,1264.602,1174.131,1179.423 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1264.6 | 1174.1–1473.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 11796.488,13569.924,13729.820,11786.689,10801.017,10486.183,10143.037 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11786.7 | 10143.0–13729.8 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 859.091,862.289,947.207,1069.407,1159.996,1226.892,1244.664 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1069.4 | 859.1–1244.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 541.375,549.093,594.399,669.525,738.695,777.681,777.741 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 669.5 | 541.4–777.7 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4881.810,5251.792,5611.725,6249.619,6670.324,7048.331,6695.900 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6249.6 | 4881.8–7048.3 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 10507.127,9900.588,10380.993,10114.047,9686.069,10434.995,10244.018 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 10244.0 | 9686.1–10507.1 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7433.572,7137.298,7685.305,7131.547,7365.388,8669.515,7334.709 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7365.4 | 7131.5–8669.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 11842.493,11209.416,11971.426,11283.270,12005.356,13203.743,11606.789 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11842.5 | 11209.4–13203.7 | 99900000 |
<!-- samples | goose-json | wide | decode | 309.272,323.065,315.312,315.209,314.041,318.488,320.745 -->
| goose-json | wide | decode | 135 | 40000 | 315.3 | 309.3–323.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 133.605,132.653,113.197,113.335,114.294,113.421,113.614 -->
| goose-json | wide | encode | 135 | 40000 | 113.6 | 113.2–133.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 260.399,247.183,242.243,238.576,243.894,240.911,244.981 -->
| Goose DOM | wide | decode | 135 | 40000 | 243.9 | 238.6–260.4 | 4777000 |
