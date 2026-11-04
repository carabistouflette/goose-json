| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 113.366,113.074,113.571,113.423,113.564,113.300,113.653 -->
| goose-json | plain | decode | 38 | 200000 | 113.4 | 113.1–113.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 52.978,52.218,53.872,52.508,52.835,53.680,53.624 -->
| goose-json | plain | encode | 38 | 200000 | 53.0 | 52.2–53.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 84.016,84.020,83.754,83.738,83.881,84.034,83.983 -->
| Goose DOM | plain | decode | 38 | 200000 | 84.0 | 83.7–84.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 222.560,221.525,221.809,221.539,225.688,221.166,221.020 -->
| goose-json | escaped | decode | 62 | 200000 | 221.5 | 221.0–225.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 106.917,106.442,107.375,106.224,106.734,106.947,106.445 -->
| goose-json | escaped | encode | 54 | 200000 | 106.7 | 106.2–107.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 153.286,146.507,149.890,144.512,144.938,146.352,148.732 -->
| Goose DOM | escaped | decode | 62 | 200000 | 146.5 | 144.5–153.3 | 30822000 |
<!-- samples | goose-json | array | decode | 11403.578,11415.877,11346.158,11468.022,11544.621,11873.250,11579.239 -->
| goose-json | array | decode | 4022 | 20000 | 11468.0 | 11346.2–11873.3 | 288627000 |
<!-- samples | goose-json | array | encode | 6040.277,6038.115,6050.770,6044.666,6217.755,6047.542,6050.714 -->
| goose-json | array | encode | 4022 | 20000 | 6047.5 | 6038.1–6217.8 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19223.356,19191.306,19276.530,19694.947,18630.483,17742.432,17806.290 -->
| Goose DOM | array | decode | 4022 | 20000 | 19191.3 | 17742.4–19694.9 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11512.913,11304.416,11588.084,11527.587,11126.666,11248.135,11955.945 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11512.9 | 11126.7–11955.9 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 7370.336,7363.044,7363.155,7364.731,7386.182,7536.841,7374.445 -->
| goose-json | array-signed | encode | 4537 | 20000 | 7370.3 | 7363.0–7536.8 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 19098.950,18982.210,18943.652,18935.024,18936.793,19835.310,20475.476 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 18982.2 | 18935.0–20475.5 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32793.895,32667.945,33307.497,33417.898,34134.215,34700.127,34560.293 -->
| goose-json | array-wide | decode | 19771 | 20000 | 33417.9 | 32667.9–34700.1 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 28591.029,28631.446,28772.884,30493.503,29977.718,29976.253,30368.925 -->
| goose-json | array-wide | encode | 19770 | 20000 | 29976.3 | 28591.0–30493.5 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 53321.553,53747.212,53177.129,55463.483,55556.607,56017.417,57086.742 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 55463.5 | 53177.1–57086.7 | 144666000 |
<!-- samples | goose-json | mixed | decode | 3309.335,3228.263,2733.244,2738.066,2608.243,2744.361,2715.305 -->
| goose-json | mixed | decode | 1187 | 20000 | 2738.1 | 2608.2–3309.3 | 227997000 |
<!-- samples | goose-json | mixed | encode | 3658.577,3328.498,3004.620,3002.993,2937.233,2985.254,2945.926 -->
| goose-json | mixed | encode | 1186 | 20000 | 3003.0 | 2937.2–3658.6 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 3578.261,3033.327,2962.282,2950.380,2943.993,2966.831,2889.260 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2962.3 | 2889.3–3578.3 | 83331000 |
<!-- samples | goose-json | floats | decode | 5110.950,5170.340,5345.025,5328.618,5388.671,5385.261,5369.418 -->
| goose-json | floats | decode | 1581 | 2000 | 5345.0 | 5111.0–5388.7 | 3825000 |
<!-- samples | goose-json | floats | encode | 11969.724,11991.624,12242.051,12193.940,12168.589,12200.979,12214.254 -->
| goose-json | floats | encode | 1581 | 2000 | 12193.9 | 11969.7–12242.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 5243.435,5274.445,5275.846,5305.928,5328.988,5308.824,5163.921 -->
| Goose DOM | floats | decode | 1581 | 2000 | 5275.8 | 5163.9–5329.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 9511.778,9849.832,9521.513,9423.111,9735.746,9364.549,9769.251 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 9521.5 | 9364.5–9849.8 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 12760.133,12843.203,12769.968,13210.104,13667.836,12774.115,12729.883 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12774.1 | 12729.9–13667.8 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17728.136,17221.383,17277.273,18017.057,17631.207,17505.805,17291.288 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17505.8 | 17221.4–18017.1 | 3870000 |
<!-- samples | goose-json | text-short | decode | 130.288,129.392,129.811,129.917,130.059,129.551,129.455 -->
| goose-json | text-short | decode | 97 | 200000 | 129.8 | 129.4–130.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 54.271,55.437,54.721,54.375,54.262,55.082,54.524 -->
| goose-json | text-short | encode | 97 | 200000 | 54.5 | 54.3–55.4 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 142.817,142.855,142.291,143.001,143.208,142.080,143.076 -->
| Goose DOM | text-short | decode | 97 | 200000 | 142.9 | 142.1–143.2 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2063.030,2089.302,2056.972,2091.892,2039.521,2067.289,2086.609 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2067.3 | 2039.5–2091.9 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 2019.871,1977.488,1993.021,1981.775,1986.118,1997.806,2098.630 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1993.0 | 1977.5–2098.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 16163.764,16251.230,16139.843,16280.460,16161.349,16214.222,17125.887 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 16214.2 | 16139.8–17125.9 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1485.326,1382.243,1403.850,1395.415,1377.852,1380.060,1316.144 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1382.2 | 1316.1–1485.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 932.431,877.995,877.494,872.963,868.903,876.259,830.734 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 876.3 | 830.7–932.4 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 8279.258,7854.269,7852.092,7844.079,7835.784,7806.065,7764.752 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7844.1 | 7764.8–8279.3 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 15913.410,15935.503,16946.371,17036.343,17091.897,18713.335,17091.276 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 17036.3 | 15913.4–18713.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11720.225,11312.166,12061.569,11958.383,12392.458,13208.480,12180.335 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 12061.6 | 11312.2–13208.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 17472.715,17956.274,18608.044,18308.524,19143.446,18305.305,18197.734 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 18305.3 | 17472.7–19143.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 552.332,540.352,542.874,531.774,541.883,494.779,488.364 -->
| goose-json | wide | decode | 135 | 40000 | 540.4 | 488.4–552.3 | 33720000 |
<!-- samples | goose-json | wide | encode | 221.060,201.983,192.602,176.044,185.932,174.664,177.560 -->
| goose-json | wide | encode | 135 | 40000 | 185.9 | 174.7–221.1 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 385.191,385.547,385.946,376.136,361.380,364.627,351.470 -->
| Goose DOM | wide | decode | 135 | 40000 | 376.1 | 351.5–385.9 | 4777000 |
