| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 102.639,101.435,111.110,102.082,96.655,98.829,96.495 -->
| goose-json | plain | decode | 38 | 200000 | 101.4 | 96.5–111.1 | 67248000 |
<!-- samples | goose-json | plain | encode | 46.127,48.828,48.426,48.248,45.846,44.179,47.483 -->
| goose-json | plain | encode | 38 | 200000 | 47.5 | 44.2–48.8 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 73.613,78.561,75.465,73.464,71.045,69.285,72.800 -->
| Goose DOM | plain | decode | 38 | 200000 | 73.5 | 69.3–78.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 208.679,226.081,227.933,182.166,181.441,189.287,210.499 -->
| goose-json | escaped | decode | 62 | 200000 | 208.7 | 181.4–227.9 | 85461000 |
<!-- samples | goose-json | escaped | encode | 112.312,105.534,94.758,89.885,82.260,99.681,100.432 -->
| goose-json | escaped | encode | 54 | 200000 | 99.7 | 82.3–112.3 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 148.876,149.464,116.641,124.858,117.267,137.326,136.555 -->
| Goose DOM | escaped | decode | 62 | 200000 | 136.6 | 116.6–149.5 | 30822000 |
<!-- samples | goose-json | array | decode | 11181.230,12152.980,8378.043,9046.412,8909.750,12872.878,8965.011 -->
| goose-json | array | decode | 4022 | 20000 | 9046.4 | 8378.0–12872.9 | 288627000 |
<!-- samples | goose-json | array | encode | 5970.280,7843.010,4933.220,5410.624,5097.723,6177.695,5310.642 -->
| goose-json | array | encode | 4022 | 20000 | 5410.6 | 4933.2–7843.0 | 574225548 |
<!-- samples | Goose DOM | array | decode | 16795.587,18590.901,16570.563,17773.432,21116.716,18852.283,15811.090 -->
| Goose DOM | array | decode | 4022 | 20000 | 17773.4 | 15811.1–21116.7 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 9170.183,11296.951,11050.910,11765.570,12248.319,11215.731,10566.981 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11215.7 | 9170.2–12248.3 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 5720.145,5839.686,5865.896,6294.674,6125.987,5765.312,6164.866 -->
| goose-json | array-signed | encode | 4537 | 20000 | 5865.9 | 5720.1–6294.7 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 20052.607,22156.870,21529.115,21808.574,21869.662,19068.206,19829.298 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 21529.1 | 19068.2–22156.9 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 31333.708,29736.134,27425.032,26272.875,27694.975,31172.707,24486.532 -->
| goose-json | array-wide | decode | 19771 | 20000 | 27695.0 | 24486.5–31333.7 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 17238.491,13110.427,13623.613,12358.605,16544.796,12332.515,12021.723 -->
| goose-json | array-wide | encode | 19770 | 20000 | 13110.4 | 12021.7–17238.5 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 46129.458,41656.116,43780.850,40428.176,44232.867,42556.480,43328.926 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 43328.9 | 40428.2–46129.5 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2072.941,1877.722,1924.837,1938.330,1795.096,2302.586,2135.954 -->
| goose-json | mixed | decode | 1187 | 20000 | 1938.3 | 1795.1–2302.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2083.788,2088.021,2292.104,1854.320,1936.291,2571.116,2078.951 -->
| goose-json | mixed | encode | 1186 | 20000 | 2083.8 | 1854.3–2571.1 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2417.070,2283.249,2817.808,2151.384,2551.601,2755.773,2424.514 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2424.5 | 2151.4–2817.8 | 83331000 |
<!-- samples | goose-json | floats | decode | 3960.943,4342.097,4633.444,4195.352,3763.482,4105.578,3857.421 -->
| goose-json | floats | decode | 1581 | 2000 | 4105.6 | 3763.5–4633.4 | 3825000 |
<!-- samples | goose-json | floats | encode | 8674.150,10206.145,9603.421,9282.210,8759.883,8959.767,8192.272 -->
| goose-json | floats | encode | 1581 | 2000 | 8959.8 | 8192.3–10206.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3961.717,4826.475,4053.260,3994.050,3947.017,3889.976,3603.360 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3961.7 | 3603.4–4826.5 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 6858.418,7872.497,8957.556,7958.004,6461.554,6407.091,7446.587 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 7446.6 | 6407.1–8957.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 8970.858,10812.801,12013.421,10251.305,9156.745,9444.188,9467.387 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 9467.4 | 8970.9–12013.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 13508.453,15719.198,15879.933,12426.004,12317.040,13268.633,14905.023 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 13508.5 | 12317.0–15879.9 | 3870000 |
<!-- samples | goose-json | text-short | decode | 113.102,120.432,94.957,92.915,91.601,84.522,87.072 -->
| goose-json | text-short | decode | 97 | 200000 | 92.9 | 84.5–120.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 44.659,47.814,38.944,36.961,37.715,36.853,37.109 -->
| goose-json | text-short | encode | 97 | 200000 | 37.7 | 36.9–47.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 120.243,114.603,104.379,92.750,95.496,98.533,92.811 -->
| Goose DOM | text-short | decode | 97 | 200000 | 98.5 | 92.8–120.2 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1521.775,1503.344,1404.321,1440.401,1326.533,1318.069,1435.434 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1435.4 | 1318.1–1521.8 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1391.026,1326.769,1222.874,1273.661,1172.626,1170.891,1279.741 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1273.7 | 1170.9–1391.0 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 12714.008,11441.176,11726.880,10787.675,10504.160,10980.103,11860.388 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11441.2 | 10504.2–12714.0 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 955.241,947.034,965.107,930.606,897.825,896.495,861.845 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 930.6 | 861.8–965.1 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 584.490,589.985,586.963,564.085,565.329,563.320,541.383 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 565.3 | 541.4–590.0 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5290.277,5486.577,5291.938,5072.206,5076.699,5031.021,5113.500 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 5113.5 | 5031.0–5486.6 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 10511.836,10374.166,10543.475,15648.473,15859.093,17109.959,14253.958 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14254.0 | 10374.2–17110.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 7879.751,7394.583,10383.362,11589.728,12212.850,12493.859,9099.743 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10383.4 | 7394.6–12493.9 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 12822.717,11922.840,18184.247,18191.209,19544.801,17979.478,13547.794 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17979.5 | 11922.8–19544.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 387.702,351.896,404.802,428.995,413.607,375.296,347.429 -->
| goose-json | wide | decode | 135 | 40000 | 387.7 | 347.4–429.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 140.100,136.644,155.917,159.959,163.952,151.062,155.090 -->
| goose-json | wide | encode | 135 | 40000 | 155.1 | 136.6–164.0 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 294.415,285.582,355.231,346.878,318.657,288.450,288.403 -->
| Goose DOM | wide | decode | 135 | 40000 | 294.4 | 285.6–355.2 | 4777000 |
