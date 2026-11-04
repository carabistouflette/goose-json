| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 117.205,117.783,118.800,119.776,182.282,123.011,122.239 -->
| goose-json | plain | decode | 38 | 200000 | 119.8 | 117.2–182.3 | 67248000 |
<!-- samples | goose-json | plain | encode | 43.690,45.540,46.081,45.997,163.009,46.065,46.323 -->
| goose-json | plain | encode | 38 | 200000 | 46.1 | 43.7–163.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 121.765,121.149,120.675,122.456,445.216,124.036,123.255 -->
| Goose DOM | plain | decode | 38 | 200000 | 122.5 | 120.7–445.2 | 5604000 |
<!-- samples | goose-json | escaped | decode | 211.248,219.569,217.264,221.260,225.013,220.226,223.723 -->
| goose-json | escaped | decode | 62 | 200000 | 220.2 | 211.2–225.0 | 85461000 |
<!-- samples | goose-json | escaped | encode | 102.546,106.720,104.656,107.982,107.018,105.639,108.458 -->
| goose-json | escaped | encode | 54 | 200000 | 106.7 | 102.5–108.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 166.601,169.003,164.238,171.817,171.061,168.629,166.485 -->
| Goose DOM | escaped | decode | 62 | 200000 | 168.6 | 164.2–171.8 | 30822000 |
<!-- samples | goose-json | array | decode | 9800.931,9616.476,9829.290,9841.820,9841.153,9758.888,9407.776 -->
| goose-json | array | decode | 4022 | 20000 | 9800.9 | 9407.8–9841.8 | 288627000 |
<!-- samples | goose-json | array | encode | 6501.944,6683.206,6762.948,6853.280,6545.419,6489.966,6438.353 -->
| goose-json | array | encode | 4022 | 20000 | 6545.4 | 6438.4–6853.3 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23320.118,23718.231,23265.699,23428.061,23603.380,22460.910,24046.879 -->
| Goose DOM | array | decode | 4022 | 20000 | 23428.1 | 22460.9–24046.9 | 144666000 |
<!-- samples | goose-json | floats | decode | 4809.860,4827.096,4949.824,4960.063,4949.087,4898.008,4965.021 -->
| goose-json | floats | decode | 1581 | 2000 | 4949.1 | 4809.9–4965.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 10189.780,10325.278,10261.459,10280.717,10363.153,10292.579,10333.478 -->
| goose-json | floats | encode | 1581 | 2000 | 10292.6 | 10189.8–10363.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6574.151,6288.444,6396.462,6377.731,6343.649,6237.269,6291.208 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6343.6 | 6237.3–6574.2 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8673.618,8506.004,8465.812,8422.407,8438.707,8529.698,8431.199 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8465.8 | 8422.4–8673.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11754.815,11962.406,11560.638,11599.547,11672.561,11655.457,11612.263 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11655.5 | 11560.6–11962.4 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17367.842,17889.803,17191.089,17273.387,17467.662,17369.556,17203.807 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17367.8 | 17191.1–17889.8 | 3870000 |
<!-- samples | goose-json | text-short | decode | 115.215,118.744,123.018,109.399,116.717,120.531,115.209 -->
| goose-json | text-short | decode | 97 | 200000 | 116.7 | 109.4–123.0 | 149907000 |
<!-- samples | goose-json | text-short | encode | 42.975,42.655,42.883,42.839,42.714,43.153,42.712 -->
| goose-json | text-short | encode | 97 | 200000 | 42.8 | 42.7–43.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 173.421,172.560,172.585,172.738,172.573,172.689,172.521 -->
| Goose DOM | text-short | decode | 97 | 200000 | 172.6 | 172.5–173.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2320.941,2331.428,2324.482,2334.333,2298.463,2321.271,2295.083 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2321.3 | 2295.1–2334.3 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1983.763,1989.396,1991.851,1997.597,1988.124,2016.595,2001.210 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1991.9 | 1983.8–2016.6 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15140.026,15148.594,14928.646,15267.578,15114.309,15033.020,15090.425 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15114.3 | 14928.6–15267.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1001.496,996.399,1025.678,971.476,987.704,1055.972,1017.362 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1001.5 | 971.5–1056.0 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 684.315,643.648,639.555,641.895,640.651,649.592,657.045 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 643.6 | 639.6–684.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7289.464,7099.422,7104.824,7128.841,7182.634,7200.851,7284.340 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7182.6 | 7099.4–7289.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12735.237,12712.942,12840.732,12983.313,12797.753,12707.511,12939.884 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12797.8 | 12707.5–12983.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10168.473,10187.933,10210.539,10476.252,10264.091,10273.362,10208.208 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10210.5 | 10168.5–10476.3 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14605.822,14468.996,14663.776,15759.458,14529.245,14466.816,14686.559 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14605.8 | 14466.8–15759.5 | 99900000 |
<!-- samples | goose-json | wide | decode | 818.977,798.736,777.580,798.258,814.314,801.371,796.962 -->
| goose-json | wide | decode | 135 | 40000 | 798.7 | 777.6–819.0 | 33720000 |
<!-- samples | goose-json | wide | encode | 193.444,203.573,200.122,207.460,199.363,214.073,198.733 -->
| goose-json | wide | encode | 135 | 40000 | 200.1 | 193.4–214.1 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 456.440,443.361,430.534,431.312,439.364,453.549,433.460 -->
| Goose DOM | wide | decode | 135 | 40000 | 439.4 | 430.5–456.4 | 4777000 |
