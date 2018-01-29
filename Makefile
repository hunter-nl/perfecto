################################################################################

# This Makefile generated by GoMakeGen 0.7.1 using next command:
# gomakegen .

################################################################################

.DEFAULT_GOAL := help
.PHONY = fmt all clean deps deps-test test help

################################################################################

all: perfecto ## Build all binaries

perfecto: ## Build perfecto binary
	go build perfecto.go

install: ## Install binaries
	cp perfecto /usr/bin/perfecto

uninstall: ## Uninstall binaries
	rm -f /usr/bin/perfecto

deps: ## Download dependencies
	git config --global http.https://pkg.re.followRedirects true
	go get -d -v pkg.re/essentialkaos/ek.v9

deps-test: ## Download dependencies for tests
	git config --global http.https://pkg.re.followRedirects true
	go get -d -v pkg.re/check.v1

test: ## Run tests
	go test -covermode=count ./...

fmt: ## Format source code with gofmt
	find . -name "*.go" -exec gofmt -s -w {} \;

clean: ## Remove generated files
	rm -f perfecto

help: ## Show this info
	@echo -e '\nSupported targets:\n'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[33m%-12s\033[0m %s\n", $$1, $$2}'
	@echo -e ''

################################################################################
