#!/usr/bin/env bash

DOCKER_BUILDKIT=1 docker build --compress --no-cache --rm -t "widnyana/go-builder:1.12-buster" -f Dockerfile .
docker push widnyana/go-builder
