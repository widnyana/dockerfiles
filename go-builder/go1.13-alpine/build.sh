#!/usr/bin/env bash

TAGNAME="widnyana/go-builder:1.13-alpine"


DOCKER_BUILDKIT=1 docker build \
    --pull \
    -t "${TAGNAME}" \
    -f Dockerfile .

docker push ${TAGNAME}