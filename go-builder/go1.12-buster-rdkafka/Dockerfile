FROM golang:1.12-buster

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN set -ex \
    && wget -qO - https://packages.confluent.io/deb/5.4/archive.key | apt-key add - \
      && add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/5.4 stable main" \  
    && apt-get update \
        && apt-get install -yqq \
            build-essential \
            tzdata \
            ca-certificates \
            upx \
            librdkafka-dev librdkafka1 \
    && echo 'export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig/' >> ~/.bash_profile \
    && apt-get autoclean \
    && apt-get autoremove; \
    find /var/log/ -type f -delete; \
    rm -rf /tmp/* /var/tmp/*; \
    rm -rf /var/lib/apt/lists/*; \
    rm -f /var/cache/apt/archives/*.deb \
        /var/cache/apt/archives/partial/*.deb \
        /var/cache/apt/*.bin; \
    rm -rf /root/.[acpw]*