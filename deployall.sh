#!/bin/bash

# curl -fsSL get.docker.com -o get-docker.sh
# sh get-docker.sh

echo This deploys all the apps and rev-proxy

echo Stopping Wordament
docker ps --filter="ancestor=bonggeek/wordament" -q | xargs docker stop

echo Stopping Elemental
docker ps --filter="ancestor=bonggeek/elementservice" -q | xargs docker stop

echo Stopping nginx-rev-proxy
docker ps --filter="ancestor=bonggeek/nginx-rev-proxy" -q | xargs docker stop

echo Pruning!!!!
docker image prune -a

echo pulling all images
docker pull bonggeek/nginx-rev-proxy
docker pull bonggeek/elementservice
docker pull bonggeek/wordament

echo start nginx
docker run -d --restart="always" -p 80:80 bonggeek/nginx-rev-proxy

echo start wordament on 8090
docker run -d --restart="always" -p 8090:8090 bonggeek/wordament

echo start elemental on 8080
docker run -d --restart="always" -p 8080:8080 bonggeek/elementservice