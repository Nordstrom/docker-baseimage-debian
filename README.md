# docker-baseimage-debian

Nordstrom's Docker baseimage based on Debian. This is based on [`minideb`](https://github.com/bitnami/minideb), with a few additions.

The images produced from this repo are published to `quay.io/nordstrom/baseimage-debian`. We intend to publish a tag for each release of Debian[1]. We will probably only actively maintain images for a single release at a time (so far, just `stretch`).

[1] Yes, this means that we overwrite the tag value when updating. Maintaining fine-grained versioning in the `FROM` of a Dockerfile is a significant hassle (which would be necessary if we used immutable tags), so mutating the tag value is a compromise.
