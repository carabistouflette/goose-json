| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 143.461,138.507,138.438,139.705,135.640,128.018,127.922 -->
| goose-json | plain | decode | 38 | 20000 | 138.4 | 127.9–143.5 | 6768000 |
<!-- samples | goose-json | plain | encode | 66.631,64.815,66.779,62.271,59.995,59.378,59.908 -->
| goose-json | plain | encode | 38 | 20000 | 62.3 | 59.4–66.8 | 16855732 |
<!-- samples | Goose DOM | plain | decode | 105.138,100.784,100.883,100.750,94.639,94.458,94.463 -->
| Goose DOM | plain | decode | 38 | 20000 | 100.8 | 94.5–105.1 | 564000 |
<!-- samples | goose-json | escaped | decode | 245.587,248.015,249.662,245.553,242.012,246.847,232.565 -->
| goose-json | escaped | decode | 62 | 20000 | 245.6 | 232.6–249.7 | 8601000 |
<!-- samples | goose-json | escaped | encode | 118.822,116.465,115.889,115.028,113.332,118.260,110.749 -->
| goose-json | escaped | encode | 54 | 20000 | 115.9 | 110.7–118.8 | 21663705 |
<!-- samples | Goose DOM | escaped | decode | 155.717,157.797,156.554,156.068,153.986,155.750,149.361 -->
| Goose DOM | escaped | decode | 62 | 20000 | 155.7 | 149.4–157.8 | 3102000 |
<!-- samples | goose-json | array | decode | 12337.273,12035.501,12436.860,12018.069,12165.164,12109.585,13240.560 -->
| goose-json | array | decode | 4022 | 2000 | 12165.2 | 12018.1–13240.6 | 30705000 |
<!-- samples | goose-json | array | encode | 6381.503,6374.136,6386.924,6371.904,6365.270,6795.940,6773.233 -->
| goose-json | array | encode | 4022 | 2000 | 6381.5 | 6365.3–6795.9 | 61080811 |
<!-- samples | Goose DOM | array | decode | 20259.699,20289.637,20291.368,20462.815,20379.965,21838.355,21335.978 -->
| Goose DOM | array | decode | 4022 | 2000 | 20380.0 | 20259.7–21838.4 | 15390000 |
<!-- samples | goose-json | array-signed | decode | 14157.833,14151.493,11992.680,12484.593,12665.406,11632.066,12796.259 -->
| goose-json | array-signed | decode | 4538 | 2000 | 12665.4 | 11632.1–14157.8 | 15375000 |
<!-- samples | goose-json | array-signed | encode | 7480.721,7351.441,6465.087,6792.550,6854.992,6488.669,6469.216 -->
| goose-json | array-signed | encode | 4537 | 2000 | 6792.6 | 6465.1–7480.7 | 68796382 |
<!-- samples | Goose DOM | array-signed | decode | 26155.752,22751.240,21993.591,21797.344,21556.684,21384.016,21654.400 -->
| Goose DOM | array-signed | decode | 4538 | 2000 | 21797.3 | 21384.0–26155.8 | 15390000 |
<!-- samples | goose-json | array-wide | decode | 35877.408,36121.874,34741.330,34828.171,35391.389,36415.518,36024.647 -->
| goose-json | array-wide | decode | 19771 | 2000 | 35877.4 | 34741.3–36415.5 | 26205000 |
<!-- samples | goose-json | array-wide | encode | 18604.730,18541.646,17492.699,17900.872,17458.150,18181.686,18396.005 -->
| goose-json | array-wide | encode | 19770 | 2000 | 18181.7 | 17458.2–18604.7 | 297316216 |
<!-- samples | Goose DOM | array-wide | decode | 59248.713,57111.626,56852.482,59042.533,56709.740,57056.855,58093.397 -->
| Goose DOM | array-wide | decode | 19771 | 2000 | 57111.6 | 56709.7–59248.7 | 15390000 |
<!-- samples | goose-json | mixed | decode | 2667.888,2681.569,2674.636,2689.950,2671.097,2689.930,2697.840 -->
| goose-json | mixed | decode | 1187 | 2000 | 2681.6 | 2667.9–2697.8 | 24255000 |
<!-- samples | goose-json | mixed | encode | 2881.504,2877.461,2899.231,2906.340,2901.008,2881.835,2882.146 -->
| goose-json | mixed | encode | 1186 | 2000 | 2882.1 | 2877.5–2906.3 | 19068985 |
<!-- samples | Goose DOM | mixed | decode | 2919.579,2896.126,2907.408,2887.854,2914.160,2901.334,2899.898 -->
| Goose DOM | mixed | decode | 1187 | 2000 | 2901.3 | 2887.9–2919.6 | 8865000 |
<!-- samples | goose-json | floats | decode | 5332.390,5318.805,5396.280,5365.155,5329.580,5330.495,5388.355 -->
| goose-json | floats | decode | 1581 | 200 | 5332.4 | 5318.8–5396.3 | 408000 |
<!-- samples | goose-json | floats | encode | 12082.595,12044.185,12089.595,12161.430,12338.805,12098.955,12137.675 -->
| goose-json | floats | encode | 1581 | 200 | 12099.0 | 12044.2–12338.8 | 2611368 |
<!-- samples | Goose DOM | floats | decode | 5165.795,5107.565,5152.515,5200.105,5173.200,5186.420,5336.760 -->
| Goose DOM | floats | decode | 1581 | 200 | 5173.2 | 5107.6–5336.8 | 412800 |
<!-- samples | goose-json | floats-wide | decode | 9284.250,9319.755,9400.070,9316.730,9297.785,9344.865,9849.275 -->
| goose-json | floats-wide | decode | 5975 | 200 | 9319.8 | 9284.3–9849.3 | 427200 |
<!-- samples | goose-json | floats-wide | encode | 12736.785,12789.970,12828.485,12779.605,12649.895,12773.975,13715.960 -->
| goose-json | floats-wide | encode | 5862 | 200 | 12779.6 | 12649.9–13716.0 | 9467432 |
<!-- samples | Goose DOM | floats-wide | decode | 17433.590,17334.080,17466.985,17476.185,17653.115,17741.385,18533.585 -->
| Goose DOM | floats-wide | decode | 5975 | 200 | 17476.2 | 17334.1–18533.6 | 412800 |
<!-- samples | goose-json | text-short | decode | 139.595,139.705,140.311,138.356,139.218,139.236,148.610 -->
| goose-json | text-short | decode | 97 | 20000 | 139.6 | 138.4–148.6 | 15087000 |
<!-- samples | goose-json | text-short | encode | 60.180,58.391,57.452,59.743,58.280,56.729,62.654 -->
| goose-json | text-short | encode | 97 | 20000 | 58.4 | 56.7–62.7 | 26788875 |
<!-- samples | Goose DOM | text-short | decode | 152.994,152.685,153.399,153.361,152.253,159.484,162.872 -->
| Goose DOM | text-short | decode | 97 | 20000 | 153.4 | 152.3–162.9 | 564000 |
<!-- samples | goose-json | text-sparse | decode | 2385.500,2385.190,2485.320,2565.015,2570.450,2602.760,2547.640 -->
| goose-json | text-sparse | decode | 8233 | 200 | 2547.6 | 2385.2–2602.8 | 13185600 |
<!-- samples | goose-json | text-sparse | encode | 2246.380,2361.950,2407.940,2429.390,2442.180,2463.310,2398.815 -->
| goose-json | text-sparse | encode | 8233 | 200 | 2407.9 | 2246.4–2463.3 | 13328096 |
<!-- samples | Goose DOM | text-sparse | decode | 18603.545,18494.820,19787.380,19817.040,19858.040,19816.220,19698.320 -->
| Goose DOM | text-sparse | decode | 8233 | 200 | 19787.4 | 18494.8–19858.0 | 13123200 |
<!-- samples | goose-json | text-ascii | decode | 1621.845,1677.755,1613.530,1668.680,1622.860,1668.535,1625.475 -->
| goose-json | text-ascii | decode | 8225 | 200 | 1625.5 | 1613.5–1677.8 | 13176000 |
<!-- samples | goose-json | text-ascii | encode | 1059.200,1062.180,1060.750,1058.560,1061.625,1055.655,1059.290 -->
| goose-json | text-ascii | encode | 8225 | 200 | 1059.3 | 1055.7–1062.2 | 13315296 |
<!-- samples | Goose DOM | text-ascii | decode | 9564.270,9557.990,9548.775,9586.715,10251.550,9567.190,9567.020 -->
| Goose DOM | text-ascii | decode | 8225 | 200 | 9567.0 | 9548.8–10251.5 | 6400 |
<!-- samples | goose-json | text-escaped | decode | 18319.095,18148.615,17777.940,16689.205,16814.875,18796.895,16696.645 -->
| goose-json | text-escaped | decode | 8737 | 200 | 17777.9 | 16689.2–18796.9 | 10718400 |
<!-- samples | goose-json | text-escaped | encode | 14089.825,14117.365,14010.280,13132.300,13276.670,14171.655,13059.685 -->
| goose-json | text-escaped | encode | 8737 | 200 | 14010.3 | 13059.7–14171.7 | 14162184 |
<!-- samples | Goose DOM | text-escaped | decode | 20612.305,20799.280,19689.045,19429.330,21272.085,20550.710,19483.075 -->
| Goose DOM | text-escaped | decode | 8737 | 200 | 20550.7 | 19429.3–21272.1 | 10656000 |
<!-- samples | goose-json | wide | decode | 521.234,504.488,502.804,507.707,507.242,498.911,501.634 -->
| goose-json | wide | decode | 135 | 4000 | 504.5 | 498.9–521.2 | 3480000 |
<!-- samples | goose-json | wide | encode | 183.152,190.409,189.941,183.619,182.964,182.382,182.229 -->
| goose-json | wide | encode | 135 | 4000 | 183.2 | 182.2–190.4 | 5479021 |
<!-- samples | Goose DOM | wide | decode | 382.303,388.818,382.405,385.209,388.868,387.783,384.451 -->
| Goose DOM | wide | decode | 135 | 4000 | 385.2 | 382.3–388.9 | 493000 |
