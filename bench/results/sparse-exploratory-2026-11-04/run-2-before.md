| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 125.641,115.511,108.442,103.548,112.385,115.562,113.067 -->
| goose-json | plain | decode | 38 | 100000 | 113.1 | 103.5–125.6 | 33648000 |
<!-- samples | goose-json | plain | encode | 48.338,45.422,43.068,42.872,42.851,42.424,45.914 -->
| goose-json | plain | encode | 38 | 100000 | 43.1 | 42.4–48.3 | 83806357 |
<!-- samples | Goose DOM | plain | decode | 132.367,120.701,121.559,120.328,123.808,116.544,126.991 -->
| Goose DOM | plain | decode | 38 | 100000 | 121.6 | 116.5–132.4 | 2804000 |
<!-- samples | goose-json | escaped | decode | 226.498,223.045,225.175,231.865,226.522,236.665,236.311 -->
| goose-json | escaped | decode | 62 | 100000 | 226.5 | 223.0–236.7 | 42761000 |
<!-- samples | goose-json | escaped | encode | 103.614,104.539,114.096,109.404,109.384,110.036,112.065 -->
| goose-json | escaped | encode | 54 | 100000 | 109.4 | 103.6–114.1 | 107718681 |
<!-- samples | Goose DOM | escaped | decode | 175.252,174.618,179.437,173.927,178.268,172.701,173.590 -->
| Goose DOM | escaped | decode | 62 | 100000 | 174.6 | 172.7–179.4 | 15422000 |
<!-- samples | goose-json | array | decode | 10182.933,9584.087,10096.967,9705.000,9225.206,9630.510,9348.638 -->
| goose-json | array | decode | 4022 | 10000 | 9630.5 | 9225.2–10182.9 | 145337000 |
<!-- samples | goose-json | array | encode | 5785.436,5827.896,5742.815,5674.200,5684.457,5604.423,5257.309 -->
| goose-json | array | encode | 4022 | 10000 | 5684.5 | 5257.3–5827.9 | 289142183 |
<!-- samples | Goose DOM | array | decode | 24167.383,25759.916,25231.484,23826.722,24574.319,23740.761,23161.764 -->
| Goose DOM | array | decode | 4022 | 10000 | 24167.4 | 23161.8–25759.9 | 72846000 |
<!-- samples | goose-json | floats | decode | 4836.754,5096.642,4725.622,5062.486,5015.066,5029.677,4732.472 -->
| goose-json | floats | decode | 1581 | 1000 | 5015.1 | 4725.6–5096.6 | 2040000 |
<!-- samples | goose-json | floats | encode | 10522.641,10307.744,10424.934,10007.415,10636.022,10331.841,10045.698 -->
| goose-json | floats | encode | 1581 | 1000 | 10331.8 | 10007.4–10636.0 | 13042088 |
<!-- samples | Goose DOM | floats | decode | 6648.649,6349.140,6489.548,6640.432,6558.797,6260.281,6063.084 -->
| Goose DOM | floats | decode | 1581 | 1000 | 6489.5 | 6063.1–6648.6 | 2064000 |
<!-- samples | goose-json | floats-wide | decode | 8104.366,8433.293,7920.936,7941.296,7831.769,7255.807,8014.721 -->
| goose-json | floats-wide | decode | 5975 | 1000 | 7941.3 | 7255.8–8433.3 | 2136000 |
<!-- samples | goose-json | floats-wide | encode | 11061.630,10896.234,10406.780,10017.116,10053.145,9292.410,10175.309 -->
| goose-json | floats-wide | encode | 5862 | 1000 | 10175.3 | 9292.4–11061.6 | 47325760 |
<!-- samples | Goose DOM | floats-wide | decode | 17106.034,16010.962,16792.973,16493.621,16116.717,16857.771,16350.548 -->
| Goose DOM | floats-wide | decode | 5975 | 1000 | 16493.6 | 16011.0–17106.0 | 2064000 |
<!-- samples | goose-json | text-short | decode | 107.630,110.057,92.456,114.548,102.938,109.943,116.448 -->
| goose-json | text-short | decode | 97 | 100000 | 109.9 | 92.5–116.4 | 75007000 |
<!-- samples | goose-json | text-short | encode | 41.526,38.245,40.390,41.036,35.198,42.871,41.484 -->
| goose-json | text-short | encode | 97 | 100000 | 41.0 | 35.2–42.9 | 133196708 |
<!-- samples | Goose DOM | text-short | decode | 166.442,164.547,164.492,165.507,158.173,177.782,172.637 -->
| Goose DOM | text-short | decode | 97 | 100000 | 165.5 | 158.2–177.8 | 2804000 |
<!-- samples | goose-json | text-sparse | decode | 2232.638,2174.849,2315.092,2237.131,2220.096,2155.187,1914.466 -->
| goose-json | text-sparse | decode | 8233 | 1000 | 2220.1 | 1914.5–2315.1 | 65928000 |
<!-- samples | goose-json | text-sparse | encode | 1922.903,1745.914,1917.243,1916.979,1802.156,1803.738,1611.793 -->
| goose-json | text-sparse | encode | 8233 | 1000 | 1803.7 | 1611.8–1922.9 | 66662496 |
<!-- samples | Goose DOM | text-sparse | decode | 14763.282,14863.419,14683.471,14326.896,13651.011,12609.045,13698.596 -->
| Goose DOM | text-sparse | decode | 8233 | 1000 | 14326.9 | 12609.0–14863.4 | 65616000 |
<!-- samples | goose-json | text-ascii | decode | 826.345,845.181,848.231,907.438,816.056,884.251,882.133 -->
| goose-json | text-ascii | decode | 8225 | 1000 | 848.2 | 816.1–907.4 | 65880000 |
<!-- samples | goose-json | text-ascii | encode | 457.333,490.056,490.658,497.823,490.456,486.336,488.970 -->
| goose-json | text-ascii | encode | 8225 | 1000 | 490.1 | 457.3–497.8 | 66598496 |
<!-- samples | Goose DOM | text-ascii | decode | 6934.658,7067.512,7022.067,7039.211,7175.095,7229.876,7063.440 -->
| Goose DOM | text-ascii | decode | 8225 | 1000 | 7063.4 | 6934.7–7229.9 | 32000 |
<!-- samples | goose-json | text-escaped | decode | 12039.344,11180.230,11282.011,12384.276,12326.789,12303.339,12153.508 -->
| goose-json | text-escaped | decode | 8737 | 1000 | 12153.5 | 11180.2–12384.3 | 53592000 |
<!-- samples | goose-json | text-escaped | encode | 8732.441,8212.644,8630.680,9380.863,9199.064,9255.090,8962.970 -->
| goose-json | text-escaped | encode | 8737 | 1000 | 8963.0 | 8212.6–9380.9 | 70853440 |
<!-- samples | Goose DOM | text-escaped | decode | 13606.999,13410.743,13426.831,13827.316,14707.475,13789.394,13605.254 -->
| Goose DOM | text-escaped | decode | 8737 | 1000 | 13607.0 | 13410.7–14707.5 | 53280000 |
<!-- samples | goose-json | wide | decode | 646.676,712.898,749.512,749.692,698.110,760.018,735.682 -->
| goose-json | wide | decode | 135 | 20000 | 735.7 | 646.7–760.0 | 16920000 |
<!-- samples | goose-json | wide | encode | 220.250,204.310,227.036,211.307,208.484,214.719,228.166 -->
| goose-json | wide | encode | 135 | 20000 | 214.7 | 204.3–228.2 | 26639006 |
<!-- samples | Goose DOM | wide | decode | 389.712,383.450,373.632,394.106,386.960,368.268,410.281 -->
| Goose DOM | wide | decode | 135 | 20000 | 387.0 | 368.3–410.3 | 2397000 |
