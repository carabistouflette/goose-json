| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 118.412,120.039,122.543,127.120,128.984,135.443,129.487 -->
| goose-json | plain | decode | 38 | 100000 | 127.1 | 118.4–135.4 | 33648000 |
<!-- samples | goose-json | plain | encode | 45.847,45.839,45.767,46.046,47.373,49.004,49.269 -->
| goose-json | plain | encode | 38 | 100000 | 46.0 | 45.8–49.3 | 83806357 |
<!-- samples | Goose DOM | plain | decode | 126.432,127.548,125.519,133.277,132.074,138.570,138.115 -->
| Goose DOM | plain | decode | 38 | 100000 | 132.1 | 125.5–138.6 | 2804000 |
<!-- samples | goose-json | escaped | decode | 239.942,228.588,216.892,214.330,222.354,216.511,223.354 -->
| goose-json | escaped | decode | 62 | 100000 | 222.4 | 214.3–239.9 | 42761000 |
<!-- samples | goose-json | escaped | encode | 105.446,104.928,101.724,99.855,99.616,105.857,100.120 -->
| goose-json | escaped | encode | 54 | 100000 | 101.7 | 99.6–105.9 | 107718681 |
<!-- samples | Goose DOM | escaped | decode | 178.926,177.393,172.918,171.400,168.437,178.835,170.974 -->
| Goose DOM | escaped | decode | 62 | 100000 | 172.9 | 168.4–178.9 | 15422000 |
<!-- samples | goose-json | array | decode | 9673.622,9896.304,9418.154,9411.761,9521.605,18510.648,18607.834 -->
| goose-json | array | decode | 4022 | 10000 | 9673.6 | 9411.8–18607.8 | 145337000 |
<!-- samples | goose-json | array | encode | 5625.321,5752.688,5594.771,5590.555,5627.247,11069.424,11017.040 -->
| goose-json | array | encode | 4022 | 10000 | 5627.2 | 5590.6–11069.4 | 289142183 |
<!-- samples | Goose DOM | array | decode | 24447.828,24223.190,24101.782,23912.931,36980.626,46488.530,39219.126 -->
| Goose DOM | array | decode | 4022 | 10000 | 24447.8 | 23912.9–46488.5 | 72846000 |
<!-- samples | goose-json | floats | decode | 5255.128,4938.651,4959.829,4969.752,5001.656,4611.808,4911.476 -->
| goose-json | floats | decode | 1581 | 1000 | 4959.8 | 4611.8–5255.1 | 2040000 |
<!-- samples | goose-json | floats | encode | 11240.723,10634.089,10644.660,10555.035,10496.656,10384.984,10545.297 -->
| goose-json | floats | encode | 1581 | 1000 | 10555.0 | 10385.0–11240.7 | 13042088 |
<!-- samples | Goose DOM | floats | decode | 6979.256,6513.236,6474.439,6445.666,6606.128,6530.197,6600.127 -->
| Goose DOM | floats | decode | 1581 | 1000 | 6530.2 | 6445.7–6979.3 | 2064000 |
<!-- samples | goose-json | floats-wide | decode | 8843.189,8445.894,8496.813,8428.473,8324.213,8389.867,8395.724 -->
| goose-json | floats-wide | decode | 5975 | 1000 | 8428.5 | 8324.2–8843.2 | 2136000 |
<!-- samples | goose-json | floats-wide | encode | 11060.138,10862.195,10884.681,10775.257,10887.508,10816.441,11245.074 -->
| goose-json | floats-wide | encode | 5862 | 1000 | 10884.7 | 10775.3–11245.1 | 47325760 |
<!-- samples | Goose DOM | floats-wide | decode | 17773.629,17292.502,17282.477,16696.956,17637.668,17367.493,17819.032 -->
| Goose DOM | floats-wide | decode | 5975 | 1000 | 17367.5 | 16697.0–17819.0 | 2064000 |
<!-- samples | goose-json | text-short | decode | 117.064,132.612,123.965,120.057,121.278,111.224,128.752 -->
| goose-json | text-short | decode | 97 | 100000 | 121.3 | 111.2–132.6 | 75007000 |
<!-- samples | goose-json | text-short | encode | 42.980,44.926,45.114,43.585,45.019,43.618,45.168 -->
| goose-json | text-short | encode | 97 | 100000 | 44.9 | 43.0–45.2 | 133196708 |
<!-- samples | Goose DOM | text-short | decode | 188.063,184.554,182.080,188.793,189.626,183.142,181.134 -->
| Goose DOM | text-short | decode | 97 | 100000 | 184.6 | 181.1–189.6 | 2804000 |
<!-- samples | goose-json | text-sparse | decode | 1211.430,1145.656,1172.516,1165.835,1195.418,1159.298,1173.983 -->
| goose-json | text-sparse | decode | 8233 | 1000 | 1172.5 | 1145.7–1211.4 | 65928000 |
<!-- samples | goose-json | text-sparse | encode | 919.166,909.423,921.436,921.920,921.156,920.595,914.643 -->
| goose-json | text-sparse | encode | 8233 | 1000 | 920.6 | 909.4–921.9 | 66662496 |
<!-- samples | Goose DOM | text-sparse | decode | 14953.362,15088.577,14800.047,15151.673,15183.860,15166.279,15147.209 -->
| Goose DOM | text-sparse | decode | 8233 | 1000 | 15147.2 | 14800.0–15183.9 | 65616000 |
<!-- samples | goose-json | text-ascii | decode | 932.231,841.547,949.545,803.885,843.129,889.778,835.465 -->
| goose-json | text-ascii | decode | 8225 | 1000 | 843.1 | 803.9–949.5 | 65880000 |
<!-- samples | goose-json | text-ascii | encode | 486.535,492.501,486.216,462.122,485.561,507.338,514.053 -->
| goose-json | text-ascii | encode | 8225 | 1000 | 486.5 | 462.1–514.1 | 66598496 |
<!-- samples | Goose DOM | text-ascii | decode | 7086.654,7055.099,7037.798,7188.918,7129.969,7224.305,7112.739 -->
| Goose DOM | text-ascii | decode | 8225 | 1000 | 7112.7 | 7037.8–7224.3 | 32000 |
<!-- samples | goose-json | text-escaped | decode | 12415.377,12850.306,12936.530,12850.061,12604.751,11825.215,12009.802 -->
| goose-json | text-escaped | decode | 8737 | 1000 | 12604.8 | 11825.2–12936.5 | 53592000 |
<!-- samples | goose-json | text-escaped | encode | 9613.227,9707.135,9662.311,9604.526,9218.363,9448.720,8874.774 -->
| goose-json | text-escaped | encode | 8737 | 1000 | 9604.5 | 8874.8–9707.1 | 70853440 |
<!-- samples | Goose DOM | text-escaped | decode | 14468.202,15045.025,14471.419,14246.454,13791.885,14029.025,14182.237 -->
| Goose DOM | text-escaped | decode | 8737 | 1000 | 14246.5 | 13791.9–15045.0 | 53280000 |
<!-- samples | goose-json | wide | decode | 765.223,736.105,725.939,734.297,750.602,751.520,754.768 -->
| goose-json | wide | decode | 135 | 20000 | 750.6 | 725.9–765.2 | 16920000 |
<!-- samples | goose-json | wide | encode | 197.995,172.559,182.506,190.322,172.019,163.759,180.276 -->
| goose-json | wide | encode | 135 | 20000 | 180.3 | 163.8–198.0 | 26639006 |
<!-- samples | Goose DOM | wide | decode | 409.994,399.718,397.864,382.027,371.904,384.847,397.839 -->
| Goose DOM | wide | decode | 135 | 20000 | 397.8 | 371.9–410.0 | 2397000 |
