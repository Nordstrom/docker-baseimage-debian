IMAGE_NAME := baseimage-debian
IMAGE_REGISTRY := quay.io/nordstrom
IMAGE_TAG := stretch

ifdef http_proxy
BUILD_ARGS += --build-arg http_proxy=$(http_proxy)
BUILD_ARGS += --build-arg https_proxy=$(http_proxy)
endif

.PHONY: push/image
push/image: tag/image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: tag/image
tag/image: build/image
	docker tag $(IMAGE_NAME) $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build/image
build/image:
	docker build -t $(IMAGE_NAME) $(BUILD_ARGS) .

build:
	mkdir -p $@

.PHONY: clean/built_image
clean/image:
	-docker rmi $(IMAGE_NAME)

.PHONY: clean
clean: clean/image
	rm -rf build
