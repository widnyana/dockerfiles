FROM golang:1.15-alpine3.13

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN set -ex \
    && apk update \
        && apk add --no-cache --update -q --progress \
            git curl wget openssh-client \
            gcc musl-dev g++ libc-dev \
            ca-certificates tzdata \
            upx make
