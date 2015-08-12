.SILENT:
.PHONY: test

BUILD_TAG := build-$(shell uuidgen | tr -d '-' | tr '[:upper:]' '[:lower:]')

default:
	$(error Please select a target)

## Install package locally
install:
	npm link

## Install and test
test: install
	test/greeting.fsx Hello World

## Test in a dockerized environment
test-dockerized:
	docker build -t $(BUILD_TAG) -f docker/image/test .
	docker rmi $(BUILD_TAG) 2>/dev/null || true

## Uninstall local installation of the package
uninstall:
	npm unlink

## Same as `uninstall`
clean: uninstall
	@true

## Run TravisCI script
travisci: test
	@true

## Update git dependencies
gitdependencies:
	git submodule update --init --recursive --remote
	git submodule foreach git reset --hard origin/master

-include includes/makefile/help.mk
