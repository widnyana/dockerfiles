FROM golang:1.17-buster

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN set -ex \
    && apt-get update \
        && apt-get upgrade -y \
        && apt-get install -y \
            build-essential \
            tzdata \
            ca-certificates \
            upx \
    && apt-get autoclean \
    && apt-get autoremove; \
    find /var/log/ -type f -delete; \
    rm -rf /tmp/* /var/tmp/*; \
    rm -rf /var/lib/apt/lists/*; \
    rm -f /var/cache/apt/archives/*.deb \
        /var/cache/apt/archives/partial/*.deb \
        /var/cache/apt/*.bin; \
    rm -rf /root/.[acpw]*