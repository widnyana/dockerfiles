#!/usr/bin/env bash

TAGNAME="widnyana/php:8.0-apache"


DOCKER_BUILDKIT=1 docker build \
    --no-cache \
    --rm \
    -t "${TAGNAME}" \
    -f Dockerfile . \
  && docker push ${TAGNAME}