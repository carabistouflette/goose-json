| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 81.697,96.816,92.994,92.660,91.909,95.885,96.327 -->
| goose-json | plain | decode | 38 | 200000 | 93.0 | 81.7–96.8 | 67248000 |
<!-- samples | goose-json | plain | encode | 32.720,31.048,32.146,30.234,31.952,32.342,31.920 -->
| goose-json | plain | encode | 38 | 200000 | 32.0 | 30.2–32.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 56.693,53.294,53.332,53.219,55.661,55.885,55.352 -->
| Goose DOM | plain | decode | 38 | 200000 | 55.4 | 53.2–56.7 | 5604000 |
<!-- samples | goose-json | escaped | decode | 136.270,140.932,143.499,136.113,133.176,135.068,134.820 -->
| goose-json | escaped | decode | 62 | 200000 | 136.1 | 133.2–143.5 | 85461000 |
<!-- samples | goose-json | escaped | encode | 68.090,74.185,68.225,69.479,67.523,66.939,67.201 -->
| goose-json | escaped | encode | 54 | 200000 | 68.1 | 66.9–74.2 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 96.622,103.440,95.734,98.277,100.263,97.275,96.327 -->
| Goose DOM | escaped | decode | 62 | 200000 | 97.3 | 95.7–103.4 | 30822000 |
<!-- samples | goose-json | array | decode | 9211.880,9086.268,9172.756,9008.550,8918.225,9031.223,9440.267 -->
| goose-json | array | decode | 4022 | 20000 | 9086.3 | 8918.2–9440.3 | 288627000 |
<!-- samples | goose-json | array | encode | 4346.559,4232.197,4289.182,4170.356,4201.049,5269.481,4123.853 -->
| goose-json | array | encode | 4022 | 20000 | 4232.2 | 4123.9–5269.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12589.563,12402.549,13075.001,12832.958,12267.839,14188.618,11039.544 -->
| Goose DOM | array | decode | 4022 | 20000 | 12589.6 | 11039.5–14188.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 3490.743,3500.762,3371.171,3438.765,3305.008,3654.930,3972.447 -->
| goose-json | floats | decode | 1581 | 2000 | 3490.7 | 3305.0–3972.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 7267.776,7275.204,7281.175,7562.306,7756.066,8108.467,8537.481 -->
| goose-json | floats | encode | 1581 | 2000 | 7562.3 | 7267.8–8537.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3108.961,3086.869,3156.331,3190.293,3461.001,3852.546,3462.357 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3190.3 | 3086.9–3852.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5681.650,5814.298,6786.592,5931.181,5787.892,5699.045,5712.384 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5787.9 | 5681.6–6786.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8007.740,8232.201,8730.502,7910.565,8041.509,7895.529,7779.906 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8007.7 | 7779.9–8730.5 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 11073.028,13204.097,11167.267,10896.646,10601.433,10526.770,10288.289 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10896.6 | 10288.3–13204.1 | 3870000 |
<!-- samples | goose-json | text-short | decode | 68.775,67.504,67.822,68.759,67.311,77.829,71.978 -->
| goose-json | text-short | decode | 97 | 200000 | 68.8 | 67.3–77.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 30.671,29.843,29.855,29.881,31.872,33.731,32.409 -->
| goose-json | text-short | encode | 97 | 200000 | 30.7 | 29.8–33.7 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 90.146,89.635,89.509,89.631,103.935,100.544,95.377 -->
| Goose DOM | text-short | decode | 97 | 200000 | 90.1 | 89.5–103.9 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1370.430,1372.241,1373.302,1383.463,1488.324,1425.150,1373.343 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1373.3 | 1370.4–1488.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1217.592,1218.309,1220.213,1257.398,1319.841,1229.626,1214.305 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1220.2 | 1214.3–1319.8 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 11357.966,11361.419,11397.090,12547.695,11898.306,11363.654,11366.134 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11366.1 | 11358.0–12547.7 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 845.835,848.964,850.933,852.215,849.327,820.561,862.398 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 849.3 | 820.6–862.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 546.957,548.302,549.928,546.710,532.764,529.479,550.956 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 547.0 | 529.5–551.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6169.156,6150.774,6154.815,6137.848,6074.025,6127.734,6916.771 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6150.8 | 6074.0–6916.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 10584.159,10318.972,11161.984,9865.367,9703.010,9702.403,9701.599 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9865.4 | 9701.6–11162.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7447.526,7408.094,7892.833,7122.864,7108.448,6908.202,7103.467 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7122.9 | 6908.2–7892.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15886.258,16275.178,15225.766,14424.843,14679.060,14651.084,14081.319 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14679.1 | 14081.3–16275.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 296.563,277.819,282.760,284.318,270.086,270.161,286.655 -->
| goose-json | wide | decode | 135 | 40000 | 282.8 | 270.1–296.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 163.191,159.463,168.168,167.461,160.998,157.065,166.754 -->
| goose-json | wide | encode | 135 | 40000 | 163.2 | 157.1–168.2 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 247.730,239.335,247.536,237.780,239.972,238.882,242.658 -->
| Goose DOM | wide | decode | 135 | 40000 | 240.0 | 237.8–247.7 | 4777000 |
