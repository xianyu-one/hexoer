FROM node:18-alpine

LABEL org.opencontainers.image.source https://github.com/xianyu-one/hexoer

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk update && \
    apk add git vim curl wget bash && \
    npm install hexo-cli -g && \
    mkdir /hexo && \
    chown node:node /hexo && \
    echo 'git config --global user.name "${GIT_AUTHOR_NAME}"' >> /etc/profile && \
    echo 'git config --global user.email "${GIT_AUTHOR_EMAIL}"' >> /etc/profile

USER node

ENV GIT_AUTHOR_NAME=yourname
ENV GIT_AUTHOR_EMAIL=youremail

WORKDIR /hexo