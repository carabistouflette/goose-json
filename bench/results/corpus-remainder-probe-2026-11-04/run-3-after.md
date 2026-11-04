| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 78.788,75.104,74.629,99.937,98.550,96.336,97.650 -->
| goose-json | plain | decode | 38 | 200000 | 96.3 | 74.6–99.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 36.582,34.552,37.614,37.521,36.132,34.457,33.667 -->
| goose-json | plain | encode | 38 | 200000 | 36.1 | 33.7–37.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 56.613,55.208,57.935,57.540,55.297,55.318,53.292 -->
| Goose DOM | plain | decode | 38 | 200000 | 55.3 | 53.3–57.9 | 5604000 |
<!-- samples | goose-json | escaped | decode | 169.180,145.534,141.189,167.096,143.816,139.255,140.868 -->
| goose-json | escaped | decode | 62 | 200000 | 143.8 | 139.3–169.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 79.610,69.701,71.017,71.239,68.522,67.833,68.400 -->
| goose-json | escaped | encode | 54 | 200000 | 69.7 | 67.8–79.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 100.959,91.864,99.061,96.717,91.498,93.516,93.767 -->
| Goose DOM | escaped | decode | 62 | 200000 | 93.8 | 91.5–101.0 | 30822000 |
<!-- samples | goose-json | array | decode | 10433.123,9458.981,8436.261,10889.122,7611.799,8048.789,7824.084 -->
| goose-json | array | decode | 4022 | 20000 | 8436.3 | 7611.8–10889.1 | 288627000 |
<!-- samples | goose-json | array | encode | 4462.757,4121.651,4057.566,5073.863,4049.312,4333.438,4048.044 -->
| goose-json | array | encode | 4022 | 20000 | 4121.7 | 4048.0–5073.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 14717.457,12870.788,15078.714,11975.842,11461.169,11408.458,11882.978 -->
| Goose DOM | array | decode | 4022 | 20000 | 11975.8 | 11408.5–15078.7 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 7967.395,7726.908,7526.420,10689.257,7261.376,7187.958,7614.187 -->
| goose-json | array-signed | decode | 4538 | 20000 | 7614.2 | 7188.0–10689.3 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 5376.775,4828.432,4882.087,5222.585,4885.635,4696.873,4730.176 -->
| goose-json | array-signed | encode | 4537 | 20000 | 4882.1 | 4696.9–5376.8 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 13025.807,12723.774,16657.493,12602.026,12286.231,12401.282,12153.452 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 12602.0 | 12153.5–16657.5 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 21157.682,20815.212,22546.291,21685.255,21489.828,20995.711,21173.414 -->
| goose-json | array-wide | decode | 19771 | 20000 | 21173.4 | 20815.2–22546.3 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 18608.965,18738.473,18453.917,19218.335,18418.676,18914.380,19461.309 -->
| goose-json | array-wide | encode | 19770 | 20000 | 18738.5 | 18418.7–19461.3 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 34359.922,35329.087,35599.633,34916.612,34325.914,35321.013,40487.688 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 35321.0 | 34325.9–40487.7 | 144666000 |
<!-- samples | goose-json | mixed | decode | 1612.983,1686.905,1668.463,1678.169,1717.559,1620.461,1582.107 -->
| goose-json | mixed | decode | 1187 | 20000 | 1668.5 | 1582.1–1717.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 1791.635,1865.186,1922.113,2167.978,1834.851,1804.146,2021.253 -->
| goose-json | mixed | encode | 1186 | 20000 | 1865.2 | 1791.6–2168.0 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2020.824,2006.995,1952.443,2118.767,1875.942,1881.294,1997.374 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 1997.4 | 1875.9–2118.8 | 83331000 |
<!-- samples | goose-json | floats | decode | 3887.792,4188.706,6340.157,4785.217,4733.059,4642.099,5042.474 -->
| goose-json | floats | decode | 1581 | 2000 | 4733.1 | 3887.8–6340.2 | 3825000 |
<!-- samples | goose-json | floats | encode | 9086.460,10006.683,11367.351,10758.421,10748.141,10840.496,11631.057 -->
| goose-json | floats | encode | 1581 | 2000 | 10758.4 | 9086.5–11631.1 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4033.826,4685.895,4956.550,4759.635,4614.736,4899.429,5129.784 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4759.6 | 4033.8–5129.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8384.636,6152.840,5748.874,6028.968,5740.623,5727.716,5736.650 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 5748.9 | 5727.7–8384.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 9955.796,8241.366,8071.658,8112.730,7830.258,7836.539,7835.597 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 8071.7 | 7830.3–9955.8 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 11895.054,10816.631,11635.754,10961.862,10619.134,10645.147,10732.076 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 10816.6 | 10619.1–11895.1 | 3870000 |
<!-- samples | goose-json | text-short | decode | 80.423,88.130,86.675,80.431,79.261,79.961,101.394 -->
| goose-json | text-short | decode | 97 | 200000 | 80.4 | 79.3–101.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 34.957,35.319,34.924,34.372,34.987,37.073,42.875 -->
| goose-json | text-short | encode | 97 | 200000 | 35.0 | 34.4–42.9 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 96.399,97.419,89.949,88.772,86.302,101.199,116.593 -->
| Goose DOM | text-short | decode | 97 | 200000 | 96.4 | 86.3–116.6 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1489.195,1359.345,1509.516,1368.749,1961.492,1809.082,1504.122 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1504.1 | 1359.3–1961.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1436.546,1277.152,1448.357,1340.912,1855.782,1669.175,1442.608 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1442.6 | 1277.2–1855.8 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 11104.450,11550.006,11391.314,13112.585,14798.149,12999.822,11196.973 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 11550.0 | 11104.5–14798.1 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 896.279,869.146,897.769,862.597,933.415,932.104,965.020 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 897.8 | 862.6–965.0 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 564.601,543.880,565.034,544.835,588.566,591.547,630.830 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 565.0 | 543.9–630.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 5075.244,5031.606,5005.863,5045.689,5296.426,5287.958,6290.288 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 5075.2 | 5005.9–6290.3 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 11618.435,14463.416,14710.851,15516.586,14688.383,14155.836,13157.345 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14463.4 | 11618.4–15516.6 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 8093.999,11286.159,11476.690,12262.686,11310.937,10124.163,10480.881 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11286.2 | 8094.0–12262.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13774.413,17215.622,17420.303,18316.443,15861.377,13831.223,14891.901 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15861.4 | 13774.4–18316.4 | 99900000 |
<!-- samples | goose-json | wide | decode | 394.902,395.798,351.310,320.603,317.932,412.106,393.044 -->
| goose-json | wide | decode | 135 | 40000 | 393.0 | 317.9–412.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 152.875,137.911,135.516,124.331,120.478,153.485,133.961 -->
| goose-json | wide | encode | 135 | 40000 | 135.5 | 120.5–153.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 319.933,266.508,251.781,239.220,247.827,319.985,266.590 -->
| Goose DOM | wide | decode | 135 | 40000 | 266.5 | 239.2–320.0 | 4777000 |
