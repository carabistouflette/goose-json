| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 117.777,120.888,122.651,118.936,116.762,114.386,115.222 -->
| goose-json | plain | decode | 38 | 200000 | 117.8 | 114.4–122.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 44.591,42.231,44.398,41.599,42.016,39.971,44.268 -->
| goose-json | plain | encode | 38 | 200000 | 42.2 | 40.0–44.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 125.662,122.804,124.047,124.751,125.575,123.904,121.472 -->
| Goose DOM | plain | decode | 38 | 200000 | 124.0 | 121.5–125.7 | 5604000 |
<!-- samples | goose-json | escaped | decode | 246.023,246.810,237.401,249.081,244.175,242.368,241.335 -->
| goose-json | escaped | decode | 62 | 200000 | 244.2 | 237.4–249.1 | 85461000 |
<!-- samples | goose-json | escaped | encode | 99.652,105.296,108.372,104.752,104.563,103.651,102.254 -->
| goose-json | escaped | encode | 54 | 200000 | 104.6 | 99.7–108.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 174.408,174.610,172.889,166.338,174.292,173.785,170.649 -->
| Goose DOM | escaped | decode | 62 | 200000 | 173.8 | 166.3–174.6 | 30822000 |
<!-- samples | goose-json | array | decode | 10671.272,10740.242,10961.600,10744.885,10805.972,10900.655,10916.323 -->
| goose-json | array | decode | 4022 | 20000 | 10806.0 | 10671.3–10961.6 | 288627000 |
<!-- samples | goose-json | array | encode | 5749.881,6021.522,5860.686,5844.154,5754.636,5965.813,5930.990 -->
| goose-json | array | encode | 4022 | 20000 | 5860.7 | 5749.9–6021.5 | 574225548 |
<!-- samples | Goose DOM | array | decode | 25079.567,25200.205,25438.892,25716.872,24603.410,25643.092,25488.684 -->
| Goose DOM | array | decode | 4022 | 20000 | 25438.9 | 24603.4–25716.9 | 144666000 |
<!-- samples | goose-json | floats | decode | 6869.971,6573.677,6535.435,6510.130,6515.242,6406.159,6415.012 -->
| goose-json | floats | decode | 1581 | 2000 | 6515.2 | 6406.2–6870.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 30777.343,30664.044,30554.950,30499.369,30599.540,29866.680,30076.219 -->
| goose-json | floats | encode | 1581 | 2000 | 30555.0 | 29866.7–30777.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6697.090,6661.203,6822.582,6736.073,6544.145,6936.581,6663.124 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6697.1 | 6544.1–6936.6 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 6768.459,6826.158,6781.038,6871.953,7088.838,7068.316,6817.722 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 6826.2 | 6768.5–7088.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 5271.932,5348.481,5341.030,5441.868,5282.843,5678.229,5359.288 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 5348.5 | 5271.9–5678.2 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7213.735,7141.748,7212.251,7386.295,7343.736,7115.165,7323.346 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7213.7 | 7115.2–7386.3 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 39063.539,38566.624,37819.824,36878.350,37181.060,36626.500,38683.440 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 37819.8 | 36626.5–39063.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 34576.768,35090.781,34035.036,33622.562,33661.363,35745.329,35866.707 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 34576.8 | 33622.6–35866.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14681.591,14714.526,14885.543,14728.338,14736.183,15091.486,15650.873 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14736.2 | 14681.6–15650.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 843.170,845.625,847.580,831.286,849.912,841.197,824.566 -->
| goose-json | wide | decode | 135 | 40000 | 843.2 | 824.6–849.9 | 33720000 |
<!-- samples | goose-json | wide | encode | 198.971,197.123,195.496,202.251,173.207,183.088,188.960 -->
| goose-json | wide | encode | 135 | 40000 | 195.5 | 173.2–202.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 438.740,442.359,446.249,437.235,445.159,432.004,430.617 -->
| Goose DOM | wide | decode | 135 | 40000 | 438.7 | 430.6–446.2 | 4777000 |
