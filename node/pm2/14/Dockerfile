FROM node:14-alpine

RUN set -ex; \
    apk add --no-cache \
    autoconf \
    automake \
    bash \
    git \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libjpeg-turbo-utils \
    libpng \
    libpng-dev \
    pngquant \
    make \
    nasm \
    libtool \
    libwebp-tools \
  && npm install pm2 -g --production

WORKDIR /usr/src/app
