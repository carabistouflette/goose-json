| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 158.647,157.811,158.118,158.555,157.777,159.366,151.964 -->
| serde_json | plain | decode | 38 | 100000 | 158.1 | 152.0–159.4 | 33648000 |
<!-- samples | serde_json | plain | encode | 65.973,68.377,64.492,68.173,65.841,69.138,70.362 -->
| serde_json | plain | encode | 38 | 100000 | 68.2 | 64.5–70.4 | 83806357 |
<!-- samples | sonic-rs | plain | decode | 171.860,176.363,174.313,179.702,175.509,179.828,169.880 -->
| sonic-rs | plain | decode | 38 | 100000 | 175.5 | 169.9–179.8 | 33648000 |
<!-- samples | sonic-rs | plain | encode | 73.236,70.716,74.142,76.539,70.809,69.209,70.812 -->
| sonic-rs | plain | encode | 38 | 100000 | 70.8 | 69.2–76.5 | 83806357 |
<!-- samples | prost (binary) | plain | decode | 59.569,59.186,60.686,61.268,61.372,59.545,60.163 -->
| prost (binary) | plain | decode | 11 | 100000 | 60.2 | 59.2–61.4 | 33648000 |
<!-- samples | prost (binary) | plain | encode | 40.520,39.868,38.859,40.451,39.858,39.977,38.463 -->
| prost (binary) | plain | encode | 11 | 100000 | 39.9 | 38.5–40.5 | 46393088 |
<!-- samples | serde_json | escaped | decode | 294.331,307.709,301.604,295.058,289.357,304.145,312.347 -->
| serde_json | escaped | decode | 62 | 100000 | 301.6 | 289.4–312.3 | 42761000 |
<!-- samples | serde_json | escaped | encode | 98.019,95.726,93.791,96.467,94.299,96.775,95.095 -->
| serde_json | escaped | encode | 54 | 100000 | 95.7 | 93.8–98.0 | 107718681 |
<!-- samples | sonic-rs | escaped | decode | 312.734,308.436,314.021,317.066,299.590,297.961,300.710 -->
| sonic-rs | escaped | decode | 62 | 100000 | 308.4 | 298.0–317.1 | 42761000 |
<!-- samples | sonic-rs | escaped | encode | 144.913,151.004,139.672,140.675,142.764,148.326,142.820 -->
| sonic-rs | escaped | encode | 54 | 100000 | 142.8 | 139.7–151.0 | 107718681 |
<!-- samples | prost (binary) | escaped | decode | 70.494,69.987,68.896,70.261,72.085,72.941,68.766 -->
| prost (binary) | escaped | decode | 24 | 100000 | 70.3 | 68.8–72.9 | 42761000 |
<!-- samples | prost (binary) | escaped | encode | 28.506,31.335,33.026,33.846,33.675,35.655,32.780 -->
| prost (binary) | escaped | encode | 24 | 100000 | 33.0 | 28.5–35.7 | 90629805 |
<!-- samples | serde_json | array | decode | 14241.018,14220.073,14580.782,14673.627,14028.902,14052.957,13671.892 -->
| serde_json | array | decode | 4022 | 10000 | 14220.1 | 13671.9–14673.6 | 145337000 |
<!-- samples | serde_json | array | encode | 7739.539,7739.342,7486.543,7524.319,7596.314,7585.724,7643.804 -->
| serde_json | array | encode | 4022 | 10000 | 7596.3 | 7486.5–7739.5 | 289142183 |
<!-- samples | sonic-rs | array | decode | 16383.455,16077.128,16492.501,15928.892,15800.024,15823.079,16085.926 -->
| sonic-rs | array | decode | 4022 | 10000 | 16077.1 | 15800.0–16492.5 | 145337000 |
<!-- samples | sonic-rs | array | encode | 7607.337,7447.187,7393.308,7582.910,7609.269,7634.937,7732.388 -->
| sonic-rs | array | encode | 4022 | 10000 | 7607.3 | 7393.3–7732.4 | 289142183 |
<!-- samples | prost (binary) | array | decode | 4308.562,4360.553,4303.555,4411.338,4235.905,4301.505,4366.666 -->
| prost (binary) | array | decode | 1923 | 10000 | 4308.6 | 4235.9–4411.3 | 145337000 |
<!-- samples | prost (binary) | array | encode | 6576.508,6626.254,6531.211,6697.671,6956.885,6912.281,6928.247 -->
| prost (binary) | array | encode | 1923 | 10000 | 6697.7 | 6531.2–6956.9 | 143272958 |
<!-- samples | serde_json | floats | decode | 6751.217,6799.501,6584.750,6682.735,6571.648,6853.162,6935.765 -->
| serde_json | floats | decode | 1581 | 1000 | 6751.2 | 6571.6–6935.8 | 2040000 |
<!-- samples | serde_json | floats | encode | 9418.401,9201.575,9548.959,9277.712,9609.056,9392.656,9563.373 -->
| serde_json | floats | encode | 1581 | 1000 | 9418.4 | 9201.6–9609.1 | 13042088 |
<!-- samples | sonic-rs | floats | decode | 6367.842,6681.356,6884.395,6289.891,6672.413,6820.503,7059.771 -->
| sonic-rs | floats | decode | 1581 | 1000 | 6681.4 | 6289.9–7059.8 | 2040000 |
<!-- samples | sonic-rs | floats | encode | 10079.359,10529.031,10353.008,10351.057,10096.129,10094.004,10056.751 -->
| sonic-rs | floats | encode | 1581 | 1000 | 10096.1 | 10056.8–10529.0 | 13042088 |
<!-- samples | prost (binary) | floats | decode | 755.207,728.922,779.064,788.334,782.350,750.458,738.171 -->
| prost (binary) | floats | decode | 2051 | 1000 | 755.2 | 728.9–788.3 | 2040000 |
<!-- samples | prost (binary) | floats | encode | 543.803,546.405,542.739,547.226,542.946,546.554,546.393 -->
| prost (binary) | floats | encode | 2051 | 1000 | 546.4 | 542.7–547.2 | 16714104 |
<!-- samples | serde_json | floats-wide | decode | 21488.176,21599.693,22059.597,21786.318,21946.687,21748.059,21410.422 -->
| serde_json | floats-wide | decode | 5975 | 1000 | 21748.1 | 21410.4–22059.6 | 2136000 |
<!-- samples | serde_json | floats-wide | encode | 8634.023,8779.321,8607.215,8923.616,8396.362,8913.585,8438.061 -->
| serde_json | floats-wide | encode | 5971 | 1000 | 8634.0 | 8396.4–8923.6 | 48196792 |
<!-- samples | sonic-rs | floats-wide | decode | 15364.121,15026.655,15465.154,14998.110,14989.368,15878.064,15734.678 -->
| sonic-rs | floats-wide | decode | 5975 | 1000 | 15364.1 | 14989.4–15878.1 | 2136000 |
<!-- samples | sonic-rs | floats-wide | encode | 9414.324,9424.010,9258.967,9373.258,9326.561,8723.600,8632.472 -->
| sonic-rs | floats-wide | encode | 5971 | 1000 | 9326.6 | 8632.5–9424.0 | 48196792 |
<!-- samples | prost (binary) | floats-wide | decode | 698.605,706.246,694.323,751.928,951.131,794.637,730.095 -->
| prost (binary) | floats-wide | decode | 2051 | 1000 | 730.1 | 694.3–951.1 | 2136000 |
<!-- samples | prost (binary) | floats-wide | encode | 486.036,482.363,488.566,481.913,492.134,482.704,483.903 -->
| prost (binary) | floats-wide | encode | 2051 | 1000 | 483.9 | 481.9–492.1 | 17415288 |
<!-- samples | serde_json | text-short | decode | 167.030,164.195,178.547,181.154,183.478,175.740,177.443 -->
| serde_json | text-short | decode | 97 | 100000 | 177.4 | 164.2–183.5 | 75007000 |
<!-- samples | serde_json | text-short | encode | 128.320,133.688,128.020,127.481,127.303,128.061,130.513 -->
| serde_json | text-short | encode | 97 | 100000 | 128.1 | 127.3–133.7 | 133196708 |
<!-- samples | sonic-rs | text-short | decode | 194.430,189.558,188.438,185.914,190.999,191.348,190.346 -->
| sonic-rs | text-short | decode | 97 | 100000 | 190.3 | 185.9–194.4 | 75007000 |
<!-- samples | sonic-rs | text-short | encode | 131.427,126.929,123.472,124.440,123.125,127.999,122.133 -->
| sonic-rs | text-short | encode | 97 | 100000 | 124.4 | 122.1–131.4 | 133196708 |
<!-- samples | prost (binary) | text-short | decode | 56.028,57.273,57.567,59.127,58.152,54.702,57.768 -->
| prost (binary) | text-short | decode | 70 | 100000 | 57.6 | 54.7–59.1 | 75007000 |
<!-- samples | prost (binary) | text-short | encode | 40.439,39.705,39.889,40.842,40.157,37.812,37.461 -->
| prost (binary) | text-short | encode | 70 | 100000 | 39.9 | 37.5–40.8 | 115052424 |
<!-- samples | serde_json | text-sparse | decode | 2762.060,2771.166,2760.659,2764.944,2761.265,2769.528,2765.252 -->
| serde_json | text-sparse | decode | 8233 | 1000 | 2764.9 | 2760.7–2771.2 | 65928000 |
<!-- samples | serde_json | text-sparse | encode | 4783.021,4787.398,4793.746,4779.110,4787.302,4780.822,4864.469 -->
| serde_json | text-sparse | encode | 8233 | 1000 | 4787.3 | 4779.1–4864.5 | 66662496 |
<!-- samples | sonic-rs | text-sparse | decode | 1799.448,1446.589,1561.022,1672.804,1621.607,1416.825,1558.458 -->
| sonic-rs | text-sparse | decode | 8233 | 1000 | 1561.0 | 1416.8–1799.4 | 65928000 |
<!-- samples | sonic-rs | text-sparse | encode | 649.910,651.999,639.483,647.356,650.615,637.249,647.103 -->
| sonic-rs | text-sparse | encode | 8233 | 1000 | 647.4 | 637.2–652.0 | 66662496 |
<!-- samples | prost (binary) | text-sparse | decode | 518.595,512.596,520.643,514.544,518.395,542.666,554.508 -->
| prost (binary) | text-sparse | decode | 8205 | 1000 | 518.6 | 512.6–554.5 | 65928000 |
<!-- samples | prost (binary) | text-sparse | encode | 195.474,198.478,194.592,191.681,191.551,195.113,199.746 -->
| prost (binary) | text-sparse | encode | 8205 | 1000 | 195.1 | 191.6–199.7 | 66440672 |
<!-- samples | serde_json | text-ascii | decode | 2188.065,2214.430,2206.588,2179.456,2336.447,2289.739,2290.985 -->
| serde_json | text-ascii | decode | 8225 | 1000 | 2214.4 | 2179.5–2336.4 | 65880000 |
<!-- samples | serde_json | text-ascii | encode | 4617.983,4560.014,4541.836,4524.560,4485.594,4493.100,4637.998 -->
| serde_json | text-ascii | encode | 8225 | 1000 | 4541.8 | 4485.6–4638.0 | 66598496 |
<!-- samples | sonic-rs | text-ascii | decode | 1063.848,1078.380,1071.985,1075.575,1090.931,1068.142,1070.007 -->
| sonic-rs | text-ascii | decode | 8225 | 1000 | 1072.0 | 1063.8–1090.9 | 65880000 |
<!-- samples | sonic-rs | text-ascii | encode | 543.718,547.556,545.145,546.429,537.929,546.422,541.757 -->
| sonic-rs | text-ascii | encode | 8225 | 1000 | 545.1 | 537.9–547.6 | 66598496 |
<!-- samples | prost (binary) | text-ascii | decode | 506.502,511.757,507.225,514.723,513.015,507.948,514.635 -->
| prost (binary) | text-ascii | decode | 8199 | 1000 | 511.8 | 506.5–514.7 | 65880000 |
<!-- samples | prost (binary) | text-ascii | encode | 222.781,190.459,180.850,185.717,184.820,180.973,183.170 -->
| prost (binary) | text-ascii | encode | 8199 | 1000 | 184.8 | 180.8–222.8 | 66392624 |
<!-- samples | serde_json | text-escaped | decode | 23090.139,22522.306,22272.363,22657.749,22942.273,22312.752,22292.282 -->
| serde_json | text-escaped | decode | 8737 | 1000 | 22522.3 | 22272.4–23090.1 | 53592000 |
<!-- samples | serde_json | text-escaped | encode | 12293.947,12379.774,12122.357,11502.328,12055.776,11975.601,12335.357 -->
| serde_json | text-escaped | encode | 8737 | 1000 | 12122.4 | 11502.3–12379.8 | 70853440 |
<!-- samples | sonic-rs | text-escaped | decode | 12814.268,12176.541,12571.945,12305.533,12161.330,12669.670,12830.721 -->
| sonic-rs | text-escaped | decode | 8737 | 1000 | 12571.9 | 12161.3–12830.7 | 53592000 |
<!-- samples | sonic-rs | text-escaped | encode | 8343.613,7915.193,8243.540,8363.444,8487.458,8330.590,7825.518 -->
| sonic-rs | text-escaped | encode | 8737 | 1000 | 8330.6 | 7825.5–8487.5 | 70853440 |
<!-- samples | prost (binary) | text-escaped | decode | 7391.133,8242.119,8178.312,8240.916,8449.650,8333.115,8269.598 -->
| prost (binary) | text-escaped | decode | 6663 | 1000 | 8242.1 | 7391.1–8449.6 | 53592000 |
<!-- samples | prost (binary) | text-escaped | encode | 163.232,163.194,163.723,161.809,161.885,164.598,166.044 -->
| prost (binary) | text-escaped | encode | 6663 | 1000 | 163.2 | 161.8–166.0 | 54209944 |
<!-- samples | serde_json | wide | decode | 1463.259,1478.647,1462.407,1469.587,1496.658,1418.904,1422.033 -->
| serde_json | wide | decode | 135 | 20000 | 1463.3 | 1418.9–1496.7 | 16920000 |
<!-- samples | serde_json | wide | encode | 404.452,404.196,392.315,371.980,384.884,395.020,399.506 -->
| serde_json | wide | encode | 135 | 20000 | 395.0 | 372.0–404.5 | 26639006 |
<!-- samples | sonic-rs | wide | decode | 914.714,921.725,926.392,924.755,944.136,930.179,921.029 -->
| sonic-rs | wide | decode | 135 | 20000 | 924.8 | 914.7–944.1 | 16920000 |
<!-- samples | sonic-rs | wide | encode | 405.606,405.472,417.437,414.681,395.341,391.329,394.575 -->
| sonic-rs | wide | encode | 135 | 20000 | 405.5 | 391.3–417.4 | 26639006 |
<!-- samples | prost (binary) | wide | decode | 131.839,136.712,144.166,138.218,129.521,130.403,131.408 -->
| prost (binary) | wide | decode | 31 | 20000 | 131.8 | 129.5–144.2 | 16920000 |
<!-- samples | prost (binary) | wide | encode | 120.101,150.089,148.893,144.572,121.915,149.747,128.862 -->
| prost (binary) | wide | encode | 31 | 20000 | 144.6 | 120.1–150.1 | 9832594 |
