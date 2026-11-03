| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 118.298,119.374,115.762,115.309,111.688,113.895,112.099 -->
| goose-json | plain | decode | 38 | 200000 | 115.3 | 111.7–119.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 42.902,42.162,40.791,40.904,41.154,40.800,42.076 -->
| goose-json | plain | encode | 38 | 200000 | 41.2 | 40.8–42.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 116.745,118.160,114.107,114.771,115.892,116.082,120.303 -->
| Goose DOM | plain | decode | 38 | 200000 | 116.1 | 114.1–120.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 233.162,234.671,234.107,233.231,235.061,232.337,246.716 -->
| goose-json | escaped | decode | 62 | 200000 | 234.1 | 232.3–246.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 102.456,103.292,104.935,101.324,102.507,102.380,106.898 -->
| goose-json | escaped | encode | 54 | 200000 | 102.5 | 101.3–106.9 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 162.145,162.442,162.611,162.438,163.116,167.014,172.027 -->
| Goose DOM | escaped | decode | 62 | 200000 | 162.6 | 162.1–172.0 | 30822000 |
<!-- samples | goose-json | array | decode | 11077.643,9981.539,10018.901,10362.059,10175.363,10090.934,10003.943 -->
| goose-json | array | decode | 4022 | 20000 | 10090.9 | 9981.5–11077.6 | 288627000 |
<!-- samples | goose-json | array | encode | 6764.627,6311.569,6125.448,6662.033,6276.159,6663.810,6197.834 -->
| goose-json | array | encode | 4022 | 20000 | 6311.6 | 6125.4–6764.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23421.230,21865.278,22183.254,22312.145,22310.032,22444.289,21924.574 -->
| Goose DOM | array | decode | 4022 | 20000 | 22310.0 | 21865.3–23421.2 | 144666000 |
<!-- samples | goose-json | floats | decode | 6331.536,6247.220,6290.131,6293.913,6397.288,6495.838,6183.226 -->
| goose-json | floats | decode | 1581 | 2000 | 6293.9 | 6183.2–6495.8 | 3825000 |
<!-- samples | goose-json | floats | encode | 28933.767,29226.827,29038.669,29386.885,29510.022,29850.853,29573.315 -->
| goose-json | floats | encode | 1581 | 2000 | 29386.9 | 28933.8–29850.9 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6200.020,6199.083,6099.574,6109.533,6245.438,6043.930,6254.795 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6199.1 | 6043.9–6254.8 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 6696.817,6433.110,6710.193,6735.233,6636.013,6733.980,6704.112 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 6704.1 | 6433.1–6735.2 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 5306.611,5223.930,5372.295,5360.484,5248.418,5327.373,5323.666 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 5323.7 | 5223.9–5372.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 6841.457,7060.923,6740.765,7056.495,7179.021,7197.285,7165.761 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7060.9 | 6740.8–7197.3 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 36394.223,35806.370,36757.588,36735.197,36944.183,37097.205,37029.618 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 36757.6 | 35806.4–37097.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 32717.413,33349.635,33824.705,33327.493,33174.859,33347.637,32453.020 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 33327.5 | 32453.0–33824.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14371.586,14450.159,14452.918,14455.823,13884.624,14113.656,14029.336 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14371.6 | 13884.6–14455.8 | 99900000 |
<!-- samples | goose-json | wide | decode | 776.674,772.302,759.628,782.482,769.711,752.330,761.879 -->
| goose-json | wide | decode | 135 | 40000 | 769.7 | 752.3–782.5 | 33720000 |
<!-- samples | goose-json | wide | encode | 174.979,163.120,166.656,181.915,168.538,160.551,161.878 -->
| goose-json | wide | encode | 135 | 40000 | 166.7 | 160.6–181.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 412.095,411.559,412.438,397.816,421.084,417.905,423.052 -->
| Goose DOM | wide | decode | 135 | 40000 | 412.4 | 397.8–423.1 | 4777000 |
