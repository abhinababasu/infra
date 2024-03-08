#!/bin/bash

# curl -fsSL get.docker.com -o get-docker.sh
# sh get-docker.sh

echo This deploys all the apps and rev-proxy

echo Stopping containers
echo -------------------
echo Stopping Wordament
docker ps --filter="ancestor=bonggeek/wordament" -q | xargs docker stop

echo Stopping Elemental
docker ps --filter="ancestor=bonggeek/elementservice" -q | xargs docker stop

echo Stopping nginx-rev-proxy
docker ps --filter="ancestor=bonggeek/nginx-rev-proxy" -q | xargs docker stop

echo pulling all images
echo -------------------
docker pull bonggeek/nginx-rev-proxy
docker pull bonggeek/elementservice
docker pull bonggeek/wordament

echo Start containers
echo -------------------

echo start nginx
docker run -d --restart="always" -p 80:80 --net="host" -v /srv/ftp/bonggeek:/usr/share/nginx/html bonggeek/nginx-rev-proxy

echo start wordament on 8090
docker run -d --restart="always" -p 8090:8090 bonggeek/wordament

echo start elemental on 8080
docker run -d --restart="always" -p 8080:8080 bonggeek/elementservice

echo Yay!
echo ----
echo Consider pruning with docker image prune -a
echo test options
echo curl -i http://localhost/wordament/?input=SPAVURNYGERSMSBE
echo curl -i http://localhost/elemental/?words=Basu
