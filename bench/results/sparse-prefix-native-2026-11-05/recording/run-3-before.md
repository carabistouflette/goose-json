| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 113.010,142.468,132.027,112.528,109.106,115.764,135.439 -->
| goose-json | plain | decode | 38 | 200000 | 115.8 | 109.1–142.5 | 67248000 |
<!-- samples | goose-json | plain | encode | 52.929,54.005,48.266,41.745,43.004,47.364,49.928 -->
| goose-json | plain | encode | 38 | 200000 | 48.3 | 41.7–54.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 85.986,76.985,73.145,63.547,66.462,78.671,83.719 -->
| Goose DOM | plain | decode | 38 | 200000 | 77.0 | 63.5–86.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 232.239,248.206,273.766,665.679,219.620,217.657,200.461 -->
| goose-json | escaped | decode | 62 | 200000 | 232.2 | 200.5–665.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 103.232,109.721,133.128,121.799,102.522,101.933,90.873 -->
| goose-json | escaped | encode | 54 | 200000 | 103.2 | 90.9–133.1 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 141.540,151.768,189.877,151.669,139.806,139.250,137.046 -->
| Goose DOM | escaped | decode | 62 | 200000 | 141.5 | 137.0–189.9 | 30822000 |
<!-- samples | goose-json | array | decode | 11406.919,11453.722,12184.252,12882.719,11437.980,8662.099,8429.046 -->
| goose-json | array | decode | 4022 | 20000 | 11438.0 | 8429.0–12882.7 | 288627000 |
<!-- samples | goose-json | array | encode | 6417.261,5956.140,6542.628,6320.712,5125.230,4065.966,4429.177 -->
| goose-json | array | encode | 4022 | 20000 | 5956.1 | 4066.0–6542.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 18434.310,18432.305,22683.250,18702.269,18832.481,14109.973,15665.051 -->
| Goose DOM | array | decode | 4022 | 20000 | 18434.3 | 14110.0–22683.2 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11784.679,10385.110,9175.942,10400.443,9835.247,10191.674,8167.427 -->
| goose-json | array-signed | decode | 4538 | 20000 | 10191.7 | 8167.4–11784.7 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 5120.977,5223.618,5040.196,5855.812,5727.215,6699.853,4532.604 -->
| goose-json | array-signed | encode | 4537 | 20000 | 5223.6 | 4532.6–6699.9 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 19327.691,16261.415,18977.166,17985.786,14592.529,18194.424,14481.362 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 17985.8 | 14481.4–19327.7 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 24100.935,23973.265,34473.777,25690.558,32694.002,32691.821,35701.957 -->
| goose-json | array-wide | decode | 19771 | 20000 | 32691.8 | 23973.3–35702.0 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 17267.316,12472.196,16481.054,13705.089,17711.622,16913.479,18074.788 -->
| goose-json | array-wide | encode | 19770 | 20000 | 16913.5 | 12472.2–18074.8 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 48281.471,47100.115,44053.141,46785.599,56318.643,54506.733,49701.041 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 48281.5 | 44053.1–56318.6 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2479.942,2053.345,2412.299,2553.704,2176.912,1819.395,1933.524 -->
| goose-json | mixed | decode | 1187 | 20000 | 2176.9 | 1819.4–2553.7 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2606.413,2091.325,2679.332,2612.567,2069.423,1964.918,1997.757 -->
| goose-json | mixed | encode | 1186 | 20000 | 2091.3 | 1964.9–2679.3 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2509.670,2167.597,2774.591,2546.583,1981.762,1960.911,2033.146 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2167.6 | 1960.9–2774.6 | 83331000 |
<!-- samples | goose-json | floats | decode | 3650.185,3457.771,3518.108,3453.132,3714.890,3466.563,3919.689 -->
| goose-json | floats | decode | 1581 | 2000 | 3518.1 | 3453.1–3919.7 | 3825000 |
<!-- samples | goose-json | floats | encode | 8041.748,8081.495,7856.492,7966.655,8062.171,7653.024,8540.488 -->
| goose-json | floats | encode | 1581 | 2000 | 8041.7 | 7653.0–8540.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 3278.439,3440.185,3318.375,3590.474,3280.041,3595.974,3717.996 -->
| Goose DOM | floats | decode | 1581 | 2000 | 3440.2 | 3278.4–3718.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7137.296,8172.080,7823.334,6835.798,6203.913,6372.587,7355.365 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 7137.3 | 6203.9–8172.1 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 10583.632,11307.445,10734.445,8887.015,8276.550,9002.384,11709.490 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 10583.6 | 8276.5–11709.5 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 15993.038,14144.484,13781.872,11634.297,11163.844,12239.586,15167.441 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 13781.9 | 11163.8–15993.0 | 3870000 |
<!-- samples | goose-json | text-short | decode | 108.182,121.467,122.635,118.044,121.001,96.783,83.280 -->
| goose-json | text-short | decode | 97 | 200000 | 118.0 | 83.3–122.6 | 149907000 |
<!-- samples | goose-json | text-short | encode | 48.842,51.027,53.959,52.638,50.437,38.353,34.589 -->
| goose-json | text-short | encode | 97 | 200000 | 50.4 | 34.6–54.0 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 127.377,138.811,132.355,139.996,120.390,96.048,89.349 -->
| Goose DOM | text-short | decode | 97 | 200000 | 127.4 | 89.3–140.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1265.634,1273.918,1270.766,1270.921,1272.152,1267.074,1267.391 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1270.8 | 1265.6–1273.9 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1226.069,1218.675,1226.526,1218.086,1220.064,1222.154,1222.264 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1222.2 | 1218.1–1226.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 10071.082,10063.794,10084.856,10067.908,10088.170,10064.457,10062.804 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 10067.9 | 10062.8–10088.2 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 861.554,864.809,863.426,866.425,858.889,897.861,939.884 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 864.8 | 858.9–939.9 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 543.156,546.985,542.083,543.938,544.027,564.941,614.452 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 544.0 | 542.1–614.5 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 4897.492,4882.699,4902.216,4884.306,5043.547,5126.180,5914.991 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 4902.2 | 4882.7–5915.0 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 14473.933,10651.731,10602.239,10248.897,11990.320,13052.534,15696.411 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 11990.3 | 10248.9–15696.4 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10085.436,8299.771,7952.289,8294.788,8667.511,11240.627,12275.436 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 8667.5 | 7952.3–12275.4 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13631.834,12837.516,12911.570,13501.724,13775.560,17336.962,18273.056 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 13631.8 | 12837.5–18273.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 569.712,447.171,421.515,410.352,459.521,500.265,467.102 -->
| goose-json | wide | decode | 135 | 40000 | 459.5 | 410.4–569.7 | 33720000 |
<!-- samples | goose-json | wide | encode | 178.338,155.569,146.663,147.439,171.988,183.467,157.529 -->
| goose-json | wide | encode | 135 | 40000 | 157.5 | 146.7–183.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 361.770,325.158,307.830,328.497,362.257,375.908,319.388 -->
| Goose DOM | wide | decode | 135 | 40000 | 328.5 | 307.8–375.9 | 4777000 |
