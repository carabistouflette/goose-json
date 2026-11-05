# Existing consumer profile: signed artifact metadata

The existing [goose-artifact download CLI](https://github.com/carabistouflette/goose-artifact/tree/c2d190b613c541a5dba839ce380de8b111c9ab0c/examples/download)
reads signed JSON metadata containing a URL and SHA-256 digest. It verifies the
signature over **original bytes before parsing**, then streams a bounded HTTPS
payload into an exclusively created staging file and verifies/publishes it. It
has no JSON serialization step. This probe does not invent one or reserialize
signed bytes.

The measured JSON call was roughly **0.08–0.18%** of the instrumented
`artifact::execute` interval in seven fresh-process executions. This workload
does not demonstrate a JSON bottleneck to optimize. No JSON or consumer runtime,
dependency pin, release or tag is changed.

This is an **existing application exercised with its existing synthetic signed
loopback-HTTPS integration fixture**, not production-traffic replay. In particular,
the application pins **JSON `3fa7b527` (v0.1.2)**. It does not use current JSON
main/v0.1.3, and these observations are not their benchmark results. Original
consumer dependency pins are preserved. No before/after optimization comparison,
CPU sampling, standalone codec latency or achievable-speedup claim is made.

## All observations

[Raw results and provenance](results.json) retain the original functional control,
two ordering/failure controls and every profile observation.
[The 117-byte signed metadata payload](metadata-fixture.json) uses only a transient
localhost URL and a deterministic fixture digest. Seven successful instrumented
runs download/publish the same 256 KiB fixture. Every final byte length and digest,
status/publication, request count and staging absence is checked.

| Run | Execute ms | Authenticate µs | Signature call µs | JSON call µs | JSON call / execute |
| --- | ---: | ---: | ---: | ---: | ---: |
| profile-1 | 26.740 | 283.870 | 184.283 | 28.138 | 0.1052% |
| profile-2 | 31.965 | 321.122 | 214.955 | 29.345 | 0.0918% |
| profile-3 | 29.893 | 299.697 | 197.497 | 26.793 | 0.0896% |
| profile-4 | 17.908 | 293.892 | 189.387 | 31.694 | 0.1770% |
| profile-5 | 35.679 | 294.139 | 188.457 | 31.681 | 0.0888% |
| profile-6 | 36.081 | 303.021 | 193.140 | 31.345 | 0.0869% |
| profile-7 | 35.138 | 279.727 | 176.090 | 27.285 | 0.0777% |

Phase medians are calculated separately over all seven runs: execute
31.965 ms, authenticate 294.139 µs,
signature call 189.387 µs and JSON call
29.345 µs. The per-run JSON/execute ratio has median
0.0896% and full observed range
0.0777–0.1770%. This ratio summary is not calculated from
the separately pooled phase medians. These are wall-clock profile observations,
not percentiles, confidence intervals or significance tests.

## Controls and scope

- Original snapshot CLI: one functional download succeeds with matching bytes/
  digest, clean staging and expected publication, without phase hooks.
- Invalid signature: profile reports exactly one signature call and **zero JSON
  calls**, with no HTTP request or destination mutation.
- Signed malformed JSON: exactly one signature and one JSON call, then `Json`
  failure with no HTTP request or destination mutation.
- Every successful profile has exactly one authenticate/signature/JSON call and
  one HTTP request. Original success/failure diagnostics are checked after
  separating the diagnostic-only profile line.

The timer spans are **nested and must not be added**:

| Span | Included | Excluded/limits |
| --- | --- | --- |
| `artifact::execute` | Request validation, bounded metadata read, signature/JSON/metadata checks, local HTTPS, body hashing, file writes/sync, checked rename and normal resource cleanup | Process startup, CLI argument parsing, signal-guard setup/stop and final diagnostic printing |
| Authenticate | Authentication helper body including bounded metadata read, signature, JSON and subsequent URL/digest validation | Ends in its defer before final owner-stack rewind |
| Signature | `crypto::verify_ed25519` call, including first-call backend work | Signature/key hex decoding and metadata file read |
| JSON | `json_codec::deserialize_into` call | Metadata declaration, later URL/digest validation and final owner cleanup |

The residual execute time is **unattributed**: this probe does not isolate TLS,
network, hashing, filesystem or synchronization individually. JSON's call-only
fraction is not a strict bound on all JSON-related work or potential speedup.
Clock calls/hooks perturb execution; fresh-process page faults and cold backend
initialization are part of the observed context. These values cannot be directly
compared with warm-loop codec microbenchmarks or production service latency.

Both compiler children and loopback server/client processes inherit CPU3 affinity;
no CPU4 work was started during CSV's courtesy window. Shared host, no exclusive
reservation or fixed frequency/turbo. The fixture uses real TLS/Ed25519/HTTP/FS,
with one ephemeral local CA trusted through the original test-only transport
shim. Certificate/hostname verification remains enabled. The URL is restricted
to the exact loopback fixture; no external application traffic is requested.
The private staging-parent contract remains intact. Test keys/certificates are
not production credentials and are not published as output artifacts.

## Provenance and reproduction

Consumer source is extracted read-only from Git commit
`c2d190b613c541a5dba839ce380de8b111c9ab0c`. No live artifact/crypto/HTTP/FS source,
checkout/index or consumer pin is changed. Metadata records original consumer
file hashes, dependency import pins, the two instrumented source hashes,
compiler/backend versions, private binary hashes, phase call counts and status
fields. Existing fixture server/certificate/status/payload helpers are imported
from that immutable snapshot; only the original TLS CA shim is linked, with no
fault-injection object.

The first and only complete profile was captured by a development prototype.
Its `harness_revision` field records the JSON checkout head at capture
(`ca3600d`), **where this tool was not yet tracked**; it is not an exact harness
Git revision. The exact recorded `harness_sha256` matches verbatim tool commit
`d56f3042ced076b8687ac3558655e85a9704b3c8`. That immutable commit is the proper
reproduction source. No observations were rerun to replace prototype data.
Later tooling adds explicit Git-revision matching/source-mutation checks and
calibration tests without changing the clock spans. Both original private
executables remain available locally for hash verification; generated builds,
keys, certificates and private snapshot files are excluded from publication.

For exact harness reproduction, use a disposable full JSON clone and a full
public consumer clone containing the pinned commit. Requirements: pinned Goose,
Linux, GCC/G++, CMake/pkg-config, libsodium/libcurl development packages, Python
and its `cryptography` package. The tool preserves the consumer's original pins;
Goose may fetch those public dependencies.

```sh
git -c credential.helper= clone https://github.com/carabistouflette/goose-artifact.git /tmp/artifact-consumer-source
git switch --detach d56f3042ced076b8687ac3558655e85a9704b3c8
python3 bench/consumer/artifact.py --goose /absolute/path/to/pinned/goose \
  --artifact-repo /tmp/artifact-consumer-source --cpu 3 \
  --output .build/artifact-consumer-profile
```

Choose an allowed CPU and a new/empty output directory. The ephemeral local port,
TLS keys/certificate and timings vary across replays. This is one small
application-profile checkpoint, not a broad comparative benchmark campaign.
