.PHONY: build run clean

build:
	@./build.sh

run: build
	@open .build/Kyoto.app

clean:
	swift package clean
	rm -rf .build/Kyoto.app
