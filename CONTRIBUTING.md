# Contributing

Keep the API small, pure, and explicit. Applications own file/process I/O. Prefer standard-library parsing and formatting over duplicate implementations. Discuss additions to the supported type set before broadening it.

Use focused branches (`feat/...`, `fix/...`, `docs/...`) and Conventional Commits: `feat: add ...`, `fix: reject ...`, `docs: clarify ...`, `test: cover ...`, `chore: update ...`. Subjects are imperative; commits contain one coherent change. Use semantic versions when a reviewed release is ready; no stability guarantee exists before 1.0.

For behavior changes, add a regression case in `tests/codec.goose`. Run `make format`, `make check test`, and `git diff --check`. Tests must exercise real public API behavior, including malformed input and ownership. Request an independent review, fix actionable findings, and keep main passing CI. Never commit credentials, generated compiler output, or private workspace notes.

Compiler changes require a reviewed full upstream commit in `GOOSE_REVISION` and full validation. CI builds that exact revision with optional graphics/audio disabled. Report vulnerabilities privately through GitHub's security advisory reporting when enabled; avoid public exploit details before a fix is available.

## Performance

Run `make bench` for the dependency-free native Goose harness, or `make bench-compare` for the optional locked Rust JSON/Protobuf baselines. See [bench/README.md](bench/README.md) for measurement scope and reproducibility. Profile before optimizing. Preserve validation and ownership guarantees, report regressions and all fixtures, and keep raw samples with the compiler, hardware, flags, and source revision. CI checks benchmark execution, not timing thresholds. Do not claim a universal ranking from microbenchmarks.
