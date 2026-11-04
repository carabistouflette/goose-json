| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 109.483,104.648,108.391,111.519,112.299,112.366,113.853 -->
| goose-json | plain | decode | 38 | 200000 | 111.5 | 104.6–113.9 | 67248000 |
<!-- samples | goose-json | plain | encode | 42.949,43.098,44.716,42.897,42.950,43.973,42.891 -->
| goose-json | plain | encode | 38 | 200000 | 43.0 | 42.9–44.7 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 122.493,119.863,119.828,120.826,121.098,120.501,121.657 -->
| Goose DOM | plain | decode | 38 | 200000 | 120.8 | 119.8–122.5 | 5604000 |
<!-- samples | goose-json | escaped | decode | 216.223,213.495,213.448,214.757,212.237,213.094,214.255 -->
| goose-json | escaped | decode | 62 | 200000 | 213.5 | 212.2–216.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 101.644,102.469,104.094,101.930,102.624,101.803,101.939 -->
| goose-json | escaped | encode | 54 | 200000 | 101.9 | 101.6–104.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 165.515,165.985,165.074,165.600,165.310,165.368,165.292 -->
| Goose DOM | escaped | decode | 62 | 200000 | 165.4 | 165.1–166.0 | 30822000 |
<!-- samples | goose-json | array | decode | 9406.943,16698.195,18544.838,19105.327,18813.146,18606.357,19282.898 -->
| goose-json | array | decode | 4022 | 20000 | 18606.4 | 9406.9–19282.9 | 288627000 |
<!-- samples | goose-json | array | encode | 6428.637,12658.459,12703.161,12714.278,12588.425,12285.123,12596.801 -->
| goose-json | array | encode | 4022 | 20000 | 12596.8 | 6428.6–12714.3 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24613.918,48027.999,48246.005,47879.740,47658.332,48531.923,47350.342 -->
| Goose DOM | array | decode | 4022 | 20000 | 47879.7 | 24613.9–48531.9 | 144666000 |
<!-- samples | goose-json | floats | decode | 9017.974,8424.327,10299.249,9288.427,10842.952,10880.813,11192.103 -->
| goose-json | floats | decode | 1581 | 2000 | 10299.2 | 8424.3–11192.1 | 3825000 |
<!-- samples | goose-json | floats | encode | 21677.176,20957.734,22361.513,18920.481,22149.360,22260.445,22332.881 -->
| goose-json | floats | encode | 1581 | 2000 | 22149.4 | 18920.5–22361.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 13319.944,14672.373,12087.064,14046.081,13130.343,13514.685,13071.091 -->
| Goose DOM | floats | decode | 1581 | 2000 | 13319.9 | 12087.1–14672.4 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 18020.157,17639.503,18322.173,17095.584,17034.585,17447.877,17710.267 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 17639.5 | 17034.6–18322.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 23728.158,21469.121,21619.244,21855.731,21964.911,22949.333,22521.840 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 21964.9 | 21469.1–23728.2 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 32810.974,35830.281,35981.789,36737.189,35295.884,34666.349,37441.568 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 35830.3 | 32811.0–37441.6 | 3870000 |
<!-- samples | goose-json | text-short | decode | 244.426,235.414,242.264,225.859,240.590,236.315,216.592 -->
| goose-json | text-short | decode | 97 | 200000 | 236.3 | 216.6–244.4 | 149907000 |
<!-- samples | goose-json | text-short | encode | 81.828,79.222,85.572,86.072,91.170,78.475,93.105 -->
| goose-json | text-short | encode | 97 | 200000 | 85.6 | 78.5–93.1 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 376.289,368.748,379.409,362.399,374.021,377.394,373.074 -->
| Goose DOM | text-short | decode | 97 | 200000 | 374.0 | 362.4–379.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 5458.801,5491.636,4054.643,4057.194,5474.785,6175.995,5261.273 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 5458.8 | 4054.6–6176.0 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 3412.394,4487.356,3906.056,4904.106,2566.171,3478.740,4126.316 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 3906.1 | 2566.2–4904.1 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 30394.790,31953.671,31987.149,30330.687,32180.260,31348.612,35224.075 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 31953.7 | 30330.7–35224.1 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 2013.238,2307.756,1679.974,1281.658,2027.145,2008.614,1983.042 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 2008.6 | 1281.7–2307.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 1933.918,522.447,798.636,1612.159,1935.960,1928.625,1940.691 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 1928.6 | 522.4–1940.7 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 14810.576,15206.042,15800.472,13974.147,14076.449,14072.659,13887.682 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 14076.4 | 13887.7–15800.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 26518.792,26249.057,25079.627,26680.894,26526.531,26626.916,26849.341 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 26526.5 | 25079.6–26849.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 19652.886,19852.287,18851.703,20896.788,19656.818,20403.776,18679.765 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 19656.8 | 18679.8–20896.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 31702.021,32397.119,30544.097,30663.207,30595.857,29786.503,29585.394 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 30595.9 | 29585.4–32397.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 1549.486,1573.629,1583.967,1510.249,1520.290,1627.836,1584.030 -->
| goose-json | wide | decode | 135 | 40000 | 1573.6 | 1510.2–1627.8 | 33720000 |
<!-- samples | goose-json | wide | encode | 435.667,375.367,456.944,482.396,530.399,501.841,511.953 -->
| goose-json | wide | encode | 135 | 40000 | 482.4 | 375.4–530.4 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 846.517,875.058,847.303,871.827,775.044,863.704,850.318 -->
| Goose DOM | wide | decode | 135 | 40000 | 850.3 | 775.0–875.1 | 4777000 |
