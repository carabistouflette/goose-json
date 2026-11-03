| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 124.073,122.333,118.915,121.803,118.764,117.433,121.751 -->
| goose-json | plain | decode | 38 | 200000 | 121.8 | 117.4–124.1 | 67248000 |
<!-- samples | goose-json | plain | encode | 58.973,58.276,58.860,57.933,57.100,56.978,59.027 -->
| goose-json | plain | encode | 38 | 200000 | 58.3 | 57.0–59.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 122.037,122.314,122.129,118.510,123.369,122.354,120.794 -->
| Goose DOM | plain | decode | 38 | 200000 | 122.1 | 118.5–123.4 | 5604000 |
<!-- samples | goose-json | escaped | decode | 245.651,244.510,247.772,248.728,244.767,247.559,251.173 -->
| goose-json | escaped | decode | 62 | 200000 | 247.6 | 244.5–251.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 106.400,103.862,109.410,107.576,107.666,109.299,106.086 -->
| goose-json | escaped | encode | 54 | 200000 | 107.6 | 103.9–109.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 169.750,170.536,170.476,169.677,169.598,171.136,168.528 -->
| Goose DOM | escaped | decode | 62 | 200000 | 169.7 | 168.5–171.1 | 30822000 |
<!-- samples | goose-json | array | decode | 14388.137,10875.534,21663.677,24699.323,22052.293,24314.559,24518.003 -->
| goose-json | array | decode | 4022 | 20000 | 22052.3 | 10875.5–24699.3 | 288627000 |
<!-- samples | goose-json | array | encode | 5870.066,5863.420,11953.967,11979.154,12030.483,13404.441,11173.749 -->
| goose-json | array | encode | 4022 | 20000 | 11954.0 | 5863.4–13404.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24186.787,41947.018,49140.545,48090.803,50786.404,50121.626,47447.624 -->
| Goose DOM | array | decode | 4022 | 20000 | 48090.8 | 24186.8–50786.4 | 144666000 |
<!-- samples | goose-json | floats | decode | 14047.035,14131.023,13304.771,13970.612,13468.558,14116.612,14312.528 -->
| goose-json | floats | decode | 1581 | 2000 | 14047.0 | 13304.8–14312.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 63497.196,61367.092,61295.327,58949.291,61527.355,62234.770,64407.103 -->
| goose-json | floats | encode | 1581 | 2000 | 61527.4 | 58949.3–64407.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 13357.000,12552.978,13771.537,12433.674,12374.689,13835.671,14037.814 -->
| Goose DOM | floats | decode | 1581 | 2000 | 13357.0 | 12374.7–14037.8 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 14721.028,14625.996,14724.173,14101.074,15566.274,14391.649,13301.654 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 14626.0 | 13301.7–15566.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 11390.133,11176.585,11428.863,11167.934,11300.208,11023.803,11034.599 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 11176.6 | 11023.8–11428.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 14885.898,15242.197,15430.421,14795.776,14571.572,14241.802,14287.674 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 14795.8 | 14241.8–15430.4 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 75845.965,82460.769,77954.661,77340.601,76488.093,77061.772,73398.184 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 77061.8 | 73398.2–82460.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 69068.028,72824.280,68876.954,70964.136,69536.590,69216.198,69585.084 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 69536.6 | 68877.0–72824.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 30702.050,31588.768,30983.135,29368.874,30400.953,30100.610,30053.355 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 30401.0 | 29368.9–31588.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 1544.375,1521.319,1491.521,1543.243,1445.562,1551.756,1539.721 -->
| goose-json | wide | decode | 135 | 40000 | 1539.7 | 1445.6–1551.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 327.126,346.958,319.402,316.560,324.636,355.894,375.853 -->
| goose-json | wide | encode | 135 | 40000 | 327.1 | 316.6–375.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 840.649,837.559,903.293,920.999,887.935,890.639,861.185 -->
| Goose DOM | wide | decode | 135 | 40000 | 887.9 | 837.6–921.0 | 4777000 |
