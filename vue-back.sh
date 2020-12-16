#!/bin/bash
WORK_PATH='/usr/projects/blog-server-koa2'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "开始执行构建"
docker build -t blog-server-koa2:1.0.2 .
echo "停止旧容器并删除旧容器"
docker stop blog-server-koa2-container
docker rm vue-back-container
echo "启动新容器"
docker container run -p 3000:3000 --name blog-server-koa2-container -d blog-server-koa2:1.0.2