#!/bin/sh -e

echo 'stopping all docker containers'
set +e
docker stop $(docker ps | grep -v CONTAINER | awk '{print $1}')
set -e

echo 'build-images'
docker build -t caspian311/github-scorer-db:1.0 db_server
docker build -t caspian311/github-scorer-app:1.0 app_server

echo 'run-images'
docker run -d -p 3306:3306 caspian311/github-scorer-db:1.0
docker run -d -p 3000:3000 caspian311/github-scorer-app:1.0

docker ps

echo 'done'
