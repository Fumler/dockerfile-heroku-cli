FROM node:12-alpine

RUN apk --update --no-cache add bash git openssh-client curl

ENV HEROKU_CLI_VERSION 7.51.0

RUN npm install -g heroku@${HEROKU_CLI_VERSION} \
 && rm -rf /tmp/* /root/.npm \
 && cd /usr/local/lib/node_modules/npm/ \
 && rm -rf man doc html *.md *.bat *.yml changelogs scripts test AUTHORS LICENSE Makefile \
 && find /usr/local/lib/node_modules/ -name test -o -name tests -o -name .bin -type d | xargs rm -rf
