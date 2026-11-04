| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 138.371,134.473,135.552,128.442,129.119,133.180,134.761 -->
| goose-json | plain | decode | 38 | 200000 | 134.5 | 128.4–138.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 43.318,42.306,40.620,42.542,42.898,43.337,41.941 -->
| goose-json | plain | encode | 38 | 200000 | 42.5 | 40.6–43.3 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 120.592,120.981,119.265,111.432,120.398,116.441,114.600 -->
| Goose DOM | plain | decode | 38 | 200000 | 119.3 | 111.4–121.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 232.548,228.344,235.386,233.531,231.399,213.624,243.269 -->
| goose-json | escaped | decode | 62 | 200000 | 232.5 | 213.6–243.3 | 85461000 |
<!-- samples | goose-json | escaped | encode | 93.720,97.188,99.789,98.903,97.249,88.429,101.987 -->
| goose-json | escaped | encode | 54 | 200000 | 97.2 | 88.4–102.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 153.667,160.132,155.173,156.281,153.359,159.230,155.284 -->
| Goose DOM | escaped | decode | 62 | 200000 | 155.3 | 153.4–160.1 | 30822000 |
<!-- samples | goose-json | array | decode | 8947.877,9385.324,9207.424,9274.057,9103.687,9573.009,9296.761 -->
| goose-json | array | decode | 4022 | 20000 | 9274.1 | 8947.9–9573.0 | 288627000 |
<!-- samples | goose-json | array | encode | 5509.840,5282.205,5391.651,5429.938,5319.572,5351.439,5542.818 -->
| goose-json | array | encode | 4022 | 20000 | 5391.7 | 5282.2–5542.8 | 574225548 |
<!-- samples | Goose DOM | array | decode | 39635.898,39659.162,40104.004,38330.827,38437.666,38294.866,39409.494 -->
| Goose DOM | array | decode | 4022 | 20000 | 39409.5 | 38294.9–40104.0 | 144666000 |
<!-- samples | goose-json | floats | decode | 4779.639,4447.688,4491.421,4463.847,4424.387,4440.129,4374.508 -->
| goose-json | floats | decode | 1581 | 2000 | 4447.7 | 4374.5–4779.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 9875.263,9704.108,9452.357,9473.425,9269.790,9318.747,9206.420 -->
| goose-json | floats | encode | 1581 | 2000 | 9452.4 | 9206.4–9875.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6292.704,6239.828,6254.883,6329.608,6277.663,6104.452,6479.690 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6277.7 | 6104.5–6479.7 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8251.921,8030.175,8014.206,8383.817,8150.690,8498.885,8457.734 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8251.9 | 8014.2–8498.9 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 10671.574,10550.636,10214.842,10344.014,10029.065,10872.459,10903.937 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 10550.6 | 10029.1–10903.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16941.375,16780.985,16758.709,16635.258,17614.186,18519.643,17095.614 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16941.4 | 16635.3–18519.6 | 3870000 |
<!-- samples | goose-json | text-short | decode | 104.772,116.077,112.851,107.864,101.890,106.865,108.766 -->
| goose-json | text-short | decode | 97 | 200000 | 107.9 | 101.9–116.1 | 149907000 |
<!-- samples | goose-json | text-short | encode | 39.894,42.587,39.777,38.775,42.474,41.291,40.127 -->
| goose-json | text-short | encode | 97 | 200000 | 40.1 | 38.8–42.6 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 155.607,177.518,171.833,159.173,176.006,171.751,167.695 -->
| Goose DOM | text-short | decode | 97 | 200000 | 171.8 | 155.6–177.5 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1102.829,1142.308,1029.931,1057.905,1061.188,1075.896,1109.816 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1075.9 | 1029.9–1142.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 935.410,950.873,878.910,974.668,989.430,953.016,929.308 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 950.9 | 878.9–989.4 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 14462.090,14278.888,14498.682,14677.544,14377.413,14492.439,14437.556 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 14462.1 | 14278.9–14677.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 771.237,846.231,814.359,758.549,792.696,755.842,790.901 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 790.9 | 755.8–846.2 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 465.175,488.041,488.563,471.954,477.856,451.637,459.440 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 472.0 | 451.6–488.6 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7057.364,7079.851,6651.171,6771.223,6862.485,6709.131,6748.671 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6771.2 | 6651.2–7079.9 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12161.416,12151.424,12697.326,12505.301,12631.708,12334.979,11767.178 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12335.0 | 11767.2–12697.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9250.593,9312.648,9494.004,9356.496,9480.013,9430.264,9056.176 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9356.5 | 9056.2–9494.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14415.559,14425.034,14092.712,14385.416,14062.029,13821.660,13982.899 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14092.7 | 13821.7–14425.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 776.125,784.194,778.553,762.949,765.152,752.120,749.702 -->
| goose-json | wide | decode | 135 | 40000 | 765.2 | 749.7–784.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 186.772,178.613,179.590,183.344,182.861,172.397,163.969 -->
| goose-json | wide | encode | 135 | 40000 | 179.6 | 164.0–186.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 410.063,411.603,405.033,391.146,396.028,387.930,403.472 -->
| Goose DOM | wide | decode | 135 | 40000 | 403.5 | 387.9–411.6 | 4777000 |
