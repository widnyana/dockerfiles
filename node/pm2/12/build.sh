#!/usr/bin/env bash

TAGNAME="widnyana/pm2:12-alpine"

DOCKER_BUILDKIT=1 docker build \
    --no-cache \
    --rm \
    -t "${TAGNAME}" \
    -f Dockerfile . \
  && docker push ${TAGNAME} \
  && docker rmi ${TAGNAME}