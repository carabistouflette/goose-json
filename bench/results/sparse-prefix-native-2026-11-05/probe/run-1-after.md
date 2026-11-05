| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 134.097,119.682,123.067,124.038,121.741,120.243,121.436 -->
| goose-json | plain | decode | 38 | 20000 | 121.7 | 119.7–134.1 | 6768000 |
<!-- samples | goose-json | plain | encode | 56.123,57.059,55.590,56.194,57.813,55.858,55.452 -->
| goose-json | plain | encode | 38 | 20000 | 56.1 | 55.5–57.8 | 16855732 |
<!-- samples | Goose DOM | plain | decode | 88.411,88.320,90.637,88.950,88.522,89.196,89.385 -->
| Goose DOM | plain | decode | 38 | 20000 | 89.0 | 88.3–90.6 | 564000 |
<!-- samples | goose-json | escaped | decode | 238.836,252.523,268.082,277.554,254.746,924.299,238.822 -->
| goose-json | escaped | decode | 62 | 20000 | 254.7 | 238.8–924.3 | 8601000 |
<!-- samples | goose-json | escaped | encode | 122.240,121.496,129.946,128.221,118.823,112.086,120.727 -->
| goose-json | escaped | encode | 54 | 20000 | 121.5 | 112.1–129.9 | 21663705 |
<!-- samples | Goose DOM | escaped | decode | 159.484,169.494,175.850,177.514,157.219,160.094,159.302 -->
| Goose DOM | escaped | decode | 62 | 20000 | 160.1 | 157.2–177.5 | 3102000 |
<!-- samples | goose-json | array | decode | 11963.758,13387.739,13485.505,11412.017,12213.705,12299.457,12268.225 -->
| goose-json | array | decode | 4022 | 2000 | 12268.2 | 11412.0–13485.5 | 30705000 |
<!-- samples | goose-json | array | encode | 8572.857,6925.222,6958.811,6051.032,6439.834,6680.508,6438.512 -->
| goose-json | array | encode | 4022 | 2000 | 6680.5 | 6051.0–8572.9 | 61080811 |
<!-- samples | Goose DOM | array | decode | 22731.204,25470.957,21453.677,21478.712,22006.804,23015.812,22445.286 -->
| Goose DOM | array | decode | 4022 | 2000 | 22445.3 | 21453.7–25471.0 | 15390000 |
<!-- samples | goose-json | array-signed | decode | 11943.344,11839.249,12871.720,12615.511,11794.539,11781.700,11673.078 -->
| goose-json | array-signed | decode | 4538 | 2000 | 11839.2 | 11673.1–12871.7 | 15375000 |
<!-- samples | goose-json | array-signed | encode | 6493.993,6510.636,6658.180,7028.265,6673.779,6708.702,6475.045 -->
| goose-json | array-signed | encode | 4537 | 2000 | 6658.2 | 6475.0–7028.3 | 68796382 |
<!-- samples | Goose DOM | array-signed | decode | 24165.473,23591.744,23341.009,24004.140,23000.966,23326.051,23427.614 -->
| Goose DOM | array-signed | decode | 4538 | 2000 | 23427.6 | 23001.0–24165.5 | 15390000 |
<!-- samples | goose-json | array-wide | decode | 34727.162,35275.481,34623.848,34639.284,34517.586,34642.867,34636.716 -->
| goose-json | array-wide | decode | 19771 | 2000 | 34639.3 | 34517.6–35275.5 | 26205000 |
<!-- samples | goose-json | array-wide | encode | 18447.328,19026.872,18411.109,18496.826,18421.050,17534.103,18294.013 -->
| goose-json | array-wide | encode | 19770 | 2000 | 18421.0 | 17534.1–19026.9 | 297316216 |
<!-- samples | Goose DOM | array-wide | decode | 56308.990,56108.751,56067.738,56162.615,56054.590,56330.196,60649.762 -->
| Goose DOM | array-wide | decode | 19771 | 2000 | 56162.6 | 56054.6–60649.8 | 15390000 |
<!-- samples | goose-json | mixed | decode | 2779.597,2808.124,2773.321,2798.878,2847.059,2900.334,3012.110 -->
| goose-json | mixed | decode | 1187 | 2000 | 2808.1 | 2773.3–3012.1 | 24255000 |
<!-- samples | goose-json | mixed | encode | 2852.068,2859.673,2857.153,2848.448,2901.731,3041.767,3039.260 -->
| goose-json | mixed | encode | 1186 | 2000 | 2859.7 | 2848.4–3041.8 | 19068985 |
<!-- samples | Goose DOM | mixed | decode | 3340.331,3221.231,3214.762,3226.450,3317.775,3440.359,3275.654 -->
| Goose DOM | mixed | decode | 1187 | 2000 | 3275.7 | 3214.8–3440.4 | 8865000 |
<!-- samples | goose-json | floats | decode | 5597.155,5567.070,5553.720,5633.910,5496.090,5485.650,5588.740 -->
| goose-json | floats | decode | 1581 | 200 | 5567.1 | 5485.6–5633.9 | 408000 |
<!-- samples | goose-json | floats | encode | 12209.705,12171.065,12127.915,12068.750,12195.545,12194.570,12286.555 -->
| goose-json | floats | encode | 1581 | 200 | 12194.6 | 12068.8–12286.6 | 2611368 |
<!-- samples | Goose DOM | floats | decode | 5470.150,5315.215,5376.635,5381.925,5419.110,5427.640,5402.585 -->
| Goose DOM | floats | decode | 1581 | 200 | 5402.6 | 5315.2–5470.1 | 412800 |
<!-- samples | goose-json | floats-wide | decode | 9431.940,9400.410,9304.715,9256.145,9344.430,9276.685,9368.550 -->
| goose-json | floats-wide | decode | 5975 | 200 | 9344.4 | 9256.1–9431.9 | 427200 |
<!-- samples | goose-json | floats-wide | encode | 12744.500,12716.185,12580.575,12758.990,12795.005,12638.870,12661.475 -->
| goose-json | floats-wide | encode | 5862 | 200 | 12716.2 | 12580.6–12795.0 | 9467432 |
<!-- samples | Goose DOM | floats-wide | decode | 17174.275,17002.365,16990.480,17278.830,16945.930,16943.090,17030.965 -->
| Goose DOM | floats-wide | decode | 5975 | 200 | 17002.4 | 16943.1–17278.8 | 412800 |
<!-- samples | goose-json | text-short | decode | 126.412,126.671,127.983,125.826,126.994,126.410,126.999 -->
| goose-json | text-short | decode | 97 | 20000 | 126.7 | 125.8–128.0 | 15087000 |
<!-- samples | goose-json | text-short | encode | 56.897,53.933,54.227,53.836,53.830,54.831,53.941 -->
| goose-json | text-short | encode | 97 | 20000 | 53.9 | 53.8–56.9 | 26788875 |
<!-- samples | Goose DOM | text-short | decode | 143.167,142.317,142.066,142.270,142.178,142.645,141.401 -->
| Goose DOM | text-short | decode | 97 | 20000 | 142.3 | 141.4–143.2 | 564000 |
<!-- samples | goose-json | text-sparse | decode | 2039.445,2044.300,2045.165,2032.850,2039.250,2029.755,2060.495 -->
| goose-json | text-sparse | decode | 8233 | 200 | 2039.4 | 2029.8–2060.5 | 13185600 |
<!-- samples | goose-json | text-sparse | encode | 1832.360,1862.790,1845.810,1846.780,1853.625,1837.900,1886.210 -->
| goose-json | text-sparse | encode | 8233 | 200 | 1846.8 | 1832.4–1886.2 | 13328096 |
<!-- samples | Goose DOM | text-sparse | decode | 16219.700,16245.410,16092.545,16125.300,16107.240,16250.805,16293.190 -->
| Goose DOM | text-sparse | decode | 8233 | 200 | 16219.7 | 16092.5–16293.2 | 13123200 |
<!-- samples | goose-json | text-ascii | decode | 1350.860,1333.380,1330.120,1326.570,1344.340,1344.990,1342.650 -->
| goose-json | text-ascii | decode | 8225 | 200 | 1342.7 | 1326.6–1350.9 | 13176000 |
<!-- samples | goose-json | text-ascii | encode | 880.855,865.205,912.045,903.785,939.445,941.115,933.855 -->
| goose-json | text-ascii | encode | 8225 | 200 | 912.0 | 865.2–941.1 | 13315296 |
<!-- samples | Goose DOM | text-ascii | decode | 7928.295,7846.605,7799.170,7785.260,7868.280,7926.300,7845.680 -->
| Goose DOM | text-ascii | decode | 8225 | 200 | 7846.6 | 7785.3–7928.3 | 6400 |
<!-- samples | goose-json | text-escaped | decode | 16476.770,16191.950,16705.615,16625.640,15863.485,15827.735,15744.620 -->
| goose-json | text-escaped | decode | 8737 | 200 | 16192.0 | 15744.6–16705.6 | 10718400 |
<!-- samples | goose-json | text-escaped | encode | 11633.380,12385.055,12253.140,11998.655,11542.510,11448.420,11426.965 -->
| goose-json | text-escaped | encode | 8737 | 200 | 11633.4 | 11427.0–12385.1 | 14162184 |
<!-- samples | Goose DOM | text-escaped | decode | 18660.775,19760.700,18969.330,18077.515,18084.910,18062.435,17930.430 -->
| Goose DOM | text-escaped | decode | 8737 | 200 | 18084.9 | 17930.4–19760.7 | 10656000 |
<!-- samples | goose-json | wide | decode | 520.649,525.459,508.264,493.481,497.497,500.230,504.463 -->
| goose-json | wide | decode | 135 | 4000 | 504.5 | 493.5–525.5 | 3480000 |
<!-- samples | goose-json | wide | encode | 211.852,212.102,209.595,210.182,185.787,182.300,192.912 -->
| goose-json | wide | encode | 135 | 4000 | 209.6 | 182.3–212.1 | 5479021 |
<!-- samples | Goose DOM | wide | decode | 420.183,420.510,418.046,414.046,416.712,408.246,417.406 -->
| Goose DOM | wide | decode | 135 | 4000 | 417.4 | 408.2–420.5 | 493000 |
