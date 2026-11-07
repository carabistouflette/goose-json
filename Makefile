BENCH_ITERATIONS ?= 100000
BENCH_CC ?= gcc

GOOSE ?= .toolchain/goose/build/goose

.PHONY: setup check test test-debug test-portable format
setup:
	./scripts/setup-goose.sh
check:
	python3 scripts/check-benchmark-sources.py --check
	python3 scripts/benchmark-report.py --check
	python3 bench/fixtures.py --check
	python3 -m unittest discover -s tests -p 'test_*.py'
	python3 scripts/native-manifest.py --check
	"$(GOOSE)" format --check json_codec.goose protocol.goose native/runtime.goose examples tests bench
	"$(GOOSE)" check tests/protocol.goose
	"$(GOOSE)" check tests/protocol_bounds.goose
	"$(GOOSE)" check tests/codec.goose
	"$(GOOSE)" check tests/formatting.goose
	"$(GOOSE)" check examples/protocol.goose
	"$(GOOSE)" check examples/item.goose
	"$(GOOSE)" check examples/into.goose
	"$(GOOSE)" check bench/bench.goose
	"$(GOOSE)" check bench/large/encoder.goose
test:
	python3 scripts/native-manifest.py --check
	"$(GOOSE)" run tests/protocol.goose
	"$(GOOSE)" run tests/protocol_bounds.goose
	python3 scripts/protocol-independent-fixtures.py
	"$(GOOSE)" run .build/protocol-independent-review.goose --debug
	"$(GOOSE)" run tests/protocol.goose --debug
	"$(GOOSE)" run tests/protocol_bounds.goose --debug
	"$(GOOSE)" build tests/protocol.goose --cc gcc -O2 -o .build/protocol-optimized
	./.build/protocol-optimized
	"$(GOOSE)" build tests/protocol_bounds.goose --cc gcc -O2 -o .build/protocol-bounds-optimized
	./.build/protocol-bounds-optimized
	mkdir -p .build
	"$(GOOSE)" build tests/protocol.goose --cc gcc --debug -D GOOSE_JSON_FORCE_PORTABLE -o .build/protocol-portable
	./.build/protocol-portable
	"$(GOOSE)" build tests/protocol_bounds.goose --cc gcc --debug -D GOOSE_JSON_FORCE_PORTABLE -o .build/protocol-bounds-portable
	./.build/protocol-bounds-portable
	"$(GOOSE)" run tests/codec.goose
	"$(GOOSE)" run tests/formatting.goose
	mkdir -p .build
	"$(GOOSE)" build tests/codec.goose -o .build/codec
	./.build/codec
	"$(GOOSE)" build tests/formatting.goose -o .build/formatting
	./.build/formatting
	"$(GOOSE)" run examples/protocol.goose
	"$(GOOSE)" run examples/item.goose
	"$(GOOSE)" run examples/into.goose
	"$(GOOSE)" run bench/bench.goose -- 10
test-debug:
	python3 scripts/native-manifest.py --check
	mkdir -p .build
	"$(GOOSE)" run tests/codec.goose --debug
	"$(GOOSE)" run tests/formatting.goose --debug
	"$(GOOSE)" build tests/codec.goose --debug -o .build/codec-debug
	./.build/codec-debug
	"$(GOOSE)" build tests/formatting.goose --debug -o .build/formatting-debug
	./.build/formatting-debug
test-portable:
	python3 scripts/native-manifest.py --check
	mkdir -p .build
	"$(GOOSE)" build tests/codec.goose --cc gcc --debug -D GOOSE_JSON_FORCE_PORTABLE -o .build/codec-portable
	./.build/codec-portable
	"$(GOOSE)" build tests/formatting.goose --cc gcc --debug --standalone -D GOOSE_JSON_FORCE_PORTABLE -o .build/formatting-portable
	./.build/formatting-portable
format:
	python3 scripts/native-manifest.py
	"$(GOOSE)" format json_codec.goose native/runtime.goose examples tests bench

.PHONY: bench bench-build bench-compare
bench-build:
	python3 bench/fixtures.py --check
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

.PHONY: test-native fuzz-native
NATIVE_BUILD = .build/native-$(notdir $(CXX))
FUZZ_CXX ?= clang++
FUZZ_RUNS ?= 10000
FUZZ_FLAGS ?=
test-native:
	cmake -S . -B "$(NATIVE_BUILD)" -DCMAKE_BUILD_TYPE=Debug -DGOOSE_JSON_NATIVE_TESTS=ON -DCMAKE_CXX_COMPILER="$(CXX)"
	cmake --build "$(NATIVE_BUILD)" --target goose_json_native_test --parallel 2
	UBSAN_OPTIONS=halt_on_error=1 "$(NATIVE_BUILD)/goose_json_native_test"
fuzz-native:
	cmake -S . -B .build/fuzz -DCMAKE_BUILD_TYPE=Debug -DGOOSE_JSON_FUZZ=ON -DCMAKE_CXX_COMPILER="$(FUZZ_CXX)" -DCMAKE_CXX_FLAGS="$(FUZZ_FLAGS)"
	cmake --build .build/fuzz --target goose_json_fuzz --parallel 2
	mkdir -p .build/fuzz-corpus .build/fuzz-artifacts
	cp bench/fixtures/*.json .build/fuzz-corpus/
	printf '%s' 'ABCDEFGH' > .build/fuzz-corpus/float-format-success
	printf '%s' ',1.25,-0.0]' > .build/fuzz-corpus/array-continuation
	UBSAN_OPTIONS=halt_on_error=1 ./.build/fuzz/goose_json_fuzz .build/fuzz-corpus -artifact_prefix=.build/fuzz-artifacts/ -dict=tests/fuzz.dict -seed=219 -max_len=16384 -runs=$(FUZZ_RUNS)
