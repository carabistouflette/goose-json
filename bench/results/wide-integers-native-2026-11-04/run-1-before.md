| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 142.923,120.575,120.672,120.675,136.002,120.622,120.975 -->
| goose-json | plain | decode | 38 | 200000 | 120.7 | 120.6–142.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 56.372,55.933,55.740,56.748,55.681,55.615,56.044 -->
| goose-json | plain | encode | 38 | 200000 | 55.9 | 55.6–56.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 89.021,88.825,89.421,88.854,89.042,89.005,88.889 -->
| Goose DOM | plain | decode | 38 | 200000 | 89.0 | 88.8–89.4 | 5604000 |
<!-- samples | goose-json | escaped | decode | 237.813,263.814,253.749,237.346,236.704,257.859,242.859 -->
| goose-json | escaped | decode | 62 | 200000 | 242.9 | 236.7–263.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 112.705,113.110,113.535,112.630,113.789,112.715,113.391 -->
| goose-json | escaped | encode | 54 | 200000 | 113.1 | 112.6–113.8 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 161.376,157.664,160.134,156.324,161.959,156.834,155.044 -->
| Goose DOM | escaped | decode | 62 | 200000 | 157.7 | 155.0–162.0 | 30822000 |
<!-- samples | goose-json | array | decode | 11894.981,11789.822,11696.782,11715.754,11979.367,12022.241,11845.871 -->
| goose-json | array | decode | 4022 | 20000 | 11845.9 | 11696.8–12022.2 | 288627000 |
<!-- samples | goose-json | array | encode | 6463.678,6473.426,6408.617,6407.752,6413.005,6589.814,6464.948 -->
| goose-json | array | encode | 4022 | 20000 | 6463.7 | 6407.8–6589.8 | 574225548 |
<!-- samples | Goose DOM | array | decode | 20631.896,20615.373,20112.323,18967.607,20120.214,20753.963,20676.653 -->
| Goose DOM | array | decode | 4022 | 20000 | 20615.4 | 18967.6–20754.0 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 12678.510,13048.633,11743.271,12074.541,11742.713,12081.871,11925.262 -->
| goose-json | array-signed | decode | 4538 | 20000 | 12074.5 | 11742.7–13048.6 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 7798.020,7797.051,7338.174,8237.343,7345.010,7365.593,7372.201 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7372.2 | 7338.2–8237.3 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 22000.678,21828.929,20173.680,19033.107,19173.910,19025.394,18979.548 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19173.9 | 18979.5–22000.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32841.730,32823.177,36841.113,36359.728,38047.859,33842.505,33147.719 -->
| goose-json | array-wide | decode | 19771 | 20000 | 33842.5 | 32823.2–38047.9 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 28622.266,30716.111,28685.923,29059.899,28626.794,29309.534,28761.855 -->
| goose-json | array-wide | encode | 19770 | 20000 | 28761.9 | 28622.3–30716.1 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 53139.897,54899.064,53770.288,53142.337,54193.971,56688.937,54062.852 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 54062.9 | 53139.9–56688.9 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2541.572,2531.272,2531.139,2547.291,2552.506,2562.048,2595.829 -->
| goose-json | mixed | decode | 1187 | 20000 | 2547.3 | 2531.1–2595.8 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2818.617,2820.243,2816.408,2828.925,2817.284,2813.773,2824.299 -->
| goose-json | mixed | encode | 1186 | 20000 | 2818.6 | 2813.8–2828.9 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2976.160,2994.029,2985.538,2982.941,2981.428,2987.238,3014.698 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2985.5 | 2976.2–3014.7 | 83331000 |
<!-- samples | goose-json | floats | decode | 5047.115,5061.864,5027.030,5053.123,5021.730,5023.350,5022.747 -->
| goose-json | floats | decode | 1581 | 2000 | 5027.0 | 5021.7–5061.9 | 3825000 |
<!-- samples | goose-json | floats | encode | 11454.611,11468.067,11471.305,11472.663,11459.432,11626.423,11495.289 -->
| goose-json | floats | encode | 1581 | 2000 | 11471.3 | 11454.6–11626.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4978.740,4932.207,4948.023,4988.163,4950.303,5028.152,4901.133 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4950.3 | 4901.1–5028.2 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8825.156,8677.022,8768.836,9250.376,8723.025,9368.001,9347.663 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8825.2 | 8677.0–9368.0 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 12033.784,12048.275,12390.829,12785.008,12060.932,12839.677,12858.202 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12390.8 | 12033.8–12858.2 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16499.695,16309.920,17214.949,17001.615,16424.369,17414.607,17677.422 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17001.6 | 16309.9–17677.4 | 3870000 |
<!-- samples | goose-json | text-short | decode | 129.367,122.959,122.017,122.862,122.643,120.501,123.086 -->
| goose-json | text-short | decode | 97 | 200000 | 122.9 | 120.5–129.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 53.742,51.012,52.327,52.194,52.578,52.157,52.278 -->
| goose-json | text-short | encode | 97 | 200000 | 52.3 | 51.0–53.7 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 135.212,134.796,135.068,134.609,134.890,135.188,134.786 -->
| Goose DOM | text-short | decode | 97 | 200000 | 134.9 | 134.6–135.2 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1915.281,1935.353,1966.450,1951.882,1966.174,1967.315,1925.034 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1951.9 | 1915.3–1967.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1882.662,1860.169,1861.239,1881.197,1873.056,1859.755,1884.252 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1873.1 | 1859.8–1884.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15301.600,15265.600,15295.433,15261.755,15249.119,15292.311,15273.782 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15273.8 | 15249.1–15301.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1300.010,1308.326,1308.243,1313.255,1353.505,1346.487,1350.457 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1313.3 | 1300.0–1353.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 822.944,822.598,823.846,828.171,831.111,826.159,826.986 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 826.2 | 822.6–831.1 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7472.015,7389.730,7428.375,7438.087,7394.407,7409.577,7428.744 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7428.4 | 7389.7–7472.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 16979.246,16629.445,16353.085,16323.870,16291.023,16868.272,17369.925 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 16629.4 | 16291.0–17369.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 12068.708,11946.158,11953.407,11866.582,12150.477,12145.924,12647.259 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 12068.7 | 11866.6–12647.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 18334.842,18331.362,18396.219,17277.057,18485.730,19207.485,18157.249 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 18334.8 | 17277.1–19207.5 | 99900000 |
<!-- samples | goose-json | wide | decode | 514.057,507.973,522.082,552.206,530.626,551.410,550.503 -->
| goose-json | wide | decode | 135 | 40000 | 530.6 | 508.0–552.2 | 33720000 |
<!-- samples | goose-json | wide | encode | 193.375,190.804,191.633,187.297,187.790,188.855,183.201 -->
| goose-json | wide | encode | 135 | 40000 | 188.9 | 183.2–193.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 383.478,384.105,387.475,385.110,382.605,384.926,383.116 -->
| Goose DOM | wide | decode | 135 | 40000 | 384.1 | 382.6–387.5 | 4777000 |
