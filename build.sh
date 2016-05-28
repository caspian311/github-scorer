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
mkdir -p data
mkdir -p logging

data_dir=$(cd data &> /dev/null; pwd; cd - &> /dev/null)
db_log_dir=$(mkdir -p logging/db ; cd logging/db &> /dev/null; pwd; cd - &> /dev/null)
app_log_dir=$(mkdir -p logging/app ; cd logging/app &> /dev/null; pwd; cd - &> /dev/null)
web_log_dir=$(mkdir -p logging/web ; cd logging/web &> /dev/null; pwd; cd - &> /dev/null)

echo 'run-images'
docker run -d -v $data_dir:/var/lib/mysql -v $db_log_dir:/var/log/mysql -p 3306:3306 caspian311/github-scorer-db:1.0
docker run -d -v $app_log_dir:/usr/src/app/log -v $app_log_dir:/usr/src/app/log -p 3000:3000 caspian311/github-scorer-app:1.0
docker run -d -v $web_log_dir:/var/log/nginx -p 80:80 caspian311/github-scorer-web:1.0

docker ps

echo 'done'
