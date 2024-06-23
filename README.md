# podman



## Introduction

*podman* is the GitHub actions to build [Podman](https://github.com/containers/podman) release on Ubuntu.



## Dependency

```bash
sudo apt update
sudo apt install -y \
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
