| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 130.554,120.307,130.405,128.105,127.382,136.561,128.338 -->
| goose-json | plain | decode | 38 | 100000 | 128.3 | 120.3–136.6 | 33648000 |
<!-- samples | goose-json | plain | encode | 43.907,43.671,44.331,44.517,43.099,44.176,44.446 -->
| goose-json | plain | encode | 38 | 100000 | 44.2 | 43.1–44.5 | 83806357 |
<!-- samples | Goose DOM | plain | decode | 116.520,113.546,113.414,118.985,114.049,114.060,114.618 -->
| Goose DOM | plain | decode | 38 | 100000 | 114.1 | 113.4–119.0 | 2804000 |
<!-- samples | goose-json | escaped | decode | 224.370,224.079,220.450,221.717,218.901,209.137,225.198 -->
| goose-json | escaped | decode | 62 | 100000 | 221.7 | 209.1–225.2 | 42761000 |
<!-- samples | goose-json | escaped | encode | 102.999,102.593,104.036,103.160,104.492,94.414,103.144 -->
| goose-json | escaped | encode | 54 | 100000 | 103.1 | 94.4–104.5 | 107718681 |
<!-- samples | Goose DOM | escaped | decode | 160.829,161.207,160.453,160.984,151.309,157.948,160.686 -->
| Goose DOM | escaped | decode | 62 | 100000 | 160.7 | 151.3–161.2 | 15422000 |
<!-- samples | goose-json | array | decode | 9470.698,9416.794,9919.399,9380.697,9429.641,9689.069,9702.738 -->
| goose-json | array | decode | 4022 | 10000 | 9470.7 | 9380.7–9919.4 | 145337000 |
<!-- samples | goose-json | array | encode | 5601.505,5606.417,5862.380,5595.285,5731.882,5665.016,5665.162 -->
| goose-json | array | encode | 4022 | 10000 | 5665.0 | 5595.3–5862.4 | 289142183 |
<!-- samples | Goose DOM | array | decode | 23305.105,23890.055,23311.262,23083.749,23686.309,23364.951,23255.714 -->
| Goose DOM | array | decode | 4022 | 10000 | 23311.3 | 23083.7–23890.1 | 72846000 |
<!-- samples | goose-json | floats | decode | 4979.862,5172.027,5095.672,5204.743,4907.158,5176.239,5168.814 -->
| goose-json | floats | decode | 1581 | 1000 | 5168.8 | 4907.2–5204.7 | 2040000 |
<!-- samples | goose-json | floats | encode | 10687.222,10806.696,10696.733,10525.545,10845.266,11300.580,11084.792 -->
| goose-json | floats | encode | 1581 | 1000 | 10806.7 | 10525.5–11300.6 | 13042088 |
<!-- samples | Goose DOM | floats | decode | 6787.468,6369.247,6400.362,6224.581,6686.911,6509.648,6269.704 -->
| Goose DOM | floats | decode | 1581 | 1000 | 6400.4 | 6224.6–6787.5 | 2064000 |
<!-- samples | goose-json | floats-wide | decode | 8380.847,8394.081,8401.012,8490.741,8570.139,8473.202,9026.165 -->
| goose-json | floats-wide | decode | 5975 | 1000 | 8473.2 | 8380.8–9026.2 | 2136000 |
<!-- samples | goose-json | floats-wide | encode | 10903.842,10159.871,10846.379,10826.677,10911.377,10830.751,11002.257 -->
| goose-json | floats-wide | encode | 5862 | 1000 | 10846.4 | 10159.9–11002.3 | 47325760 |
<!-- samples | Goose DOM | floats-wide | decode | 17069.636,17009.758,17271.869,17154.620,17170.769,17360.772,17259.389 -->
| Goose DOM | floats-wide | decode | 5975 | 1000 | 17170.8 | 17009.8–17360.8 | 2064000 |
<!-- samples | goose-json | text-short | decode | 123.470,127.318,127.448,118.037,120.514,124.025,118.028 -->
| goose-json | text-short | decode | 97 | 100000 | 123.5 | 118.0–127.4 | 75007000 |
<!-- samples | goose-json | text-short | encode | 43.015,45.405,42.982,40.528,40.528,43.816,40.954 -->
| goose-json | text-short | encode | 97 | 100000 | 43.0 | 40.5–45.4 | 133196708 |
<!-- samples | Goose DOM | text-short | decode | 173.772,179.869,172.485,168.908,160.286,166.697,165.350 -->
| Goose DOM | text-short | decode | 97 | 100000 | 168.9 | 160.3–179.9 | 2804000 |
<!-- samples | goose-json | text-sparse | decode | 1172.484,1218.284,1204.455,1168.644,1185.689,1212.782,1169.768 -->
| goose-json | text-sparse | decode | 8233 | 1000 | 1185.7 | 1168.6–1218.3 | 65928000 |
<!-- samples | goose-json | text-sparse | encode | 930.832,930.239,918.463,920.241,927.844,958.921,919.496 -->
| goose-json | text-sparse | encode | 8233 | 1000 | 927.8 | 918.5–958.9 | 66662496 |
<!-- samples | Goose DOM | text-sparse | decode | 14893.139,15294.058,14856.519,15159.276,15236.297,15094.814,15169.076 -->
| Goose DOM | text-sparse | decode | 8233 | 1000 | 15159.3 | 14856.5–15294.1 | 65616000 |
<!-- samples | goose-json | text-ascii | decode | 889.438,891.055,874.564,873.314,891.487,910.066,879.631 -->
| goose-json | text-ascii | decode | 8225 | 1000 | 889.4 | 873.3–910.1 | 65880000 |
<!-- samples | goose-json | text-ascii | encode | 498.502,493.078,537.032,497.274,500.792,490.447,495.447 -->
| goose-json | text-ascii | encode | 8225 | 1000 | 497.3 | 490.4–537.0 | 66598496 |
<!-- samples | Goose DOM | text-ascii | decode | 7134.655,7221.086,7384.125,7054.034,7060.504,7064.797,7048.001 -->
| Goose DOM | text-ascii | decode | 8225 | 1000 | 7064.8 | 7048.0–7384.1 | 32000 |
<!-- samples | goose-json | text-escaped | decode | 13314.072,12828.203,13457.533,13261.932,13323.016,13679.400,13620.056 -->
| goose-json | text-escaped | decode | 8737 | 1000 | 13323.0 | 12828.2–13679.4 | 53592000 |
<!-- samples | goose-json | text-escaped | encode | 10146.657,9786.034,10052.632,10243.250,10340.076,10275.418,10189.047 -->
| goose-json | text-escaped | encode | 8737 | 1000 | 10189.0 | 9786.0–10340.1 | 70853440 |
<!-- samples | Goose DOM | text-escaped | decode | 14708.590,14590.080,14863.181,15227.215,15137.465,15248.679,15423.914 -->
| Goose DOM | text-escaped | decode | 8737 | 1000 | 15137.5 | 14590.1–15423.9 | 53280000 |
<!-- samples | goose-json | wide | decode | 815.485,911.452,960.514,952.473,929.599,887.679,848.997 -->
| goose-json | wide | decode | 135 | 20000 | 911.5 | 815.5–960.5 | 16920000 |
<!-- samples | goose-json | wide | encode | 191.934,240.208,241.391,240.676,237.796,210.954,207.206 -->
| goose-json | wide | encode | 135 | 20000 | 237.8 | 191.9–241.4 | 26639006 |
<!-- samples | Goose DOM | wide | decode | 491.661,536.775,537.402,535.467,533.369,494.572,453.965 -->
| Goose DOM | wide | decode | 135 | 20000 | 533.4 | 454.0–537.4 | 2397000 |
