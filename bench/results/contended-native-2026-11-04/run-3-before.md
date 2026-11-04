| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 115.058,118.079,110.611,118.656,115.741,109.868,112.609 -->
| goose-json | plain | decode | 38 | 200000 | 115.1 | 109.9–118.7 | 67248000 |
<!-- samples | goose-json | plain | encode | 44.700,45.563,45.266,43.035,44.283,43.090,43.323 -->
| goose-json | plain | encode | 38 | 200000 | 44.3 | 43.0–45.6 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 123.292,119.239,119.136,117.042,115.599,117.622,118.884 -->
| Goose DOM | plain | decode | 38 | 200000 | 118.9 | 115.6–123.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 213.193,213.842,218.339,219.426,226.757,226.872,222.600 -->
| goose-json | escaped | decode | 62 | 200000 | 219.4 | 213.2–226.9 | 85461000 |
<!-- samples | goose-json | escaped | encode | 105.467,106.304,107.167,105.132,107.982,106.013,105.511 -->
| goose-json | escaped | encode | 54 | 200000 | 106.0 | 105.1–108.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 161.155,164.735,165.257,161.542,167.853,163.300,161.437 -->
| Goose DOM | escaped | decode | 62 | 200000 | 163.3 | 161.2–167.9 | 30822000 |
<!-- samples | goose-json | array | decode | 9519.981,9596.930,9408.945,9395.002,9444.702,9734.486,9806.781 -->
| goose-json | array | decode | 4022 | 20000 | 9520.0 | 9395.0–9806.8 | 288627000 |
<!-- samples | goose-json | array | encode | 5624.512,5627.540,5582.517,5596.585,5620.750,5828.200,5789.092 -->
| goose-json | array | encode | 4022 | 20000 | 5624.5 | 5582.5–5828.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23721.266,23403.636,23441.727,23291.870,23433.328,24610.717,23280.156 -->
| Goose DOM | array | decode | 4022 | 20000 | 23433.3 | 23280.2–24610.7 | 144666000 |
<!-- samples | goose-json | floats | decode | 5007.047,4912.188,4933.523,4911.889,4915.552,4910.394,4957.233 -->
| goose-json | floats | decode | 1581 | 2000 | 4915.6 | 4910.4–5007.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 10224.199,10301.806,10163.058,10211.210,10294.281,10252.994,10365.249 -->
| goose-json | floats | encode | 1581 | 2000 | 10253.0 | 10163.1–10365.2 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6293.471,6348.850,6254.370,6260.401,6182.531,6252.104,6313.511 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6260.4 | 6182.5–6348.9 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8635.274,8614.034,8460.183,8603.073,8643.201,8610.041,8581.765 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8610.0 | 8460.2–8643.2 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11651.136,11801.030,11712.917,11709.178,11616.959,11746.029,11509.791 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11709.2 | 11509.8–11801.0 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17187.034,17335.096,17311.545,17549.083,17462.949,17280.268,17261.993 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17311.5 | 17187.0–17549.1 | 3870000 |
<!-- samples | goose-json | text-short | decode | 109.819,112.004,116.336,111.968,114.682,114.105,107.224 -->
| goose-json | text-short | decode | 97 | 200000 | 112.0 | 107.2–116.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.122,41.047,42.960,44.184,42.211,43.023,42.922 -->
| goose-json | text-short | encode | 97 | 200000 | 43.0 | 41.0–44.2 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 176.610,175.746,176.020,173.200,172.110,170.445,175.006 -->
| Goose DOM | text-short | decode | 97 | 200000 | 175.0 | 170.4–176.6 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2293.584,2358.977,2368.617,2361.409,2342.778,2318.110,2359.843 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2359.0 | 2293.6–2368.6 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1944.918,2020.810,1996.805,2000.899,1991.629,1991.880,1989.527 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1991.9 | 1944.9–2020.8 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15134.833,15352.552,15019.053,14954.379,14939.679,14733.943,15118.975 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15019.1 | 14733.9–15352.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 906.263,958.920,988.371,995.280,863.242,970.268,963.365 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 963.4 | 863.2–995.3 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 603.373,640.518,626.521,640.234,574.911,640.413,639.352 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 639.4 | 574.9–640.5 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7079.810,7155.284,6886.811,6918.815,7131.653,7055.725,7170.467 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7079.8 | 6886.8–7170.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13071.219,12724.645,12963.235,12925.089,12732.449,12881.160,13196.809 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12925.1 | 12724.6–13196.8 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10518.757,10664.015,10245.702,10175.611,10150.390,10191.463,10588.044 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10245.7 | 10150.4–10664.0 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15018.665,15171.070,14600.449,14585.901,14552.636,14621.681,14842.082 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14621.7 | 14552.6–15171.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 782.272,785.422,777.087,759.493,784.105,799.947,767.226 -->
| goose-json | wide | decode | 135 | 40000 | 782.3 | 759.5–799.9 | 33720000 |
<!-- samples | goose-json | wide | encode | 187.700,181.263,188.170,181.773,180.434,177.902,183.046 -->
| goose-json | wide | encode | 135 | 40000 | 181.8 | 177.9–188.2 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 433.805,434.755,432.658,432.523,435.368,433.195,442.808 -->
| Goose DOM | wide | decode | 135 | 40000 | 433.8 | 432.5–442.8 | 4777000 |
