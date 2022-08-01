PHONY = \
	help \
	lint \
	serve \
	serve-docs \
	build \
	build-docs \
	test-unit \
	test-unit-coverage \
	test-e2e \
	clean \

.SILENT: ${PHONY}

# .DEFAULT_GOAL is the target that is executed when 'make' is typed
.DEFAULT_GOAL = help

PATH  := $(PATH):$(PWD)/node_modules/.bin

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	sort | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

lint: ## Runs linting on all JS code
	vue-cli-service lint

serve: ## Provides a dev instance on the application with hot reload
	development=true vue-cli-service serve

serve-docs: ## Provides the documentation on a local server with hot reload
	vue-cli-service styleguidist

build: ## Compiles and minifies the application for production
	vue-cli-service build

build-docs: ## Builds the documentation and minifies for production
	vue-cli-service styleguidist:build

test-unit: ## Runs the unit tests
	vue-cli-service test:unit

test-unit-coverage: ## Runs the unit tests and generates a code coverage report
	vue-cli-service test:unit --coverage

test-e2e: ## Runs the end-to-end unit tests
	echo "End-to-end testing is not currently supported"
	# vue-cli-service test:e2e

clean:
	echo "Removing build files and test coverage information"
	rm -rf dist
	rm -rf coverage
	rm -rf styleguide
	find . -maxdepth 1 -type f -name codecov\* -exec rm {} \;
	rm jest-report.xml
