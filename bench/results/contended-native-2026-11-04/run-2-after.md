| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 111.160,114.189,112.373,118.047,113.023,119.711,120.703 -->
| goose-json | plain | decode | 38 | 200000 | 114.2 | 111.2–120.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 44.443,45.382,43.063,45.667,45.670,44.013,45.516 -->
| goose-json | plain | encode | 38 | 200000 | 45.4 | 43.1–45.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 125.665,123.377,122.566,127.076,126.484,125.594,123.083 -->
| Goose DOM | plain | decode | 38 | 200000 | 125.6 | 122.6–127.1 | 5604000 |
<!-- samples | goose-json | escaped | decode | 227.537,224.351,217.414,218.134,217.023,221.611,223.037 -->
| goose-json | escaped | decode | 62 | 200000 | 221.6 | 217.0–227.5 | 85461000 |
<!-- samples | goose-json | escaped | encode | 107.475,108.134,106.746,104.380,105.695,105.265,105.611 -->
| goose-json | escaped | encode | 54 | 200000 | 105.7 | 104.4–108.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 172.750,169.536,170.265,169.284,176.531,170.970,173.507 -->
| Goose DOM | escaped | decode | 62 | 200000 | 171.0 | 169.3–176.5 | 30822000 |
<!-- samples | goose-json | array | decode | 9804.020,9566.042,9644.586,9779.512,9696.697,9809.749,14982.965 -->
| goose-json | array | decode | 4022 | 20000 | 9779.5 | 9566.0–14983.0 | 288627000 |
<!-- samples | goose-json | array | encode | 5859.689,5843.742,5968.004,5867.126,6278.357,6822.736,11580.439 -->
| goose-json | array | encode | 4022 | 20000 | 5968.0 | 5843.7–11580.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 25052.590,25150.533,24501.911,24421.805,24751.880,24582.249,50025.046 -->
| Goose DOM | array | decode | 4022 | 20000 | 24751.9 | 24421.8–50025.0 | 144666000 |
<!-- samples | goose-json | floats | decode | 10543.654,11273.683,11179.155,11666.634,9002.292,10855.693,11112.827 -->
| goose-json | floats | decode | 1581 | 2000 | 11112.8 | 9002.3–11666.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 22931.400,21513.006,20595.510,20476.528,23221.969,21668.623,21522.648 -->
| goose-json | floats | encode | 1581 | 2000 | 21522.6 | 20476.5–23222.0 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 14433.674,12455.573,14096.019,13791.420,12637.093,14496.958,14361.333 -->
| Goose DOM | floats | decode | 1581 | 2000 | 14096.0 | 12455.6–14497.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 18128.064,17431.121,17637.210,18026.396,17148.674,16994.948,17945.213 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 17637.2 | 16994.9–18128.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 21929.548,22547.111,21591.569,23660.419,24177.681,23849.522,22787.824 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 22787.8 | 21591.6–24177.7 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 38130.736,37798.209,38210.745,36891.018,37974.823,36341.617,37203.107 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 37798.2 | 36341.6–38210.7 | 3870000 |
<!-- samples | goose-json | text-short | decode | 257.749,253.521,241.890,241.714,240.638,220.365,225.607 -->
| goose-json | text-short | decode | 97 | 200000 | 241.7 | 220.4–257.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 107.209,89.573,82.071,93.472,102.580,103.205,99.953 -->
| goose-json | text-short | encode | 97 | 200000 | 100.0 | 82.1–107.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 389.024,402.630,402.066,387.677,385.214,363.250,349.990 -->
| Goose DOM | text-short | decode | 97 | 200000 | 387.7 | 350.0–402.6 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 5309.993,4291.954,4295.367,5434.568,6494.753,4806.944,5332.434 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 5310.0 | 4292.0–6494.8 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 3778.809,3062.264,4548.453,4556.568,2645.791,3479.794,3957.369 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 3778.8 | 2645.8–4556.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 30906.980,30978.938,30511.574,31379.207,32061.662,31009.327,31278.180 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 31009.3 | 30511.6–32061.7 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 844.490,855.128,1895.198,812.134,2255.191,2321.678,2346.695 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1895.2 | 812.1–2346.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 1035.618,1035.371,535.656,487.962,487.038,495.231,487.695 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 495.2 | 487.0–1035.6 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 15152.885,14369.199,15772.202,14216.974,13940.194,14283.175,14340.970 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 14341.0 | 13940.2–15772.2 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 26839.776,26050.835,27254.053,26320.810,25470.275,28151.809,30535.606 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 26839.8 | 25470.3–30535.6 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 19145.519,20354.212,19409.696,18907.893,21423.525,19795.760,20686.386 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 19795.8 | 18907.9–21423.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 29990.791,28365.803,29849.230,30072.567,28554.261,32338.028,29678.619 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 29849.2 | 28365.8–32338.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 1675.793,1557.625,1617.410,1670.301,1646.653,1706.136,1636.933 -->
| goose-json | wide | decode | 135 | 40000 | 1646.7 | 1557.6–1706.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 415.692,358.136,373.994,420.800,340.954,369.668,350.277 -->
| goose-json | wide | encode | 135 | 40000 | 369.7 | 341.0–420.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 852.645,843.874,793.223,808.925,804.295,867.093,864.680 -->
| Goose DOM | wide | decode | 135 | 40000 | 843.9 | 793.2–867.1 | 4777000 |
