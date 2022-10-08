#!/usr/bin/env bash

TAGNAME="widnyana/go-builder:1.19-alpine3.16"


DOCKER_BUILDKIT=1 docker build \
    --no-cache \
    --rm \
    -t "${TAGNAME}" \
    -f Dockerfile . \
  && docker push ${TAGNAME}