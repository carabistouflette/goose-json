# Invalid consumption probe — retained, excluded from comparisons

All three passes completed normally with full-value preflight passing. Source
`e58661a` used Rust signed remainder for integer checksum endpoints, while Goose
uses nonnegative modulo. Wide-array decode checksums differ by a fixed amount;
consumption work is not equivalent. These raw outputs and metadata are retained
unchanged and are excluded from accepted comparison tables. The corrected series
is [here](../corpus-native-2026-11-04). No timing was interrupted or selected away.
