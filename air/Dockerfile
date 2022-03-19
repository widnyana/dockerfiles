FROM alpine:3.13

WORKDIR /app

ARG VERSION "master"

RUN apk add --no-cache \
        bash \
        curl \
    && curl -fLo install.sh https://raw.githubusercontent.com/cosmtrek/air/$VERSION/install.sh \
        && chmod +x install.sh \
        && sh install.sh \
        && cp ./bin/air /bin/air

CMD ["air"]
