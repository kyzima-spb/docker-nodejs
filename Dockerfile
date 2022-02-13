FROM node:16-alpine

VOLUME /node_modules

WORKDIR /app
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN set -x \
    && apk update \
    && apk add --no-cache jq \
    && rm -rf /var/cache/apk/* \
    && chown node:node /app

ADD ./root /
