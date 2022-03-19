#!/usr/bin/env bash

VERSION=${1:-"master"}
DOCKER_BUILDKIT=1 

if [[ $VERSION == "master" ]]; then
  TAGNAME="widnyana/air:${VERSION}"
else
  TAGNAME="widnyana/air:latest"
fi


docker build \
    -t "${TAGNAME}" \
    -f Dockerfile . \
    --build-arg "VERSION=${VERSION}" \
  && docker push ${TAGNAME}