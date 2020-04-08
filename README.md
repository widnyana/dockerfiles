# Dockerfiles

docker image for your multistage build process

## Available tags

- `widnyana/go-builder:1.13-alpine`
- `widnyana/go-builder:1.13-buster`

## Usage


```
FROM widnyana/go-builder:1.13-alpine as builder
WORKDIR /app
COPY . /app

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN set -ex \
    && cd /app \
    && go mod download \
        && GIT_TAG=$(git describe --abbrev=0 2> /dev/null || echo "no tag") \
            COMMIT=$(git log -1 --pretty=format:"%at-%h" 2> /dev/null || echo "no commit") \
            COMMIT_MSG=$(git log -1 --pretty=format:"%s"2> /dev/null || echo "no msg") \
            go build -a -i \
                -ldflags "-w \
                    -X 'package/config.CommitMsg=${COMMIT_MSG}' \
                    -X 'package/config.CommitHash=${COMMIT}' \
                    -X 'package/config.AppVersion=${GIT_TAG}'" \
                    -o whatever \
FROM alpine:latest

ARG WHATEVER_HTTP_PORT=2525
WORKDIR /root/
COPY --from=builder /app/whatever .

# Do as you want ...
```


## License
```
Copyright © 2020 widnyana <wid -at- widnyana.web.id>

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar.
```