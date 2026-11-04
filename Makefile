BENCH_ITERATIONS ?= 100000
BENCH_CC ?= gcc

GOOSE ?= .toolchain/goose/build/goose

.PHONY: setup check test format
setup:
	./scripts/setup-goose.sh
check:
	python3 -m unittest discover -s tests -p 'test_*.py'
	python3 scripts/native-manifest.py --check
	"$(GOOSE)" format --check json_codec.goose examples tests bench
	"$(GOOSE)" check tests/codec.goose
	"$(GOOSE)" check examples/item.goose
	"$(GOOSE)" check bench/bench.goose
test:
	python3 scripts/native-manifest.py --check
	"$(GOOSE)" run tests/codec.goose
	mkdir -p .build
	"$(GOOSE)" build tests/codec.goose -o .build/codec
	./.build/codec
	"$(GOOSE)" run examples/item.goose
	"$(GOOSE)" run bench/bench.goose -- 10
format:
	python3 scripts/native-manifest.py
	"$(GOOSE)" format json_codec.goose examples tests bench

.PHONY: bench bench-build bench-compare
bench-build:
	python3 scripts/native-manifest.py --check
	mkdir -p .build
	"$(GOOSE)" build bench/bench.goose --cc "$(BENCH_CC)" -O2 -o .build/bench
bench: bench-build
	./.build/bench $(BENCH_ITERATIONS)
bench-compare: bench
	cargo run --locked --release --manifest-path bench/compare/Cargo.toml -- $(BENCH_ITERATIONS)

.PHONY: bench-native
bench-native:
	RUSTFLAGS="-C target-cpu=native" $(MAKE) bench-compare BENCH_CC="$(abspath bench/native-cc.sh)"

.PHONY: test-native
test-native:
	mkdir -p .build
	$(CXX) -std=c++17 -O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer tests/native.cpp native/accelerated.cpp native/vendor/simdutf/simdutf.cpp native/vendor/dragonbox/dragonbox_to_chars.cpp -DJKJ_NAMESPACE=goose_json_dragonbox -Inative/vendor -Inative/vendor/simdutf -o .build/native-sanitize
	UBSAN_OPTIONS=halt_on_error=1 ./.build/native-sanitize
