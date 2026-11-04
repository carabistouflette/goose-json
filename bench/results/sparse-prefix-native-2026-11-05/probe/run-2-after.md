| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 145.342,136.151,138.334,129.443,127.342,127.624,129.465 -->
| goose-json | plain | decode | 38 | 20000 | 129.5 | 127.3–145.3 | 6768000 |
<!-- samples | goose-json | plain | encode | 65.761,62.554,64.028,58.642,61.469,60.431,61.365 -->
| goose-json | plain | encode | 38 | 20000 | 61.5 | 58.6–65.8 | 16855732 |
<!-- samples | Goose DOM | plain | decode | 101.425,99.757,100.309,93.923,94.417,95.287,94.114 -->
| Goose DOM | plain | decode | 38 | 20000 | 95.3 | 93.9–101.4 | 564000 |
<!-- samples | goose-json | escaped | decode | 249.477,250.739,260.501,262.294,246.147,251.202,250.060 -->
| goose-json | escaped | decode | 62 | 20000 | 250.7 | 246.1–262.3 | 8601000 |
<!-- samples | goose-json | escaped | encode | 119.284,118.704,128.793,117.772,118.281,118.912,118.070 -->
| goose-json | escaped | encode | 54 | 20000 | 118.7 | 117.8–128.8 | 21663705 |
<!-- samples | Goose DOM | escaped | decode | 160.596,159.508,169.960,159.627,155.950,159.846,158.192 -->
| Goose DOM | escaped | decode | 62 | 20000 | 159.6 | 156.0–170.0 | 3102000 |
<!-- samples | goose-json | array | decode | 18630.786,12133.360,13650.678,13762.904,13220.901,13473.298,13376.111 -->
| goose-json | array | decode | 4022 | 2000 | 13473.3 | 12133.4–18630.8 | 30705000 |
<!-- samples | goose-json | array | encode | 6458.121,6391.824,7778.895,7064.677,7253.470,7484.767,6821.501 -->
| goose-json | array | encode | 4022 | 2000 | 7064.7 | 6391.8–7778.9 | 61080811 |
<!-- samples | Goose DOM | array | decode | 22283.147,23996.635,25946.571,25005.122,25332.018,25575.005,32302.911 -->
| Goose DOM | array | decode | 4022 | 2000 | 25332.0 | 22283.1–32302.9 | 15390000 |
<!-- samples | goose-json | array-signed | decode | 12119.624,11961.618,12249.317,12595.775,12537.449,12424.113,12637.221 -->
| goose-json | array-signed | decode | 4538 | 2000 | 12424.1 | 11961.6–12637.2 | 15375000 |
<!-- samples | goose-json | array-signed | encode | 6484.005,6507.558,6528.959,6523.190,6521.523,6541.599,6545.882 -->
| goose-json | array-signed | encode | 4537 | 2000 | 6523.2 | 6484.0–6545.9 | 68796382 |
<!-- samples | Goose DOM | array-signed | decode | 22781.907,21997.031,22487.093,24584.270,23725.189,21871.919,22338.827 -->
| Goose DOM | array-signed | decode | 4538 | 2000 | 22487.1 | 21871.9–24584.3 | 15390000 |
<!-- samples | goose-json | array-wide | decode | 34835.893,34853.524,35345.620,36810.370,35721.855,35898.319,34585.965 -->
| goose-json | array-wide | decode | 19771 | 2000 | 35345.6 | 34586.0–36810.4 | 26205000 |
<!-- samples | goose-json | array-wide | encode | 18696.446,17714.000,17498.056,18446.475,17998.128,17465.708,17625.536 -->
| goose-json | array-wide | encode | 19770 | 2000 | 17714.0 | 17465.7–18696.4 | 297316216 |
<!-- samples | Goose DOM | array-wide | decode | 58436.712,61367.442,56259.033,57287.615,56829.502,56030.586,56616.773 -->
| Goose DOM | array-wide | decode | 19771 | 2000 | 56829.5 | 56030.6–61367.4 | 15390000 |
<!-- samples | goose-json | mixed | decode | 2783.245,2782.934,2804.424,2776.036,2771.903,2760.524,2765.934 -->
| goose-json | mixed | decode | 1187 | 2000 | 2776.0 | 2760.5–2804.4 | 24255000 |
<!-- samples | goose-json | mixed | encode | 2889.564,2900.139,2894.034,2905.010,2899.686,2890.483,2866.716 -->
| goose-json | mixed | encode | 1186 | 2000 | 2894.0 | 2866.7–2905.0 | 19068985 |
<!-- samples | Goose DOM | mixed | decode | 3084.633,3082.751,3222.252,3045.323,3050.802,3045.026,3036.410 -->
| Goose DOM | mixed | decode | 1187 | 2000 | 3050.8 | 3036.4–3222.3 | 8865000 |
<!-- samples | goose-json | floats | decode | 5647.345,5545.585,5499.070,5388.010,5587.875,5646.075,5561.510 -->
| goose-json | floats | decode | 1581 | 200 | 5561.5 | 5388.0–5647.3 | 408000 |
<!-- samples | goose-json | floats | encode | 12224.175,12157.965,12161.490,12240.030,12143.525,12163.760,12117.940 -->
| goose-json | floats | encode | 1581 | 200 | 12161.5 | 12117.9–12240.0 | 2611368 |
<!-- samples | Goose DOM | floats | decode | 5443.225,5442.255,5396.450,5411.275,5450.045,5438.290,5448.440 -->
| Goose DOM | floats | decode | 1581 | 200 | 5442.3 | 5396.4–5450.0 | 412800 |
<!-- samples | goose-json | floats-wide | decode | 9370.495,9415.170,9222.020,9512.645,9290.805,9206.525,9285.500 -->
| goose-json | floats-wide | decode | 5975 | 200 | 9290.8 | 9206.5–9512.6 | 427200 |
<!-- samples | goose-json | floats-wide | encode | 12747.765,12691.025,12864.580,12773.720,12694.740,12628.220,12787.610 -->
| goose-json | floats-wide | encode | 5862 | 200 | 12747.8 | 12628.2–12864.6 | 9467432 |
<!-- samples | Goose DOM | floats-wide | decode | 17118.215,17117.455,17265.465,17155.565,17027.475,17222.865,17213.475 -->
| Goose DOM | floats-wide | decode | 5975 | 200 | 17155.6 | 17027.5–17265.5 | 412800 |
<!-- samples | goose-json | text-short | decode | 126.525,125.718,127.447,126.816,125.773,127.404,130.625 -->
| goose-json | text-short | decode | 97 | 20000 | 126.8 | 125.7–130.6 | 15087000 |
<!-- samples | goose-json | text-short | encode | 54.267,54.941,54.041,53.833,53.977,54.008,53.712 -->
| goose-json | text-short | encode | 97 | 20000 | 54.0 | 53.7–54.9 | 26788875 |
<!-- samples | Goose DOM | text-short | decode | 143.006,143.499,142.961,141.840,141.637,142.423,141.837 -->
| Goose DOM | text-short | decode | 97 | 20000 | 142.4 | 141.6–143.5 | 564000 |
<!-- samples | goose-json | text-sparse | decode | 2030.040,2053.495,2050.850,2079.615,2186.970,2179.815,2199.380 -->
| goose-json | text-sparse | decode | 8233 | 200 | 2079.6 | 2030.0–2199.4 | 13185600 |
<!-- samples | goose-json | text-sparse | encode | 1807.640,1813.340,1817.150,1828.375,1982.665,1971.610,1912.670 -->
| goose-json | text-sparse | encode | 8233 | 200 | 1828.4 | 1807.6–1982.7 | 13328096 |
<!-- samples | Goose DOM | text-sparse | decode | 16158.930,16193.965,16302.925,16462.380,17287.995,17097.155,17081.865 -->
| Goose DOM | text-sparse | decode | 8233 | 200 | 16462.4 | 16158.9–17288.0 | 13123200 |
<!-- samples | goose-json | text-ascii | decode | 1410.010,1420.005,1337.840,1370.985,1425.840,1472.570,1490.135 -->
| goose-json | text-ascii | decode | 8225 | 200 | 1420.0 | 1337.8–1490.1 | 13176000 |
<!-- samples | goose-json | text-ascii | encode | 921.740,904.570,916.305,932.000,982.955,933.765,929.510 -->
| goose-json | text-ascii | encode | 8225 | 200 | 929.5 | 904.6–983.0 | 13315296 |
<!-- samples | Goose DOM | text-ascii | decode | 8334.390,7872.535,8138.965,8377.585,8304.760,8303.990,8360.820 -->
| Goose DOM | text-ascii | decode | 8225 | 200 | 8304.8 | 7872.5–8377.6 | 6400 |
<!-- samples | goose-json | text-escaped | decode | 17851.560,17801.825,17789.645,17767.750,16661.565,16555.555,16314.140 -->
| goose-json | text-escaped | decode | 8737 | 200 | 17767.8 | 16314.1–17851.6 | 10718400 |
<!-- samples | goose-json | text-escaped | encode | 13238.495,13149.710,12947.530,12957.365,12216.430,12116.730,11505.440 -->
| goose-json | text-escaped | encode | 8737 | 200 | 12947.5 | 11505.4–13238.5 | 14162184 |
<!-- samples | Goose DOM | text-escaped | decode | 20970.130,20377.740,19874.025,20016.005,19146.000,18973.365,18413.190 -->
| Goose DOM | text-escaped | decode | 8737 | 200 | 19874.0 | 18413.2–20970.1 | 10656000 |
<!-- samples | goose-json | wide | decode | 498.050,505.241,507.366,506.637,507.140,510.027,503.007 -->
| goose-json | wide | decode | 135 | 4000 | 506.6 | 498.0–510.0 | 3480000 |
<!-- samples | goose-json | wide | encode | 181.649,181.872,207.506,181.593,181.427,182.767,207.248 -->
| goose-json | wide | encode | 135 | 4000 | 181.9 | 181.4–207.5 | 5479021 |
<!-- samples | Goose DOM | wide | decode | 407.682,421.963,403.013,392.123,392.160,411.555,394.108 -->
| Goose DOM | wide | decode | 135 | 4000 | 403.0 | 392.1–422.0 | 493000 |
