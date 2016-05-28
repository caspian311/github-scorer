#!/bin/sh -e

echo 'stopping all docker containers'
set +e
docker stop $(docker ps | grep -v CONTAINER | awk '{print $1}')
set -e

echo 'build-images'
docker build -t caspian311/github-scorer-db:1.0 db_server
docker build -t caspian311/github-scorer-app:1.0 app_server
docker build -t caspian311/github-scorer-web:1.0 web_server

echo 'create data directories'
data_dir=$(mkdir -p data ; cd data &> /dev/null; pwd; cd - &> /dev/null)
log_dir=$(mkdir -p log ; cd log &> /dev/null; pwd; cd - &> /dev/null)

echo 'run-images'
docker run -d -v $data_dir:/var/lib/mysql -p 3306:3306 caspian311/github-scorer-db:1.0
docker run -d -v $log_dir:/usr/src/app/log -p 3000:3000 caspian311/github-scorer-app:1.0
docker run -d -p 80:80 caspian311/github-scorer-web:1.0

docker ps

echo 'done'
