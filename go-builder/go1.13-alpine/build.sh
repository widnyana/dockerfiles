#!/usr/bin/env bash

DOCKER_BUILDKIT=1 docker build --no-cache --rm -t "widnyana/go-builder:1.13-alpine" -f Dockerfile .
docker push widnyana/go-builder
