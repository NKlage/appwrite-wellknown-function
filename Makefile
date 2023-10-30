build-runner:
	dart pub run build_runner build --delete-conflicting-outputs

watch-build-runner:
	dart pub run build_runner watch --delete-conflicting-outputs

lint:
	dart analyze

tests:
	make build-runner
	dart test
