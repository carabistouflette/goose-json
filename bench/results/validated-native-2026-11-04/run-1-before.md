| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 114.750,110.377,112.649,121.535,112.299,113.838,119.141 -->
| goose-json | plain | decode | 38 | 200000 | 113.8 | 110.4–121.5 | 67248000 |
<!-- samples | goose-json | plain | encode | 44.716,42.871,42.891,43.420,42.807,45.114,44.248 -->
| goose-json | plain | encode | 38 | 200000 | 43.4 | 42.8–45.1 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.977,120.742,121.320,122.988,123.001,123.872,126.572 -->
| Goose DOM | plain | decode | 38 | 200000 | 123.0 | 120.7–126.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 222.351,221.284,225.442,226.168,219.921,223.731,220.700 -->
| goose-json | escaped | decode | 62 | 200000 | 222.4 | 219.9–226.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 107.261,106.561,109.845,107.225,107.317,109.243,106.297 -->
| goose-json | escaped | encode | 54 | 200000 | 107.3 | 106.3–109.8 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 174.320,173.870,175.814,174.216,174.910,173.963,173.450 -->
| Goose DOM | escaped | decode | 62 | 200000 | 174.2 | 173.4–175.8 | 30822000 |
<!-- samples | goose-json | array | decode | 9939.038,9556.149,9977.657,9865.833,9531.712,9929.804,9441.073 -->
| goose-json | array | decode | 4022 | 20000 | 9865.8 | 9441.1–9977.7 | 288627000 |
<!-- samples | goose-json | array | encode | 6041.990,6029.632,6219.938,6154.399,5965.535,6178.882,6065.545 -->
| goose-json | array | encode | 4022 | 20000 | 6065.5 | 5965.5–6219.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 25899.341,25317.427,25224.723,24566.287,25069.607,25381.630,24449.570 -->
| Goose DOM | array | decode | 4022 | 20000 | 25224.7 | 24449.6–25899.3 | 144666000 |
<!-- samples | goose-json | floats | decode | 4918.082,4933.154,4955.377,5094.621,5231.219,5069.717,4924.966 -->
| goose-json | floats | decode | 1581 | 2000 | 4955.4 | 4918.1–5231.2 | 3825000 |
<!-- samples | goose-json | floats | encode | 10164.208,10136.747,10172.835,10801.280,10434.741,10395.137,10366.634 -->
| goose-json | floats | encode | 1581 | 2000 | 10366.6 | 10136.7–10801.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6487.758,6548.098,6582.053,6962.717,6667.237,6571.582,7010.563 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6582.1 | 6487.8–7010.6 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8878.358,8875.835,8763.061,8855.020,9067.534,9051.948,8869.941 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8875.8 | 8763.1–9067.5 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11979.283,12235.954,11661.620,12188.913,12174.318,12210.041,11837.061 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12174.3 | 11661.6–12236.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17791.121,18076.614,17681.908,18157.540,18607.993,18231.483,17547.017 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 18076.6 | 17547.0–18608.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 116.459,107.739,118.672,117.662,117.266,111.266,112.493 -->
| goose-json | text-short | decode | 97 | 200000 | 116.5 | 107.7–118.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.349,42.111,42.370,42.833,43.370,42.754,42.023 -->
| goose-json | text-short | encode | 97 | 200000 | 42.8 | 42.0–43.4 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 185.377,178.575,179.285,179.312,178.660,178.711,179.231 -->
| Goose DOM | text-short | decode | 97 | 200000 | 179.2 | 178.6–185.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2326.604,2322.090,2325.263,2382.406,2381.260,2388.702,2403.693 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2381.3 | 2322.1–2403.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 2006.281,1982.378,1991.350,2060.673,2075.005,2086.126,2098.608 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 2060.7 | 1982.4–2098.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15278.566,15180.547,15487.234,15751.240,15715.832,15733.920,15703.354 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15703.4 | 15180.5–15751.2 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 962.379,1006.600,1001.510,969.891,995.908,990.693,1020.112 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 995.9 | 962.4–1020.1 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 679.460,637.672,683.412,641.013,639.219,636.708,681.122 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 641.0 | 636.7–683.4 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7484.950,7397.252,7378.674,7552.092,7440.151,7352.383,7287.110 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7397.3 | 7287.1–7552.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13134.028,13095.257,12930.514,13407.359,13219.492,12721.578,12886.283 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13095.3 | 12721.6–13407.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10426.433,10442.556,10351.952,10187.901,10533.891,10216.668,10157.608 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10352.0 | 10157.6–10533.9 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15104.868,15057.867,14847.575,14789.367,14791.573,14665.708,14712.981 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14791.6 | 14665.7–15104.9 | 99900000 |
<!-- samples | goose-json | wide | decode | 818.140,761.574,794.868,774.584,823.189,813.905,817.354 -->
| goose-json | wide | decode | 135 | 40000 | 813.9 | 761.6–823.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 194.407,184.726,181.334,190.503,205.451,197.820,200.380 -->
| goose-json | wide | encode | 135 | 40000 | 194.4 | 181.3–205.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 409.517,406.796,406.286,429.829,434.108,431.271,432.077 -->
| Goose DOM | wide | decode | 135 | 40000 | 429.8 | 406.3–434.1 | 4777000 |
