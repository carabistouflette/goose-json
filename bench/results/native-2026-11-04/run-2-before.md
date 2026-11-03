| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 148.251,146.786,146.106,141.644,140.836,142.645,139.396 -->
| goose-json | plain | decode | 38 | 200000 | 142.6 | 139.4–148.3 | 67248000 |
<!-- samples | goose-json | plain | encode | 52.262,49.470,51.568,48.823,49.337,49.297,48.693 -->
| goose-json | plain | encode | 38 | 200000 | 49.3 | 48.7–52.3 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 119.285,117.744,117.519,113.589,116.009,113.517,115.465 -->
| Goose DOM | plain | decode | 38 | 200000 | 116.0 | 113.5–119.3 | 5604000 |
<!-- samples | goose-json | escaped | decode | 270.839,277.337,266.846,272.329,268.107,262.176,264.719 -->
| goose-json | escaped | decode | 62 | 200000 | 268.1 | 262.2–277.3 | 85461000 |
<!-- samples | goose-json | escaped | encode | 112.349,116.163,111.948,114.322,110.860,110.620,112.233 -->
| goose-json | escaped | encode | 54 | 200000 | 112.2 | 110.6–116.2 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 165.545,167.840,180.361,168.066,162.616,163.606,162.917 -->
| Goose DOM | escaped | decode | 62 | 200000 | 165.5 | 162.6–180.4 | 30822000 |
<!-- samples | goose-json | array | decode | 15282.150,15145.338,15016.617,15055.902,15057.678,15116.962,15342.175 -->
| goose-json | array | decode | 4022 | 20000 | 15117.0 | 15016.6–15342.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5719.925,5683.794,5592.529,5735.107,5606.344,5635.092,5735.183 -->
| goose-json | array | encode | 4022 | 20000 | 5683.8 | 5592.5–5735.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 24651.457,24304.298,24256.678,24129.959,24221.792,24279.069,24190.765 -->
| Goose DOM | array | decode | 4022 | 20000 | 24256.7 | 24130.0–24651.5 | 144666000 |
<!-- samples | goose-json | floats | decode | 7637.892,7517.338,7484.720,7496.178,7567.075,7501.121,7524.672 -->
| goose-json | floats | decode | 1581 | 2000 | 7517.3 | 7484.7–7637.9 | 3825000 |
<!-- samples | goose-json | floats | encode | 30154.541,30070.217,29900.918,29950.394,30091.270,29939.692,30016.694 -->
| goose-json | floats | encode | 1581 | 2000 | 30016.7 | 29900.9–30154.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6398.610,6321.823,6247.822,6331.717,6244.049,6205.435,6272.372 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6272.4 | 6205.4–6398.6 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 11418.438,11520.360,11598.713,11403.849,11216.044,11338.507,11350.771 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 11403.8 | 11216.0–11598.7 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 11546.510,11559.127,11635.533,11465.110,11510.184,11702.263,11428.111 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 11546.5 | 11428.1–11702.3 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7123.471,7216.306,7166.441,7152.270,7280.745,7077.672,7252.845 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7166.4 | 7077.7–7280.7 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 36975.690,39265.904,38725.514,39001.872,40264.973,37274.234,37230.207 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 38725.5 | 36975.7–40265.0 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 32314.508,35143.573,34926.238,35478.514,35708.215,33374.421,33115.208 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 34926.2 | 32314.5–35708.2 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 15345.085,15445.319,15549.650,15630.969,15032.733,14647.728,14622.617 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 15345.1 | 14622.6–15631.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 825.689,879.743,881.239,899.407,889.003,836.940,859.187 -->
| goose-json | wide | decode | 135 | 40000 | 879.7 | 825.7–899.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 190.739,190.062,174.019,191.328,190.442,174.893,188.771 -->
| goose-json | wide | encode | 135 | 40000 | 190.1 | 174.0–191.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 445.654,420.175,435.045,445.004,430.594,407.723,429.967 -->
| Goose DOM | wide | decode | 135 | 40000 | 430.6 | 407.7–445.7 | 4777000 |
