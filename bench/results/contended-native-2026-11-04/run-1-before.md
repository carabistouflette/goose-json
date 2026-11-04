| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 115.238,113.223,119.694,116.812,117.674,119.005,116.660 -->
| goose-json | plain | decode | 38 | 200000 | 116.8 | 113.2–119.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 44.152,45.320,45.103,45.231,44.895,45.030,46.058 -->
| goose-json | plain | encode | 38 | 200000 | 45.1 | 44.2–46.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 118.138,118.042,121.274,121.088,119.569,123.250,121.217 -->
| Goose DOM | plain | decode | 38 | 200000 | 121.1 | 118.0–123.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 216.558,220.770,219.280,220.036,222.066,222.791,247.922 -->
| goose-json | escaped | decode | 62 | 200000 | 220.8 | 216.6–247.9 | 85461000 |
<!-- samples | goose-json | escaped | encode | 107.054,107.217,107.333,108.331,107.950,107.138,111.894 -->
| goose-json | escaped | encode | 54 | 200000 | 107.3 | 107.1–111.9 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 163.264,162.275,166.679,166.043,168.021,166.800,177.746 -->
| Goose DOM | escaped | decode | 62 | 200000 | 166.7 | 162.3–177.7 | 30822000 |
<!-- samples | goose-json | array | decode | 9558.088,9899.876,9854.073,10096.752,9739.916,9632.986,9651.603 -->
| goose-json | array | decode | 4022 | 20000 | 9739.9 | 9558.1–10096.8 | 288627000 |
<!-- samples | goose-json | array | encode | 6614.520,6826.489,6690.791,6662.912,6882.690,6478.082,6508.540 -->
| goose-json | array | encode | 4022 | 20000 | 6662.9 | 6478.1–6882.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23802.333,24031.306,24384.371,24164.744,24127.242,23731.313,24206.294 -->
| Goose DOM | array | decode | 4022 | 20000 | 24127.2 | 23731.3–24384.4 | 144666000 |
<!-- samples | goose-json | floats | decode | 4960.266,4927.355,4928.316,5178.440,5073.032,5203.261,4916.452 -->
| goose-json | floats | decode | 1581 | 2000 | 4960.3 | 4916.5–5203.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 10380.537,10230.915,10345.876,10407.069,10909.788,10481.535,10265.114 -->
| goose-json | floats | encode | 1581 | 2000 | 10380.5 | 10230.9–10909.8 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6317.531,6336.716,6610.520,6588.608,6362.291,6334.651,6356.209 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6356.2 | 6317.5–6610.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8924.731,8772.194,8520.942,8708.447,8567.692,8817.095,8892.934 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8772.2 | 8520.9–8924.7 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 12224.654,11708.969,11743.281,12256.495,11730.070,12274.293,12039.103 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12039.1 | 11709.0–12274.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17246.021,17378.058,17234.930,17958.464,17359.042,17497.429,17622.935 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17378.1 | 17234.9–17958.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 112.332,115.012,111.842,121.706,109.490,112.130,116.470 -->
| goose-json | text-short | decode | 97 | 200000 | 112.3 | 109.5–121.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.019,44.739,44.843,44.941,43.727,44.214,42.966 -->
| goose-json | text-short | encode | 97 | 200000 | 44.2 | 43.0–44.9 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 179.656,180.035,175.169,176.503,177.019,176.123,177.444 -->
| Goose DOM | text-short | decode | 97 | 200000 | 177.0 | 175.2–180.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2309.656,2354.970,2394.881,2322.222,2415.619,2372.587,2483.035 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2372.6 | 2309.7–2483.0 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1984.563,1987.193,2124.993,1994.169,2048.245,2063.995,2085.816 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 2048.2 | 1984.6–2125.0 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15409.659,15330.572,15343.067,15664.424,15362.122,15957.766,15589.957 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15409.7 | 15330.6–15957.8 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1007.045,968.232,993.281,961.789,982.638,1002.308,1022.278 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 993.3 | 961.8–1022.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 682.556,678.091,690.754,646.857,640.557,640.921,658.852 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 658.9 | 640.6–690.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7302.757,7342.106,7335.109,7208.248,7179.380,7331.016,7139.078 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7302.8 | 7139.1–7342.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13306.024,13197.310,13488.712,12753.297,13450.794,13367.587,12832.418 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13306.0 | 12753.3–13488.7 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10617.928,10849.667,10769.935,10534.027,10783.052,10698.118,10650.068 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10698.1 | 10534.0–10849.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15325.955,15352.111,15463.636,15353.637,15116.295,15285.064,15198.093 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15326.0 | 15116.3–15463.6 | 99900000 |
<!-- samples | goose-json | wide | decode | 796.204,766.417,803.797,806.920,805.974,787.745,804.433 -->
| goose-json | wide | decode | 135 | 40000 | 803.8 | 766.4–806.9 | 33720000 |
<!-- samples | goose-json | wide | encode | 232.706,177.779,234.094,236.009,245.415,239.217,240.775 -->
| goose-json | wide | encode | 135 | 40000 | 236.0 | 177.8–245.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 444.088,458.145,449.900,445.718,449.308,442.511,452.921 -->
| Goose DOM | wide | decode | 135 | 40000 | 449.3 | 442.5–458.1 | 4777000 |
