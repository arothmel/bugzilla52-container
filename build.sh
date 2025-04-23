#!/bin/bash
set -e

IMAGE_NAME=bugzilla52:alma8
TAR_NAME=bugzilla52-alma8.tar
BUGZILLA_TAR=bugzilla-5.2.tar.gz
BUGZILLA_URL=https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla/bugzilla-5.2.tar.gz

echo "[*] Fetching Bugzilla source..."
wget -N $BUGZILLA_URL
tar -xzf $BUGZILLA_TAR

echo "[*] Building container image..."
podman build -t $IMAGE_NAME .

echo "[*] Saving container image to tarball..."
podman save -o $TAR_NAME $IMAGE_NAME

echo "[✔] Done. Image saved as $TAR_NAME"

