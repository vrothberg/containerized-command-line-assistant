FROM registry.fedoraproject.org/fedora:41
RUN <<EOF
set -xeuo pipefail
dnf -y copr enable @rhel-lightspeed/command-line-assistant
dnf -y install command-line-assistant
dnf -y install systemd
dnf clean all
EOF

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
