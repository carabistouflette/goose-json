| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 114.719,110.033,112.492,102.633,100.494,118.680,120.591 -->
| goose-json | plain | decode | 38 | 200000 | 112.5 | 100.5–120.6 | 67248000 |
<!-- samples | goose-json | plain | encode | 52.700,48.566,50.321,47.507,51.114,56.127,58.216 -->
| goose-json | plain | encode | 38 | 200000 | 51.1 | 47.5–58.2 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 80.324,82.288,77.074,75.444,84.114,89.029,89.527 -->
| Goose DOM | plain | decode | 38 | 200000 | 82.3 | 75.4–89.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 228.012,226.599,226.303,249.672,303.647,253.632,213.733 -->
| goose-json | escaped | decode | 62 | 200000 | 228.0 | 213.7–303.6 | 85461000 |
<!-- samples | goose-json | escaped | encode | 103.507,109.235,108.950,137.984,145.502,105.614,99.454 -->
| goose-json | escaped | encode | 54 | 200000 | 108.9 | 99.5–145.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 141.454,151.029,150.755,194.366,198.062,139.533,135.050 -->
| Goose DOM | escaped | decode | 62 | 200000 | 150.8 | 135.0–198.1 | 30822000 |
<!-- samples | goose-json | array | decode | 11623.798,12083.731,10882.835,11713.427,12081.586,11982.192,12145.550 -->
| goose-json | array | decode | 4022 | 20000 | 11982.2 | 10882.8–12145.6 | 288627000 |
<!-- samples | goose-json | array | encode | 5650.355,6150.681,5573.197,6290.583,6148.887,6307.691,6088.805 -->
| goose-json | array | encode | 4022 | 20000 | 6148.9 | 5573.2–6307.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19826.684,19012.037,19665.136,20203.332,20089.295,20160.110,16810.841 -->
| Goose DOM | array | decode | 4022 | 20000 | 19826.7 | 16810.8–20203.3 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11159.112,11116.956,10830.430,9655.726,11703.487,11252.209,10469.635 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11117.0 | 9655.7–11703.5 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6351.585,5186.272,6364.989,5551.022,6127.905,6046.627,4882.674 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6046.6 | 4882.7–6365.0 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 19891.629,18562.466,20829.479,20987.447,18511.640,20860.425,17853.393 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19891.6 | 17853.4–20987.4 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32377.858,31027.974,32646.625,32584.614,30095.336,29199.320,32243.140 -->
| goose-json | array-wide | decode | 19771 | 20000 | 32243.1 | 29199.3–32646.6 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 14199.208,17006.502,16059.693,15424.178,13587.637,16805.465,15022.274 -->
| goose-json | array-wide | encode | 19770 | 20000 | 15424.2 | 13587.6–17006.5 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 52758.444,51924.433,50568.780,55255.804,49741.060,50726.517,52520.340 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 51924.4 | 49741.1–55255.8 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2309.691,1932.850,2558.539,2531.786,2707.372,2405.934,2623.466 -->
| goose-json | mixed | decode | 1187 | 20000 | 2531.8 | 1932.9–2707.4 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2339.640,2355.123,2783.296,2763.503,2556.318,2741.088,2688.252 -->
| goose-json | mixed | encode | 1186 | 20000 | 2688.3 | 2339.6–2783.3 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2283.853,2804.461,2926.286,2939.053,2475.486,2721.565,2835.434 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2804.5 | 2283.9–2939.1 | 83331000 |
<!-- samples | goose-json | floats | decode | 5197.146,4886.534,4627.212,4964.389,5000.657,4438.506,3998.834 -->
| goose-json | floats | decode | 1581 | 2000 | 4886.5 | 3998.8–5197.1 | 3825000 |
<!-- samples | goose-json | floats | encode | 11104.835,11289.375,10580.661,11384.644,10988.475,9543.614,9062.902 -->
| goose-json | floats | encode | 1581 | 2000 | 10988.5 | 9062.9–11384.6 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4553.340,4478.315,4941.967,4875.828,4286.296,3920.088,3886.651 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4478.3 | 3886.7–4942.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7071.990,8847.063,9322.203,9343.185,8531.759,8413.118,8310.689 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8531.8 | 7072.0–9343.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 10577.756,12685.037,12671.915,12657.398,10824.837,12308.358,10770.492 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12308.4 | 10577.8–12685.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16128.810,17231.840,17296.474,16274.053,14476.193,15950.403,13556.014 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16128.8 | 13556.0–17296.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 125.692,155.218,148.540,151.922,146.113,148.738,138.802 -->
| goose-json | text-short | decode | 97 | 200000 | 148.5 | 125.7–155.2 | 149907000 |
<!-- samples | goose-json | text-short | encode | 47.137,53.979,50.708,53.763,48.594,50.156,45.100 -->
| goose-json | text-short | encode | 97 | 200000 | 50.2 | 45.1–54.0 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 134.820,138.072,139.807,139.283,122.743,135.301,113.004 -->
| Goose DOM | text-short | decode | 97 | 200000 | 135.3 | 113.0–139.8 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1583.271,1505.831,1762.897,1642.299,1580.820,1538.655,1624.368 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1583.3 | 1505.8–1762.9 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1511.782,1452.729,1738.406,1624.284,1545.099,1455.989,1510.915 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1511.8 | 1452.7–1738.4 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 12339.861,13869.283,13923.502,13101.920,12713.898,12297.987,14398.281 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 13101.9 | 12298.0–14398.3 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1327.825,1410.549,1375.505,1385.765,1396.516,1311.314,1297.689 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1375.5 | 1297.7–1410.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 836.091,885.596,875.522,877.364,877.346,823.314,785.615 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 875.5 | 785.6–885.6 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7643.270,7850.029,7725.148,7855.818,7647.037,7317.390,7031.983 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7647.0 | 7032.0–7855.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12925.113,14479.104,14957.621,13314.557,13766.549,14491.845,15144.410 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14479.1 | 12925.1–15144.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10578.987,11947.779,12511.663,10593.561,12097.810,11169.104,11858.768 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11858.8 | 10579.0–12511.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15096.176,17755.472,16719.430,14921.684,18024.429,17667.123,17081.356 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17081.4 | 14921.7–18024.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 504.185,479.499,473.680,435.663,386.201,355.543,371.484 -->
| goose-json | wide | decode | 135 | 40000 | 435.7 | 355.5–504.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 177.435,179.495,170.804,152.506,134.829,129.139,147.798 -->
| goose-json | wide | encode | 135 | 40000 | 152.5 | 129.1–179.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 361.743,363.893,359.953,305.776,279.387,268.030,321.737 -->
| Goose DOM | wide | decode | 135 | 40000 | 321.7 | 268.0–363.9 | 4777000 |
