| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 121.450,119.467,113.860,116.158,116.951,123.367,126.737 -->
| goose-json | plain | decode | 38 | 200000 | 119.5 | 113.9–126.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 46.032,44.672,45.567,44.743,45.916,45.717,46.900 -->
| goose-json | plain | encode | 38 | 200000 | 45.7 | 44.7–46.9 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 124.107,121.705,122.499,121.614,119.297,122.932,121.727 -->
| Goose DOM | plain | decode | 38 | 200000 | 121.7 | 119.3–124.1 | 5604000 |
<!-- samples | goose-json | escaped | decode | 220.132,214.550,214.132,212.402,216.122,211.357,212.935 -->
| goose-json | escaped | decode | 62 | 200000 | 214.1 | 211.4–220.1 | 85461000 |
<!-- samples | goose-json | escaped | encode | 104.320,103.593,102.824,100.820,100.955,101.063,103.982 -->
| goose-json | escaped | encode | 54 | 200000 | 102.8 | 100.8–104.3 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 160.377,160.765,163.165,161.857,166.457,160.585,168.504 -->
| Goose DOM | escaped | decode | 62 | 200000 | 161.9 | 160.4–168.5 | 30822000 |
<!-- samples | goose-json | array | decode | 9629.282,9957.748,9701.693,9884.296,10713.680,9579.889,9445.749 -->
| goose-json | array | decode | 4022 | 20000 | 9701.7 | 9445.7–10713.7 | 288627000 |
<!-- samples | goose-json | array | encode | 5887.551,6394.643,5585.890,5955.965,5963.699,5830.337,5575.077 -->
| goose-json | array | encode | 4022 | 20000 | 5887.6 | 5575.1–6394.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23868.514,23975.272,24125.768,24807.405,23404.807,23846.051,22541.678 -->
| Goose DOM | array | decode | 4022 | 20000 | 23868.5 | 22541.7–24807.4 | 144666000 |
<!-- samples | goose-json | floats | decode | 4915.009,4937.690,4958.412,4958.568,4901.132,4982.525,4954.857 -->
| goose-json | floats | decode | 1581 | 2000 | 4954.9 | 4901.1–4982.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 10566.419,10586.599,10687.726,10618.914,10573.458,10575.061,10605.174 -->
| goose-json | floats | encode | 1581 | 2000 | 10586.6 | 10566.4–10687.7 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6304.475,6364.350,6240.671,6243.097,6185.081,6201.354,6207.209 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6240.7 | 6185.1–6364.4 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8476.171,8369.303,8799.132,8495.354,8452.836,8581.656,8521.437 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8495.4 | 8369.3–8799.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 10899.222,11132.638,11234.933,11006.645,10999.289,11137.852,10984.570 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11006.6 | 10899.2–11234.9 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17192.018,18156.981,17451.472,17298.480,17304.477,17180.289,17318.377 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17304.5 | 17180.3–18157.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 117.817,111.634,109.418,116.263,117.269,113.513,116.520 -->
| goose-json | text-short | decode | 97 | 200000 | 116.3 | 109.4–117.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.240,43.088,43.187,43.858,44.269,43.069,43.358 -->
| goose-json | text-short | encode | 97 | 200000 | 43.2 | 43.1–44.3 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 173.852,172.051,172.406,173.267,171.972,175.364,172.266 -->
| Goose DOM | text-short | decode | 97 | 200000 | 172.4 | 172.0–175.4 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2336.838,2327.992,2326.387,2313.997,2622.416,2428.832,2433.967 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2336.8 | 2314.0–2622.4 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1930.591,1930.715,1931.400,2089.657,2062.123,1932.549,1928.812 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1931.4 | 1928.8–2089.7 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15075.793,15084.581,15668.396,15758.076,15789.865,15891.138,15919.859 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15758.1 | 15075.8–15919.9 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 823.138,888.493,827.304,819.509,845.296,864.709,824.469 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 827.3 | 819.5–888.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 493.635,493.084,504.659,502.177,500.180,503.012,648.802 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 502.2 | 493.1–648.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7584.421,7363.768,7532.787,7440.146,7590.557,7419.597,7491.069 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7491.1 | 7363.8–7590.6 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13371.291,13304.676,13396.878,13348.972,13271.230,13425.904,13152.370 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13349.0 | 13152.4–13425.9 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10043.810,10350.452,10048.765,10022.199,10067.144,10228.014,10000.535 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10048.8 | 10000.5–10350.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15293.367,15339.166,15185.896,15281.385,15232.860,15307.880,15126.776 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15281.4 | 15126.8–15339.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 809.818,794.196,810.971,820.764,792.607,798.682,821.471 -->
| goose-json | wide | decode | 135 | 40000 | 809.8 | 792.6–821.5 | 33720000 |
<!-- samples | goose-json | wide | encode | 182.324,194.331,192.459,198.574,188.845,195.855,184.718 -->
| goose-json | wide | encode | 135 | 40000 | 192.5 | 182.3–198.6 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 448.726,458.343,440.344,453.956,450.437,444.948,450.790 -->
| Goose DOM | wide | decode | 135 | 40000 | 450.4 | 440.3–458.3 | 4777000 |
