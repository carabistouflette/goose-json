| Implementation | Fixture | Operation | Bytes | Iterations/sample | Median ns/op | Min–max ns/op | Checksum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
<!-- samples | goose-json | plain | decode | 106.972,107.238,104.550,99.885,108.208,106.968,107.213 -->
| goose-json | plain | decode | 38 | 200000 | 107.0 | 99.9–108.2 | 67248000 |
<!-- samples | goose-json | plain | encode | 43.367,42.970,42.979,42.065,40.441,40.282,41.261 -->
| goose-json | plain | encode | 38 | 200000 | 42.1 | 40.3–43.4 | 167492841 |
<!-- samples | Goose DOM | plain | decode | 116.480,114.949,116.247,116.048,117.962,116.303,115.025 -->
| Goose DOM | plain | decode | 38 | 200000 | 116.2 | 114.9–118.0 | 5604000 |
<!-- samples | goose-json | escaped | decode | 209.425,201.719,205.092,200.707,196.575,201.252,205.761 -->
| goose-json | escaped | decode | 62 | 200000 | 201.7 | 196.6–209.4 | 85461000 |
<!-- samples | goose-json | escaped | encode | 99.614,99.975,101.071,100.152,99.651,101.574,102.597 -->
| goose-json | escaped | encode | 54 | 200000 | 100.2 | 99.6–102.6 | 215281997 |
<!-- samples | Goose DOM | escaped | decode | 161.985,160.278,163.134,160.451,163.171,161.743,166.513 -->
| Goose DOM | escaped | decode | 62 | 200000 | 162.0 | 160.3–166.5 | 30822000 |
<!-- samples | goose-json | array | decode | 9100.310,9012.330,9124.679,8962.793,8993.596,9139.735,9185.165 -->
| goose-json | array | decode | 4022 | 20000 | 9100.3 | 8962.8–9185.2 | 288627000 |
<!-- samples | goose-json | array | encode | 5700.865,5730.618,5636.760,5541.064,5584.095,5552.498,5595.655 -->
| goose-json | array | encode | 4022 | 20000 | 5595.7 | 5541.1–5730.6 | 574225548 |
<!-- samples | Goose DOM | array | decode | 23356.235,25631.728,23740.480,23543.097,23607.664,23744.659,23845.739 -->
| Goose DOM | array | decode | 4022 | 20000 | 23740.5 | 23356.2–25631.7 | 144666000 |
<!-- samples | goose-json | floats | decode | 4907.727,4929.073,4946.846,4580.100,4866.209,4498.685,4896.617 -->
| goose-json | floats | decode | 1581 | 2000 | 4896.6 | 4498.7–4946.8 | 3825000 |
<!-- samples | goose-json | floats | encode | 9850.276,10214.476,10280.889,9801.527,9633.933,9821.639,9869.392 -->
| goose-json | floats | encode | 1581 | 2000 | 9850.3 | 9633.9–10280.9 | 24457751 |
<!-- samples | Goose DOM | floats | decode | 6333.234,6653.001,6292.314,6220.479,6334.483,6471.217,6559.519 -->
| Goose DOM | floats | decode | 1581 | 2000 | 6334.5 | 6220.5–6653.0 | 3870000 |
<!-- samples | goose-json | floats-wide | decode | 7879.905,8529.252,8468.058,8229.352,8133.895,8650.412,8674.385 -->
| goose-json | floats-wide | decode | 5975 | 2000 | 8468.1 | 7879.9–8674.4 | 4005000 |
<!-- samples | goose-json | floats-wide | encode | 11386.428,11659.135,11290.748,11438.832,11130.925,11789.747,11724.076 -->
| goose-json | floats-wide | encode | 5862 | 2000 | 11438.8 | 11130.9–11789.7 | 88733686 |
<!-- samples | Goose DOM | floats-wide | decode | 17047.400,17339.643,17287.021,16972.471,17373.941,18166.308,17465.219 -->
| Goose DOM | floats-wide | decode | 5975 | 2000 | 17339.6 | 16972.5–18166.3 | 3870000 |
<!-- samples | goose-json | text-ascii | decode | 900.792,983.423,891.779,970.468,972.793,901.770,898.336 -->
| goose-json | text-ascii | decode | 8225 | 2000 | 901.8 | 891.8–983.4 | 123525000 |
<!-- samples | goose-json | text-ascii | encode | 803.465,801.153,805.769,822.643,859.137,801.598,786.633 -->
| goose-json | text-ascii | encode | 8225 | 2000 | 803.5 | 786.6–859.1 | 124876996 |
<!-- samples | Goose DOM | text-ascii | decode | 7001.774,6688.708,6983.927,7082.696,6924.100,7005.167,7116.064 -->
| Goose DOM | text-ascii | decode | 8225 | 2000 | 7001.8 | 6688.7–7116.1 | 60000 |
<!-- samples | goose-json | text-escaped | decode | 12506.056,12409.164,12382.399,12195.140,12117.594,12201.690,11937.838 -->
| goose-json | text-escaped | decode | 8737 | 2000 | 12201.7 | 11937.8–12506.1 | 100485000 |
<!-- samples | goose-json | text-escaped | encode | 9959.860,9840.816,9916.722,9834.319,9788.453,9623.005,9668.926 -->
| goose-json | text-escaped | encode | 8737 | 2000 | 9834.3 | 9623.0–9959.9 | 132858908 |
<!-- samples | Goose DOM | text-escaped | decode | 14462.636,14004.036,14121.933,14016.087,14068.819,14121.082,14569.967 -->
| Goose DOM | text-escaped | decode | 8737 | 2000 | 14121.1 | 14004.0–14570.0 | 99900000 |
<!-- samples | goose-json | wide | decode | 765.898,767.148,756.867,764.417,756.023,720.095,748.921 -->
| goose-json | wide | decode | 135 | 40000 | 756.9 | 720.1–767.1 | 33720000 |
<!-- samples | goose-json | wide | encode | 185.842,173.323,162.303,175.126,170.501,180.478,154.197 -->
| goose-json | wide | encode | 135 | 40000 | 173.3 | 154.2–185.8 | 53088352 |
<!-- samples | Goose DOM | wide | decode | 417.743,392.018,395.312,407.496,397.203,397.616,384.511 -->
| Goose DOM | wide | decode | 135 | 40000 | 397.2 | 384.5–417.7 | 4777000 |
