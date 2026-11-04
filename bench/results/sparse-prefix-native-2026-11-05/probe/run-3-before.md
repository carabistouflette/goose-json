| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 137.224,137.268,128.386,127.412,127.211,127.166,127.110 -->
| goose-json | plain | decode | 38 | 20000 | 127.4 | 127.1–137.3 | 6768000 |
<!-- samples | goose-json | plain | encode | 63.407,66.434,60.079,58.812,59.165,58.206,54.882 -->
| goose-json | plain | encode | 38 | 20000 | 59.2 | 54.9–66.4 | 16855732 |
<!-- samples | Goose DOM | plain | decode | 102.216,100.556,94.934,94.546,93.324,94.408,91.333 -->
| Goose DOM | plain | decode | 38 | 20000 | 94.5 | 91.3–102.2 | 564000 |
<!-- samples | goose-json | escaped | decode | 252.736,262.369,248.927,247.726,258.283,247.559,250.308 -->
| goose-json | escaped | decode | 62 | 20000 | 250.3 | 247.6–262.4 | 8601000 |
<!-- samples | goose-json | escaped | encode | 119.827,119.247,116.334,118.440,119.660,114.946,115.907 -->
| goose-json | escaped | encode | 54 | 20000 | 118.4 | 114.9–119.8 | 21663705 |
<!-- samples | Goose DOM | escaped | decode | 161.974,161.505,159.878,158.135,157.714,160.987,161.229 -->
| Goose DOM | escaped | decode | 62 | 20000 | 161.0 | 157.7–162.0 | 3102000 |
<!-- samples | goose-json | array | decode | 12775.508,12977.335,12550.171,12200.861,12571.255,12908.006,12799.433 -->
| goose-json | array | decode | 4022 | 2000 | 12775.5 | 12200.9–12977.3 | 30705000 |
<!-- samples | goose-json | array | encode | 6794.042,6673.262,6391.907,6574.479,6748.716,6785.382,6774.977 -->
| goose-json | array | encode | 4022 | 2000 | 6748.7 | 6391.9–6794.0 | 61080811 |
<!-- samples | Goose DOM | array | decode | 19969.820,19566.014,19022.649,19312.343,19839.290,19987.500,19917.070 -->
| Goose DOM | array | decode | 4022 | 2000 | 19839.3 | 19022.6–19987.5 | 15390000 |
<!-- samples | goose-json | array-signed | decode | 12873.950,12950.485,12745.014,13412.260,12391.963,13581.390,12546.558 -->
| goose-json | array-signed | decode | 4538 | 2000 | 12873.9 | 12392.0–13581.4 | 15375000 |
<!-- samples | goose-json | array-signed | encode | 6885.002,7341.096,7154.117,7338.797,6886.221,6966.894,6889.243 -->
| goose-json | array-signed | encode | 4537 | 2000 | 6966.9 | 6885.0–7341.1 | 68796382 |
<!-- samples | Goose DOM | array-signed | decode | 20827.914,22053.246,22440.280,21371.668,21166.066,21320.827,20936.480 -->
| Goose DOM | array-signed | decode | 4538 | 2000 | 21320.8 | 20827.9–22440.3 | 15390000 |
<!-- samples | goose-json | array-wide | decode | 37009.856,36975.878,36785.935,36790.611,35071.401,36841.359,35436.490 -->
| goose-json | array-wide | decode | 19771 | 2000 | 36790.6 | 35071.4–37009.9 | 26205000 |
<!-- samples | goose-json | array-wide | encode | 19043.621,18752.189,18569.014,17567.122,18255.895,18591.698,18642.761 -->
| goose-json | array-wide | encode | 19770 | 2000 | 18591.7 | 17567.1–19043.6 | 297316216 |
<!-- samples | Goose DOM | array-wide | decode | 59332.111,59411.353,58227.611,57796.379,59558.440,58466.944,59290.342 -->
| Goose DOM | array-wide | decode | 19771 | 2000 | 59290.3 | 57796.4–59558.4 | 15390000 |
<!-- samples | goose-json | mixed | decode | 2856.253,2869.570,2856.340,2743.313,2688.805,2711.858,2858.506 -->
| goose-json | mixed | decode | 1187 | 2000 | 2856.3 | 2688.8–2869.6 | 24255000 |
<!-- samples | goose-json | mixed | encode | 3053.652,3059.582,3040.869,2837.134,2869.679,2859.515,3032.289 -->
| goose-json | mixed | encode | 1186 | 2000 | 3032.3 | 2837.1–3059.6 | 19068985 |
<!-- samples | Goose DOM | mixed | decode | 3345.713,3337.713,3331.674,3132.912,3131.168,3149.620,3312.530 -->
| Goose DOM | mixed | decode | 1187 | 2000 | 3312.5 | 3131.2–3345.7 | 8865000 |
<!-- samples | goose-json | floats | decode | 5631.360,5644.020,5741.380,5283.705,5464.470,5305.300,5315.635 -->
| goose-json | floats | decode | 1581 | 200 | 5464.5 | 5283.7–5741.4 | 408000 |
<!-- samples | goose-json | floats | encode | 12940.235,12887.245,12826.110,12172.350,12098.675,12166.320,12126.060 -->
| goose-json | floats | encode | 1581 | 200 | 12172.4 | 12098.7–12940.2 | 2611368 |
<!-- samples | Goose DOM | floats | decode | 5428.165,5397.475,5367.795,5100.320,5144.715,5114.420,5093.675 -->
| Goose DOM | floats | decode | 1581 | 200 | 5144.7 | 5093.7–5428.2 | 412800 |
<!-- samples | goose-json | floats-wide | decode | 9855.910,9797.920,9918.005,9855.780,9835.020,9318.175,9414.005 -->
| goose-json | floats-wide | decode | 5975 | 200 | 9835.0 | 9318.2–9918.0 | 427200 |
<!-- samples | goose-json | floats-wide | encode | 13546.880,13606.270,13418.765,13578.230,13532.210,12721.960,13312.955 -->
| goose-json | floats-wide | encode | 5862 | 200 | 13532.2 | 12722.0–13606.3 | 9467432 |
<!-- samples | Goose DOM | floats-wide | decode | 19335.950,19421.660,19364.725,19316.955,18611.360,18280.310,19294.535 -->
| Goose DOM | floats-wide | decode | 5975 | 200 | 19317.0 | 18280.3–19421.7 | 412800 |
<!-- samples | goose-json | text-short | decode | 135.592,134.544,134.073,133.161,126.391,126.054,127.175 -->
| goose-json | text-short | decode | 97 | 20000 | 133.2 | 126.1–135.6 | 15087000 |
<!-- samples | goose-json | text-short | encode | 57.974,57.109,56.345,55.273,52.902,55.520,56.110 -->
| goose-json | text-short | encode | 97 | 20000 | 56.1 | 52.9–58.0 | 26788875 |
<!-- samples | Goose DOM | text-short | decode | 152.116,151.118,151.146,141.799,141.951,141.700,141.807 -->
| Goose DOM | text-short | decode | 97 | 20000 | 142.0 | 141.7–152.1 | 564000 |
<!-- samples | goose-json | text-sparse | decode | 2187.070,2215.950,2158.285,2167.475,2205.850,2235.550,2164.230 -->
| goose-json | text-sparse | decode | 8233 | 200 | 2187.1 | 2158.3–2235.6 | 13185600 |
<!-- samples | goose-json | text-sparse | encode | 2158.425,2068.105,2064.225,2151.190,2080.220,2074.760,2098.015 -->
| goose-json | text-sparse | encode | 8233 | 200 | 2080.2 | 2064.2–2158.4 | 13328096 |
<!-- samples | Goose DOM | text-sparse | decode | 17209.660,17110.700,17134.290,17173.760,17235.000,17187.875,17060.005 -->
| Goose DOM | text-sparse | decode | 8233 | 200 | 17173.8 | 17060.0–17235.0 | 13123200 |
<!-- samples | goose-json | text-ascii | decode | 1408.465,1465.920,1462.180,1423.945,1424.070,1413.020,1328.550 -->
| goose-json | text-ascii | decode | 8225 | 200 | 1423.9 | 1328.5–1465.9 | 13176000 |
<!-- samples | goose-json | text-ascii | encode | 956.785,929.790,922.300,925.475,881.605,926.195,869.200 -->
| goose-json | text-ascii | encode | 8225 | 200 | 925.5 | 869.2–956.8 | 13315296 |
<!-- samples | Goose DOM | text-ascii | decode | 8272.275,8260.570,8365.265,8335.800,8020.120,8045.350,7835.815 -->
| Goose DOM | text-ascii | decode | 8225 | 200 | 8260.6 | 7835.8–8365.3 | 6400 |
<!-- samples | goose-json | text-escaped | decode | 16351.425,16334.990,15802.545,15857.000,15956.845,16014.900,16457.010 -->
| goose-json | text-escaped | decode | 8737 | 200 | 16014.9 | 15802.5–16457.0 | 10718400 |
<!-- samples | goose-json | text-escaped | encode | 13144.900,12778.875,12273.040,12400.000,12381.635,12911.645,12453.755 -->
| goose-json | text-escaped | encode | 8737 | 200 | 12453.8 | 12273.0–13144.9 | 14162184 |
<!-- samples | Goose DOM | text-escaped | decode | 20010.380,18189.420,18272.215,18182.925,18264.975,19540.755,18984.135 -->
| Goose DOM | text-escaped | decode | 8737 | 200 | 18272.2 | 18182.9–20010.4 | 10656000 |
<!-- samples | goose-json | wide | decode | 537.737,537.119,540.959,541.087,544.135,538.532,537.794 -->
| goose-json | wide | decode | 135 | 4000 | 538.5 | 537.1–544.1 | 3480000 |
<!-- samples | goose-json | wide | encode | 192.829,219.742,197.887,194.344,197.798,193.922,191.020 -->
| goose-json | wide | encode | 135 | 4000 | 194.3 | 191.0–219.7 | 5479021 |
<!-- samples | Goose DOM | wide | decode | 406.263,402.483,414.270,409.636,413.301,404.791,412.043 -->
| Goose DOM | wide | decode | 135 | 4000 | 409.6 | 402.5–414.3 | 493000 |
