# hexoer

hexo博客生产环境构建

## 使用方法

### 快速开始

通过下面的命令可以进入容器

```bash
docker run -it --rm \
  --name hexoer \
  -p 4000:4000 \
  -v YOUR_HEXO_PATH:/hexo \\
  -e TZ="Asia/Taipei" \
  -e USER_UID=1000 \
  mrxianyu/hexoer:latest \
  /bin/bash
```

* 请将`YOUR_HEXO_PATH`替换为你的hexo文件夹路径


### 高级用法

如果需要使用`hexo d`进行推送，请使用下面的命令

```bash
docker run -it --rm \
  --name hexoer \
  -p 4000:4000 \
  -v YOUR_HEXO_PATH:/hexo \
  -v YOUR_SSH_KEY_PATH:/home/hexoer/.ssh \
  -e TZ="Asia/Taipei" \
  -e USER_UID=1000 \
  -e GIT_AUTHOR_NAME="YOUR_USERNAME" \
  -e GIT_AUTHOR_EMAIL="YOUR_EMAIL" \
  mrxianyu/hexoer:latest \
  /bin/bash
```

* 请将`YOUR_HEXO_PATH`替换为你的hexo文件夹路径
* 请将`YOUR_SSH_KEY_PATH`替换为你的ssh密钥文件夹路径
* 请将`GIT_AUTHOR_NAME`替换为你的git用户名
* 请将`GIT_AUTHOR_EMAIL`替换为你的git邮箱