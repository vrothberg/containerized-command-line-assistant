OCI_IMAGE ?= quay.io/vrothberg/command-line-assistant:41
ARCH ?= amd64

.PHONY: oci-image
oci-image:
	podman build --platform linux/$(ARCH) -t $(OCI_IMAGE) .

.PHONY: push-oci-image
push-oci-image:
	podman push $(OCI_IMAGE)
