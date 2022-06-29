FROM php:8.0-apache

#: use this to change the apt mirror
ARG DEBIAN_REPO_MIRROR=kebo.pens.ac.id
ARG DEBIAN_SECURITY_REPO_MIRROR=kebo.pens.ac.id
ARG TIMEZONE=Asia/Jakarta

ENV TERM=dumb \
  PYTHONUNBUFFERED=1 \
  DEBIAN_FRONTEND=noninteractive


WORKDIR /var/www/html

RUN set -ex \
    #: change the apt mirror based on ARG above
    && sed -i "s/deb.debian.org/${DEBIAN_REPO_MIRROR}/g" /etc/apt/sources.list \
        && sed -i "s/security.debian.org/${DEBIAN_SECURITY_REPO_MIRROR}/g" /etc/apt/sources.list \
    #: Timezone stuff 
    && ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
        && echo $TIMEZONE > /etc/timezone \
    #: install required package
    && apt-get update \
      && apt-get install -y \
            apt-utils \
      && apt-get install -y \
            dumb-init \
            cron \
            autoconf \
            libpq-dev \
            libzip-dev \
            libjpeg62-turbo-dev \
            libpng-dev \
    #: datadog integration \
    && curl -o /tmp/datadog-setup.php -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php \
      && /usr/local/bin/php /tmp/datadog-setup.php --php-bin=all \
      && rm -fr /tmp/datadog-setup.php \
    #: apache2 httpd stuff
    && a2enmod rewrite \
        && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    #: install & configure php module
    && docker-php-ext-install pdo pdo_pgsql \
        && docker-php-ext-install gd \
        && docker-php-ext-configure gd --with-jpeg \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install -j$(nproc) sockets \
        && docker-php-ext-install -j$(nproc) curl \
        && docker-php-ext-install -j$(nproc) json \
        && docker-php-ext-install -j$(nproc) intl \
        && docker-php-ext-install -j$(nproc) exif fileinfo \
        && docker-php-ext-install -j$(nproc) bcmath sodium iconv \
        && docker-php-ext-install -j$(nproc) tokenizer xml \
    # perform clean-up
    && apt-get autoremove -y \
        && apt-get autoclean -y \
        && find /var/log/ -type f -delete; \
        rm -rf  /var/tmp/*; \
        rm -rf /var/lib/apt/lists/*; \
        rm -f /var/cache/apt/archives/*.deb \
            /var/cache/apt/archives/partial/*.deb \
            /var/cache/apt/*.bin; \
        rm -rf /root/.[acpw]*%;


EXPOSE 80
ENTRYPOINT ["dumb-init", "--"]