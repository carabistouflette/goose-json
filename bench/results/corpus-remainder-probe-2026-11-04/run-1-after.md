| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 120.893,117.714,112.264,111.666,114.190,114.608,114.258 -->
| goose-json | plain | decode | 38 | 200000 | 114.3 | 111.7–120.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 59.222,52.727,53.690,52.312,53.029,53.602,53.396 -->
| goose-json | plain | encode | 38 | 200000 | 53.4 | 52.3–59.2 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 91.566,83.879,83.752,83.847,83.890,83.874,83.808 -->
| Goose DOM | plain | decode | 38 | 200000 | 83.9 | 83.8–91.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 220.001,218.605,215.944,217.943,218.911,219.345,217.599 -->
| goose-json | escaped | decode | 62 | 200000 | 218.6 | 215.9–220.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 106.535,112.099,106.609,107.442,105.279,109.522,106.664 -->
| goose-json | escaped | encode | 54 | 200000 | 106.7 | 105.3–112.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 148.353,146.233,144.368,145.812,145.428,152.990,145.942 -->
| Goose DOM | escaped | decode | 62 | 200000 | 145.9 | 144.4–153.0 | 30822000 |
<!-- samples | goose-json | array | decode | 11513.863,11530.922,16188.251,23971.334,18681.973,19838.598,24405.294 -->
| goose-json | array | decode | 4022 | 20000 | 18682.0 | 11513.9–24405.3 | 288627000 |
<!-- samples | goose-json | array | encode | 5930.868,6023.171,11493.044,12893.319,12331.465,12076.781,11602.559 -->
| goose-json | array | encode | 4022 | 20000 | 11602.6 | 5930.9–12893.3 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19755.671,19277.807,30269.409,32792.572,25869.228,40962.896,37622.039 -->
| Goose DOM | array | decode | 4022 | 20000 | 30269.4 | 19277.8–40962.9 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 22230.223,21623.266,21661.680,21867.760,22472.774,23774.286,22216.738 -->
| goose-json | array-signed | decode | 4538 | 20000 | 22216.7 | 21623.3–23774.3 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 14152.650,14130.651,12679.570,14479.454,13479.054,14984.081,14568.958 -->
| goose-json | array-signed | encode | 4537 | 20000 | 14152.7 | 12679.6–14984.1 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 40483.100,39423.087,37725.029,40972.563,40423.206,39280.338,38658.295 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 39423.1 | 37725.0–40972.6 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 67276.555,61694.631,63920.421,32286.601,60127.696,53094.432,64092.722 -->
| goose-json | array-wide | decode | 19771 | 20000 | 61694.6 | 32286.6–67276.6 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 55224.064,62248.770,52819.015,28327.145,52094.060,52719.953,34249.471 -->
| goose-json | array-wide | encode | 19770 | 20000 | 52720.0 | 28327.1–62248.8 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 96427.883,107047.171,73960.907,89682.165,99420.368,95927.980,53797.401 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 95928.0 | 53797.4–107047.2 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2485.403,2591.384,5270.685,4934.619,4430.463,4060.873,4444.865 -->
| goose-json | mixed | decode | 1187 | 20000 | 4430.5 | 2485.4–5270.7 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2689.130,3859.396,5419.432,4919.484,5108.288,4456.916,5388.122 -->
| goose-json | mixed | encode | 1186 | 20000 | 4919.5 | 2689.1–5419.4 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2765.682,6385.570,5262.435,6772.845,5140.838,5038.213,4997.256 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 5140.8 | 2765.7–6772.8 | 83331000 |
<!-- samples | goose-json | floats | decode | 9208.327,10689.608,8626.989,8613.301,11279.665,12081.301,8989.410 -->
| goose-json | floats | decode | 1581 | 2000 | 9208.3 | 8613.3–12081.3 | 3825000 |
<!-- samples | goose-json | floats | encode | 22401.917,16531.790,16859.232,24789.998,23631.163,19392.367,23541.778 -->
| goose-json | floats | encode | 1581 | 2000 | 22401.9 | 16531.8–24790.0 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 7689.190,8721.085,7897.372,13264.778,9769.144,8535.000,9284.783 -->
| Goose DOM | floats | decode | 1581 | 2000 | 8721.1 | 7689.2–13264.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 15054.698,16205.254,12622.366,13399.344,13871.586,14557.811,11724.787 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 13871.6 | 11724.8–16205.3 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 22302.648,19633.939,19314.911,18411.230,18209.482,20146.260,18307.524 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 19314.9 | 18209.5–22302.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 28955.269,26512.392,23780.536,23745.601,25419.673,23484.540,24667.425 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 24667.4 | 23484.5–28955.3 | 3870000 |
<!-- samples | goose-json | text-short | decode | 193.579,172.407,172.602,202.688,202.317,196.052,195.251 -->
| goose-json | text-short | decode | 97 | 200000 | 195.3 | 172.4–202.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 63.535,76.122,85.640,83.975,82.218,62.979,64.233 -->
| goose-json | text-short | encode | 97 | 200000 | 76.1 | 63.0–85.6 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 204.221,201.008,204.795,204.588,208.454,204.042,225.540 -->
| Goose DOM | text-short | decode | 97 | 200000 | 204.6 | 201.0–225.5 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1569.362,2076.631,3176.431,4515.571,2757.206,4241.349,3112.273 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 3112.3 | 1569.4–4515.6 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 2648.338,3406.604,3743.556,2999.970,3286.316,1762.707,2522.331 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 3000.0 | 1762.7–3743.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 24183.653,26006.448,26256.270,25593.775,26043.890,26016.717,24327.745 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 26006.4 | 24183.7–26256.3 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1934.207,2568.053,2426.206,2062.407,2611.656,977.031,972.355 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 2062.4 | 972.4–2611.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 616.899,615.053,615.511,2215.968,1748.828,2028.665,2204.765 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 1748.8 | 615.1–2216.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 11383.915,10880.328,11551.031,9786.632,11422.050,11059.854,11240.405 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 11240.4 | 9786.6–11551.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 24280.539,28461.860,28029.946,26504.135,22968.253,25671.107,25724.922 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 25724.9 | 22968.3–28461.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 18362.500,19202.674,24493.442,16856.953,17452.734,20719.751,21363.540 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 19202.7 | 16857.0–24493.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 27655.517,32539.847,38528.824,27613.423,29363.369,30100.544,27482.422 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 29363.4 | 27482.4–38528.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 730.518,831.607,811.429,697.245,970.947,929.929,950.625 -->
| goose-json | wide | decode | 135 | 40000 | 831.6 | 697.2–970.9 | 33720000 |
<!-- samples | goose-json | wide | encode | 290.342,295.263,290.978,399.644,340.722,346.216,318.423 -->
| goose-json | wide | encode | 135 | 40000 | 318.4 | 290.3–399.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 610.370,587.793,643.797,577.312,756.521,799.749,741.733 -->
| Goose DOM | wide | decode | 135 | 40000 | 643.8 | 577.3–799.7 | 4777000 |
