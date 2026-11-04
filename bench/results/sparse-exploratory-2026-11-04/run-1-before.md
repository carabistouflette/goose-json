| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 253.390,211.008,245.412,253.421,203.047,245.028,224.604 -->
| goose-json | plain | decode | 38 | 100000 | 245.0 | 203.0–253.4 | 33648000 |
<!-- samples | goose-json | plain | encode | 117.609,111.742,106.206,68.179,111.574,110.020,98.839 -->
| goose-json | plain | encode | 38 | 100000 | 110.0 | 68.2–117.6 | 83806357 |
<!-- samples | Goose DOM | plain | decode | 266.330,223.297,246.409,280.912,263.807,258.464,261.033 -->
| Goose DOM | plain | decode | 38 | 100000 | 261.0 | 223.3–280.9 | 2804000 |
<!-- samples | goose-json | escaped | decode | 479.905,463.093,468.563,444.918,489.653,473.385,474.716 -->
| goose-json | escaped | decode | 62 | 100000 | 473.4 | 444.9–489.7 | 42761000 |
<!-- samples | goose-json | escaped | encode | 211.447,203.768,202.017,225.475,205.150,212.980,228.901 -->
| goose-json | escaped | encode | 54 | 100000 | 211.4 | 202.0–228.9 | 107718681 |
<!-- samples | Goose DOM | escaped | decode | 327.097,349.676,362.890,331.616,346.533,357.221,359.091 -->
| Goose DOM | escaped | decode | 62 | 100000 | 349.7 | 327.1–362.9 | 15422000 |
<!-- samples | goose-json | array | decode | 19287.340,19721.813,23024.287,19677.223,19465.332,19848.129,19720.254 -->
| goose-json | array | decode | 4022 | 10000 | 19720.3 | 19287.3–23024.3 | 145337000 |
<!-- samples | goose-json | array | encode | 11761.999,11868.445,12451.898,12126.349,11584.181,12254.425,12036.169 -->
| goose-json | array | encode | 4022 | 10000 | 12036.2 | 11584.2–12451.9 | 289142183 |
<!-- samples | Goose DOM | array | decode | 47649.822,48789.506,47503.948,45298.828,47008.910,47299.490,46996.599 -->
| Goose DOM | array | decode | 4022 | 10000 | 47299.5 | 45298.8–48789.5 | 72846000 |
<!-- samples | goose-json | floats | decode | 10674.450,8345.042,11110.112,8346.034,8515.677,11481.245,10543.780 -->
| goose-json | floats | decode | 1581 | 1000 | 10543.8 | 8345.0–11481.2 | 2040000 |
<!-- samples | goose-json | floats | encode | 21951.728,23639.697,24314.041,24201.052,23562.624,22033.353,22026.453 -->
| goose-json | floats | encode | 1581 | 1000 | 23562.6 | 21951.7–24314.0 | 13042088 |
<!-- samples | Goose DOM | floats | decode | 12685.068,12932.492,13862.484,15840.585,10403.592,14109.891,12005.435 -->
| Goose DOM | floats | decode | 1581 | 1000 | 12932.5 | 10403.6–15840.6 | 2064000 |
<!-- samples | goose-json | floats-wide | decode | 20230.428,18802.411,19204.335,17804.973,17355.406,18123.730,19224.328 -->
| goose-json | floats-wide | decode | 5975 | 1000 | 18802.4 | 17355.4–20230.4 | 2136000 |
<!-- samples | goose-json | floats-wide | encode | 22564.361,22639.569,24058.941,23876.799,21960.595,22554.926,23597.351 -->
| goose-json | floats-wide | encode | 5862 | 1000 | 22639.6 | 21960.6–24058.9 | 47325760 |
<!-- samples | Goose DOM | floats-wide | decode | 36359.152,38872.851,36400.457,35438.137,37113.300,36609.059,37291.814 -->
| Goose DOM | floats-wide | decode | 5975 | 1000 | 36609.1 | 35438.1–38872.9 | 2064000 |
<!-- samples | goose-json | text-short | decode | 272.003,239.944,243.174,259.315,255.845,243.359,259.333 -->
| goose-json | text-short | decode | 97 | 100000 | 255.8 | 239.9–272.0 | 75007000 |
<!-- samples | goose-json | text-short | encode | 108.538,108.818,76.488,109.709,69.509,85.364,77.492 -->
| goose-json | text-short | encode | 97 | 100000 | 85.4 | 69.5–109.7 | 133196708 |
<!-- samples | Goose DOM | text-short | decode | 365.532,342.315,377.081,381.713,383.079,366.625,386.586 -->
| Goose DOM | text-short | decode | 97 | 100000 | 377.1 | 342.3–386.6 | 2804000 |
<!-- samples | goose-json | text-sparse | decode | 5469.094,5391.776,4501.039,3654.651,4313.886,5369.916,5360.321 -->
| goose-json | text-sparse | decode | 8233 | 1000 | 5360.3 | 3654.7–5469.1 | 65928000 |
<!-- samples | goose-json | text-sparse | encode | 5181.686,5046.252,8243.274,4031.259,2052.220,3136.037,2993.627 -->
| goose-json | text-sparse | encode | 8233 | 1000 | 4031.3 | 2052.2–8243.3 | 66662496 |
<!-- samples | Goose DOM | text-sparse | decode | 31478.584,30127.546,30955.290,31438.182,34626.989,34695.233,19600.758 -->
| Goose DOM | text-sparse | decode | 8233 | 1000 | 31438.2 | 19600.8–34695.2 | 65616000 |
<!-- samples | goose-json | text-ascii | decode | 926.893,1027.268,896.272,991.951,1028.185,1019.608,973.434 -->
| goose-json | text-ascii | decode | 8225 | 1000 | 992.0 | 896.3–1028.2 | 65880000 |
<!-- samples | goose-json | text-ascii | encode | 531.844,572.508,491.644,569.498,551.725,524.685,568.269 -->
| goose-json | text-ascii | encode | 8225 | 1000 | 551.7 | 491.6–572.5 | 66598496 |
<!-- samples | Goose DOM | text-ascii | decode | 7449.180,7570.319,7431.138,7984.723,7895.161,7876.766,7775.316 -->
| Goose DOM | text-ascii | decode | 8225 | 1000 | 7775.3 | 7431.1–7984.7 | 32000 |
<!-- samples | goose-json | text-escaped | decode | 13691.004,13659.803,13732.210,13397.070,13764.803,14043.214,13567.682 -->
| goose-json | text-escaped | decode | 8737 | 1000 | 13691.0 | 13397.1–14043.2 | 53592000 |
<!-- samples | goose-json | text-escaped | encode | 10417.254,10215.381,10386.864,10167.409,10572.014,10356.302,10397.523 -->
| goose-json | text-escaped | encode | 8737 | 1000 | 10386.9 | 10167.4–10572.0 | 70853440 |
<!-- samples | Goose DOM | text-escaped | decode | 15520.892,15105.701,15298.656,16122.960,15698.232,15559.973,15268.761 -->
| Goose DOM | text-escaped | decode | 8737 | 1000 | 15520.9 | 15105.7–16123.0 | 53280000 |
<!-- samples | goose-json | wide | decode | 786.410,814.009,781.636,770.604,770.134,799.574,799.862 -->
| goose-json | wide | decode | 135 | 20000 | 786.4 | 770.1–814.0 | 16920000 |
<!-- samples | goose-json | wide | encode | 187.387,173.279,183.101,197.644,187.919,202.099,206.639 -->
| goose-json | wide | encode | 135 | 20000 | 187.9 | 173.3–206.6 | 26639006 |
<!-- samples | Goose DOM | wide | decode | 447.995,458.116,432.807,428.192,423.055,444.680,433.495 -->
| Goose DOM | wide | decode | 135 | 20000 | 433.5 | 423.1–458.1 | 2397000 |
