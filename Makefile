.SILENT:
.PHONY: test

default:
	$(error Please select a target. Type `make help` for more information.)

## Install package locally
install:
	npm link

## Install and test
test: install
	test/greeting.fsx Hello World

## Test in a dockerized environment
test-dockerized:
	$(eval BUILD_TAG := build-$(shell uuidgen | tr -d '-' | tr '[:upper:]' '[:lower:]'))
	docker build -t $(BUILD_TAG) -f docker/image/test.dockerfile .
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
