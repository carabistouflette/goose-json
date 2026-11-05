| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 117.898,120.410,121.710,120.065,122.535,119.896,121.712 -->
| goose-json | plain | decode | 38 | 20000 | 120.4 | 117.9–122.5 | 6768000 |
<!-- samples | goose-json | plain | encode | 56.368,59.520,57.975,55.548,54.896,57.509,55.126 -->
| goose-json | plain | encode | 38 | 20000 | 56.4 | 54.9–59.5 | 16855732 |
<!-- samples | Goose DOM | plain | decode | 89.576,89.391,88.751,89.772,89.667,89.523,88.943 -->
| Goose DOM | plain | decode | 38 | 20000 | 89.5 | 88.8–89.8 | 564000 |
<!-- samples | goose-json | escaped | decode | 234.408,236.739,234.502,238.944,234.902,235.385,234.970 -->
| goose-json | escaped | decode | 62 | 20000 | 235.0 | 234.4–238.9 | 8601000 |
<!-- samples | goose-json | escaped | encode | 106.902,109.091,107.959,110.239,108.814,110.076,109.035 -->
| goose-json | escaped | encode | 54 | 20000 | 109.0 | 106.9–110.2 | 21663705 |
<!-- samples | Goose DOM | escaped | decode | 149.558,148.886,149.219,151.280,149.904,147.973,150.801 -->
| Goose DOM | escaped | decode | 62 | 20000 | 149.6 | 148.0–151.3 | 3102000 |
<!-- samples | goose-json | array | decode | 12103.408,12094.631,12282.657,12154.579,12366.023,12842.243,12173.532 -->
| goose-json | array | decode | 4022 | 2000 | 12173.5 | 12094.6–12842.2 | 30705000 |
<!-- samples | goose-json | array | encode | 6369.553,6361.091,6339.695,6575.583,6355.544,6756.402,6761.586 -->
| goose-json | array | encode | 4022 | 2000 | 6369.6 | 6339.7–6761.6 | 61080811 |
<!-- samples | Goose DOM | array | decode | 20337.192,20126.974,20151.035,21519.892,20433.361,21589.927,20973.109 -->
| Goose DOM | array | decode | 4022 | 2000 | 20433.4 | 20127.0–21589.9 | 15390000 |
<!-- samples | goose-json | array-signed | decode | 12484.122,11914.581,11795.412,11731.550,11669.784,11906.962,11633.003 -->
| goose-json | array-signed | decode | 4538 | 2000 | 11795.4 | 11633.0–12484.1 | 15375000 |
<!-- samples | goose-json | array-signed | encode | 6484.136,6461.945,6452.690,6459.293,6635.834,6623.932,6459.066 -->
| goose-json | array-signed | encode | 4537 | 2000 | 6461.9 | 6452.7–6635.8 | 68796382 |
<!-- samples | Goose DOM | array-signed | decode | 21595.019,21637.551,21450.680,21527.845,21679.493,21631.752,21586.063 -->
| Goose DOM | array-signed | decode | 4538 | 2000 | 21595.0 | 21450.7–21679.5 | 15390000 |
<!-- samples | goose-json | array-wide | decode | 34673.351,34715.846,34737.871,34478.881,34545.257,34721.922,34870.044 -->
| goose-json | array-wide | decode | 19771 | 2000 | 34715.8 | 34478.9–34870.0 | 26205000 |
<!-- samples | goose-json | array-wide | encode | 17515.923,17956.514,17399.772,17445.338,17482.376,17515.321,17543.725 -->
| goose-json | array-wide | encode | 19770 | 2000 | 17515.3 | 17399.8–17956.5 | 297316216 |
<!-- samples | Goose DOM | array-wide | decode | 56192.931,57607.069,56004.450,55849.785,56347.590,56359.451,56241.272 -->
| Goose DOM | array-wide | decode | 19771 | 2000 | 56241.3 | 55849.8–57607.1 | 15390000 |
<!-- samples | goose-json | mixed | decode | 2737.244,2911.099,2779.439,2853.782,2895.956,2835.972,2692.398 -->
| goose-json | mixed | decode | 1187 | 2000 | 2836.0 | 2692.4–2911.1 | 24255000 |
<!-- samples | goose-json | mixed | encode | 3001.309,3062.537,3025.970,2983.015,3032.439,3057.032,2897.602 -->
| goose-json | mixed | encode | 1186 | 2000 | 3026.0 | 2897.6–3062.5 | 19068985 |
<!-- samples | Goose DOM | mixed | decode | 3103.204,3112.651,3135.472,3134.854,3123.431,3129.561,3473.028 -->
| Goose DOM | mixed | decode | 1187 | 2000 | 3129.6 | 3103.2–3473.0 | 8865000 |
<!-- samples | goose-json | floats | decode | 5348.755,5344.115,5337.975,5382.090,5372.850,6446.075,5320.075 -->
| goose-json | floats | decode | 1581 | 200 | 5348.8 | 5320.1–6446.1 | 408000 |
<!-- samples | goose-json | floats | encode | 12095.485,12184.325,12089.160,12115.105,12102.730,12098.330,12059.680 -->
| goose-json | floats | encode | 1581 | 200 | 12098.3 | 12059.7–12184.3 | 2611368 |
<!-- samples | Goose DOM | floats | decode | 5874.840,5215.950,5249.745,5204.510,5196.510,5155.390,5135.050 -->
| Goose DOM | floats | decode | 1581 | 200 | 5204.5 | 5135.1–5874.8 | 412800 |
<!-- samples | goose-json | floats-wide | decode | 9165.770,9318.400,9204.165,9322.445,9289.760,9244.425,9354.630 -->
| goose-json | floats-wide | decode | 5975 | 200 | 9289.8 | 9165.8–9354.6 | 427200 |
<!-- samples | goose-json | floats-wide | encode | 12582.935,12649.060,13014.250,12576.945,12543.770,12591.125,12615.780 -->
| goose-json | floats-wide | encode | 5862 | 200 | 12591.1 | 12543.8–13014.3 | 9467432 |
<!-- samples | Goose DOM | floats-wide | decode | 17116.140,17241.295,17175.535,17290.630,17247.230,17217.950,17185.555 -->
| Goose DOM | floats-wide | decode | 5975 | 200 | 17218.0 | 17116.1–17290.6 | 412800 |
<!-- samples | goose-json | text-short | decode | 125.722,126.053,126.254,125.787,126.909,126.040,126.238 -->
| goose-json | text-short | decode | 97 | 20000 | 126.1 | 125.7–126.9 | 15087000 |
<!-- samples | goose-json | text-short | encode | 53.590,55.416,53.356,53.098,54.061,53.652,52.969 -->
| goose-json | text-short | encode | 97 | 20000 | 53.6 | 53.0–55.4 | 26788875 |
<!-- samples | Goose DOM | text-short | decode | 142.664,142.844,142.121,142.264,142.056,141.746,142.301 -->
| Goose DOM | text-short | decode | 97 | 20000 | 142.3 | 141.7–142.8 | 564000 |
<!-- samples | goose-json | text-sparse | decode | 2033.060,2031.820,2033.370,2048.765,2034.660,2045.210,2048.030 -->
| goose-json | text-sparse | decode | 8233 | 200 | 2034.7 | 2031.8–2048.8 | 13185600 |
<!-- samples | goose-json | text-sparse | encode | 1974.170,1978.720,1992.760,1989.070,1991.810,2005.920,2002.390 -->
| goose-json | text-sparse | encode | 8233 | 200 | 1991.8 | 1974.2–2005.9 | 13328096 |
<!-- samples | Goose DOM | text-sparse | decode | 16065.300,16057.965,16129.405,16088.060,16144.910,16209.870,16126.210 -->
| Goose DOM | text-sparse | decode | 8233 | 200 | 16126.2 | 16058.0–16209.9 | 13123200 |
<!-- samples | goose-json | text-ascii | decode | 1331.295,1336.525,1339.660,1332.415,1342.700,1328.740,1335.695 -->
| goose-json | text-ascii | decode | 8225 | 200 | 1335.7 | 1328.7–1342.7 | 13176000 |
<!-- samples | goose-json | text-ascii | encode | 901.140,915.515,916.570,910.530,905.930,909.160,925.990 -->
| goose-json | text-ascii | encode | 8225 | 200 | 910.5 | 901.1–926.0 | 13315296 |
<!-- samples | Goose DOM | text-ascii | decode | 7837.335,7848.320,7831.970,7812.930,7847.330,7829.855,7832.435 -->
| Goose DOM | text-ascii | decode | 8225 | 200 | 7832.4 | 7812.9–7848.3 | 6400 |
<!-- samples | goose-json | text-escaped | decode | 15606.050,15588.735,15689.675,15639.090,15914.260,15945.430,15806.010 -->
| goose-json | text-escaped | decode | 8737 | 200 | 15689.7 | 15588.7–15945.4 | 10718400 |
<!-- samples | goose-json | text-escaped | encode | 12147.225,12117.235,12165.325,12282.905,12209.120,12120.860,12094.850 -->
| goose-json | text-escaped | encode | 8737 | 200 | 12147.2 | 12094.9–12282.9 | 14162184 |
<!-- samples | Goose DOM | text-escaped | decode | 18022.040,17941.335,18468.400,18331.210,18002.700,18137.280,18125.885 -->
| Goose DOM | text-escaped | decode | 8737 | 200 | 18125.9 | 17941.3–18468.4 | 10656000 |
<!-- samples | goose-json | wide | decode | 489.531,504.066,498.593,494.623,499.681,511.630,510.152 -->
| goose-json | wide | decode | 135 | 4000 | 499.7 | 489.5–511.6 | 3480000 |
<!-- samples | goose-json | wide | encode | 200.446,208.912,181.993,182.424,181.676,180.688,183.905 -->
| goose-json | wide | encode | 135 | 4000 | 182.4 | 180.7–208.9 | 5479021 |
<!-- samples | Goose DOM | wide | decode | 382.487,383.868,382.451,381.447,385.623,385.652,385.377 -->
| Goose DOM | wide | decode | 135 | 4000 | 383.9 | 381.4–385.7 | 493000 |
