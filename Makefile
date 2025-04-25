IMAGE ?= quay.io/vrothberg/command-line-assistant:41
ARCH ?= amd64

.PHONY: image
image:
	podman build --platform linux/$(ARCH) -t $(IMAGE)-$(ARCH) .

.PHONY: push-manifest
push-manifest:
	podman manifest push $(IMAGE)

.PHONY: manifest
manifest:
	make ARCH=amd64 image
	make ARCH=arm64 image
	podman rmi -f $(IMAGE)
	podman manifest create $(IMAGE) $(IMAGE)-amd64 $(IMAGE)-arm64
