# Dockerfiles

![go release workflow](https://github.com/widnyana/dockerfiles/actions/workflows/release.yaml/badge.svg) ![node release workflow](https://github.com/widnyana/dockerfiles/actions/workflows/oci-nodejs.yaml/badge.svg)


Container image collections



## Available tags

- `widnyana/go-builder`: for your golang multistage build process, see: [docker hub](https://hub.docker.com/r/widnyana/go-builder)
- `widnyana/pm2`: for serving nodejs app using [PM2](https://pm2.keymetrics.io/) [docker hub](https://hub.docker.com/r/widnyana/pm2)

*please refers to `Dockerfile` on each directory for detailed package installed on the container.

## Usage

A brief usage explanations for each tags

### widnyana/go-builder

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