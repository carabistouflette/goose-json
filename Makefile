BENCH_ITERATIONS ?= 100000

GOOSE ?= .toolchain/goose/build/goose

.PHONY: setup check test format
setup:
	./scripts/setup-goose.sh
check:
	$(GOOSE) format --check json_codec.goose examples tests bench
	$(GOOSE) check tests/codec.goose
	$(GOOSE) check examples/item.goose
	$(GOOSE) check bench/bench.goose
test:
	$(GOOSE) run tests/codec.goose
	mkdir -p .build
	$(GOOSE) build tests/codec.goose -o .build/codec
	./.build/codec
	$(GOOSE) run examples/item.goose
	$(GOOSE) run bench/bench.goose -- 10
format:
	$(GOOSE) format json_codec.goose examples tests bench

.PHONY: bench bench-build bench-compare
bench-build:
	mkdir -p .build
	$(GOOSE) build bench/bench.goose --cc gcc -O2 -o .build/bench
bench: bench-build
	./.build/bench $(BENCH_ITERATIONS)
bench-compare: bench
	cargo run --locked --release --manifest-path bench/compare/Cargo.toml -- $(BENCH_ITERATIONS)
