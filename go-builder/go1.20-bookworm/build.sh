#!/usr/bin/env bash

TAGNAME="widnyana/go-builder:1.20-bookwormm"


DOCKER_BUILDKIT=1 docker build \
    --no-cache \
    --rm \
    -t "${TAGNAME}" \
    -f Dockerfile . \
  && docker push ${TAGNAME}