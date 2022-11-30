#!/bin/bash

# curl -fsSL get.docker.com -o get-docker.sh
# sh get-docker.sh

docker ps --filter="ancestor=bonggeek/nginx-rev-proxy" -q | xargs docker stop
docker pull bonggeek/nginx-rev-proxy
docker run -d --restart="always" -p 80:80 bonggeek/nginx-rev-proxy