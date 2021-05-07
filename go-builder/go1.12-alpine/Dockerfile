FROM golang:1.12-alpine

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN set -ex \
    && apk -U upgrade \
        && apk add --no-cache --update -q --progress \
            git curl wget openssh-client make \
            gcc musl-dev g++ libc-dev \
            ca-certificates tzdata \
            upx
