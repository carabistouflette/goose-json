| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 108.715,112.308,109.990,108.911,104.853,117.334,101.313 -->
| goose-json | plain | decode | 38 | 200000 | 108.9 | 101.3–117.3 | 67248000 |
<!-- samples | goose-json | plain | encode | 40.151,42.880,40.254,41.471,41.013,43.577,43.117 -->
| goose-json | plain | encode | 38 | 200000 | 41.5 | 40.2–43.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 111.435,114.546,110.646,108.434,109.516,116.857,112.978 -->
| Goose DOM | plain | decode | 38 | 200000 | 111.4 | 108.4–116.9 | 5604000 |
<!-- samples | goose-json | escaped | decode | 209.785,199.608,201.087,197.602,198.363,204.584,191.911 -->
| goose-json | escaped | decode | 62 | 200000 | 199.6 | 191.9–209.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 97.697,97.778,98.028,97.272,96.335,95.451,99.351 -->
| goose-json | escaped | encode | 54 | 200000 | 97.7 | 95.5–99.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 156.899,152.874,155.400,150.706,153.301,152.314,151.899 -->
| Goose DOM | escaped | decode | 62 | 200000 | 152.9 | 150.7–156.9 | 30822000 |
<!-- samples | goose-json | array | decode | 8877.310,9020.842,9057.970,8929.193,8839.539,8820.093,8740.548 -->
| goose-json | array | decode | 4022 | 20000 | 8877.3 | 8740.5–9058.0 | 288627000 |
<!-- samples | goose-json | array | encode | 5260.121,5330.008,5304.155,5359.826,5364.891,5313.075,5251.202 -->
| goose-json | array | encode | 4022 | 20000 | 5313.1 | 5251.2–5364.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 21066.447,21291.768,21532.699,21147.005,21215.244,21867.572,21609.227 -->
| Goose DOM | array | decode | 4022 | 20000 | 21291.8 | 21066.4–21867.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 4675.320,4661.378,4811.293,4586.970,4591.907,4822.558,4597.586 -->
| goose-json | floats | decode | 1581 | 2000 | 4661.4 | 4587.0–4822.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 9593.966,10080.446,9854.528,9729.471,9413.478,10068.817,9654.356 -->
| goose-json | floats | encode | 1581 | 2000 | 9729.5 | 9413.5–10080.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5871.602,6073.132,5786.984,5762.404,5911.113,5914.257,6162.190 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5911.1 | 5762.4–6162.2 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7890.637,7927.297,8131.079,8098.366,7990.632,7938.834,7969.007 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 7969.0 | 7890.6–8131.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11107.538,11091.483,11294.585,11145.103,10425.239,10370.169,11111.796 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11107.5 | 10370.2–11294.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16252.489,16829.107,16367.132,16150.658,16354.490,15892.419,15584.685 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16252.5 | 15584.7–16829.1 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 813.372,825.332,766.034,926.718,856.366,897.288,788.271 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 825.3 | 766.0–926.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 700.841,708.140,709.491,735.355,805.993,807.883,704.160 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 709.5 | 700.8–807.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5816.118,5860.525,6003.768,6551.390,6476.417,6047.394,5851.872 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6003.8 | 5816.1–6551.4 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 10646.977,11301.182,12119.081,12565.454,12606.960,12250.578,12648.183 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12250.6 | 10647.0–12648.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 8351.729,9471.711,9620.345,9961.813,9648.481,9630.840,9715.953 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9630.8 | 8351.7–9961.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 12863.472,13817.586,13605.997,14207.447,14128.558,14273.212,14208.150 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14128.6 | 12863.5–14273.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 756.475,765.362,713.445,704.234,730.809,761.781,728.078 -->
| goose-json | wide | decode | 135 | 40000 | 730.8 | 704.2–765.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 218.878,229.067,226.849,235.259,177.955,228.225,232.830 -->
| goose-json | wide | encode | 135 | 40000 | 228.2 | 178.0–235.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 401.289,407.525,405.562,415.233,399.518,410.192,410.349 -->
| Goose DOM | wide | decode | 135 | 40000 | 407.5 | 399.5–415.2 | 4777000 |
