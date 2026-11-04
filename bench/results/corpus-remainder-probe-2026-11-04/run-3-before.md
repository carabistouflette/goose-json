| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 113.614,113.483,113.380,113.525,113.269,112.750,113.568 -->
| goose-json | plain | decode | 38 | 200000 | 113.5 | 112.7–113.6 | 67248000 |
<!-- samples | goose-json | plain | encode | 51.608,52.483,53.150,52.573,53.562,52.285,50.769 -->
| goose-json | plain | encode | 38 | 200000 | 52.5 | 50.8–53.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 83.209,83.759,83.683,83.646,83.231,83.701,83.654 -->
| Goose DOM | plain | decode | 38 | 200000 | 83.7 | 83.2–83.8 | 5604000 |
<!-- samples | goose-json | escaped | decode | 219.503,218.422,220.752,218.812,217.861,217.821,220.102 -->
| goose-json | escaped | decode | 62 | 200000 | 218.8 | 217.8–220.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 107.820,106.611,107.441,107.098,106.771,107.013,107.776 -->
| goose-json | escaped | encode | 54 | 200000 | 107.1 | 106.6–107.8 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 147.135,146.148,148.877,144.292,146.822,146.833,145.834 -->
| Goose DOM | escaped | decode | 62 | 200000 | 146.8 | 144.3–148.9 | 30822000 |
<!-- samples | goose-json | array | decode | 11022.273,11273.194,12037.882,11458.857,11018.633,10863.561,10954.488 -->
| goose-json | array | decode | 4022 | 20000 | 11022.3 | 10863.6–12037.9 | 288627000 |
<!-- samples | goose-json | array | encode | 6103.658,6203.380,6417.356,6102.241,5793.236,5854.338,5788.941 -->
| goose-json | array | encode | 4022 | 20000 | 6102.2 | 5788.9–6417.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19476.219,19552.842,19392.687,19005.139,18542.026,18287.647,18499.182 -->
| Goose DOM | array | decode | 4022 | 20000 | 19005.1 | 18287.6–19552.8 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 10984.396,11050.211,10603.199,11833.337,11438.188,11375.374,10783.688 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11050.2 | 10603.2–11833.3 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6968.197,7381.911,7121.373,6956.861,6985.667,7621.925,7112.001 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7112.0 | 6956.9–7621.9 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 19542.714,20305.931,20195.021,18074.539,18025.303,18665.492,20483.690 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 19542.7 | 18025.3–20483.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32859.065,33149.573,32730.885,32183.637,31058.515,32668.404,24586.826 -->
| goose-json | array-wide | decode | 19771 | 20000 | 32668.4 | 24586.8–33149.6 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 28186.305,27854.302,28142.943,27384.338,27454.031,28514.129,20683.967 -->
| goose-json | array-wide | encode | 19770 | 20000 | 27854.3 | 20684.0–28514.1 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 52871.659,52722.505,50931.044,50234.059,52306.101,51333.002,35156.354 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 51333.0 | 35156.4–52871.7 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1630.841,1587.640,1625.177,1571.327,1569.183,1760.053,1616.633 -->
| goose-json | mixed | decode | 1187 | 20000 | 1616.6 | 1569.2–1760.1 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1771.162,1805.148,1793.394,1770.260,1773.106,1913.075,1774.495 -->
| goose-json | mixed | encode | 1186 | 20000 | 1774.5 | 1770.3–1913.1 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 1879.392,1932.271,1870.778,1854.942,1932.531,1961.532,1873.973 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1879.4 | 1854.9–1961.5 | 83331000 |
<!-- samples | goose-json | floats | decode | 3432.970,3302.905,3303.979,3879.870,4323.060,3591.059,3300.468 -->
| goose-json | floats | decode | 1581 | 2000 | 3433.0 | 3300.5–4323.1 | 3825000 |
<!-- samples | goose-json | floats | encode | 7747.086,7567.236,7897.286,9491.269,9054.846,7958.796,7577.497 -->
| goose-json | floats | encode | 1581 | 2000 | 7897.3 | 7567.2–9491.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3339.672,3232.860,3560.807,4215.105,3628.949,3314.207,3187.748 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3339.7 | 3187.7–4215.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 5496.083,5498.850,5516.332,5793.965,5946.319,5715.387,5557.107 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5557.1 | 5496.1–5946.3 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 7600.408,7784.609,7588.995,8142.222,7880.936,7844.458,7556.690 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 7784.6 | 7556.7–8142.2 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 10204.675,10198.637,10875.888,11345.283,10787.007,10371.479,10245.255 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10371.5 | 10198.6–11345.3 | 3870000 |
<!-- samples | goose-json | text-short | decode | 79.270,79.021,79.450,76.608,76.948,79.734,78.923 -->
| goose-json | text-short | decode | 97 | 200000 | 79.0 | 76.6–79.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 33.919,33.042,32.187,32.178,34.813,33.224,33.553 -->
| goose-json | text-short | encode | 97 | 200000 | 33.2 | 32.2–34.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 88.654,85.353,85.516,85.552,89.532,86.784,89.746 -->
| Goose DOM | text-short | decode | 97 | 200000 | 86.8 | 85.4–89.7 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1268.535,1268.101,1267.336,1225.532,1321.696,1282.283,1265.453 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1268.1 | 1225.5–1321.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1222.945,1222.069,1221.133,1177.147,1265.380,1224.911,1234.054 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1222.9 | 1177.1–1265.4 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 10101.178,10065.483,9702.557,9839.778,10252.465,10075.752,10092.390 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10075.8 | 9702.6–10252.5 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 859.686,872.124,895.739,859.490,861.569,862.037,830.875 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 861.6 | 830.9–895.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 542.163,534.419,565.086,544.927,541.516,543.818,521.887 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 542.2 | 521.9–565.1 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4876.779,5057.773,4898.288,4884.663,4884.315,4741.316,4713.328 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4884.3 | 4713.3–5057.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 9571.910,9322.523,9292.308,9479.283,9605.478,10094.806,9939.593 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 9571.9 | 9292.3–10094.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7379.288,7110.324,7108.512,7286.267,7249.342,7231.681,7107.720 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 7231.7 | 7107.7–7379.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 11109.057,10899.326,11616.459,11016.213,11158.382,10833.210,10868.062 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 11016.2 | 10833.2–11616.5 | 99900000 |
<!-- samples | goose-json | wide | decode | 307.381,328.091,305.585,306.029,309.234,310.844,312.722 -->
| goose-json | wide | decode | 135 | 40000 | 309.2 | 305.6–328.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 137.597,120.532,115.532,113.991,110.342,113.824,111.112 -->
| goose-json | wide | encode | 135 | 40000 | 114.0 | 110.3–137.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 245.597,240.918,237.612,230.923,230.957,233.626,229.201 -->
| Goose DOM | wide | decode | 135 | 40000 | 233.6 | 229.2–245.6 | 4777000 |
