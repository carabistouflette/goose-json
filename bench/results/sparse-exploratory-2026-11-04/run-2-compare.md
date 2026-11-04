| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.047,153.523,149.437,152.503,147.661,144.428,143.450 -->
| serde_json | plain | decode | 38 | 100000 | 149.4 | 143.5–158.0 | 33648000 |
<!-- samples | serde_json | plain | encode | 60.610,58.869,60.350,65.621,62.953,64.413,62.622 -->
| serde_json | plain | encode | 38 | 100000 | 62.6 | 58.9–65.6 | 83806357 |
<!-- samples | sonic-rs | plain | decode | 146.787,146.929,158.005,154.795,140.824,151.512,154.927 -->
| sonic-rs | plain | decode | 38 | 100000 | 151.5 | 140.8–158.0 | 33648000 |
<!-- samples | sonic-rs | plain | encode | 63.154,63.218,58.184,62.429,69.476,67.610,69.295 -->
| sonic-rs | plain | encode | 38 | 100000 | 63.2 | 58.2–69.5 | 83806357 |
<!-- samples | prost (binary) | plain | decode | 58.580,59.714,59.744,59.885,59.125,59.789,59.705 -->
| prost (binary) | plain | decode | 11 | 100000 | 59.7 | 58.6–59.9 | 33648000 |
<!-- samples | prost (binary) | plain | encode | 41.627,42.142,40.915,41.748,41.096,42.358,39.047 -->
| prost (binary) | plain | encode | 11 | 100000 | 41.6 | 39.0–42.4 | 46393088 |
<!-- samples | serde_json | escaped | decode | 296.896,308.972,306.949,306.840,298.327,297.361,300.030 -->
| serde_json | escaped | decode | 62 | 100000 | 300.0 | 296.9–309.0 | 42761000 |
<!-- samples | serde_json | escaped | encode | 92.076,91.354,91.868,94.073,92.420,95.114,99.271 -->
| serde_json | escaped | encode | 54 | 100000 | 92.4 | 91.4–99.3 | 107718681 |
<!-- samples | sonic-rs | escaped | decode | 322.205,328.632,334.266,333.322,324.683,339.383,321.336 -->
| sonic-rs | escaped | decode | 62 | 100000 | 328.6 | 321.3–339.4 | 42761000 |
<!-- samples | sonic-rs | escaped | encode | 160.040,156.134,152.193,154.533,158.760,157.851,154.076 -->
| sonic-rs | escaped | encode | 54 | 100000 | 156.1 | 152.2–160.0 | 107718681 |
<!-- samples | prost (binary) | escaped | decode | 64.139,65.105,62.821,65.251,65.980,65.627,63.751 -->
| prost (binary) | escaped | decode | 24 | 100000 | 65.1 | 62.8–66.0 | 42761000 |
<!-- samples | prost (binary) | escaped | encode | 31.589,29.728,31.708,32.843,27.686,30.436,31.064 -->
| prost (binary) | escaped | encode | 24 | 100000 | 31.1 | 27.7–32.8 | 90629805 |
<!-- samples | serde_json | array | decode | 14488.698,15188.245,15030.920,14838.451,14943.569,15266.569,15400.469 -->
| serde_json | array | decode | 4022 | 10000 | 15030.9 | 14488.7–15400.5 | 145337000 |
<!-- samples | serde_json | array | encode | 8229.097,8136.441,7843.844,8348.023,8369.404,8224.740,7794.519 -->
| serde_json | array | encode | 4022 | 10000 | 8224.7 | 7794.5–8369.4 | 289142183 |
<!-- samples | sonic-rs | array | decode | 17481.770,17984.899,17988.729,17463.814,18252.041,17207.997,17065.498 -->
| sonic-rs | array | decode | 4022 | 10000 | 17481.8 | 17065.5–18252.0 | 145337000 |
<!-- samples | sonic-rs | array | encode | 8278.192,8312.516,8215.793,8243.324,8317.688,8484.126,9181.928 -->
| sonic-rs | array | encode | 4022 | 10000 | 8312.5 | 8215.8–9181.9 | 289142183 |
<!-- samples | prost (binary) | array | decode | 5533.135,4935.670,4861.976,4631.040,4654.990,4523.324,4383.088 -->
| prost (binary) | array | decode | 1923 | 10000 | 4655.0 | 4383.1–5533.1 | 145337000 |
<!-- samples | prost (binary) | array | encode | 6693.961,6504.551,6114.358,6985.649,7046.166,6758.695,7120.270 -->
| prost (binary) | array | encode | 1923 | 10000 | 6758.7 | 6114.4–7120.3 | 143272958 |
<!-- samples | serde_json | floats | decode | 6896.999,7161.059,7115.739,7302.991,7330.818,7167.046,7435.299 -->
| serde_json | floats | decode | 1581 | 1000 | 7167.0 | 6897.0–7435.3 | 2040000 |
<!-- samples | serde_json | floats | encode | 9746.088,9641.166,9884.270,9816.296,9656.074,9576.136,9454.413 -->
| serde_json | floats | encode | 1581 | 1000 | 9656.1 | 9454.4–9884.3 | 13042088 |
<!-- samples | sonic-rs | floats | decode | 6905.304,7117.125,6760.272,6797.540,6940.307,6761.172,6886.311 -->
| sonic-rs | floats | decode | 1581 | 1000 | 6886.3 | 6760.3–7117.1 | 2040000 |
<!-- samples | sonic-rs | floats | encode | 9962.996,10033.018,9959.654,9710.997,9535.084,9388.977,10150.011 -->
| sonic-rs | floats | encode | 1581 | 1000 | 9959.7 | 9389.0–10150.0 | 13042088 |
<!-- samples | prost (binary) | floats | decode | 988.445,792.539,757.015,901.929,1126.708,827.600,754.421 -->
| prost (binary) | floats | decode | 2051 | 1000 | 827.6 | 754.4–1126.7 | 2040000 |
<!-- samples | prost (binary) | floats | encode | 483.674,486.463,483.206,486.414,482.566,487.043,508.421 -->
| prost (binary) | floats | encode | 2051 | 1000 | 486.4 | 482.6–508.4 | 16714104 |
<!-- samples | serde_json | floats-wide | decode | 21284.709,20979.935,21606.139,22302.888,22420.328,21872.274,21951.105 -->
| serde_json | floats-wide | decode | 5975 | 1000 | 21872.3 | 20979.9–22420.3 | 2136000 |
<!-- samples | serde_json | floats-wide | encode | 10537.410,10518.246,10549.919,10615.670,10911.967,11187.640,11258.067 -->
| serde_json | floats-wide | encode | 5971 | 1000 | 10615.7 | 10518.2–11258.1 | 48196792 |
<!-- samples | sonic-rs | floats-wide | decode | 16792.782,16473.356,15922.502,15863.400,15719.630,15718.543,15840.868 -->
| sonic-rs | floats-wide | decode | 5975 | 1000 | 15863.4 | 15718.5–16792.8 | 2136000 |
<!-- samples | sonic-rs | floats-wide | encode | 12227.167,14427.420,14477.668,14067.123,14186.767,14276.785,14298.724 -->
| sonic-rs | floats-wide | encode | 5971 | 1000 | 14276.8 | 12227.2–14477.7 | 48196792 |
<!-- samples | prost (binary) | floats-wide | decode | 648.714,657.085,697.356,720.903,804.959,892.333,877.359 -->
| prost (binary) | floats-wide | decode | 2051 | 1000 | 720.9 | 648.7–892.3 | 2136000 |
<!-- samples | prost (binary) | floats-wide | encode | 547.882,543.349,545.888,545.027,532.127,513.441,497.331 -->
| prost (binary) | floats-wide | encode | 2051 | 1000 | 543.3 | 497.3–547.9 | 17415288 |
<!-- samples | serde_json | text-short | decode | 161.811,161.308,164.565,166.807,173.511,178.044,172.390 -->
| serde_json | text-short | decode | 97 | 100000 | 166.8 | 161.3–178.0 | 75007000 |
<!-- samples | serde_json | text-short | encode | 122.183,126.637,126.305,126.372,127.735,126.622,125.963 -->
| serde_json | text-short | encode | 97 | 100000 | 126.4 | 122.2–127.7 | 133196708 |
<!-- samples | sonic-rs | text-short | decode | 186.027,189.641,186.637,185.581,191.831,184.127,177.375 -->
| sonic-rs | text-short | decode | 97 | 100000 | 186.0 | 177.4–191.8 | 75007000 |
<!-- samples | sonic-rs | text-short | encode | 127.700,127.141,134.012,131.339,129.060,135.348,135.813 -->
| sonic-rs | text-short | encode | 97 | 100000 | 131.3 | 127.1–135.8 | 133196708 |
<!-- samples | prost (binary) | text-short | decode | 59.483,55.481,57.667,58.232,59.223,57.908,55.060 -->
| prost (binary) | text-short | decode | 70 | 100000 | 57.9 | 55.1–59.5 | 75007000 |
<!-- samples | prost (binary) | text-short | encode | 39.018,37.917,37.927,39.739,39.528,37.265,39.776 -->
| prost (binary) | text-short | encode | 70 | 100000 | 39.0 | 37.3–39.8 | 115052424 |
<!-- samples | serde_json | text-sparse | decode | 2592.137,2569.985,2452.527,2534.325,2607.923,2479.139,2293.775 -->
| serde_json | text-sparse | decode | 8233 | 1000 | 2534.3 | 2293.8–2607.9 | 65928000 |
<!-- samples | serde_json | text-sparse | encode | 4322.200,4555.394,4498.129,4770.438,4556.741,4485.336,4769.078 -->
| serde_json | text-sparse | encode | 8233 | 1000 | 4555.4 | 4322.2–4770.4 | 66662496 |
<!-- samples | sonic-rs | text-sparse | decode | 1633.351,1388.495,1597.404,1397.031,1521.030,1498.736,1595.465 -->
| sonic-rs | text-sparse | decode | 8233 | 1000 | 1521.0 | 1388.5–1633.4 | 65928000 |
<!-- samples | sonic-rs | text-sparse | encode | 635.920,632.896,623.428,624.299,597.428,596.955,590.986 -->
| sonic-rs | text-sparse | encode | 8233 | 1000 | 623.4 | 591.0–635.9 | 66662496 |
<!-- samples | prost (binary) | text-sparse | decode | 451.950,470.684,481.910,463.693,458.787,459.026,485.654 -->
| prost (binary) | text-sparse | decode | 8205 | 1000 | 463.7 | 451.9–485.7 | 65928000 |
<!-- samples | prost (binary) | text-sparse | encode | 172.640,168.835,169.109,172.292,171.486,169.153,172.816 -->
| prost (binary) | text-sparse | encode | 8205 | 1000 | 171.5 | 168.8–172.8 | 66440672 |
<!-- samples | serde_json | text-ascii | decode | 2029.715,1934.615,1940.410,2048.213,2046.815,2109.656,2105.495 -->
| serde_json | text-ascii | decode | 8225 | 1000 | 2046.8 | 1934.6–2109.7 | 65880000 |
<!-- samples | serde_json | text-ascii | encode | 4436.966,4383.795,4458.213,4319.996,4405.767,4328.064,4101.771 -->
| serde_json | text-ascii | encode | 8225 | 1000 | 4383.8 | 4101.8–4458.2 | 66598496 |
<!-- samples | sonic-rs | text-ascii | decode | 870.561,893.211,855.859,877.446,891.144,868.263,920.796 -->
| sonic-rs | text-ascii | decode | 8225 | 1000 | 877.4 | 855.9–920.8 | 65880000 |
<!-- samples | sonic-rs | text-ascii | encode | 494.792,515.133,509.472,516.980,516.753,519.938,508.019 -->
| sonic-rs | text-ascii | encode | 8225 | 1000 | 515.1 | 494.8–519.9 | 66598496 |
<!-- samples | prost (binary) | text-ascii | decode | 479.051,483.397,477.406,480.668,476.701,480.153,478.688 -->
| prost (binary) | text-ascii | decode | 8199 | 1000 | 479.1 | 476.7–483.4 | 65880000 |
<!-- samples | prost (binary) | text-ascii | encode | 170.080,177.561,170.052,169.529,172.973,169.274,169.033 -->
| prost (binary) | text-ascii | encode | 8199 | 1000 | 170.1 | 169.0–177.6 | 66392624 |
<!-- samples | serde_json | text-escaped | decode | 21926.302,22674.097,22744.293,22026.893,22596.068,22163.407,22869.379 -->
| serde_json | text-escaped | decode | 8737 | 1000 | 22596.1 | 21926.3–22869.4 | 53592000 |
<!-- samples | serde_json | text-escaped | encode | 11313.410,11468.090,11321.944,11900.587,11242.738,11492.452,11695.906 -->
| serde_json | text-escaped | encode | 8737 | 1000 | 11468.1 | 11242.7–11900.6 | 70853440 |
<!-- samples | sonic-rs | text-escaped | decode | 14752.452,13177.829,13587.549,13864.840,12762.001,13459.675,12796.353 -->
| sonic-rs | text-escaped | decode | 8737 | 1000 | 13459.7 | 12762.0–14752.5 | 53592000 |
<!-- samples | sonic-rs | text-escaped | encode | 7875.475,7850.754,8060.710,8074.715,7608.561,7984.356,7631.790 -->
| sonic-rs | text-escaped | encode | 8737 | 1000 | 7875.5 | 7608.6–8074.7 | 70853440 |
<!-- samples | prost (binary) | text-escaped | decode | 7912.748,7560.988,7137.453,6441.784,6540.853,7091.496,7344.484 -->
| prost (binary) | text-escaped | decode | 6663 | 1000 | 7137.5 | 6441.8–7912.7 | 53592000 |
<!-- samples | prost (binary) | text-escaped | encode | 159.115,149.186,157.827,149.178,154.010,150.717,151.194 -->
| prost (binary) | text-escaped | encode | 6663 | 1000 | 151.2 | 149.2–159.1 | 54209944 |
<!-- samples | serde_json | wide | decode | 1372.378,1368.746,1392.534,1383.994,1384.153,1386.180,1363.393 -->
| serde_json | wide | decode | 135 | 20000 | 1384.0 | 1363.4–1392.5 | 16920000 |
<!-- samples | serde_json | wide | encode | 370.016,359.833,377.533,394.722,360.530,348.044,339.798 -->
| serde_json | wide | encode | 135 | 20000 | 360.5 | 339.8–394.7 | 26639006 |
<!-- samples | sonic-rs | wide | decode | 872.953,848.123,845.535,875.813,859.502,847.583,847.647 -->
| sonic-rs | wide | decode | 135 | 20000 | 848.1 | 845.5–875.8 | 16920000 |
<!-- samples | sonic-rs | wide | encode | 441.869,428.615,416.747,411.288,422.615,388.805,413.021 -->
| sonic-rs | wide | encode | 135 | 20000 | 416.7 | 388.8–441.9 | 26639006 |
<!-- samples | prost (binary) | wide | decode | 130.545,126.768,135.860,133.750,138.873,119.083,123.779 -->
| prost (binary) | wide | decode | 31 | 20000 | 130.5 | 119.1–138.9 | 16920000 |
<!-- samples | prost (binary) | wide | encode | 130.664,136.085,167.539,125.621,135.580,145.911,149.292 -->
| prost (binary) | wide | encode | 31 | 20000 | 136.1 | 125.6–167.5 | 9832594 |
