#!/usr/bin/env bash

TAGNAME="widnyana/pm2:14-alpine"

DOCKER_BUILDKIT=1 docker build \
    -t "${TAGNAME}" \
    -f Dockerfile . \
  && docker push ${TAGNAME} \
  && docker rmi ${TAGNAME}