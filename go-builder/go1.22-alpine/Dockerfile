FROM golang:1.22-alpine

ENV GO111MODULE=on \
    CGO_ENABLED=1 \
    GOOS=linux

RUN set -ex \
    && apk update \
        && apk add --no-cache --update -q --progress \
            git curl wget openssh-client \
            gcc musl-dev g++ libc-dev \
            ca-certificates tzdata \
            upx make 
