| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | serde_json | plain | decode | 143.826,124.116,126.635,135.160,139.975,149.058,157.500 -->
| serde_json | plain | decode | 38 | 200000 | 140.0 | 124.1–157.5 | 67248000 |
<!-- samples | serde_json | plain | encode | 76.592,74.950,74.566,74.295,72.811,74.940,74.775 -->
| serde_json | plain | encode | 38 | 200000 | 74.8 | 72.8–76.6 | 167492841 |
<!-- samples | sonic-rs | plain | decode | 275.728,264.675,267.919,269.261,267.657,278.581,284.888 -->
| sonic-rs | plain | decode | 38 | 200000 | 269.3 | 264.7–284.9 | 67248000 |
<!-- samples | sonic-rs | plain | encode | 80.171,81.447,84.137,81.039,79.317,79.249,75.642 -->
| sonic-rs | plain | encode | 38 | 200000 | 80.2 | 75.6–84.1 | 167492841 |
<!-- samples | prost (binary) | plain | decode | 52.443,49.892,47.310,51.516,57.284,60.034,55.350 -->
| prost (binary) | plain | decode | 11 | 200000 | 52.4 | 47.3–60.0 | 67248000 |
<!-- samples | prost (binary) | plain | encode | 30.058,28.551,27.782,26.923,26.875,27.894,29.143 -->
| prost (binary) | plain | encode | 11 | 200000 | 27.9 | 26.9–30.1 | 92719942 |
<!-- samples | serde_json | escaped | decode | 277.306,235.859,267.959,300.707,327.990,340.816,314.890 -->
| serde_json | escaped | decode | 62 | 200000 | 300.7 | 235.9–340.8 | 85461000 |
<!-- samples | serde_json | escaped | encode | 95.392,88.098,85.599,85.800,91.650,94.748,94.989 -->
| serde_json | escaped | encode | 54 | 200000 | 91.7 | 85.6–95.4 | 215281997 |
<!-- samples | sonic-rs | escaped | decode | 462.712,363.532,411.670,494.748,440.482,498.088,502.905 -->
| sonic-rs | escaped | decode | 62 | 200000 | 462.7 | 363.5–502.9 | 85461000 |
<!-- samples | sonic-rs | escaped | encode | 176.857,170.777,176.089,180.544,176.984,178.043,177.715 -->
| sonic-rs | escaped | encode | 54 | 200000 | 177.0 | 170.8–180.5 | 215281997 |
<!-- samples | prost (binary) | escaped | decode | 77.243,77.257,77.114,77.694,77.070,77.119,77.147 -->
| prost (binary) | escaped | decode | 24 | 200000 | 77.1 | 77.1–77.7 | 85461000 |
<!-- samples | prost (binary) | escaped | encode | 34.920,35.018,35.024,35.173,35.013,34.895,33.316 -->
| prost (binary) | escaped | encode | 24 | 200000 | 35.0 | 33.3–35.2 | 181133323 |
<!-- samples | serde_json | array | decode | 16671.365,15014.994,17536.172,20404.052,19952.370,20238.887,17442.835 -->
| serde_json | array | decode | 4022 | 20000 | 17536.2 | 15015.0–20404.1 | 288627000 |
<!-- samples | serde_json | array | encode | 9525.321,9853.255,10373.051,9626.362,8965.622,9629.199,7662.874 -->
| serde_json | array | encode | 4022 | 20000 | 9626.4 | 7662.9–10373.1 | 574225548 |
<!-- samples | sonic-rs | array | decode | 26566.670,28240.698,28253.970,23597.775,26840.927,23180.401,21995.728 -->
| sonic-rs | array | decode | 4022 | 20000 | 26566.7 | 21995.7–28254.0 | 288627000 |
<!-- samples | sonic-rs | array | encode | 9639.647,10482.313,10431.764,10374.972,10371.550,10007.216,10133.186 -->
| sonic-rs | array | encode | 4022 | 20000 | 10371.6 | 9639.6–10482.3 | 574225548 |
<!-- samples | prost (binary) | array | decode | 5422.404,5428.520,5784.859,5986.595,6043.573,5935.744,6065.799 -->
| prost (binary) | array | decode | 1923 | 20000 | 5935.7 | 5422.4–6065.8 | 288627000 |
<!-- samples | prost (binary) | array | encode | 8466.572,6996.590,6768.909,7699.287,9047.086,8675.680,9097.410 -->
| prost (binary) | array | encode | 1923 | 20000 | 8466.6 | 6768.9–9097.4 | 284551620 |
<!-- samples | serde_json | array-signed | decode | 20401.276,20815.025,21248.138,20915.957,21056.586,19313.176,14401.157 -->
| serde_json | array-signed | decode | 4538 | 20000 | 20815.0 | 14401.2–21248.1 | 144525000 |
<!-- samples | serde_json | array-signed | encode | 6588.526,7260.422,8701.338,8920.468,9063.124,9077.640,9468.703 -->
| serde_json | array-signed | encode | 4537 | 20000 | 8920.5 | 6588.5–9468.7 | 646745614 |
<!-- samples | sonic-rs | array-signed | decode | 27097.357,28666.239,27726.629,26231.827,22617.226,20994.780,23828.809 -->
| sonic-rs | array-signed | decode | 4538 | 20000 | 26231.8 | 20994.8–28666.2 | 144525000 |
<!-- samples | sonic-rs | array-signed | encode | 7844.786,11527.047,9589.922,7566.231,6887.029,6230.565,6015.148 -->
| sonic-rs | array-signed | encode | 4537 | 20000 | 7566.2 | 6015.1–11527.0 | 646745614 |
<!-- samples | prost (binary) | array-signed | decode | 5060.508,7137.714,6757.883,6271.282,5834.083,8226.739,7147.420 -->
| prost (binary) | array-signed | decode | 6083 | 20000 | 6757.9 | 5060.5–8226.7 | 144525000 |
<!-- samples | prost (binary) | array-signed | encode | 19102.303,18170.934,15589.570,17208.093,16522.867,19642.793,19950.774 -->
| prost (binary) | array-signed | encode | 6083 | 20000 | 18170.9 | 15589.6–19950.8 | 886311874 |
<!-- samples | serde_json | array-wide | decode | 34658.706,33171.098,32800.254,41553.313,38952.954,39507.353,39098.050 -->
| serde_json | array-wide | decode | 19771 | 20000 | 38953.0 | 32800.3–41553.3 | 246327000 |
<!-- samples | serde_json | array-wide | encode | 15244.020,13317.713,12754.254,11197.866,11990.772,12201.534,16060.578 -->
| serde_json | array-wide | encode | 19770 | 20000 | 12754.3 | 11197.9–16060.6 | 2794741447 |
<!-- samples | sonic-rs | array-wide | decode | 32717.252,33027.128,32442.373,28140.158,28617.339,32660.144,22102.885 -->
| sonic-rs | array-wide | decode | 19771 | 20000 | 32442.4 | 22102.9–33027.1 | 246327000 |
<!-- samples | sonic-rs | array-wide | encode | 16307.645,11951.164,13505.189,14917.513,14465.085,12153.792,16346.592 -->
| sonic-rs | array-wide | encode | 19770 | 20000 | 14465.1 | 11951.2–16346.6 | 2794741447 |
<!-- samples | prost (binary) | array-wide | decode | 8798.779,7728.472,9538.759,9646.296,10248.411,9715.409,9799.483 -->
| prost (binary) | array-wide | decode | 9669 | 20000 | 9646.3 | 7728.5–10248.4 | 246327000 |
<!-- samples | prost (binary) | array-wide | encode | 31888.218,31167.161,29237.000,34146.788,36604.918,32063.730,31485.301 -->
| prost (binary) | array-wide | encode | 9669 | 20000 | 31888.2 | 29237.0–36604.9 | 1387916680 |
<!-- samples | serde_json | mixed | decode | 4792.375,5121.994,4709.477,4595.259,4603.270,4357.905,4093.590 -->
| serde_json | mixed | decode | 1187 | 20000 | 4603.3 | 4093.6–5122.0 | 227997000 |
<!-- samples | serde_json | mixed | encode | 2220.168,1987.729,2345.287,2528.765,2553.327,2593.196,2470.475 -->
| serde_json | mixed | encode | 1186 | 20000 | 2470.5 | 1987.7–2593.2 | 179985307 |
<!-- samples | sonic-rs | mixed | decode | 4280.136,3625.394,3686.789,3986.125,4498.506,4520.667,4362.874 -->
| sonic-rs | mixed | decode | 1187 | 20000 | 4280.1 | 3625.4–4520.7 | 227997000 |
<!-- samples | sonic-rs | mixed | encode | 3113.925,3219.059,3234.143,2925.319,3050.897,2555.889,2263.722 -->
| sonic-rs | mixed | encode | 1186 | 20000 | 3050.9 | 2263.7–3234.1 | 179985307 |
<!-- samples | prost (binary) | mixed | decode | 958.776,967.442,957.810,943.975,1050.434,1247.576,1425.384 -->
| prost (binary) | mixed | decode | 954 | 20000 | 967.4 | 944.0–1425.4 | 227997000 |
<!-- samples | prost (binary) | mixed | encode | 644.995,612.103,603.685,767.827,614.402,635.254,620.695 -->
| prost (binary) | mixed | encode | 954 | 20000 | 620.7 | 603.7–767.8 | 149207284 |
<!-- samples | serde_json | floats | decode | 8089.998,7575.350,7322.108,7226.745,6829.056,6227.902,6080.587 -->
| serde_json | floats | decode | 1581 | 2000 | 7226.7 | 6080.6–8090.0 | 3825000 |
<!-- samples | serde_json | floats | encode | 8266.505,9423.003,9038.098,8068.298,7674.518,7339.217,7390.271 -->
| serde_json | floats | encode | 1581 | 2000 | 8068.3 | 7339.2–9423.0 | 24457751 |
<!-- samples | sonic-rs | floats | decode | 7699.193,8401.574,8056.574,7263.593,7200.199,7006.678,6464.150 -->
| sonic-rs | floats | decode | 1581 | 2000 | 7263.6 | 6464.2–8401.6 | 3825000 |
<!-- samples | sonic-rs | floats | encode | 10576.435,10175.172,9988.049,10073.712,10806.392,11678.137,11332.218 -->
| sonic-rs | floats | encode | 1581 | 2000 | 10576.4 | 9988.0–11678.1 | 24457751 |
<!-- samples | prost (binary) | floats | decode | 594.655,586.689,588.133,587.057,609.598,639.488,602.062 -->
| prost (binary) | floats | decode | 2051 | 2000 | 594.7 | 586.7–639.5 | 3825000 |
<!-- samples | prost (binary) | floats | encode | 312.103,314.783,315.292,311.683,319.885,363.748,313.634 -->
| prost (binary) | floats | encode | 2051 | 2000 | 314.8 | 311.7–363.7 | 31234057 |
<!-- samples | serde_json | floats-wide | decode | 16572.880,15161.200,19600.761,20581.238,21559.714,20139.354,21890.314 -->
| serde_json | floats-wide | decode | 5975 | 2000 | 20139.4 | 15161.2–21890.3 | 4005000 |
<!-- samples | serde_json | floats-wide | encode | 7780.430,8190.707,9191.642,9208.386,8550.039,7556.254,7003.666 -->
| serde_json | floats-wide | encode | 5971 | 2000 | 8190.7 | 7003.7–9208.4 | 90366899 |
<!-- samples | sonic-rs | floats-wide | decode | 11791.184,11005.088,10653.880,10609.436,10293.481,10962.818,11155.603 -->
| sonic-rs | floats-wide | decode | 5975 | 2000 | 10962.8 | 10293.5–11791.2 | 4005000 |
<!-- samples | sonic-rs | floats-wide | encode | 13731.639,15996.688,16238.062,16227.069,16013.724,14551.173,12895.880 -->
| sonic-rs | floats-wide | encode | 5971 | 2000 | 15996.7 | 12895.9–16238.1 | 90366899 |
<!-- samples | prost (binary) | floats-wide | decode | 840.584,838.443,837.298,806.890,803.943,808.202,834.824 -->
| prost (binary) | floats-wide | decode | 2051 | 2000 | 834.8 | 803.9–840.6 | 4005000 |
<!-- samples | prost (binary) | floats-wide | encode | 283.792,289.488,293.260,288.983,292.500,287.046,278.933 -->
| prost (binary) | floats-wide | encode | 2051 | 2000 | 289.0 | 278.9–293.3 | 32664305 |
<!-- samples | serde_json | text-short | decode | 120.560,153.369,147.551,157.463,138.025,120.058,111.631 -->
| serde_json | text-short | decode | 97 | 200000 | 138.0 | 111.6–157.5 | 149907000 |
<!-- samples | serde_json | text-short | encode | 73.909,70.883,71.406,71.166,71.279,73.307,72.795 -->
| serde_json | text-short | encode | 97 | 200000 | 71.4 | 70.9–73.9 | 266203554 |
<!-- samples | sonic-rs | text-short | decode | 142.766,150.306,148.735,180.511,216.287,219.828,221.795 -->
| sonic-rs | text-short | decode | 97 | 200000 | 180.5 | 142.8–221.8 | 149907000 |
<!-- samples | sonic-rs | text-short | encode | 155.767,156.167,149.799,128.727,112.211,102.675,100.005 -->
| sonic-rs | text-short | encode | 97 | 200000 | 128.7 | 100.0–156.2 | 266203554 |
<!-- samples | prost (binary) | text-short | decode | 40.291,40.166,40.056,40.306,40.067,40.172,40.585 -->
| prost (binary) | text-short | decode | 70 | 200000 | 40.2 | 40.1–40.6 | 149907000 |
<!-- samples | prost (binary) | text-short | encode | 24.152,24.060,24.280,24.023,24.509,25.115,24.921 -->
| prost (binary) | text-short | encode | 70 | 200000 | 24.3 | 24.0–25.1 | 229941072 |
<!-- samples | serde_json | text-sparse | decode | 2438.216,2455.058,2349.174,2337.758,2347.008,2304.827,2294.642 -->
| serde_json | text-sparse | decode | 8233 | 2000 | 2347.0 | 2294.6–2455.1 | 123615000 |
<!-- samples | serde_json | text-sparse | encode | 4220.719,4240.926,4200.749,4355.959,4574.369,4589.895,4462.399 -->
| serde_json | text-sparse | encode | 8233 | 2000 | 4356.0 | 4200.7–4589.9 | 124997003 |
<!-- samples | sonic-rs | text-sparse | decode | 2066.409,2043.226,1982.555,2028.590,1973.270,1976.100,1981.332 -->
| sonic-rs | text-sparse | decode | 8233 | 2000 | 1982.6 | 1973.3–2066.4 | 123615000 |
<!-- samples | sonic-rs | text-sparse | encode | 546.708,547.771,547.684,543.531,542.727,545.606,541.790 -->
| sonic-rs | text-sparse | encode | 8233 | 2000 | 545.6 | 541.8–547.8 | 124997003 |
<!-- samples | prost (binary) | text-sparse | decode | 551.037,550.707,551.856,570.374,534.400,528.998,528.717 -->
| prost (binary) | text-sparse | decode | 8205 | 2000 | 550.7 | 528.7–570.4 | 123615000 |
<!-- samples | prost (binary) | text-sparse | encode | 275.591,277.495,275.104,278.197,275.173,278.852,275.147 -->
| prost (binary) | text-sparse | encode | 8205 | 2000 | 275.6 | 275.1–278.9 | 124578514 |
<!-- samples | serde_json | text-ascii | decode | 1596.931,1532.443,1527.931,1531.723,1527.015,1521.920,1523.382 -->
| serde_json | text-ascii | decode | 8225 | 2000 | 1527.9 | 1521.9–1596.9 | 123525000 |
<!-- samples | serde_json | text-ascii | encode | 4014.450,4831.198,5203.279,5291.535,5198.453,5159.333,5121.824 -->
| serde_json | text-ascii | encode | 8225 | 2000 | 5159.3 | 4014.5–5291.5 | 124876996 |
<!-- samples | sonic-rs | text-ascii | decode | 1823.148,1819.292,1826.090,1828.301,1826.452,1874.795,1840.560 -->
| sonic-rs | text-ascii | decode | 8225 | 2000 | 1826.5 | 1819.3–1874.8 | 123525000 |
<!-- samples | sonic-rs | text-ascii | encode | 713.222,705.852,712.415,704.933,709.224,700.582,716.275 -->
| sonic-rs | text-ascii | encode | 8225 | 2000 | 709.2 | 700.6–716.3 | 124876996 |
<!-- samples | prost (binary) | text-ascii | decode | 751.784,775.866,788.463,784.479,792.290,794.738,783.472 -->
| prost (binary) | text-ascii | decode | 8199 | 2000 | 784.5 | 751.8–794.7 | 123525000 |
<!-- samples | prost (binary) | text-ascii | encode | 408.108,411.637,409.649,409.675,407.626,407.582,403.221 -->
| prost (binary) | text-ascii | encode | 8199 | 2000 | 408.1 | 403.2–411.6 | 124489124 |
<!-- samples | serde_json | text-escaped | decode | 31016.844,29864.804,30310.770,24906.599,24969.631,29297.159,30655.715 -->
| serde_json | text-escaped | decode | 8737 | 2000 | 29864.8 | 24906.6–31016.8 | 100485000 |
<!-- samples | serde_json | text-escaped | encode | 10636.138,10153.290,11042.728,11342.328,10907.453,11437.769,11151.829 -->
| serde_json | text-escaped | encode | 8737 | 2000 | 11042.7 | 10153.3–11437.8 | 132858908 |
<!-- samples | sonic-rs | text-escaped | decode | 23038.013,20106.872,23124.326,24462.128,23660.581,23166.122,19975.154 -->
| sonic-rs | text-escaped | decode | 8737 | 2000 | 23124.3 | 19975.2–24462.1 | 100485000 |
<!-- samples | sonic-rs | text-escaped | encode | 6428.477,6106.732,5886.047,5829.234,6332.268,6555.363,6335.615 -->
| sonic-rs | text-escaped | encode | 8737 | 2000 | 6332.3 | 5829.2–6555.4 | 132858908 |
<!-- samples | prost (binary) | text-escaped | decode | 6731.939,6516.968,6371.930,6235.199,6206.676,6199.391,6320.820 -->
| prost (binary) | text-escaped | decode | 6663 | 2000 | 6320.8 | 6199.4–6731.9 | 100485000 |
<!-- samples | prost (binary) | text-escaped | encode | 230.278,228.479,225.970,229.251,225.260,229.345,254.679 -->
| prost (binary) | text-escaped | encode | 6663 | 2000 | 229.3 | 225.3–254.7 | 101649504 |
<!-- samples | serde_json | wide | decode | 679.723,740.958,786.457,831.545,823.517,837.206,807.903 -->
| serde_json | wide | decode | 135 | 40000 | 807.9 | 679.7–837.2 | 33720000 |
<!-- samples | serde_json | wide | encode | 386.428,413.574,431.389,406.855,373.898,354.992,357.254 -->
| serde_json | wide | encode | 135 | 40000 | 386.4 | 355.0–431.4 | 53088352 |
<!-- samples | sonic-rs | wide | decode | 858.976,769.558,735.338,691.928,699.542,748.520,824.264 -->
| sonic-rs | wide | decode | 135 | 40000 | 748.5 | 691.9–859.0 | 33720000 |
<!-- samples | sonic-rs | wide | encode | 389.447,400.898,418.804,444.795,442.405,430.759,435.574 -->
| sonic-rs | wide | encode | 135 | 40000 | 430.8 | 389.4–444.8 | 53088352 |
<!-- samples | prost (binary) | wide | decode | 137.539,130.092,130.542,125.579,120.078,122.014,128.437 -->
| prost (binary) | wide | decode | 31 | 40000 | 128.4 | 120.1–137.5 | 33720000 |
<!-- samples | prost (binary) | wide | encode | 143.862,151.625,158.724,158.002,159.470,158.833,159.661 -->
| prost (binary) | wide | encode | 31 | 40000 | 158.7 | 143.9–159.7 | 19595809 |
