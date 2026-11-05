| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 137.495,135.296,130.165,132.193,129.215,138.444,138.331 -->
| goose-json | plain | decode | 38 | 20000 | 135.3 | 129.2–138.4 | 6768000 |
<!-- samples | goose-json | plain | encode | 62.854,65.415,60.452,59.361,61.506,64.598,65.532 -->
| goose-json | plain | encode | 38 | 20000 | 62.9 | 59.4–65.5 | 16855732 |
<!-- samples | Goose DOM | plain | decode | 101.697,97.461,94.122,94.287,95.705,100.736,100.683 -->
| Goose DOM | plain | decode | 38 | 20000 | 97.5 | 94.1–101.7 | 564000 |
<!-- samples | goose-json | escaped | decode | 264.710,249.984,247.814,249.458,246.301,246.082,244.958 -->
| goose-json | escaped | decode | 62 | 20000 | 247.8 | 245.0–264.7 | 8601000 |
<!-- samples | goose-json | escaped | encode | 126.049,118.627,117.236,116.539,111.382,117.856,117.397 -->
| goose-json | escaped | encode | 54 | 20000 | 117.4 | 111.4–126.0 | 21663705 |
<!-- samples | Goose DOM | escaped | decode | 166.351,157.443,156.367,155.321,150.913,157.270,155.322 -->
| Goose DOM | escaped | decode | 62 | 20000 | 156.4 | 150.9–166.4 | 3102000 |
<!-- samples | goose-json | array | decode | 12908.970,12717.874,12511.146,11908.962,12771.336,12661.676,12723.040 -->
| goose-json | array | decode | 4022 | 2000 | 12717.9 | 11909.0–12909.0 | 30705000 |
<!-- samples | goose-json | array | encode | 6797.878,6789.461,6676.407,6538.497,6792.208,6791.052,6389.390 -->
| goose-json | array | encode | 4022 | 2000 | 6789.5 | 6389.4–6797.9 | 61080811 |
<!-- samples | Goose DOM | array | decode | 22871.064,22120.426,22209.919,22593.272,23378.900,23244.061,22278.641 -->
| Goose DOM | array | decode | 4022 | 2000 | 22593.3 | 22120.4–23378.9 | 15390000 |
<!-- samples | goose-json | array-signed | decode | 12533.751,12624.196,12538.628,11983.618,12052.804,12959.143,12296.064 -->
| goose-json | array-signed | decode | 4538 | 2000 | 12533.8 | 11983.6–12959.1 | 15375000 |
<!-- samples | goose-json | array-signed | encode | 6890.098,6890.261,6875.038,6517.494,6535.308,6943.800,6711.141 -->
| goose-json | array-signed | encode | 4537 | 2000 | 6875.0 | 6517.5–6943.8 | 68796382 |
<!-- samples | Goose DOM | array-signed | decode | 23818.235,25120.784,23940.726,23940.657,25151.271,25456.319,23997.986 -->
| Goose DOM | array-signed | decode | 4538 | 2000 | 23998.0 | 23818.2–25456.3 | 15390000 |
<!-- samples | goose-json | array-wide | decode | 35723.465,35973.450,42266.005,34834.845,37289.842,34937.179,34696.999 -->
| goose-json | array-wide | decode | 19771 | 2000 | 35723.5 | 34697.0–42266.0 | 26205000 |
<!-- samples | goose-json | array-wide | encode | 17589.896,18648.632,18680.605,17529.360,19026.939,18059.420,17486.762 -->
| goose-json | array-wide | encode | 19770 | 2000 | 18059.4 | 17486.8–19026.9 | 297316216 |
<!-- samples | Goose DOM | array-wide | decode | 57343.980,66821.292,60156.694,56689.870,58330.099,56149.334,56104.152 -->
| Goose DOM | array-wide | decode | 19771 | 2000 | 57344.0 | 56104.2–66821.3 | 15390000 |
<!-- samples | goose-json | mixed | decode | 2722.266,2712.193,2725.084,2716.912,2769.954,2757.198,2732.441 -->
| goose-json | mixed | decode | 1187 | 2000 | 2725.1 | 2712.2–2770.0 | 24255000 |
<!-- samples | goose-json | mixed | encode | 2856.588,2877.262,2863.923,2883.487,2861.336,2864.338,2896.950 -->
| goose-json | mixed | encode | 1186 | 2000 | 2864.3 | 2856.6–2897.0 | 19068985 |
<!-- samples | Goose DOM | mixed | decode | 3009.792,3003.191,2974.610,2990.579,2967.642,2956.530,2957.314 -->
| Goose DOM | mixed | decode | 1187 | 2000 | 2974.6 | 2956.5–3009.8 | 8865000 |
<!-- samples | goose-json | floats | decode | 5731.445,5776.080,5619.580,5591.015,5587.585,5554.130,5549.575 -->
| goose-json | floats | decode | 1581 | 200 | 5591.0 | 5549.6–5776.1 | 408000 |
<!-- samples | goose-json | floats | encode | 12180.790,12184.870,12097.175,12071.215,12179.625,12120.910,12164.650 -->
| goose-json | floats | encode | 1581 | 200 | 12164.6 | 12071.2–12184.9 | 2611368 |
<!-- samples | Goose DOM | floats | decode | 5508.465,5422.200,5404.390,5402.115,5439.680,5407.140,5394.930 -->
| Goose DOM | floats | decode | 1581 | 200 | 5407.1 | 5394.9–5508.5 | 412800 |
<!-- samples | goose-json | floats-wide | decode | 9370.895,9435.500,9336.700,9505.025,9537.800,9521.560,10082.265 -->
| goose-json | floats-wide | decode | 5975 | 200 | 9505.0 | 9336.7–10082.3 | 427200 |
<!-- samples | goose-json | floats-wide | encode | 12702.905,12603.960,12628.890,12658.590,12756.630,13411.570,13646.705 -->
| goose-json | floats-wide | encode | 5862 | 200 | 12702.9 | 12604.0–13646.7 | 9467432 |
<!-- samples | Goose DOM | floats-wide | decode | 17063.045,17118.315,17062.530,17172.820,17309.970,18281.860,18178.675 -->
| Goose DOM | floats-wide | decode | 5975 | 200 | 17172.8 | 17062.5–18281.9 | 412800 |
<!-- samples | goose-json | text-short | decode | 136.608,137.097,137.189,138.172,137.615,136.153,135.145 -->
| goose-json | text-short | decode | 97 | 20000 | 137.1 | 135.1–138.2 | 15087000 |
<!-- samples | goose-json | text-short | encode | 57.630,60.423,60.414,57.668,60.198,59.997,57.165 -->
| goose-json | text-short | encode | 97 | 20000 | 60.0 | 57.2–60.4 | 26788875 |
<!-- samples | Goose DOM | text-short | decode | 152.874,152.991,154.298,152.895,158.191,152.069,146.822 -->
| Goose DOM | text-short | decode | 97 | 20000 | 152.9 | 146.8–158.2 | 564000 |
<!-- samples | goose-json | text-sparse | decode | 2220.205,2141.735,2170.450,2189.180,2165.750,2098.085,2081.595 -->
| goose-json | text-sparse | decode | 8233 | 200 | 2165.8 | 2081.6–2220.2 | 13185600 |
<!-- samples | goose-json | text-sparse | encode | 1930.785,1819.815,1908.195,1972.955,1958.385,1803.990,1795.150 -->
| goose-json | text-sparse | encode | 8233 | 200 | 1908.2 | 1795.2–1973.0 | 13328096 |
<!-- samples | Goose DOM | text-sparse | decode | 16233.115,16970.860,17122.315,17106.140,16817.225,16068.830,16187.870 -->
| Goose DOM | text-sparse | decode | 8233 | 200 | 16817.2 | 16068.8–17122.3 | 13123200 |
<!-- samples | goose-json | text-ascii | decode | 1358.960,1364.100,1420.285,1411.490,1396.715,1388.375,1379.260 -->
| goose-json | text-ascii | decode | 8225 | 200 | 1388.4 | 1359.0–1420.3 | 13176000 |
<!-- samples | goose-json | text-ascii | encode | 868.830,866.695,874.055,876.440,873.650,873.495,873.365 -->
| goose-json | text-ascii | encode | 8225 | 200 | 873.5 | 866.7–876.4 | 13315296 |
<!-- samples | Goose DOM | text-ascii | decode | 7806.590,7819.190,7812.130,7837.835,7805.745,7789.920,7865.510 -->
| Goose DOM | text-ascii | decode | 8225 | 200 | 7812.1 | 7789.9–7865.5 | 6400 |
<!-- samples | goose-json | text-escaped | decode | 16170.870,16489.510,16613.325,16588.435,15764.250,16592.465,16750.960 -->
| goose-json | text-escaped | decode | 8737 | 200 | 16588.4 | 15764.3–16751.0 | 10718400 |
<!-- samples | goose-json | text-escaped | encode | 12079.355,12241.630,12409.220,12236.675,12031.980,12290.985,12301.445 -->
| goose-json | text-escaped | encode | 8737 | 200 | 12241.6 | 12032.0–12409.2 | 14162184 |
<!-- samples | Goose DOM | text-escaped | decode | 18274.690,19238.005,19019.555,18860.685,18871.240,19559.430,19953.630 -->
| Goose DOM | text-escaped | decode | 8737 | 200 | 19019.6 | 18274.7–19953.6 | 10656000 |
<!-- samples | goose-json | wide | decode | 535.899,533.086,540.529,537.957,535.173,530.989,533.432 -->
| goose-json | wide | decode | 135 | 4000 | 535.2 | 531.0–540.5 | 3480000 |
<!-- samples | goose-json | wide | encode | 193.066,213.185,227.361,190.808,222.004,192.155,191.608 -->
| goose-json | wide | encode | 135 | 4000 | 193.1 | 190.8–227.4 | 5479021 |
<!-- samples | Goose DOM | wide | decode | 442.052,457.668,452.241,448.180,436.088,434.558,460.162 -->
| Goose DOM | wide | decode | 135 | 4000 | 448.2 | 434.6–460.2 | 493000 |
