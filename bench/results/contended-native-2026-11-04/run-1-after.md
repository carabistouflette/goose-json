| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 117.992,115.759,121.425,119.275,120.276,113.655,115.733 -->
| goose-json | plain | decode | 38 | 200000 | 118.0 | 113.7–121.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 45.550,45.918,46.416,45.539,44.796,45.232,43.409 -->
| goose-json | plain | encode | 38 | 200000 | 45.5 | 43.4–46.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 122.717,122.148,123.526,120.557,122.182,121.557,120.636 -->
| Goose DOM | plain | decode | 38 | 200000 | 122.1 | 120.6–123.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 216.580,222.519,223.785,223.322,222.458,219.568,222.212 -->
| goose-json | escaped | decode | 62 | 200000 | 222.5 | 216.6–223.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 101.346,102.344,106.924,106.687,107.906,109.154,106.057 -->
| goose-json | escaped | encode | 54 | 200000 | 106.7 | 101.3–109.2 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 161.861,167.317,170.883,167.512,169.406,168.677,166.769 -->
| Goose DOM | escaped | decode | 62 | 200000 | 167.5 | 161.9–170.9 | 30822000 |
<!-- samples | goose-json | array | decode | 9805.617,9722.608,9631.869,9640.574,9815.279,9688.061,9856.916 -->
| goose-json | array | decode | 4022 | 20000 | 9722.6 | 9631.9–9856.9 | 288627000 |
<!-- samples | goose-json | array | encode | 5914.978,5869.367,5773.163,5932.879,5890.900,5890.559,5917.121 -->
| goose-json | array | encode | 4022 | 20000 | 5890.9 | 5773.2–5932.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24437.032,24300.851,24227.309,24117.295,24413.929,24278.904,24517.678 -->
| Goose DOM | array | decode | 4022 | 20000 | 24300.9 | 24117.3–24517.7 | 144666000 |
<!-- samples | goose-json | floats | decode | 5006.316,5228.667,4989.491,5111.202,4952.945,5252.238,5118.744 -->
| goose-json | floats | decode | 1581 | 2000 | 5111.2 | 4952.9–5252.2 | 3825000 |
<!-- samples | goose-json | floats | encode | 11237.967,11042.478,11268.441,11149.337,11378.521,11181.334,11116.528 -->
| goose-json | floats | encode | 1581 | 2000 | 11181.3 | 11042.5–11378.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6627.350,6477.703,6668.862,6367.770,6663.646,6620.211,6594.649 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6620.2 | 6367.8–6668.9 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 9138.182,9031.975,8878.302,8753.766,8943.575,8672.609,8959.606 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8943.6 | 8672.6–9138.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11538.126,11505.007,11140.789,11504.301,11668.304,11460.890,11217.172 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11504.3 | 11140.8–11668.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 18351.481,17961.417,17940.383,18369.861,17865.772,17750.588,18258.745 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17961.4 | 17750.6–18369.9 | 3870000 |
<!-- samples | goose-json | text-short | decode | 115.593,117.627,118.408,115.279,125.363,118.275,114.694 -->
| goose-json | text-short | decode | 97 | 200000 | 117.6 | 114.7–125.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 45.979,45.159,45.676,43.610,45.993,46.056,45.440 -->
| goose-json | text-short | encode | 97 | 200000 | 45.7 | 43.6–46.1 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 180.528,180.402,177.284,176.587,181.946,180.891,180.462 -->
| Goose DOM | text-short | decode | 97 | 200000 | 180.5 | 176.6–181.9 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2376.925,2378.205,2468.964,2291.912,2307.549,2321.163,2384.079 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2376.9 | 2291.9–2469.0 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 2066.742,2003.826,2057.153,1929.212,1933.939,1977.377,1977.706 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1977.7 | 1929.2–2066.7 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15257.461,15798.680,16141.344,15670.561,15102.735,15638.671,15936.534 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15670.6 | 15102.7–16141.3 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 912.419,861.964,865.092,867.072,905.642,895.053,860.590 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 867.1 | 860.6–912.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 527.257,493.656,492.815,493.528,493.393,526.527,497.957 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 493.7 | 492.8–527.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7230.104,7040.997,7509.744,7445.855,7369.318,7239.384,7094.959 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7239.4 | 7041.0–7509.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12887.599,12759.364,13123.784,13251.879,13109.590,13200.928,13217.969 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13123.8 | 12759.4–13251.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9948.548,9979.492,9770.883,9736.888,9977.305,9999.477,10177.773 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9977.3 | 9736.9–10177.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14648.358,14571.844,14816.297,14858.825,15464.265,15137.132,15366.998 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14858.8 | 14571.8–15464.3 | 99900000 |
<!-- samples | goose-json | wide | decode | 823.601,828.799,836.101,813.875,818.587,797.626,819.782 -->
| goose-json | wide | decode | 135 | 40000 | 819.8 | 797.6–836.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 203.465,188.545,197.040,192.489,196.516,183.992,192.873 -->
| goose-json | wide | encode | 135 | 40000 | 192.9 | 184.0–203.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 448.375,446.073,439.024,458.362,446.389,460.158,440.458 -->
| Goose DOM | wide | decode | 135 | 40000 | 446.4 | 439.0–460.2 | 4777000 |
