| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 121.359,120.313,113.692,113.920,114.214,120.100,120.050 -->
| goose-json | plain | decode | 38 | 200000 | 120.0 | 113.7–121.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 55.439,55.522,52.444,52.209,55.569,55.533,55.400 -->
| goose-json | plain | encode | 38 | 200000 | 55.4 | 52.2–55.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 88.705,88.259,83.691,83.623,89.541,88.620,87.192 -->
| Goose DOM | plain | decode | 38 | 200000 | 88.3 | 83.6–89.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 221.383,236.189,233.642,229.081,232.531,229.076,232.927 -->
| goose-json | escaped | decode | 62 | 200000 | 232.5 | 221.4–236.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 104.898,112.682,109.358,106.605,112.695,105.127,112.060 -->
| goose-json | escaped | encode | 54 | 200000 | 109.4 | 104.9–112.7 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 146.168,149.184,148.627,143.446,149.339,142.520,148.979 -->
| Goose DOM | escaped | decode | 62 | 200000 | 148.6 | 142.5–149.3 | 30822000 |
<!-- samples | goose-json | array | decode | 11958.768,11963.557,11959.257,11979.399,11510.321,11581.827,11674.083 -->
| goose-json | array | decode | 4022 | 20000 | 11958.8 | 11510.3–11979.4 | 288627000 |
<!-- samples | goose-json | array | encode | 6330.323,6201.313,11503.426,6527.400,6125.645,6103.251,6211.676 -->
| goose-json | array | encode | 4022 | 20000 | 6211.7 | 6103.3–11503.4 | 574225548 |
<!-- samples | Goose DOM | array | decode | 21146.940,21668.882,21893.783,23664.096,21202.592,22458.411,21614.413 -->
| Goose DOM | array | decode | 4022 | 20000 | 21668.9 | 21146.9–23664.1 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 12330.578,12220.906,12525.371,12091.258,12308.414,12100.183,11754.596 -->
| goose-json | array-signed | decode | 4538 | 20000 | 12220.9 | 11754.6–12525.4 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6502.619,6447.873,7148.986,6493.974,6524.023,6246.318,6252.702 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6494.0 | 6246.3–7149.0 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 23162.305,22739.031,22945.485,23153.903,23357.707,22814.002,22473.537 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 22945.5 | 22473.5–23357.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 33334.102,33259.131,33718.962,33211.182,32885.172,30936.819,35884.454 -->
| goose-json | array-wide | decode | 19771 | 20000 | 33259.1 | 30936.8–35884.5 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 17219.558,17482.209,17659.136,17596.490,18513.332,17352.900,14392.564 -->
| goose-json | array-wide | encode | 19770 | 20000 | 17482.2 | 14392.6–18513.3 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 53370.573,54348.610,54317.579,54019.099,54904.550,44083.819,45537.636 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 54019.1 | 44083.8–54904.5 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1996.307,2200.018,2280.571,1989.360,1795.854,2577.371,1921.443 -->
| goose-json | mixed | decode | 1187 | 20000 | 1996.3 | 1795.9–2577.4 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2190.033,2641.365,2264.560,1854.334,2229.402,2510.210,2009.110 -->
| goose-json | mixed | encode | 1186 | 20000 | 2229.4 | 1854.3–2641.4 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2188.294,2687.160,2393.357,2033.360,2899.593,2629.591,2094.782 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2393.4 | 2033.4–2899.6 | 83331000 |
<!-- samples | goose-json | floats | decode | 3332.881,3371.682,3323.974,3884.607,4287.938,4653.334,4986.551 -->
| goose-json | floats | decode | 1581 | 2000 | 3884.6 | 3324.0–4986.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 7675.898,7611.931,7591.329,8881.675,9533.204,10794.943,11376.122 -->
| goose-json | floats | encode | 1581 | 2000 | 8881.7 | 7591.3–11376.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3445.679,3354.887,3697.990,4111.087,4552.016,4870.560,5006.310 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4111.1 | 3354.9–5006.3 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 6565.565,8794.999,7877.700,8863.559,10612.023,11405.998,9528.026 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8863.6 | 6565.6–11406.0 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 9465.153,12017.785,11206.882,12028.478,15399.940,15494.713,12335.442 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12028.5 | 9465.2–15494.7 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 15312.737,16233.930,16224.217,17030.215,20699.541,19113.894,16203.889 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16233.9 | 15312.7–20699.5 | 3870000 |
<!-- samples | goose-json | text-short | decode | 117.974,122.511,118.212,92.420,90.679,83.075,93.430 -->
| goose-json | text-short | decode | 97 | 200000 | 93.4 | 83.1–122.5 | 149907000 |
<!-- samples | goose-json | text-short | encode | 49.896,51.208,47.679,39.113,36.865,36.035,38.550 -->
| goose-json | text-short | encode | 97 | 200000 | 39.1 | 36.0–51.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 124.479,129.059,112.442,106.001,93.086,96.115,98.073 -->
| Goose DOM | text-short | decode | 97 | 200000 | 106.0 | 93.1–129.1 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1645.270,1825.012,1920.269,1912.561,1920.523,1603.936,1545.225 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1825.0 | 1545.2–1920.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1459.104,1606.652,1700.131,1695.735,1696.837,1392.091,1323.848 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1606.7 | 1323.8–1700.1 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 13842.951,14416.680,15126.095,15298.872,14175.951,12810.145,11745.117 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 14176.0 | 11745.1–15298.9 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 979.360,1063.025,1110.031,1241.063,1233.860,1110.143,1055.887 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1110.0 | 979.4–1241.1 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 617.476,668.041,697.242,746.760,776.846,700.817,637.456 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 697.2 | 617.5–776.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5864.307,6118.885,6428.503,6792.199,6796.636,6085.000,5664.627 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6118.9 | 5664.6–6796.6 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 11184.400,9649.626,12687.898,12654.773,12178.850,11534.939,13685.164 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12178.9 | 9649.6–13685.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7758.515,7212.349,9100.404,9002.166,8239.324,9743.222,8711.632 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 8711.6 | 7212.3–9743.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 11975.528,13376.058,14635.369,15386.563,13007.808,17069.775,12729.920 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 13376.1 | 11975.5–17069.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 347.935,334.630,351.235,335.558,333.953,349.070,360.310 -->
| goose-json | wide | decode | 135 | 40000 | 347.9 | 334.0–360.3 | 33720000 |
<!-- samples | goose-json | wide | encode | 133.615,137.732,120.330,117.306,120.344,122.100,142.107 -->
| goose-json | wide | encode | 135 | 40000 | 122.1 | 117.3–142.1 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 271.041,260.797,268.791,260.338,281.232,277.709,283.254 -->
| Goose DOM | wide | decode | 135 | 40000 | 271.0 | 260.3–283.3 | 4777000 |
