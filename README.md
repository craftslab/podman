# podman

[![Build Status](https://github.com/craftslab/podman/workflows/release/badge.svg?branch=main&event=push)](https://github.com/craftslab/podman/actions?query=workflow%3Arelease)
[![License](https://img.shields.io/github/license/craftslab/podman.svg)](https://github.com/craftslab/podman/blob/main/LICENSE)
[![Tag](https://img.shields.io/github/tag/craftslab/podman.svg)](https://github.com/craftslab/podman/tags)



## Introduction

*podman* is the GitHub actions to build [Podman](https://github.com/containers/podman) release on Ubuntu.



## Dependency

```bash
apt install -y \
  containernetworking-plugins \
  iptables \
  libdevmapper-dev \
  libfuse3-dev \
  libgpgme-dev \
  libseccomp-dev \
  slirp4netns \
  uidmap
```



## Reference

- [buildah-install](https://github.com/containers/buildah/blob/main/install.md)
- [creating-debianubuntu-deb-packages](https://www.iodigital.com/en/history/intracto/creating-debianubuntu-deb-packages)
- [how-to-upload-file-to-github-release-in-a-workflow](https://michael-mckenna.com/how-to-upload-file-to-github-release-in-a-workflow/)
- [podman-building-from-source](https://podman.io/docs/installation#building-from-source)
- [ubuntu-podman](https://packages.ubuntu.com/jammy/podman)
