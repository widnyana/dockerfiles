#!/usr/bin/env bash

DOCKER_BUILDKIT=1 
TAGNAME="widnyana/go-builder:1.17-alpine"

docker build \
    --no-cache \
    --rm \
    -t "${TAGNAME}" \
    -f Dockerfile . \
  && docker push ${TAGNAME}