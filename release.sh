#!/bin/bash

# Fetch netavark
git clone https://github.com/containers/netavark.git -b v1.11.0 --depth=1

pushd netavark || exit

# Build netavark
make

popd || exit


# Fetch podman
version="$1"
git clone https://github.com/containers/podman/ -b v"$version" --depth=1

pushd podman || exit

# Build podman
make BUILDTAGS="selinux seccomp" PREFIX="$PWD"/release

# Install podman
make install PREFIX="$PWD"/release

# Install buildah
# TBD

# Install conmon
curl -L https://github.com/containers/conmon/releases/download/v2.1.12/conmon.amd64 -o release/bin/conmon
chmod +x release/bin/conmon

# Install crun
curl -L https://github.com/containers/crun/releases/download/1.15/crun-1.15-linux-amd64 -o release/bin/crun
chmod +x release/bin/crun

# Install fuse-overlayfs
curl -L https://github.com/containers/fuse-overlayfs/releases/download/v1.13/fuse-overlayfs-x86_64 -o release/bin/fuse-overlayfs
chmod +x release/bin/fuse-overlayfs

# Install netavark
mkdir -p release/lib/podman
cp ../netavark/bin/netavark release/lib/podman/
chmod +x release/lib/podman/netavark

# Install config
# https://github.com/containers/common/blob/main/pkg/config/containers.conf
# https://src.fedoraproject.org/rpms/containers-common/blob/main/f/default-policy.json
# https://src.fedoraproject.org/rpms/containers-common/blob/main/f/mounts.conf
# https://src.fedoraproject.org/rpms/containers-common/blob/main/f/registries.conf
# https://src.fedoraproject.org/rpms/containers-common/blob/main/f/seccomp.json
cp ../config/* release/etc/containers/
sed -i -e 's/#default_rootless_network_cmd = "pasta"/default_rootless_network_cmd = "slirp4netns"/g' release/etc/containers/containers.conf

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
