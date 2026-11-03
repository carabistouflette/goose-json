GOOSE ?= .toolchain/goose/build/goose

.PHONY: setup check test format
setup:
	./scripts/setup-goose.sh
check:
	$(GOOSE) format --check json_codec.goose examples tests
	$(GOOSE) check tests/codec.goose
	$(GOOSE) check examples/item.goose
test:
	$(GOOSE) run tests/codec.goose
	mkdir -p .build
	$(GOOSE) build tests/codec.goose -o .build/codec
	./.build/codec
	$(GOOSE) run examples/item.goose
format:
	$(GOOSE) format json_codec.goose examples tests
