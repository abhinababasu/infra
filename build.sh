#!/bin/bash

VERSION=0.1
CONTAINER=nginx-rev-proxy

echo Building Image $CONTAINER:$VERSION
docker build -t $CONTAINER:$VERSION .
docker tag $CONTAINER:$VERSION $DOCKER_ID_USER/$CONTAINER

echo Done ................................
echo 
echo Run Container using
echo docker run -d --restart="always" -p 80:80 --net="host" -v /srv/ftp/bonggeek:/usr/share/nginx/html $CONTAINER:$VERSION
echo or without website as
echo docker run -d --restart="always" -p 80:80 --net="host" $CONTAINER:$VERSION
echo
echo and/or
echo docker push $DOCKER_ID_USER/$CONTAINER
