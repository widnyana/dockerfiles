#!/usr/bin/env bash

TAGNAME="widnyana/go-builder:1.16-buster"

DOCKER_BUILDKIT=1 docker build \
    --pull \
    --compress \
    --no-cache \
    --rm \
    -t "${TAGNAME}" \
    -f Dockerfile .

docker push widnyana/go-builder --all-tags
