SHELL=/bin/bash

current_dir = $(shell pwd)

.PHONY: build run

all: build run

build:
	docker build -t daronco/presentations .

run: build
	docker run --rm -v ${current_dir}/${TARGET}/images:/opt/presentation/images -v ${current_dir}/${TARGET}/index.html:/opt/presentation/index.html -p 8000:8000 daronco/presentations
