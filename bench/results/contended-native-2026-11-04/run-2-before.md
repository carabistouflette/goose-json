| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 227.022,203.264,229.271,225.983,226.706,219.915,222.534 -->
| goose-json | plain | decode | 38 | 200000 | 226.0 | 203.3–229.3 | 67248000 |
<!-- samples | goose-json | plain | encode | 93.906,97.034,92.275,86.977,86.949,86.447,90.005 -->
| goose-json | plain | encode | 38 | 200000 | 90.0 | 86.4–97.0 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 259.757,241.521,249.530,250.600,249.638,232.900,254.828 -->
| Goose DOM | plain | decode | 38 | 200000 | 249.6 | 232.9–259.8 | 5604000 |
<!-- samples | goose-json | escaped | decode | 451.792,444.408,477.167,450.504,442.981,461.132,454.677 -->
| goose-json | escaped | decode | 62 | 200000 | 451.8 | 443.0–477.2 | 85461000 |
<!-- samples | goose-json | escaped | encode | 206.447,205.902,195.057,220.976,199.554,220.675,218.479 -->
| goose-json | escaped | encode | 54 | 200000 | 206.4 | 195.1–221.0 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 338.011,346.806,341.658,356.477,348.292,366.745,361.262 -->
| Goose DOM | escaped | decode | 62 | 200000 | 348.3 | 338.0–366.7 | 30822000 |
<!-- samples | goose-json | array | decode | 20197.285,20213.392,20137.153,19894.664,9666.502,9598.408,9742.488 -->
| goose-json | array | decode | 4022 | 20000 | 19894.7 | 9598.4–20213.4 | 288627000 |
<!-- samples | goose-json | array | encode | 11713.020,11719.947,11554.589,11062.710,5687.091,5663.389,5787.629 -->
| goose-json | array | encode | 4022 | 20000 | 11062.7 | 5663.4–11719.9 | 574225548 |
<!-- samples | Goose DOM | array | decode | 51017.354,51281.574,51190.457,25173.426,25422.844,24922.853,25384.847 -->
| Goose DOM | array | decode | 4022 | 20000 | 25422.8 | 24922.9–51281.6 | 144666000 |
<!-- samples | goose-json | floats | decode | 4982.758,5066.584,4999.956,4908.091,4909.582,5194.185,5250.587 -->
| goose-json | floats | decode | 1581 | 2000 | 5000.0 | 4908.1–5250.6 | 3825000 |
<!-- samples | goose-json | floats | encode | 10381.223,10593.674,10230.467,10367.398,10399.867,10650.256,10488.004 -->
| goose-json | floats | encode | 1581 | 2000 | 10399.9 | 10230.5–10650.3 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6794.492,6847.477,6725.226,6778.831,6815.971,6882.313,6982.560 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6816.0 | 6725.2–6982.6 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8943.915,8947.648,8483.871,8967.610,8392.179,8526.202,8862.038 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8862.0 | 8392.2–8967.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 12370.567,12192.380,11767.846,11713.803,11526.938,11894.084,12264.678 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11894.1 | 11526.9–12370.6 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 18835.881,18702.362,18270.191,18225.930,17811.383,18303.996,18571.155 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 18304.0 | 17811.4–18835.9 | 3870000 |
<!-- samples | goose-json | text-short | decode | 123.280,119.604,120.637,116.340,114.542,114.329,116.687 -->
| goose-json | text-short | decode | 97 | 200000 | 116.7 | 114.3–123.3 | 149907000 |
<!-- samples | goose-json | text-short | encode | 43.600,44.795,44.258,43.534,45.408,44.809,44.373 -->
| goose-json | text-short | encode | 97 | 200000 | 44.4 | 43.5–45.4 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 192.972,186.201,186.013,190.883,190.335,186.957,184.336 -->
| Goose DOM | text-short | decode | 97 | 200000 | 187.0 | 184.3–193.0 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 2464.630,2347.999,2448.455,2342.163,2439.898,2489.990,2347.483 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 2439.9 | 2342.2–2490.0 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 2117.459,2092.749,1983.403,2036.403,2047.582,1986.023,1994.377 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 2036.4 | 1983.4–2117.5 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15955.276,15765.410,15638.924,15904.733,15300.835,15595.099,15451.718 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15638.9 | 15300.8–15955.3 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 992.250,1001.866,963.302,965.024,979.745,1016.917,1050.124 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 992.3 | 963.3–1050.1 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 637.140,637.986,637.780,636.701,636.091,637.670,678.788 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 637.7 | 636.1–678.8 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7078.311,7101.834,7343.166,7088.921,7062.569,7326.903,7423.517 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7101.8 | 7062.6–7423.5 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 13117.749,13310.136,13065.576,12868.568,13223.878,13144.615,13343.019 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 13144.6 | 12868.6–13343.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 10159.958,10476.369,10177.322,10382.875,10603.870,10619.832,10500.963 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 10476.4 | 10160.0–10619.8 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14652.606,14945.967,14834.021,15193.978,15390.983,15532.101,15059.274 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15059.3 | 14652.6–15532.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 787.469,821.739,778.477,811.702,793.467,811.330,828.119 -->
| goose-json | wide | decode | 135 | 40000 | 811.3 | 778.5–828.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 191.303,201.465,190.420,197.820,192.069,187.717,199.662 -->
| goose-json | wide | encode | 135 | 40000 | 192.1 | 187.7–201.5 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 421.677,421.229,423.382,413.929,424.284,435.730,437.752 -->
| Goose DOM | wide | decode | 135 | 40000 | 423.4 | 413.9–437.8 | 4777000 |
