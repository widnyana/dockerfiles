FROM golang:1.13-alpine

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN set -ex \
    && apk update \
        && apk add --no-cache --update -q --progress \
            git openssh-client \
            gcc musl-dev g++ \
            ca-certificates tzdata \
            upx
