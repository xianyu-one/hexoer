FROM node:18-alpine

LABEL org.opencontainers.image.source https://github.com/xianyu-one/hexoer

RUN apk update && \
    apk add git vim curl wget bash openssh && \
    npm install hexo-cli -g && \
    mkdir /hexo && \
    chown node:node /hexo && \
    echo 'git config --global user.name "${GIT_AUTHOR_NAME}"' >> /home/node/.bashrc && \
    echo 'git config --global user.email "${GIT_AUTHOR_EMAIL}"' >> /home/node/.bashrc

USER node

ENV GIT_AUTHOR_NAME=yourname
ENV GIT_AUTHOR_EMAIL=youremail

WORKDIR /hexo