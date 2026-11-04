| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 75.282,69.839,68.438,89.397,78.815,73.037,70.258 -->
| goose-json | plain | decode | 38 | 200000 | 73.0 | 68.4–89.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 35.106,32.919,34.048,41.164,37.044,34.574,34.944 -->
| goose-json | plain | encode | 38 | 200000 | 34.9 | 32.9–41.2 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 57.934,55.598,58.839,65.015,61.415,57.341,57.592 -->
| Goose DOM | plain | decode | 38 | 200000 | 57.9 | 55.6–65.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 139.979,135.278,146.662,144.119,140.997,136.792,136.170 -->
| goose-json | escaped | decode | 62 | 200000 | 140.0 | 135.3–146.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 70.113,66.970,70.084,70.824,69.627,66.812,67.010 -->
| goose-json | escaped | encode | 54 | 200000 | 69.6 | 66.8–70.8 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 98.292,102.839,98.062,99.012,96.844,96.963,95.309 -->
| Goose DOM | escaped | decode | 62 | 200000 | 98.1 | 95.3–102.8 | 30822000 |
<!-- samples | goose-json | array | decode | 9222.091,9217.605,9343.886,9471.853,9410.147,9459.124,9616.334 -->
| goose-json | array | decode | 4022 | 20000 | 9410.1 | 9217.6–9616.3 | 288627000 |
<!-- samples | goose-json | array | encode | 4635.998,4168.870,4902.214,4318.293,4161.040,4202.832,4350.249 -->
| goose-json | array | encode | 4022 | 20000 | 4318.3 | 4161.0–4902.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 12900.854,13221.160,13785.240,12382.266,12932.584,12766.288,12500.222 -->
| Goose DOM | array | decode | 4022 | 20000 | 12900.9 | 12382.3–13785.2 | 144666000 |
<!-- samples | goose-json | floats | decode | 3293.852,3299.209,3307.724,3279.553,3435.468,3306.351,3188.555 -->
| goose-json | floats | decode | 1581 | 2000 | 3299.2 | 3188.6–3435.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 7548.763,7557.515,7548.427,7667.687,7587.763,7492.717,7274.011 -->
| goose-json | floats | encode | 1581 | 2000 | 7548.8 | 7274.0–7667.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3292.173,3314.988,3278.401,3437.334,3247.706,3237.916,3171.344 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3278.4 | 3171.3–3437.3 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 6444.315,6540.832,5985.833,5932.350,5962.337,6976.374,6191.440 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 6191.4 | 5932.4–6976.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8548.891,8672.545,8181.899,8006.749,8140.184,9401.485,8799.123 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8548.9 | 8006.7–9401.5 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 11296.981,11364.579,11380.459,10960.621,10729.624,11774.655,12079.932 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 11364.6 | 10729.6–12079.9 | 3870000 |
<!-- samples | goose-json | text-short | decode | 80.618,75.522,72.280,75.504,110.403,99.464,94.555 -->
| goose-json | text-short | decode | 97 | 200000 | 80.6 | 72.3–110.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 36.414,35.582,33.685,35.432,38.381,36.262,33.798 -->
| goose-json | text-short | encode | 97 | 200000 | 35.6 | 33.7–38.4 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 93.136,89.174,91.790,108.265,98.887,89.590,89.411 -->
| Goose DOM | text-short | decode | 97 | 200000 | 91.8 | 89.2–108.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1386.925,1385.092,1458.483,1438.110,1557.708,1429.701,1380.027 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1429.7 | 1380.0–1557.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1226.805,1224.915,1274.270,1283.917,1383.336,1272.613,1221.525 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1272.6 | 1221.5–1383.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 10095.640,10348.352,10481.695,11158.219,10738.219,10334.416,10087.744 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10348.4 | 10087.7–11158.2 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 851.337,851.769,850.863,851.296,850.496,851.690,849.539 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 851.3 | 849.5–851.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 541.912,543.184,542.819,542.327,543.841,543.463,543.297 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 543.2 | 541.9–543.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4883.814,4887.892,4884.283,4890.827,4881.823,4891.491,4889.377 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4887.9 | 4881.8–4891.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9752.853,12809.043,11582.534,10136.554,9971.649,11382.154,10094.359 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 10136.6 | 9752.9–12809.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7564.667,11056.094,8247.453,7720.847,7808.779,8172.319,7540.379 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7808.8 | 7540.4–11056.1 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13642.776,17372.586,13056.153,12379.505,14135.030,12687.756,12041.209 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 13056.2 | 12041.2–17372.6 | 99900000 |
<!-- samples | goose-json | wide | decode | 273.778,325.043,313.958,325.825,297.327,299.483,278.349 -->
| goose-json | wide | decode | 135 | 40000 | 299.5 | 273.8–325.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 111.860,130.970,121.686,117.094,110.988,108.310,113.841 -->
| goose-json | wide | encode | 135 | 40000 | 113.8 | 108.3–131.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 252.066,278.619,288.916,272.394,258.773,237.328,237.462 -->
| Goose DOM | wide | decode | 135 | 40000 | 258.8 | 237.3–288.9 | 4777000 |
