| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 120.478,120.493,113.791,115.437,113.866,113.135,114.511 -->
| goose-json | plain | decode | 38 | 200000 | 114.5 | 113.1–120.5 | 67248000 |
<!-- samples | goose-json | plain | encode | 53.472,52.657,52.565,52.640,52.390,52.332,55.768 -->
| goose-json | plain | encode | 38 | 200000 | 52.6 | 52.3–55.8 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 87.919,83.683,84.160,83.779,83.697,83.832,83.937 -->
| Goose DOM | plain | decode | 38 | 200000 | 83.8 | 83.7–87.9 | 5604000 |
<!-- samples | goose-json | escaped | decode | 221.382,225.664,224.013,218.444,223.632,224.625,222.383 -->
| goose-json | escaped | decode | 62 | 200000 | 223.6 | 218.4–225.7 | 85461000 |
<!-- samples | goose-json | escaped | encode | 103.583,104.953,103.620,105.034,105.323,103.771,104.621 -->
| goose-json | escaped | encode | 54 | 200000 | 104.6 | 103.6–105.3 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 144.331,145.319,142.395,140.682,155.115,141.746,141.855 -->
| Goose DOM | escaped | decode | 62 | 200000 | 142.4 | 140.7–155.1 | 30822000 |
<!-- samples | goose-json | array | decode | 11262.989,11411.184,11513.252,11344.813,11571.927,11472.200,11195.842 -->
| goose-json | array | decode | 4022 | 20000 | 11411.2 | 11195.8–11571.9 | 288627000 |
<!-- samples | goose-json | array | encode | 6038.912,6045.314,6084.219,6110.455,6166.202,6130.080,6048.068 -->
| goose-json | array | encode | 4022 | 20000 | 6084.2 | 6038.9–6166.2 | 574225548 |
<!-- samples | Goose DOM | array | decode | 19952.096,19245.337,19326.799,19299.633,19304.771,19282.449,19486.896 -->
| Goose DOM | array | decode | 4022 | 20000 | 19304.8 | 19245.3–19952.1 | 144666000 |
<!-- samples | goose-json | array-signed | decode | 11852.980,11813.741,11778.232,11538.698,11604.439,11826.129,12020.339 -->
| goose-json | array-signed | decode | 4538 | 20000 | 11813.7 | 11538.7–12020.3 | 144525000 |
<!-- samples | goose-json | array-signed | encode | 6346.348,6148.116,6142.211,6222.179,6199.446,6141.411,6132.099 -->
| goose-json | array-signed | encode | 4537 | 20000 | 6148.1 | 6132.1–6346.3 | 646745614 |
<!-- samples | Goose DOM | array-signed | decode | 20382.069,20442.494,20553.935,20466.733,20410.770,21876.817,20701.729 -->
| Goose DOM | array-signed | decode | 4538 | 20000 | 20466.7 | 20382.1–21876.8 | 144666000 |
<!-- samples | goose-json | array-wide | decode | 32779.317,32791.809,33877.484,32756.683,32916.471,32843.762,33176.340 -->
| goose-json | array-wide | decode | 19771 | 20000 | 32843.8 | 32756.7–33877.5 | 246327000 |
<!-- samples | goose-json | array-wide | encode | 17177.637,16566.576,18476.150,16602.326,16563.561,16687.843,16567.216 -->
| goose-json | array-wide | encode | 19770 | 20000 | 16602.3 | 16563.6–18476.2 | 2794741447 |
<!-- samples | Goose DOM | array-wide | decode | 54240.851,53832.721,53522.760,53534.916,54443.793,54121.803,55131.622 -->
| Goose DOM | array-wide | decode | 19771 | 20000 | 54121.8 | 53522.8–55131.6 | 144666000 |
<!-- samples | goose-json | mixed | decode | 2518.791,2559.634,2527.839,2536.104,2542.759,2511.707,2535.805 -->
| goose-json | mixed | decode | 1187 | 20000 | 2535.8 | 2511.7–2559.6 | 227997000 |
<!-- samples | goose-json | mixed | encode | 2700.721,2701.784,2692.166,2695.161,2689.201,2684.508,2688.756 -->
| goose-json | mixed | encode | 1186 | 20000 | 2692.2 | 2684.5–2701.8 | 179985307 |
<!-- samples | Goose DOM | mixed | decode | 2770.628,2765.065,2756.811,2760.735,2769.798,2754.500,2761.885 -->
| Goose DOM | mixed | decode | 1187 | 20000 | 2761.9 | 2754.5–2770.6 | 83331000 |
<!-- samples | goose-json | floats | decode | 5049.740,5039.173,5035.958,5059.028,5043.999,5040.575,4998.532 -->
| goose-json | floats | decode | 1581 | 2000 | 5040.6 | 4998.5–5059.0 | 3825000 |
<!-- samples | goose-json | floats | encode | 11503.102,11494.012,11528.634,12052.501,11509.942,11517.192,11561.603 -->
| goose-json | floats | encode | 1581 | 2000 | 11517.2 | 11494.0–12052.5 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 4860.783,4829.422,4855.712,4841.480,4837.860,4801.287,4989.761 -->
| Goose DOM | floats | decode | 1581 | 2000 | 4841.5 | 4801.3–4989.8 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 8757.990,8776.968,8748.245,8772.927,8679.792,8789.586,8738.384 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8758.0 | 8679.8–8789.6 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11971.619,11965.777,12021.551,11993.142,12021.559,12010.635,12044.113 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 12010.6 | 11965.8–12044.1 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 16298.143,16329.608,16238.566,16279.745,16181.992,16226.977,16182.839 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 16238.6 | 16182.0–16329.6 | 3870000 |
<!-- samples | goose-json | text-short | decode | 121.646,120.902,120.232,121.036,127.706,123.570,120.511 -->
| goose-json | text-short | decode | 97 | 200000 | 121.0 | 120.2–127.7 | 149907000 |
<!-- samples | goose-json | text-short | encode | 50.998,50.829,50.817,50.985,53.806,50.792,51.949 -->
| goose-json | text-short | encode | 97 | 200000 | 51.0 | 50.8–53.8 | 266203554 |
<!-- samples | Goose DOM | text-short | decode | 134.868,134.651,134.557,134.736,135.534,134.733,134.494 -->
| Goose DOM | text-short | decode | 97 | 200000 | 134.7 | 134.5–135.5 | 5604000 |
<!-- samples | goose-json | text-sparse | decode | 1952.735,1951.825,1966.130,2065.137,2162.475,1961.087,2043.484 -->
| goose-json | text-sparse | decode | 8233 | 2000 | 1966.1 | 1951.8–2162.5 | 123615000 |
<!-- samples | goose-json | text-sparse | encode | 1855.925,1874.818,1865.711,1959.933,1853.461,1940.953,1982.813 -->
| goose-json | text-sparse | encode | 8233 | 2000 | 1874.8 | 1853.5–1982.8 | 124997003 |
<!-- samples | Goose DOM | text-sparse | decode | 15253.184,15255.404,16078.468,15413.298,15727.090,16186.557,15780.843 -->
| Goose DOM | text-sparse | decode | 8233 | 2000 | 15727.1 | 15253.2–16186.6 | 123030000 |
<!-- samples | goose-json | text-ascii | decode | 1316.519,1332.560,1314.443,1384.450,1376.628,1308.698,1335.706 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 1332.6 | 1308.7–1384.5 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 818.183,822.881,834.796,875.938,865.067,820.512,833.288 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 833.3 | 818.2–875.9 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7395.306,7394.463,7531.579,7844.909,7821.447,7395.679,7392.924 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7395.7 | 7392.9–7844.9 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 14819.538,14745.639,14725.794,14719.625,14729.586,14687.544,14703.030 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 14725.8 | 14687.5–14819.5 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 11262.720,11589.488,11513.316,11518.885,11525.113,11490.195,11452.775 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 11513.3 | 11262.7–11589.5 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 17190.061,17193.062,17133.783,17114.363,17056.613,17148.447,17056.922 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 17133.8 | 17056.6–17193.1 | 99900000 |
<!-- samples | goose-json | wide | decode | 473.515,478.831,490.827,493.221,493.795,494.406,493.833 -->
| goose-json | wide | decode | 135 | 40000 | 493.2 | 473.5–494.4 | 33720000 |
<!-- samples | goose-json | wide | encode | 172.053,171.771,170.638,175.829,170.745,174.440,178.290 -->
| goose-json | wide | encode | 135 | 40000 | 172.1 | 170.6–178.3 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 362.446,362.542,361.712,360.562,359.575,361.495,359.841 -->
| Goose DOM | wide | decode | 135 | 40000 | 361.5 | 359.6–362.5 | 4777000 |
