#!/usr/bin/env bash

TAGNAME="widnyana/go-builder:1.22-alpine"

DOCKER_BUILDKIT=1 docker buildx build \
	--builder crossplatform \
	--platform linux/amd64,linux/arm64 \
	--progress plain \
	--no-cache \
	--rm \
	-t "${TAGNAME}" \
	-f Dockerfile . &&
	docker push ${TAGNAME}
