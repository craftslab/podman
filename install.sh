#!/bin/bash

# Install packages
sudo apt update
sudo apt install -y \
  btrfs-progs \
  containernetworking-plugins \
  crun \
  git \
  go-md2man \
  iptables \
  libassuan-dev \
  libbtrfs-dev \
  libc6-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libgpgme-dev \
  libgpg-error-dev \
  libprotobuf-dev \
  libprotobuf-c-dev \
  libseccomp-dev \
  libselinux1-dev \
  libsystemd-dev \
  pkg-config \
  protobuf-compiler \
  slirp4netns \
  uidmap
