#!/usr/bin/env bash

VERSION=v1.0.0
REPO=https://github.com/aka-bo/docker-machine-godaddy

curl -L ${REPO}/releases/download/${VERSION}/docker-machine-driver-godaddy-$(uname -s) > docker-machine-driver-godaddy
chmod +x docker-machine-driver-godaddy
mv docker-machine-driver-godaddy /usr/local/lib/
