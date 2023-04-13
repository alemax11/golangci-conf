.install-linter:
	[ -f $(shell pwd)/bin/golangci-lint ] || curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(shell pwd)/bin v1.52.2

lint: .install-linter
	$(shell pwd)/bin/golangci-lint run --fix --config=./.golangci.yaml

lint-fast: .install-linter
	$(shell pwd)/bin/golangci-lint run --fix --fast --config=./.golangci.yaml
