| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 113.847,106.861,105.210,112.301,117.406,108.908,111.488 -->
| goose-json | plain | decode | 38 | 200000 | 111.5 | 105.2–117.4 | 67248000 |
<!-- samples | goose-json | plain | encode | 42.885,43.013,43.102,43.465,45.984,42.839,43.181 -->
| goose-json | plain | encode | 38 | 200000 | 43.1 | 42.8–46.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 122.599,120.201,120.560,123.390,124.216,121.124,120.861 -->
| Goose DOM | plain | decode | 38 | 200000 | 121.1 | 120.2–124.2 | 5604000 |
<!-- samples | goose-json | escaped | decode | 216.259,212.326,211.191,219.759,214.744,218.027,210.040 -->
| goose-json | escaped | decode | 62 | 200000 | 214.7 | 210.0–219.8 | 85461000 |
<!-- samples | goose-json | escaped | encode | 97.496,99.563,102.220,102.414,98.774,100.007,99.352 -->
| goose-json | escaped | encode | 54 | 200000 | 99.6 | 97.5–102.4 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 167.589,167.505,173.144,168.137,171.472,167.636,170.168 -->
| Goose DOM | escaped | decode | 62 | 200000 | 168.1 | 167.5–173.1 | 30822000 |
<!-- samples | goose-json | array | decode | 9817.170,9398.326,9419.702,9393.996,9487.916,9452.875,9430.297 -->
| goose-json | array | decode | 4022 | 20000 | 9430.3 | 9394.0–9817.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5673.823,5643.578,5636.740,5653.955,5687.748,5687.982,5687.273 -->
| goose-json | array | encode | 4022 | 20000 | 5673.8 | 5636.7–5688.0 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24558.526,24611.852,24790.996,24643.289,24643.376,24755.367,25621.672 -->
| Goose DOM | array | decode | 4022 | 20000 | 24643.4 | 24558.5–25621.7 | 144666000 |
<!-- samples | goose-json | floats | decode | 4982.435,5221.609,4909.812,5093.638,5103.927,4911.529,5119.675 -->
| goose-json | floats | decode | 1581 | 2000 | 5093.6 | 4909.8–5221.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 10798.322,10961.678,10669.657,10517.163,10695.614,10717.209,11268.294 -->
| goose-json | floats | encode | 1581 | 2000 | 10717.2 | 10517.2–11268.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6941.206,6614.792,6581.354,6749.151,6657.542,7013.269,7063.801 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6749.2 | 6581.4–7063.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 9412.728,9635.942,8729.121,8424.882,8496.038,8400.471,8437.408 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8496.0 | 8400.5–9635.9 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 12038.251,11880.926,10986.692,10870.892,11031.639,11005.226,10938.696 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11005.2 | 10870.9–12038.3 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 20101.924,18271.619,17833.435,17591.973,17766.378,17707.947,17388.809 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17766.4 | 17388.8–20101.9 | 3870000 |
<!-- samples | goose-json | text-short | decode | 118.371,113.080,119.571,119.832,118.090,119.490,123.272 -->
| goose-json | text-short | decode | 97 | 200000 | 119.5 | 113.1–123.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.299,44.616,44.980,44.328,43.254,44.242,43.000 -->
| goose-json | text-short | encode | 97 | 200000 | 44.2 | 43.0–45.0 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 181.001,183.404,182.025,185.012,184.522,184.493,183.157 -->
| Goose DOM | text-short | decode | 97 | 200000 | 183.4 | 181.0–185.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2310.200,2342.186,2348.588,2310.274,2318.233,2309.398,2393.658 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2318.2 | 2309.4–2393.7 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1958.325,1928.724,1927.707,1926.897,1923.798,1925.291,1983.324 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1927.7 | 1923.8–1983.3 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15448.103,15248.723,15096.053,15110.433,15136.023,15338.666,15441.361 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15248.7 | 15096.1–15448.1 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 846.743,835.294,802.990,842.307,777.142,769.645,854.806 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 835.3 | 769.6–854.8 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 489.011,512.476,444.990,452.172,459.829,434.864,487.994 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 459.8 | 434.9–512.5 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7194.803,7038.909,7136.371,6841.846,6616.082,6618.566,6457.867 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 6841.8 | 6457.9–7194.8 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 11868.411,11959.468,12206.539,11813.038,11814.255,11888.865,12259.287 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 11888.9 | 11813.0–12259.3 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9219.997,9184.697,9228.345,8718.521,8720.336,8963.031,9429.470 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9184.7 | 8718.5–9429.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 13846.129,13563.663,13696.344,13370.429,13331.113,14084.005,14149.714 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 13696.3 | 13331.1–14149.7 | 99900000 |
<!-- samples | goose-json | wide | decode | 749.882,728.360,754.385,747.394,777.553,718.952,670.185 -->
| goose-json | wide | decode | 135 | 40000 | 747.4 | 670.2–777.6 | 33720000 |
<!-- samples | goose-json | wide | encode | 175.763,163.518,162.959,174.239,182.918,174.800,168.021 -->
| goose-json | wide | encode | 135 | 40000 | 174.2 | 163.0–182.9 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 393.389,394.342,402.689,401.736,406.341,376.392,391.216 -->
| Goose DOM | wide | decode | 135 | 40000 | 394.3 | 376.4–406.3 | 4777000 |
