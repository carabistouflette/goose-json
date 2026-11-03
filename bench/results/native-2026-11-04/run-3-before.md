| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 149.963,148.292,146.069,153.028,150.454,146.530,145.749 -->
| goose-json | plain | decode | 38 | 200000 | 148.3 | 145.7–153.0 | 67248000 |
<!-- samples | goose-json | plain | encode | 50.423,51.884,51.517,53.760,50.211,48.783,47.992 -->
| goose-json | plain | encode | 38 | 200000 | 50.4 | 48.0–53.8 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.794,118.907,121.051,125.439,121.566,114.647,115.915 -->
| Goose DOM | plain | decode | 38 | 200000 | 121.1 | 114.6–125.4 | 5604000 |
<!-- samples | goose-json | escaped | decode | 274.376,282.590,288.371,276.680,266.217,262.060,253.928 -->
| goose-json | escaped | decode | 62 | 200000 | 274.4 | 253.9–288.4 | 85461000 |
<!-- samples | goose-json | escaped | encode | 113.348,122.524,122.041,117.070,111.252,109.196,107.394 -->
| goose-json | escaped | encode | 54 | 200000 | 113.3 | 107.4–122.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 167.755,175.313,173.208,166.005,160.400,158.951,158.836 -->
| Goose DOM | escaped | decode | 62 | 200000 | 166.0 | 158.8–175.3 | 30822000 |
<!-- samples | goose-json | array | decode | 15248.818,15086.063,15036.633,15534.523,15936.855,15268.402,15982.234 -->
| goose-json | array | decode | 4022 | 20000 | 15268.4 | 15036.6–15982.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5834.389,5694.450,5621.820,6000.499,5970.925,5608.881,5930.425 -->
| goose-json | array | encode | 4022 | 20000 | 5834.4 | 5608.9–6000.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24022.481,24213.678,24158.887,25480.494,26163.495,24747.724,25126.042 -->
| Goose DOM | array | decode | 4022 | 20000 | 24747.7 | 24022.5–26163.5 | 144666000 |
<!-- samples | goose-json | floats | decode | 8216.162,8235.519,8050.821,8076.913,8198.342,8355.636,8236.694 -->
| goose-json | floats | decode | 1581 | 2000 | 8216.2 | 8050.8–8355.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 31289.507,31696.967,32020.072,31750.712,31132.630,32722.477,32633.551 -->
| goose-json | floats | encode | 1581 | 2000 | 31750.7 | 31132.6–32722.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6419.983,6601.033,6587.222,6651.713,6763.775,6795.618,6689.210 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6651.7 | 6420.0–6795.6 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 11997.081,11687.931,12029.504,11692.979,11846.638,11682.633,12153.185 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 11846.6 | 11682.6–12153.2 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 12023.727,12125.142,12259.673,12316.647,12340.129,12402.044,11835.541 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 12259.7 | 11835.5–12402.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7423.462,7306.256,7387.743,7530.354,7640.101,7553.769,7474.783 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7474.8 | 7306.3–7640.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 37850.390,39596.992,37252.935,37195.246,37122.999,37266.632,37410.656 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 37266.6 | 37123.0–39597.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 35999.411,34798.939,34426.332,33581.012,33787.086,34014.000,33868.910 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 34014.0 | 33581.0–35999.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15784.573,14914.031,14661.593,14398.993,14691.764,14566.472,14768.442 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14691.8 | 14399.0–15784.6 | 99900000 |
<!-- samples | goose-json | wide | decode | 827.759,815.829,813.994,811.357,823.623,812.389,821.377 -->
| goose-json | wide | decode | 135 | 40000 | 815.8 | 811.4–827.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 193.583,188.966,177.622,181.964,186.316,190.223,179.062 -->
| goose-json | wide | encode | 135 | 40000 | 186.3 | 177.6–193.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 410.965,407.466,408.457,412.452,406.240,408.329,408.478 -->
| Goose DOM | wide | decode | 135 | 40000 | 408.5 | 406.2–412.5 | 4777000 |
