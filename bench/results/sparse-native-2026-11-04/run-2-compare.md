| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.626,158.365,162.537,158.413,157.868,158.754,165.616 -->
| serde_json | plain | decode | 38 | 200000 | 158.6 | 157.9–165.6 | 67248000 |
<!-- samples | serde_json | plain | encode | 72.200,73.859,87.549,72.619,72.477,73.341,73.936 -->
| serde_json | plain | encode | 38 | 200000 | 73.3 | 72.2–87.5 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 175.662,176.216,175.450,175.676,173.050,176.118,175.678 -->
| sonic-rs | plain | decode | 38 | 200000 | 175.7 | 173.0–176.2 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 77.602,75.911,74.984,74.639,73.614,75.960,75.014 -->
| sonic-rs | plain | encode | 38 | 200000 | 75.0 | 73.6–77.6 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 61.456,61.217,59.856,61.015,60.232,59.983,57.749 -->
| prost (binary) | plain | decode | 11 | 200000 | 60.2 | 57.7–61.5 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 39.740,39.672,39.204,39.532,40.320,41.888,42.176 -->
| prost (binary) | plain | encode | 11 | 200000 | 39.7 | 39.2–42.2 | 92719942 |
<!-- samples | serde_json | escaped | decode | 316.017,312.810,311.575,314.310,313.836,310.509,302.648 -->
| serde_json | escaped | decode | 62 | 200000 | 312.8 | 302.6–316.0 | 85461000 |
<!-- samples | serde_json | escaped | encode | 91.213,92.994,92.293,92.308,92.281,91.937,92.178 -->
| serde_json | escaped | encode | 54 | 200000 | 92.3 | 91.2–93.0 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 297.381,300.062,301.032,302.735,300.436,303.685,305.181 -->
| sonic-rs | escaped | decode | 62 | 200000 | 301.0 | 297.4–305.2 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 140.215,143.629,141.412,146.327,139.342,144.079,142.507 -->
| sonic-rs | escaped | encode | 54 | 200000 | 142.5 | 139.3–146.3 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 68.629,66.735,67.426,68.928,68.239,69.168,69.429 -->
| prost (binary) | escaped | decode | 24 | 200000 | 68.6 | 66.7–69.4 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 34.351,34.984,35.343,33.580,37.042,36.747,33.286 -->
| prost (binary) | escaped | encode | 24 | 200000 | 35.0 | 33.3–37.0 | 181133323 |
<!-- samples | serde_json | array | decode | 14338.589,14852.824,14793.092,14811.510,14564.039,14473.227,14344.345 -->
| serde_json | array | decode | 4022 | 20000 | 14564.0 | 14338.6–14852.8 | 288627000 |
<!-- samples | serde_json | array | encode | 7698.381,7786.729,7816.019,7805.807,7818.822,7812.564,7912.158 -->
| serde_json | array | encode | 4022 | 20000 | 7812.6 | 7698.4–7912.2 | 574225548 |
<!-- samples | sonic-rs | array | decode | 16943.538,16875.289,15949.393,16637.522,16946.274,17318.069,16342.320 -->
| sonic-rs | array | decode | 4022 | 20000 | 16875.3 | 15949.4–17318.1 | 288627000 |
<!-- samples | sonic-rs | array | encode | 7562.842,7669.754,7924.099,7881.738,7813.158,7748.374,7735.643 -->
| sonic-rs | array | encode | 4022 | 20000 | 7748.4 | 7562.8–7924.1 | 574225548 |
<!-- samples | prost (binary) | array | decode | 4367.759,4424.586,4514.027,4452.076,4475.582,4379.219,4362.569 -->
| prost (binary) | array | decode | 1923 | 20000 | 4424.6 | 4362.6–4514.0 | 288627000 |
<!-- samples | prost (binary) | array | encode | 6688.755,6770.613,6762.854,6962.275,7025.599,7012.947,6847.227 -->
| prost (binary) | array | encode | 1923 | 20000 | 6847.2 | 6688.8–7025.6 | 284551620 |
<!-- samples | serde_json | floats | decode | 7076.958,7054.312,7098.591,7062.257,6853.047,6605.861,6551.381 -->
| serde_json | floats | decode | 1581 | 2000 | 7054.3 | 6551.4–7098.6 | 3825000 |
<!-- samples | serde_json | floats | encode | 9546.076,9588.121,9780.939,9572.499,9323.199,9638.100,9052.434 -->
| serde_json | floats | encode | 1581 | 2000 | 9572.5 | 9052.4–9780.9 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 6675.448,6683.465,6533.618,6804.021,6994.008,6782.585,6688.641 -->
| sonic-rs | floats | decode | 1581 | 2000 | 6688.6 | 6533.6–6994.0 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 9940.387,9461.579,9638.168,9681.847,9586.885,9816.165,10157.549 -->
| sonic-rs | floats | encode | 1581 | 2000 | 9681.8 | 9461.6–10157.5 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 917.614,804.773,999.810,795.399,772.193,771.128,898.658 -->
| prost (binary) | floats | decode | 2051 | 2000 | 804.8 | 771.1–999.8 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 545.736,544.130,543.918,545.051,545.348,547.523,572.389 -->
| prost (binary) | floats | encode | 2051 | 2000 | 545.3 | 543.9–572.4 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 21444.260,21341.158,21815.965,21811.160,21263.701,21229.910,21696.351 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 21444.3 | 21229.9–21816.0 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 8726.979,8949.779,8694.941,8553.844,8805.394,8830.006,8866.333 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8805.4 | 8553.8–8949.8 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 15831.626,15991.957,15217.445,15307.872,15196.270,16032.637,15406.065 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 15406.1 | 15196.3–16032.6 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 9392.702,9376.351,9370.285,8885.626,8884.288,9279.453,9148.029 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 9279.5 | 8884.3–9392.7 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 829.053,769.832,782.315,750.146,924.920,987.453,750.120 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 782.3 | 750.1–987.5 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 547.796,546.741,546.856,545.518,547.999,548.745,546.160 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 546.9 | 545.5–548.7 | 32664305 |
<!-- samples | serde_json | text-short | decode | 173.706,167.273,167.444,169.566,173.349,164.606,167.799 -->
| serde_json | text-short | decode | 97 | 200000 | 167.8 | 164.6–173.7 | 149907000 |
<!-- samples | serde_json | text-short | encode | 118.251,120.443,123.811,123.634,121.833,121.260,122.418 -->
| serde_json | text-short | encode | 97 | 200000 | 121.8 | 118.3–123.8 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 180.026,180.971,180.272,181.847,178.513,174.472,179.320 -->
| sonic-rs | text-short | decode | 97 | 200000 | 180.0 | 174.5–181.8 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 123.392,125.443,122.596,120.668,118.768,117.664,123.244 -->
| sonic-rs | text-short | encode | 97 | 200000 | 122.6 | 117.7–125.4 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 56.784,56.921,54.674,54.723,57.666,56.651,55.964 -->
| prost (binary) | text-short | decode | 70 | 200000 | 56.7 | 54.7–57.7 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 39.341,37.179,38.294,37.427,38.023,39.990,38.944 -->
| prost (binary) | text-short | encode | 70 | 200000 | 38.3 | 37.2–40.0 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2751.874,2604.218,2603.140,2578.316,2659.195,2618.171,2609.104 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2609.1 | 2578.3–2751.9 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4471.284,4446.341,4678.880,4822.551,4810.941,4558.443,4449.086 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4558.4 | 4446.3–4822.6 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 1457.949,1443.358,1471.087,1388.882,1431.629,1602.902,1467.432 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1457.9 | 1388.9–1602.9 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 643.827,671.711,635.965,631.251,632.821,628.544,628.337 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 632.8 | 628.3–671.7 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 1110.052,1064.895,1068.367,1065.224,1064.648,1104.141,1131.149 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 1068.4 | 1064.6–1131.1 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 181.756,181.617,182.951,183.493,182.076,186.401,185.889 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 183.0 | 181.6–186.4 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 2178.267,2016.582,1964.187,2054.012,2180.195,2177.264,2183.374 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 2177.3 | 1964.2–2183.4 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4297.153,4228.011,4454.157,4496.926,4291.360,4346.142,4271.749 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 4297.2 | 4228.0–4496.9 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1058.558,958.591,993.448,998.649,1004.236,991.028,954.520 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 993.4 | 954.5–1058.6 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 486.543,501.853,509.385,508.762,507.077,510.032,535.837 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 508.8 | 486.5–535.8 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 1058.617,1120.696,1126.936,1126.829,1127.224,1124.274,1129.890 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 1126.8 | 1058.6–1129.9 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 183.214,182.873,183.057,186.912,183.633,187.036,185.114 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 183.6 | 182.9–187.0 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 22964.013,23244.695,23950.106,23464.807,22701.425,23038.472,22493.662 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 23038.5 | 22493.7–23950.1 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 11689.234,11452.706,11589.506,11538.418,11463.567,11098.871,11660.479 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 11538.4 | 11098.9–11689.2 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 12452.044,12082.506,12449.385,11958.277,12117.040,12909.457,13077.344 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 12449.4 | 11958.3–13077.3 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 8347.913,8189.458,8181.852,8334.903,8306.541,8065.693,7863.855 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 8189.5 | 7863.9–8347.9 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 7448.779,7482.764,7960.396,7874.832,7507.654,7385.467,7777.837 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 7507.7 | 7385.5–7960.4 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 158.353,149.918,149.775,148.412,151.863,148.211,149.664 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 149.8 | 148.2–158.4 | 101649504 |
<!-- samples | serde_json | wide | decode | 1444.109,1453.358,1476.956,1491.298,1480.337,1438.362,1419.645 -->
| serde_json | wide | decode | 135 | 40000 | 1453.4 | 1419.6–1491.3 | 33720000 |
<!-- samples | serde_json | wide | encode | 373.113,392.587,387.197,373.030,386.042,381.757,380.099 -->
| serde_json | wide | encode | 135 | 40000 | 381.8 | 373.0–392.6 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 880.405,879.952,875.422,939.952,932.558,895.677,932.328 -->
| sonic-rs | wide | decode | 135 | 40000 | 895.7 | 875.4–940.0 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 383.099,387.273,399.154,398.590,373.413,372.363,378.473 -->
| sonic-rs | wide | encode | 135 | 40000 | 383.1 | 372.4–399.2 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 132.773,133.471,133.306,123.255,128.911,135.631,125.723 -->
| prost (binary) | wide | decode | 31 | 40000 | 132.8 | 123.3–135.6 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 125.292,140.845,147.328,123.155,141.151,166.320,147.950 -->
| prost (binary) | wide | encode | 31 | 40000 | 141.2 | 123.2–166.3 | 19595809 |
