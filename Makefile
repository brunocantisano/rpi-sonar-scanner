.PHONY: all build push test

DOCKER_IMAGE_NAME=paperinik/rpi-sonar-scanner:4.5.0.2216

all: build

build:
	docker build -t $(DOCKER_IMAGE_NAME) .

push:
	docker push $(DOCKER_IMAGE_NAME)

test:
	docker run --rm $(DOCKER_IMAGE_NAME) /bin/echo "Success."
