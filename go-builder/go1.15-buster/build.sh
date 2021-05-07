#!/usr/bin/env bash

DOCKER_BUILDKIT=1 docker build \
    --pull \
    --compress \
    --no-cache \
    --rm \
    -t "widnyana/go-builder:1.15-buster" \
    -f Dockerfile .

docker push widnyana/go-builder --all-tags
