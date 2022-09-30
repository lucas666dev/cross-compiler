# Name of the project.
PROJECT = lucas666dev
IMAGE_PREFIX = cross-compiler
TAG = $(shell git describe --tags | cut -c2-)
ifeq ($(TAG),)
	TAG := dev
endif

# Set binaries and platform specific variables.
DOCKER = docker

# Platforms on which we want to build the project.
PLATFORMS = \
	android-arm \
	android-arm64 \
	android-x64 \
	android-x86 \
	darwin-x64 \
	darwin-arm64 \
	linux-arm \
	linux-armv7 \
	linux-arm64 \
	linux-x64 \
	linux-x86 \
	windows-x64 \
	windows-x86

.PHONY: $(PLATFORMS)

all:
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done

base:
	$(DOCKER) build --platform linux/x86_64 -t $(PROJECT)/$(IMAGE_PREFIX)-base:$(TAG) .

$(PLATFORMS): base
	$(DOCKER) build --platform linux/x86_64 \
		-t $(PROJECT)/$(IMAGE_PREFIX)-$@:$(TAG) \
		-t $(PROJECT)/$(IMAGE_PREFIX)-$@:latest \
		--build-arg BASE_TAG=$(TAG) -f docker/$@.Dockerfile docker

push:
	docker push $(PROJECT)/$(IMAGE_PREFIX)-$(PLATFORM):latest
	docker push $(PROJECT)/$(IMAGE_PREFIX)-$(PLATFORM):$(TAG)

push-all:
	for i in $(PLATFORMS); do \
		PLATFORM=$$i $(MAKE) push; \
	done

pull:
	docker pull $(PROJECT)/$(IMAGE_PREFIX)-$(PLATFORM):latest

pull-all:
	for i in $(PLATFORMS); do \
		PLATFORM=$$i $(MAKE) pull; \
	done
