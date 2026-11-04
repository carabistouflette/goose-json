# Exploratory sparse-run probe

Not used for the published performance comparison. This first probe tested
sparse-run coalescing before the local decimal-helper change, with uncommitted
native edits over the metadata's HEAD commit. Source hashes identify those
inputs; source_head alone does not identify that working tree.

A local kernel timing job overlapped CPU2 in the first passes. The first two
process CPU/wall ratios were approximately 51.2% and 85.3%. All nine outputs are
retained for transparency; none contribute to the current tables.

The [final recording](../sparse-native-2026-11-04) uses a committed candidate,
finished validation/review jobs and a coordinated CPU2 handoff, with the usual
shared-host limitations. It includes all final passes and regressions.
