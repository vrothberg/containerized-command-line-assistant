#!/bin/sh
set -xeuo pipefail

mkdir -p /etc/pki/consumer
find /run/secrets/etc-pki-entitlement/ -type f ! -name *-key.pem -exec ln -s {} /etc/pki/consumer/cert.pem \;
find /run/secrets/etc-pki-entitlement/ -type f -name *-key.pem -exec ln -s {} /etc/pki/consumer/key.pem \;
