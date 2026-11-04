| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 156.591,156.493,157.475,157.068,160.165,157.132,158.765 -->
| serde_json | plain | decode | 38 | 200000 | 157.1 | 156.5–160.2 | 67248000 |
<!-- samples | serde_json | plain | encode | 71.654,70.627,69.672,69.710,70.130,69.660,72.346 -->
| serde_json | plain | encode | 38 | 200000 | 70.1 | 69.7–72.3 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 173.723,170.900,170.572,172.000,174.893,175.393,171.817 -->
| sonic-rs | plain | decode | 38 | 200000 | 172.0 | 170.6–175.4 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 71.405,68.888,69.421,68.938,68.319,69.124,69.146 -->
| sonic-rs | plain | encode | 38 | 200000 | 69.1 | 68.3–71.4 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 59.694,59.354,61.285,62.627,60.799,60.162,60.029 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.2 | 59.4–62.6 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 41.156,42.067,42.891,41.217,41.167,41.599,40.787 -->
| prost (binary) | plain | encode | 11 | 200000 | 41.2 | 40.8–42.9 | 92719942 |
<!-- samples | serde_json | escaped | decode | 311.288,304.110,307.394,312.708,308.756,311.795,311.909 -->
| serde_json | escaped | decode | 62 | 200000 | 311.3 | 304.1–312.7 | 85461000 |
<!-- samples | serde_json | escaped | encode | 94.993,94.440,97.806,99.460,98.719,98.086,99.304 -->
| serde_json | escaped | encode | 54 | 200000 | 98.1 | 94.4–99.5 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 319.527,316.343,316.166,312.347,308.647,311.774,313.002 -->
| sonic-rs | escaped | decode | 62 | 200000 | 313.0 | 308.6–319.5 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 145.261,146.637,150.179,142.806,148.005,153.200,145.984 -->
| sonic-rs | escaped | encode | 54 | 200000 | 146.6 | 142.8–153.2 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 72.689,72.824,72.690,73.182,73.616,71.135,70.626 -->
| prost (binary) | escaped | decode | 24 | 200000 | 72.7 | 70.6–73.6 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 33.320,34.149,37.134,36.410,33.714,32.532,35.079 -->
| prost (binary) | escaped | encode | 24 | 200000 | 34.1 | 32.5–37.1 | 181133323 |
<!-- samples | serde_json | array | decode | 14748.100,14647.770,14649.891,14654.137,14817.875,14771.777,14582.040 -->
| serde_json | array | decode | 4022 | 20000 | 14654.1 | 14582.0–14817.9 | 288627000 |
<!-- samples | serde_json | array | encode | 7926.218,8006.749,7995.198,7925.974,8029.817,8027.860,7927.976 -->
| serde_json | array | encode | 4022 | 20000 | 7995.2 | 7926.0–8029.8 | 574225548 |
<!-- samples | sonic-rs | array | decode | 16909.816,17205.813,17691.160,16868.081,17135.915,17047.144,16868.843 -->
| sonic-rs | array | decode | 4022 | 20000 | 17047.1 | 16868.1–17691.2 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7880.506,7983.277,8017.693,8202.654,8204.506,7978.766,8066.803 -->
| sonic-rs | array | encode | 4022 | 20000 | 8017.7 | 7880.5–8204.5 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4464.597,4555.157,4578.997,4583.027,4347.729,4484.068,4312.422 -->
| prost (binary) | array | decode | 1923 | 20000 | 4484.1 | 4312.4–4583.0 | 288627000 |
<!-- samples | prost (binary) | array | encode | 7190.096,7322.011,7090.111,7403.018,7183.758,7139.062,7172.957 -->
| prost (binary) | array | encode | 1923 | 20000 | 7183.8 | 7090.1–7403.0 | 284551620 |
<!-- samples | serde_json | floats | decode | 7101.852,7167.166,7114.235,6922.901,6877.105,7053.454,6996.883 -->
| serde_json | floats | decode | 1581 | 2000 | 7053.5 | 6877.1–7167.2 | 3825000 |
<!-- samples | serde_json | floats | encode | 10384.424,10383.510,10426.219,10274.496,10400.005,10559.716,10398.987 -->
| serde_json | floats | encode | 1581 | 2000 | 10399.0 | 10274.5–10559.7 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 6866.766,6983.408,6993.575,7017.671,7060.004,7122.533,7169.180 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7017.7 | 6866.8–7169.2 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 17730.794,18245.370,17815.245,18302.919,18132.974,18313.593,18387.403 -->
| sonic-rs | floats | encode | 1581 | 2000 | 18245.4 | 17730.8–18387.4 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 759.688,767.974,761.528,967.789,818.198,1020.691,744.518 -->
| prost (binary) | floats | decode | 2051 | 2000 | 768.0 | 744.5–1020.7 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 544.971,546.124,550.497,546.487,547.250,544.924,553.336 -->
| prost (binary) | floats | encode | 2051 | 2000 | 546.5 | 544.9–553.3 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 22598.807,21979.004,22177.394,21938.679,22177.760,22123.636,22515.482 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 22177.4 | 21938.7–22598.8 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 10873.537,10613.006,10718.770,10817.240,10761.629,10551.935,10575.611 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 10718.8 | 10551.9–10873.5 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 15938.031,15845.205,15868.150,15881.119,15982.734,16039.158,16253.099 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15938.0 | 15845.2–16253.1 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 10649.435,10529.324,10999.123,10744.776,10789.812,10780.687,10760.519 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 10760.5 | 10529.3–10999.1 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 799.189,881.669,760.667,818.321,805.902,791.543,771.278 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 799.2 | 760.7–881.7 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 642.694,640.043,683.685,614.314,600.962,600.727,602.697 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 614.3 | 600.7–683.7 | 32664305 |
<!-- samples | serde_json | text-ascii | decode | 2177.543,2208.510,2180.193,2284.945,2379.788,2232.537,2272.652 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2232.5 | 2177.5–2379.8 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4703.189,4545.547,4591.682,4641.417,4712.726,4641.437,4783.180 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4641.4 | 4545.5–4783.2 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1071.347,1079.196,1092.861,1084.411,1103.931,1077.257,1066.815 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1079.2 | 1066.8–1103.9 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 554.115,552.899,553.869,559.321,560.678,557.072,555.513 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 555.5 | 552.9–560.7 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 506.815,507.777,510.031,508.690,506.894,515.362,541.244 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 508.7 | 506.8–541.2 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 198.834,199.112,197.997,197.713,199.843,197.262,198.195 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 198.2 | 197.3–199.8 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 23330.998,23421.675,23579.318,23587.825,23115.429,22409.514,22835.893 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23331.0 | 22409.5–23587.8 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 12609.612,12399.881,12846.193,12908.881,13049.942,12373.175,12285.225 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 12609.6 | 12285.2–13049.9 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 13763.875,13701.935,13860.718,14031.864,15041.375,13995.646,14205.237 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 13995.6 | 13701.9–15041.4 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8306.206,8430.682,8500.992,8585.913,8597.274,8223.558,8649.858 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8501.0 | 8223.6–8649.9 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 8573.252,8428.141,8268.103,8376.758,8486.933,8309.561,8552.695 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 8428.1 | 8268.1–8573.3 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 167.111,170.798,168.962,166.547,161.429,159.325,158.219 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 166.5 | 158.2–170.8 | 101649504 |
<!-- samples | serde_json | wide | decode | 1473.929,1508.195,1530.711,1531.276,1524.871,1539.579,1512.168 -->
| serde_json | wide | decode | 135 | 40000 | 1524.9 | 1473.9–1539.6 | 33720000 |
<!-- samples | serde_json | wide | encode | 404.054,417.094,420.368,404.575,418.916,408.137,418.329 -->
| serde_json | wide | encode | 135 | 40000 | 417.1 | 404.1–420.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 939.183,934.668,951.710,940.423,935.070,921.248,935.368 -->
| sonic-rs | wide | decode | 135 | 40000 | 935.4 | 921.2–951.7 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 412.689,401.266,399.048,413.815,440.879,399.118,419.746 -->
| sonic-rs | wide | encode | 135 | 40000 | 412.7 | 399.0–440.9 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 135.982,138.515,140.398,138.458,136.140,139.228,137.345 -->
| prost (binary) | wide | decode | 31 | 40000 | 138.5 | 136.0–140.4 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 164.714,142.532,168.232,154.147,145.722,143.280,140.637 -->
| prost (binary) | wide | encode | 31 | 40000 | 145.7 | 140.6–168.2 | 19595809 |
