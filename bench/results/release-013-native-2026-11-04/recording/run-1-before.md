| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 175.218,146.411,135.002,114.326,113.863,114.264,121.495 -->
| goose-json | plain | decode | 38 | 200000 | 121.5 | 113.9–175.2 | 67248000 |
<!-- samples | goose-json | plain | encode | 73.032,63.621,57.965,55.922,53.489,54.373,55.497 -->
| goose-json | plain | encode | 38 | 200000 | 55.9 | 53.5–73.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 109.114,100.548,88.457,87.196,83.756,88.931,89.619 -->
| Goose DOM | plain | decode | 38 | 200000 | 88.9 | 83.8–109.1 | 5604000 |
<!-- samples | goose-json | escaped | decode | 224.671,220.688,236.005,261.670,234.768,286.044,303.987 -->
| goose-json | escaped | decode | 62 | 200000 | 236.0 | 220.7–304.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 113.189,110.101,126.678,114.317,124.568,139.349,141.684 -->
| goose-json | escaped | encode | 54 | 200000 | 124.6 | 110.1–141.7 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 147.678,154.904,188.654,158.579,181.340,205.363,363.630 -->
| Goose DOM | escaped | decode | 62 | 200000 | 181.3 | 147.7–363.6 | 30822000 |
<!-- samples | goose-json | array | decode | 12130.106,12185.547,11760.367,11985.249,12314.201,12120.377,11921.810 -->
| goose-json | array | decode | 4022 | 20000 | 12120.4 | 11760.4–12314.2 | 288627000 |
<!-- samples | goose-json | array | encode | 6488.403,6494.206,6051.672,6506.719,6365.966,6272.151,6425.214 -->
| goose-json | array | encode | 4022 | 20000 | 6425.2 | 6051.7–6506.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 20676.110,20884.501,20488.574,20397.131,20427.912,20057.650,19198.359 -->
| Goose DOM | array | decode | 4022 | 20000 | 20427.9 | 19198.4–20884.5 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11621.710,11787.176,12265.518,13154.545,11198.058,11834.216,11995.148 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11834.2 | 11198.1–13154.5 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 7760.116,7467.106,7230.523,7728.974,7222.852,7681.529,7994.716 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7681.5 | 7222.9–7994.7 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 20563.469,21206.418,21081.676,21842.797,21225.935,20935.535,21683.893 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 21206.4 | 20563.5–21842.8 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32434.513,34345.359,27549.428,30937.615,146579.505,32125.901,34403.053 -->
| goose-json | array-wide | decode | 19771 | 20000 | 32434.5 | 27549.4–146579.5 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 29413.013,31116.530,27502.215,27660.966,55702.411,24545.340,29355.156 -->
| goose-json | array-wide | encode | 19770 | 20000 | 29355.2 | 24545.3–55702.4 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 55368.464,50271.537,50957.226,56661.976,174731.008,47285.678,56848.579 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 55368.5 | 47285.7–174731.0 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2861.838,2581.009,8193.189,18144.759,7903.776,5947.511,2599.484 -->
| goose-json | mixed | decode | 1187 | 20000 | 5947.5 | 2581.0–18144.8 | 227997000 |
<!-- samples | goose-json | mixed | encode | 3116.422,2852.988,13646.321,18488.308,6275.273,3171.511,2912.082 -->
| goose-json | mixed | encode | 1186 | 20000 | 3171.5 | 2853.0–18488.3 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2897.189,4528.111,22053.469,16203.651,6157.290,2791.923,2912.724 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 4528.1 | 2791.9–22053.5 | 83331000 |
<!-- samples | goose-json | floats | decode | 6634.441,6188.416,6223.850,5431.334,5367.318,5401.547,5385.720 -->
| goose-json | floats | decode | 1581 | 2000 | 5431.3 | 5367.3–6634.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 14588.579,14598.427,13803.501,12120.879,11677.427,12177.338,12157.942 -->
| goose-json | floats | encode | 1581 | 2000 | 12177.3 | 11677.4–14598.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6078.355,6113.669,5361.370,5099.141,4974.033,5228.001,5275.233 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5275.2 | 4974.0–6113.7 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 9519.968,8918.594,8705.833,7473.637,7664.156,9113.823,9235.553 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8918.6 | 7473.6–9520.0 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 13271.087,11927.323,12066.463,10082.078,10560.191,12811.285,12187.834 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12066.5 | 10082.1–13271.1 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 18664.007,17026.787,15559.270,14494.120,16663.000,17752.043,14866.644 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16663.0 | 14494.1–18664.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 103.410,103.709,118.512,113.086,111.203,121.889,111.938 -->
| goose-json | text-short | decode | 97 | 200000 | 111.9 | 103.4–121.9 | 149907000 |
<!-- samples | goose-json | text-short | encode | 41.385,50.353,51.255,47.722,46.522,51.688,47.339 -->
| goose-json | text-short | encode | 97 | 200000 | 47.7 | 41.4–51.7 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 109.063,133.222,123.693,120.150,120.155,130.264,134.806 -->
| Goose DOM | text-short | decode | 97 | 200000 | 123.7 | 109.1–134.8 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1940.562,1936.474,2069.210,1920.220,1940.082,1972.922,2051.673 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1940.6 | 1920.2–2069.2 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1869.413,1901.415,1944.822,1837.492,1911.878,1849.617,1983.504 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1901.4 | 1837.5–1983.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15461.481,16213.985,15409.966,14872.129,15562.344,15456.172,16178.509 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15461.5 | 14872.1–16214.0 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1388.069,1389.901,1385.021,1394.784,1407.390,1306.102,1311.670 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1388.1 | 1306.1–1407.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 871.803,869.608,880.987,877.170,878.676,829.816,827.354 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 871.8 | 827.4–881.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7862.013,7858.096,7868.711,7846.945,7769.260,7421.096,7468.009 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7846.9 | 7421.1–7868.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13175.150,14963.475,12422.525,12097.426,11738.316,14860.970,13728.507 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13175.2 | 11738.3–14963.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9784.369,11037.390,9343.725,9157.419,8929.874,11753.321,9617.746 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9617.7 | 8929.9–11753.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 16021.477,15806.833,14247.186,14021.047,15777.837,17937.450,14532.688 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15777.8 | 14021.0–17937.5 | 99900000 |
<!-- samples | goose-json | wide | decode | 404.288,391.579,405.283,396.644,382.333,381.733,386.003 -->
| goose-json | wide | decode | 135 | 40000 | 391.6 | 381.7–405.3 | 33720000 |
<!-- samples | goose-json | wide | encode | 146.344,147.297,146.874,152.683,138.250,143.018,138.439 -->
| goose-json | wide | encode | 135 | 40000 | 146.3 | 138.2–152.7 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 301.239,299.062,303.669,297.890,284.664,294.736,306.886 -->
| Goose DOM | wide | decode | 135 | 40000 | 299.1 | 284.7–306.9 | 4777000 |
