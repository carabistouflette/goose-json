# Exploratory shared-host run

All three process passes are retained here. Several candidate operations,
including unchanged decoding paths, showed large within-process timing swings
and approximately doubled medians in passes 2 and 3. Other projects were testing
on this shared host. These observations do not identify a definitive cause.

This series is not used for the current performance comparison. The
[replacement recording](../validated-native-2026-11-04) includes process CPU/wall
accounting and followed a best-effort request for other workers to avoid CPU 0.
It is still a shared-host measurement, not an isolated-machine benchmark.
