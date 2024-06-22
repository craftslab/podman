#!/bin/bash

# Set version
release="$1"
version=${release#"v"}

# Install Go
curl -L https://go.dev/dl/go1.22.4.linux-amd64.tar.gz -o go.tar.gz
tar zxvf go.tar.gz
rm go.tar.gz

# Set path
export PATH=$PWD/go/bin:$PATH

# Fetch podman
curl -LO https://github.com/containers/podman/archive/refs/tags/v"$version".zip
unzip v"$version".zip
rm v"$version".zip

pushd podman-"$version" || exit

# Build podman
make BUILDTAGS="" PREFIX="$PWD"/release

# Install podman
make install PREFIX="$PWD"/release

# Install conmon
curl -L https://github.com/containers/conmon/releases/download/v2.1.12/conmon.amd64 -o release/bin/conmon
chmod +x release/bin/conmon

# Install crun
curl -L https://github.com/containers/crun/releases/download/1.15/crun-1.15-linux-amd64 -o release/bin/crun
chmod +x release/bin/crun

# Set package
mkdir -p "$PWD"/release/DEBIAN
bash -c "cat > $PWD/release/DEBIAN/control" << EOF
Package: podman
Version: $version
Maintainer: Jia Jia
Architecture: all
Description: Podman Debian package
EOF

# Build package
dpkg-deb --build release

popd || exit
