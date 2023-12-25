FROM node:20-alpine

LABEL org.opencontainers.image.source https://github.com/xianyu-one/hexoer

ARG http_proxy=http://10.233.0.1:7890
ARG https_proxy=http://10.233.0.1:7890

COPY init.sh /init.sh

RUN apk update && \
    apk add git vim curl wget bash openssh && \
    npm install hexo-cli -g && \
    chmod +x /init.sh && \
    mkdir /hexo && \
    mkdir /ssh-key

ENV GIT_AUTHOR_NAME=yourname
ENV GIT_AUTHOR_EMAIL=youremail
ENV USER_UID=1000 

ENTRYPOINT /init.sh

WORKDIR /hexo