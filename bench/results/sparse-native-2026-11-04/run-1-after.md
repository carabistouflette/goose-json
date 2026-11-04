| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 110.675,121.761,113.113,123.167,118.392,110.380,115.784 -->
| goose-json | plain | decode | 38 | 200000 | 115.8 | 110.4–123.2 | 67248000 |
<!-- samples | goose-json | plain | encode | 44.190,44.586,44.596,46.399,44.853,44.362,43.921 -->
| goose-json | plain | encode | 38 | 200000 | 44.6 | 43.9–46.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 115.301,114.285,115.826,116.146,121.043,113.926,115.133 -->
| Goose DOM | plain | decode | 38 | 200000 | 115.3 | 113.9–121.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 208.269,213.840,214.484,222.304,214.879,212.181,218.128 -->
| goose-json | escaped | decode | 62 | 200000 | 214.5 | 208.3–222.3 | 85461000 |
<!-- samples | goose-json | escaped | encode | 101.914,106.073,106.379,102.775,102.100,101.862,105.375 -->
| goose-json | escaped | encode | 54 | 200000 | 102.8 | 101.9–106.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 162.670,167.846,167.292,162.231,163.034,162.820,171.413 -->
| Goose DOM | escaped | decode | 62 | 200000 | 163.0 | 162.2–171.4 | 30822000 |
<!-- samples | goose-json | array | decode | 9707.276,9767.708,9855.929,9429.573,8805.223,9865.824,9602.186 -->
| goose-json | array | decode | 4022 | 20000 | 9707.3 | 8805.2–9865.8 | 288627000 |
<!-- samples | goose-json | array | encode | 6749.543,6686.456,6589.424,6425.674,5571.775,6830.005,6590.435 -->
| goose-json | array | encode | 4022 | 20000 | 6590.4 | 5571.8–6830.0 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23661.687,23758.474,23715.252,22495.858,22216.366,24005.479,25570.131 -->
| Goose DOM | array | decode | 4022 | 20000 | 23715.3 | 22216.4–25570.1 | 144666000 |
<!-- samples | goose-json | floats | decode | 5407.447,5251.867,5587.709,5297.245,5267.128,5231.471,5189.160 -->
| goose-json | floats | decode | 1581 | 2000 | 5267.1 | 5189.2–5587.7 | 3825000 |
<!-- samples | goose-json | floats | encode | 11125.424,10689.732,10689.671,10616.184,10671.982,10675.515,11224.847 -->
| goose-json | floats | encode | 1581 | 2000 | 10689.7 | 10616.2–11224.8 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6592.473,6626.958,6632.887,6623.012,6566.305,6521.507,6571.410 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6592.5 | 6521.5–6632.9 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8766.130,9282.105,8913.249,8989.817,8952.119,8727.793,9040.513 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8952.1 | 8727.8–9282.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11764.905,12064.367,11705.925,11799.247,11692.864,11427.107,11678.433 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11705.9 | 11427.1–12064.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 18649.250,18136.736,18107.397,17938.217,17954.537,17970.802,18074.736 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 18074.7 | 17938.2–18649.3 | 3870000 |
<!-- samples | goose-json | text-short | decode | 119.043,114.178,123.593,115.992,124.067,122.679,117.383 -->
| goose-json | text-short | decode | 97 | 200000 | 119.0 | 114.2–124.1 | 149907000 |
<!-- samples | goose-json | text-short | encode | 45.736,44.631,45.585,44.927,45.647,45.206,45.772 -->
| goose-json | text-short | encode | 97 | 200000 | 45.6 | 44.6–45.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 181.319,173.206,184.318,182.509,182.027,182.414,181.186 -->
| Goose DOM | text-short | decode | 97 | 200000 | 182.0 | 173.2–184.3 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1150.439,1136.756,1173.591,1140.212,1126.491,1199.609,1211.894 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1150.4 | 1126.5–1211.9 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 930.615,919.734,952.424,977.723,1005.380,1005.547,1000.770 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 977.7 | 919.7–1005.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15435.513,15560.547,15663.573,15887.842,15644.911,15552.917,16521.507 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15644.9 | 15435.5–16521.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 846.951,897.107,872.219,913.361,879.071,914.567,878.038 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 879.1 | 847.0–914.6 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 493.937,540.004,507.401,519.616,535.640,499.177,555.822 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 519.6 | 493.9–555.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7509.141,7498.153,7771.556,7547.502,7426.048,7499.115,7559.005 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7509.1 | 7426.0–7771.6 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13355.804,13387.201,14169.647,14147.712,13905.792,13441.331,13360.956 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13441.3 | 13355.8–14169.6 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10210.746,10324.457,10531.179,10735.443,10359.663,10145.058,10205.303 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10324.5 | 10145.1–10735.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15429.471,15657.343,15887.984,15780.735,15284.155,15235.179,15490.847 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15490.8 | 15235.2–15888.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 840.194,829.416,850.983,829.499,842.394,821.975,840.433 -->
| goose-json | wide | decode | 135 | 40000 | 840.2 | 822.0–851.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 232.655,234.286,221.500,216.009,222.023,210.414,224.915 -->
| goose-json | wide | encode | 135 | 40000 | 222.0 | 210.4–234.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 473.658,460.267,458.871,473.114,467.266,462.486,465.358 -->
| Goose DOM | wide | decode | 135 | 40000 | 465.4 | 458.9–473.7 | 4777000 |
