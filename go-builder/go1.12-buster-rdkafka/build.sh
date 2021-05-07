#!/usr/bin/env bash
set -ex
TAG_NAME="widnyana/go-builder:1.12-buster-rdkafka"


DOCKER_BUILDKIT=1 docker build \
    --compress \
    --no-cache \
    --rm \
    --squash \
    -t ${TAG_NAME} \
    -f Dockerfile .

docker push ${TAG_NAME}