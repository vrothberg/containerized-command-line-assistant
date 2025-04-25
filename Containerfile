FROM registry.fedoraproject.org/fedora:41
RUN <<EOF
set -xeuo pipefail
dnf -y copr enable @rhel-lightspeed/command-line-assistant
dnf -y install command-line-assistant systemd subscription-manager
dnf clean all
EOF

# Link the mounted entitlements/certificates to make sure
# the container can run as a non-root user.
COPY ./link-entitlements.sh /usr/bin/
COPY ./link-entitlements.service /etc/systemd/system
RUN systemctl enable link-entitlements.service

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
