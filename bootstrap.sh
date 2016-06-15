#!/bin/bash

#rm -rf pre-install

#mkdir pre-install

git clone git@github.com:reliablejs/reliable-macaca-slave.git ./pre-install/reliable-macaca-slave --depth=1

cd ./pre-install/reliable-macaca-slave

docker build -t="local/reliable-macaca-slave" .

RELIABLE_ENV_PORT=8082 docker-compose kill
RELIABLE_ENV_PORT=8082 docker-compose build
RELIABLE_ENV_PORT=8082 docker-compose up -d



#git clone git@github.com:reliablejs/reliable-master.git --branch 2.0 ./pre-install/reliable-master --depth=1

#cd ./pre-install/reliable-master

#docker build .
