#!/usr/bin/env bash

set -e

VERSION=v1.0.0
REPO=https://github.com/aka-bo/docker-machine-godaddy

echo "Downloading driver..."
curl -L ${REPO}/releases/download/${VERSION}/docker-machine-driver-godaddy-$(uname -s) > docker-machine-driver-godaddy

echo "Installing..."
chmod +x docker-machine-driver-godaddy
mv docker-machine-driver-godaddy /usr/local/bin/

echo "Install complete."
exit 0
