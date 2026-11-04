| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 111.628,107.763,111.380,114.176,111.017,119.284,107.064 -->
| goose-json | plain | decode | 38 | 100000 | 111.4 | 107.1–119.3 | 33648000 |
<!-- samples | goose-json | plain | encode | 45.082,42.976,43.102,42.170,43.084,42.845,42.651 -->
| goose-json | plain | encode | 38 | 100000 | 43.0 | 42.2–45.1 | 83806357 |
<!-- samples | Goose DOM | plain | decode | 119.531,122.639,120.466,121.137,120.636,116.880,118.938 -->
| Goose DOM | plain | decode | 38 | 100000 | 120.5 | 116.9–122.6 | 2804000 |
<!-- samples | goose-json | escaped | decode | 215.551,215.767,214.534,216.571,210.186,218.054,210.573 -->
| goose-json | escaped | decode | 62 | 100000 | 215.6 | 210.2–218.1 | 42761000 |
<!-- samples | goose-json | escaped | encode | 103.106,100.896,100.441,96.887,99.046,98.482,99.751 -->
| goose-json | escaped | encode | 54 | 100000 | 99.8 | 96.9–103.1 | 107718681 |
<!-- samples | Goose DOM | escaped | decode | 170.897,170.306,172.950,166.766,167.691,170.520,166.336 -->
| Goose DOM | escaped | decode | 62 | 100000 | 170.3 | 166.3–172.9 | 15422000 |
<!-- samples | goose-json | array | decode | 9101.461,9028.328,9498.084,8955.850,9634.651,10096.250,10382.837 -->
| goose-json | array | decode | 4022 | 10000 | 9498.1 | 8955.9–10382.8 | 145337000 |
<!-- samples | goose-json | array | encode | 5281.327,5471.845,5588.930,5418.758,5623.703,5846.633,6199.797 -->
| goose-json | array | encode | 4022 | 10000 | 5588.9 | 5281.3–6199.8 | 289142183 |
<!-- samples | Goose DOM | array | decode | 23440.550,23703.530,24296.416,23833.998,25994.548,25055.066,24931.363 -->
| Goose DOM | array | decode | 4022 | 10000 | 24296.4 | 23440.5–25994.5 | 72846000 |
<!-- samples | goose-json | floats | decode | 4589.398,4674.582,5042.758,5151.979,5093.718,5233.258,5578.559 -->
| goose-json | floats | decode | 1581 | 1000 | 5093.7 | 4589.4–5578.6 | 2040000 |
<!-- samples | goose-json | floats | encode | 10190.542,10577.366,11160.177,11026.193,10507.283,10870.643,11011.382 -->
| goose-json | floats | encode | 1581 | 1000 | 10870.6 | 10190.5–11160.2 | 13042088 |
<!-- samples | Goose DOM | floats | decode | 6305.419,6542.881,6978.353,6897.252,6986.639,7235.805,6952.680 -->
| Goose DOM | floats | decode | 1581 | 1000 | 6952.7 | 6305.4–7235.8 | 2064000 |
<!-- samples | goose-json | floats-wide | decode | 8875.387,8515.284,8891.116,8892.255,8855.978,8782.834,9241.651 -->
| goose-json | floats-wide | decode | 5975 | 1000 | 8875.4 | 8515.3–9241.7 | 2136000 |
<!-- samples | goose-json | floats-wide | encode | 11433.937,11455.388,11395.822,11195.046,11388.017,11471.677,11526.507 -->
| goose-json | floats-wide | encode | 5862 | 1000 | 11433.9 | 11195.0–11526.5 | 47325760 |
<!-- samples | Goose DOM | floats-wide | decode | 18245.920,18131.770,18210.675,18281.166,18089.608,18270.450,19075.159 -->
| Goose DOM | floats-wide | decode | 5975 | 1000 | 18245.9 | 18089.6–19075.2 | 2064000 |
<!-- samples | goose-json | text-short | decode | 132.862,117.046,123.700,117.084,141.137,137.414,148.267 -->
| goose-json | text-short | decode | 97 | 100000 | 132.9 | 117.0–148.3 | 75007000 |
<!-- samples | goose-json | text-short | encode | 46.036,45.383,44.178,47.508,52.455,53.722,55.540 -->
| goose-json | text-short | encode | 97 | 100000 | 47.5 | 44.2–55.5 | 133196708 |
<!-- samples | Goose DOM | text-short | decode | 205.541,199.091,200.823,203.985,230.663,231.194,234.382 -->
| Goose DOM | text-short | decode | 97 | 100000 | 205.5 | 199.1–234.4 | 2804000 |
<!-- samples | goose-json | text-sparse | decode | 1245.597,1352.358,1272.575,1404.830,1258.750,1349.295,1351.596 -->
| goose-json | text-sparse | decode | 8233 | 1000 | 1349.3 | 1245.6–1404.8 | 65928000 |
<!-- samples | goose-json | text-sparse | encode | 1008.748,997.815,967.406,1049.051,1071.595,938.469,1078.871 -->
| goose-json | text-sparse | encode | 8233 | 1000 | 1008.7 | 938.5–1078.9 | 66662496 |
<!-- samples | Goose DOM | text-sparse | decode | 16858.907,16554.957,16245.207,16797.330,16767.471,16320.994,16549.380 -->
| Goose DOM | text-sparse | decode | 8233 | 1000 | 16555.0 | 16245.2–16858.9 | 65616000 |
<!-- samples | goose-json | text-ascii | decode | 945.685,962.464,987.933,910.340,862.604,919.714,912.948 -->
| goose-json | text-ascii | decode | 8225 | 1000 | 919.7 | 862.6–987.9 | 65880000 |
<!-- samples | goose-json | text-ascii | encode | 486.355,535.107,531.366,498.557,487.378,544.013,550.258 -->
| goose-json | text-ascii | encode | 8225 | 1000 | 531.4 | 486.4–550.3 | 66598496 |
<!-- samples | Goose DOM | text-ascii | decode | 7545.968,7620.769,7472.974,7416.711,7422.901,7467.427,7424.977 -->
| Goose DOM | text-ascii | decode | 8225 | 1000 | 7467.4 | 7416.7–7620.8 | 32000 |
<!-- samples | goose-json | text-escaped | decode | 13620.309,13363.065,13367.618,12874.529,12628.485,11895.449,12116.889 -->
| goose-json | text-escaped | decode | 8737 | 1000 | 12874.5 | 11895.4–13620.3 | 53592000 |
<!-- samples | goose-json | text-escaped | encode | 10372.138,10495.289,10459.956,9531.423,9605.813,9446.732,9314.472 -->
| goose-json | text-escaped | encode | 8737 | 1000 | 9605.8 | 9314.5–10495.3 | 70853440 |
<!-- samples | Goose DOM | text-escaped | decode | 15356.633,15362.272,15182.031,13983.319,13993.864,13950.671,14417.363 -->
| Goose DOM | text-escaped | decode | 8737 | 1000 | 14417.4 | 13950.7–15362.3 | 53280000 |
<!-- samples | goose-json | wide | decode | 704.233,758.884,744.457,766.696,788.830,842.929,807.187 -->
| goose-json | wide | decode | 135 | 20000 | 766.7 | 704.2–842.9 | 16920000 |
<!-- samples | goose-json | wide | encode | 179.143,180.069,164.891,178.754,177.291,188.959,190.744 -->
| goose-json | wide | encode | 135 | 20000 | 179.1 | 164.9–190.7 | 26639006 |
<!-- samples | Goose DOM | wide | decode | 423.278,432.419,420.797,433.572,437.301,452.992,442.413 -->
| Goose DOM | wide | decode | 135 | 20000 | 433.6 | 420.8–453.0 | 2397000 |
