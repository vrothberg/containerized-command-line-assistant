# containerized-command-line-assitsant
A Fedora container shipping github.com/rhel-lightspeed/command-line-assistant

```
# Build the image (default ARCH=amd64). Use the IMAGE variable to change the reference.
$ make ARCH=aarch64 oci-image
[...]
Successfully tagged quay.io/vrothberg/command-line-assistant:41

# Push the image. Use the IMAGE variable to change the reference.
$ make push-oci-image
```
