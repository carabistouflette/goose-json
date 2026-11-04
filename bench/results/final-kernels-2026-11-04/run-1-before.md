| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 114.135,114.954,121.436,117.887,118.128,117.507,115.941 -->
| goose-json | plain | decode | 38 | 200000 | 117.5 | 114.1–121.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 42.396,43.207,42.181,41.620,42.463,42.757,42.542 -->
| goose-json | plain | encode | 38 | 200000 | 42.5 | 41.6–43.2 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 118.127,116.856,115.217,117.808,117.634,115.394,119.731 -->
| Goose DOM | plain | decode | 38 | 200000 | 117.6 | 115.2–119.7 | 5604000 |
<!-- samples | goose-json | escaped | decode | 238.638,245.836,234.700,240.469,238.841,237.765,236.446 -->
| goose-json | escaped | decode | 62 | 200000 | 238.6 | 234.7–245.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 105.107,106.044,102.193,103.418,104.146,102.955,102.867 -->
| goose-json | escaped | encode | 54 | 200000 | 103.4 | 102.2–106.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 162.860,162.139,160.215,160.493,163.134,159.919,161.561 -->
| Goose DOM | escaped | decode | 62 | 200000 | 161.6 | 159.9–163.1 | 30822000 |
<!-- samples | goose-json | array | decode | 10334.014,10329.159,10185.443,9668.801,11110.501,9976.812,9773.087 -->
| goose-json | array | decode | 4022 | 20000 | 10185.4 | 9668.8–11110.5 | 288627000 |
<!-- samples | goose-json | array | encode | 5617.335,5668.739,5602.847,5363.128,5389.369,5415.702,5351.782 -->
| goose-json | array | encode | 4022 | 20000 | 5415.7 | 5351.8–5668.7 | 574225548 |
<!-- samples | Goose DOM | array | decode | 22868.143,22968.475,21597.877,21682.068,21376.998,21759.150,21528.212 -->
| Goose DOM | array | decode | 4022 | 20000 | 21682.1 | 21377.0–22968.5 | 144666000 |
<!-- samples | goose-json | floats | decode | 6229.384,6270.238,6187.967,6271.673,6241.160,6083.742,6365.834 -->
| goose-json | floats | decode | 1581 | 2000 | 6241.2 | 6083.7–6365.8 | 3825000 |
<!-- samples | goose-json | floats | encode | 29810.098,28860.059,29063.164,29405.906,29131.625,28913.057,29361.010 -->
| goose-json | floats | encode | 1581 | 2000 | 29131.6 | 28860.1–29810.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5700.546,6230.241,6214.807,5878.956,5830.512,6207.287,6405.958 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6207.3 | 5700.5–6406.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 24999.268,25682.043,25287.056,24245.815,25054.901,25023.483,24767.677 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 25023.5 | 24245.8–25682.0 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 1063713.817,1089137.093,1070141.770,1058331.638,1068065.371,1078296.410,1073496.835 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 1070141.8 | 1058331.6–1089137.1 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16494.300,16879.410,16245.437,16271.079,16719.896,16540.939,16903.536 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16540.9 | 16245.4–16903.5 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 6807.586,6429.397,6543.176,6625.895,6290.407,6308.987,6396.012 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 6429.4 | 6290.4–6807.6 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 5137.380,5276.499,5079.141,5084.005,5091.408,5239.867,4973.259 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 5091.4 | 4973.3–5276.5 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6898.267,6904.510,7027.234,6943.221,6712.149,6890.493,6902.056 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6902.1 | 6712.1–7027.2 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 35669.220,35551.222,36036.829,37274.690,36093.022,35179.770,34470.653 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 35669.2 | 34470.7–37274.7 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 33687.255,32895.789,32833.821,33517.867,32906.601,33200.134,32257.240 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 32906.6 | 32257.2–33687.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14270.441,14316.147,14650.635,14123.811,14061.099,13808.122,13936.057 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14123.8 | 13808.1–14650.6 | 99900000 |
<!-- samples | goose-json | wide | decode | 744.326,731.340,748.083,777.458,744.814,757.279,763.022 -->
| goose-json | wide | decode | 135 | 40000 | 748.1 | 731.3–777.5 | 33720000 |
<!-- samples | goose-json | wide | encode | 187.471,196.530,198.625,199.047,201.739,170.858,173.218 -->
| goose-json | wide | encode | 135 | 40000 | 196.5 | 170.9–201.7 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 420.947,399.774,417.269,429.960,422.082,421.702,408.464 -->
| Goose DOM | wide | decode | 135 | 40000 | 420.9 | 399.8–430.0 | 4777000 |
