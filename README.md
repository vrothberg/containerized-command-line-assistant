# containerized-command-line-assistant
A Fedora container shipping github.com/rhel-lightspeed/command-line-assistant

```
# Build the image (default ARCH=amd64). Use the IMAGE variable to change the reference.
$ make ARCH=aarch64 oci-image
[...]
Successfully tagged quay.io/vrothberg/command-line-assistant:41

# Push the image. Use the IMAGE variable to change the reference.
$ make push-oci-image
```

## Usage

The command-line-assistant has dbus dependencies which requires systemd to be PID1 inside the container.  Hence, we first need to run the container and can then interact with it via `podman-exec`.

### Start the container

`$ podman run --rm --name=cla --privileged -v /etc/pki/consumer:/etc/pki/consumer quay.io/vrothberg/command-line-assistant:41`

### Interact with the command-line-assistant

![screenshot](screenshot.png)
