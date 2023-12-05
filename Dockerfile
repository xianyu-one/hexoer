FROM ubuntu:jammy

LABEL org.opencontainers.image.source https://github.com/xianyu-one/hexoer

RUN apt update && apt upgrade -y && \
    apt install git vim curl wget nodejs npm -y && \
    npm install hexo-cli -g && \
    mkdir /hexo && \
    mkdir /home/hexoer && \
    useradd -s /bin/bash hexoer && \
    echo 'git config --global user.name "${GIT_AUTHOR_NAME}"' >> /home/hexoer/.bashrc && \
    echo 'git config --global user.email "${GIT_AUTHOR_EMAIL}"' >> /home/hexoer/.bashrc && \
    chown hexoer:hexoer /hexo && \
    chown -R hexoer:hexoer /home/hexoer

USER hexoer

ENV GIT_AUTHOR_NAME=yourname
ENV GIT_AUTHOR_EMAIL=youremail

WORKDIR /hexo