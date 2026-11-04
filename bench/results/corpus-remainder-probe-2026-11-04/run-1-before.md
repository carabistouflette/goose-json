| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 119.003,120.216,120.885,120.836,121.255,121.358,120.853 -->
| goose-json | plain | decode | 38 | 200000 | 120.9 | 119.0–121.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 55.412,56.401,57.397,56.404,55.410,55.815,55.340 -->
| goose-json | plain | encode | 38 | 200000 | 55.8 | 55.3–57.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 88.827,88.918,88.931,88.868,89.175,89.293,88.786 -->
| Goose DOM | plain | decode | 38 | 200000 | 88.9 | 88.8–89.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 232.061,231.034,233.952,233.384,234.003,232.819,235.152 -->
| goose-json | escaped | decode | 62 | 200000 | 233.4 | 231.0–235.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 113.903,114.127,114.003,115.136,114.010,113.681,114.034 -->
| goose-json | escaped | encode | 54 | 200000 | 114.0 | 113.7–115.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 153.975,156.127,159.348,159.197,156.342,159.004,157.864 -->
| Goose DOM | escaped | decode | 62 | 200000 | 157.9 | 154.0–159.3 | 30822000 |
<!-- samples | goose-json | array | decode | 11828.783,11750.323,11910.741,11802.751,11873.101,11917.610,11897.663 -->
| goose-json | array | decode | 4022 | 20000 | 11873.1 | 11750.3–11917.6 | 288627000 |
<!-- samples | goose-json | array | encode | 6505.386,6411.755,6408.128,6445.090,6419.707,6413.560,6453.298 -->
| goose-json | array | encode | 4022 | 20000 | 6419.7 | 6408.1–6505.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 20565.195,20179.799,20504.244,20467.355,20448.171,20173.042,18882.576 -->
| Goose DOM | array | decode | 4022 | 20000 | 20448.2 | 18882.6–20565.2 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 12054.242,11962.370,12459.556,11259.172,11077.975,11214.272,11394.473 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11394.5 | 11078.0–12459.6 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 7805.599,7812.135,7372.681,7365.921,7376.034,7389.622,7398.208 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7389.6 | 7365.9–7812.1 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 21929.398,21981.056,20645.146,19126.888,18977.414,18991.779,18930.329 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19126.9 | 18930.3–21981.1 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 33020.147,68651.455,70744.092,54714.751,58480.373,72894.243,64547.856 -->
| goose-json | array-wide | decode | 19771 | 20000 | 64547.9 | 33020.1–72894.2 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 29837.686,58174.920,61527.448,34853.597,60569.683,61406.510,32025.282 -->
| goose-json | array-wide | encode | 19770 | 20000 | 58174.9 | 29837.7–61527.4 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 89823.881,109853.265,116060.976,56370.089,115475.492,114520.001,56358.241 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 109853.3 | 56358.2–116061.0 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2704.480,2760.144,2874.525,2759.622,2711.798,5358.983,5244.005 -->
| goose-json | mixed | decode | 1187 | 20000 | 2760.1 | 2704.5–5359.0 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2995.950,3004.212,6227.358,3043.357,3008.321,5899.181,6045.953 -->
| goose-json | mixed | encode | 1186 | 20000 | 3043.4 | 2995.9–6227.4 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 3173.530,3195.815,5027.043,3178.421,5331.986,5717.165,6801.758 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 5027.0 | 3173.5–6801.8 | 83331000 |
<!-- samples | goose-json | floats | decode | 10913.960,10604.093,10108.744,10479.246,11225.608,8745.306,9611.881 -->
| goose-json | floats | decode | 1581 | 2000 | 10479.2 | 8745.3–11225.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 23561.063,24245.003,24580.534,25003.009,26318.715,25128.643,25702.457 -->
| goose-json | floats | encode | 1581 | 2000 | 25003.0 | 23561.1–26318.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 11683.837,11960.815,10417.369,11877.356,10922.652,11379.442,10131.292 -->
| Goose DOM | floats | decode | 1581 | 2000 | 11379.4 | 10131.3–11960.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 18272.339,19030.996,18142.784,19199.612,18430.276,18752.039,18135.465 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 18430.3 | 18135.5–19199.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 25154.286,26070.142,26053.645,22904.874,24746.564,25492.951,25208.096 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 25208.1 | 22904.9–26070.1 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 35214.681,33218.952,34433.355,33060.857,34063.257,34881.910,31345.089 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 34063.3 | 31345.1–35214.7 | 3870000 |
<!-- samples | goose-json | text-short | decode | 254.071,252.834,258.400,259.638,259.215,259.598,254.505 -->
| goose-json | text-short | decode | 97 | 200000 | 258.4 | 252.8–259.6 | 149907000 |
<!-- samples | goose-json | text-short | encode | 109.380,100.189,111.430,116.982,104.431,110.916,112.328 -->
| goose-json | text-short | encode | 97 | 200000 | 110.9 | 100.2–117.0 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 288.610,283.370,287.750,276.296,283.136,285.299,288.056 -->
| Goose DOM | text-short | decode | 97 | 200000 | 285.3 | 276.3–288.6 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 3948.503,3999.677,5610.313,5717.823,4164.355,2077.885,2078.370 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 3999.7 | 2077.9–5717.8 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 4344.615,4338.005,3115.087,3417.761,4334.623,1984.187,1980.130 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 3417.8 | 1980.1–4344.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 32646.225,32559.414,32703.601,32702.168,17568.178,16238.630,16195.439 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 32559.4 | 16195.4–32703.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1390.277,1383.908,1321.475,1303.581,1321.894,1314.736,1325.704 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1321.9 | 1303.6–1390.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 867.856,872.647,821.648,820.506,818.391,823.212,820.359 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 821.6 | 818.4–872.6 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7863.034,7594.773,7435.218,7402.052,7400.286,7396.728,7468.782 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7435.2 | 7396.7–7863.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 15624.407,15583.917,15564.976,15834.329,15632.210,14648.307,14594.244 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 15583.9 | 14594.2–15834.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 12051.148,12114.968,12045.813,12172.875,11628.680,11241.647,11238.023 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 12045.8 | 11238.0–12172.9 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 18195.810,18213.578,18273.310,18073.420,17141.966,17369.813,17328.189 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 18073.4 | 17142.0–18273.3 | 99900000 |
<!-- samples | goose-json | wide | decode | 489.422,482.683,480.767,479.856,479.156,481.304,488.670 -->
| goose-json | wide | decode | 135 | 40000 | 481.3 | 479.2–489.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 175.435,177.079,175.517,174.473,180.034,180.507,176.853 -->
| goose-json | wide | encode | 135 | 40000 | 176.9 | 174.5–180.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 360.349,360.756,360.095,360.924,360.856,361.080,361.153 -->
| Goose DOM | wide | decode | 135 | 40000 | 360.9 | 360.1–361.2 | 4777000 |
