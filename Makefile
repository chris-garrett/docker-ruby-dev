
IMAGE_VERSION=2.1
IMAGE_NAME=chrisgarrett/ruby-dev

all: build

prep:
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/Dockerfile.template > Dockerfile
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/README.md.template > README.md

build: prep
	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run --rm -it \
		-v `pwd`/src:/work/app \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		bash

