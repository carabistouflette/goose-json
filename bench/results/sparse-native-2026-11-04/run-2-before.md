| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 105.861,113.350,109.514,113.040,109.653,107.419,109.295 -->
| goose-json | plain | decode | 38 | 200000 | 109.5 | 105.9–113.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 40.316,43.523,43.238,41.748,41.010,41.699,41.368 -->
| goose-json | plain | encode | 38 | 200000 | 41.7 | 40.3–43.5 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 107.748,114.637,114.040,108.042,107.823,109.319,111.968 -->
| Goose DOM | plain | decode | 38 | 200000 | 109.3 | 107.7–114.6 | 5604000 |
<!-- samples | goose-json | escaped | decode | 203.809,199.421,191.431,192.536,196.096,194.204,202.714 -->
| goose-json | escaped | decode | 62 | 200000 | 196.1 | 191.4–203.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 96.197,93.950,90.332,90.380,96.025,92.274,96.451 -->
| goose-json | escaped | encode | 54 | 200000 | 93.9 | 90.3–96.5 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 151.091,139.791,142.778,146.269,152.950,144.664,152.884 -->
| Goose DOM | escaped | decode | 62 | 200000 | 146.3 | 139.8–153.0 | 30822000 |
<!-- samples | goose-json | array | decode | 8969.826,8872.777,9372.064,9878.751,9078.676,9350.294,9856.957 -->
| goose-json | array | decode | 4022 | 20000 | 9350.3 | 8872.8–9878.8 | 288627000 |
<!-- samples | goose-json | array | encode | 5472.010,5313.483,5525.341,5710.046,5454.635,5685.176,5983.819 -->
| goose-json | array | encode | 4022 | 20000 | 5525.3 | 5313.5–5983.8 | 574225548 |
<!-- samples | Goose DOM | array | decode | 21898.104,22727.387,22763.609,23143.104,21682.158,23659.242,23204.877 -->
| Goose DOM | array | decode | 4022 | 20000 | 22763.6 | 21682.2–23659.2 | 144666000 |
<!-- samples | goose-json | floats | decode | 5072.721,5067.570,5024.146,5094.378,4903.148,5237.536,4933.607 -->
| goose-json | floats | decode | 1581 | 2000 | 5067.6 | 4903.1–5237.5 | 3825000 |
<!-- samples | goose-json | floats | encode | 11202.388,11171.171,10776.280,10913.006,10670.044,11044.994,10687.802 -->
| goose-json | floats | encode | 1581 | 2000 | 10913.0 | 10670.0–11202.4 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6661.074,6546.158,6628.257,6242.283,6714.131,6412.904,6374.742 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6546.2 | 6242.3–6714.1 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8627.163,8915.872,8928.200,8982.967,8932.174,8651.363,8831.427 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8915.9 | 8627.2–8983.0 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11142.098,11457.248,11559.468,11663.897,22786.569,11263.698,11231.784 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11457.2 | 11142.1–22786.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17926.879,18250.415,18204.825,18232.417,18175.824,17605.658,17236.817 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 18175.8 | 17236.8–18250.4 | 3870000 |
<!-- samples | goose-json | text-short | decode | 117.138,112.231,116.162,115.618,118.720,122.789,111.054 -->
| goose-json | text-short | decode | 97 | 200000 | 116.2 | 111.1–122.8 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.134,43.637,46.184,44.273,44.163,43.738,43.900 -->
| goose-json | text-short | encode | 97 | 200000 | 43.9 | 43.1–46.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 175.598,173.979,183.000,179.167,178.480,171.947,172.693 -->
| Goose DOM | text-short | decode | 97 | 200000 | 175.6 | 171.9–183.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2327.553,2286.077,2313.385,2294.436,2296.443,2314.009,2378.523 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2313.4 | 2286.1–2378.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1923.117,1926.572,1922.896,1926.255,1955.673,1922.379,1954.926 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1926.3 | 1922.4–1955.7 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15179.602,14857.159,15132.106,15406.401,15280.004,15126.169,15201.483 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15179.6 | 14857.2–15406.4 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 855.619,838.171,856.428,831.485,887.360,918.581,930.271 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 856.4 | 831.5–930.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 497.186,492.127,492.399,499.519,513.673,525.790,525.594 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 499.5 | 492.1–525.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7092.146,7085.600,7123.189,7194.003,7339.673,7663.704,7465.203 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7194.0 | 7085.6–7663.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12993.765,13104.163,12720.753,12988.915,12751.865,12705.847,12803.772 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12803.8 | 12705.8–13104.2 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9905.673,9625.596,9658.567,9740.166,9568.856,9565.343,9589.621 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9625.6 | 9565.3–9905.7 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15109.153,14416.124,14704.156,14715.569,14673.521,14606.010,14637.760 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14673.5 | 14416.1–15109.2 | 99900000 |
<!-- samples | goose-json | wide | decode | 785.877,789.270,785.372,770.010,783.125,793.544,761.204 -->
| goose-json | wide | decode | 135 | 40000 | 785.4 | 761.2–793.5 | 33720000 |
<!-- samples | goose-json | wide | encode | 182.740,187.849,180.632,190.517,181.125,196.493,188.074 -->
| goose-json | wide | encode | 135 | 40000 | 187.8 | 180.6–196.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 434.803,431.263,434.033,440.685,433.030,431.788,429.027 -->
| Goose DOM | wide | decode | 135 | 40000 | 433.0 | 429.0–440.7 | 4777000 |
