#/bin/bash


#!/bin/bash

if [ "$USER_UID" -eq 1000 ]; then
    # 当变量$USER_UID为1000时执行
    chown node:node /hexo
    echo 'git config --global user.name "${GIT_AUTHOR_NAME}"' >> /home/node/.bashrc
    echo 'git config --global user.email "${GIT_AUTHOR_EMAIL}"' >> /home/node/.bashrc
    echo 'cp -r /ssh-key /home/node/.ssh' >> /home/node/.bashrc
    chown -R node:node /home/node/
    su -s /bin/bash node
    source /home/node/.bashrc
    chown 600 /home/node/.ssh/id_rsa
    chown 644 /home/node/.ssh/id_rsa.pub
else
    # 当变量$USER_UID不为1000时执行
    adduser -u $USER_UID -D --shell /bin/bash -h /home/$USER_UID $USER_UID
    chown $USER_UID:$USER_UID /hexo
    echo 'git config --global user.name "${GIT_AUTHOR_NAME}"' >> /home/$USER_UID/.bashrc
    echo 'git config --global user.email "${GIT_AUTHOR_EMAIL}"' >> /home/$USER_UID/.bashrc
    echo 'cp -r /ssh-key /home/"$USER_UID"/.ssh' >> /home/$USER_UID/.bashrc
    chown -R $USER_UID:$USER_UID /home/$USER_UID/
    su -s /bin/bash $USER_UID
    source /home/$USER_UID/.bashrc
    chown 600 /home/$USER_UID/.ssh/id_rsa
    chown 644 /home/$USER_UID/.ssh/id_rsa.pub
fi

