#!/bin/bash

PROJECT="$1"
VER="$2"

docker build -t $PROJECT:$VER .
docker run -tid --rm -p 80:80 -v /root/html:/var/www/html $PROJECT:$VER
ID=$(docker ps | grep "$PROJECT:$VER" | awk '{print $1}')
docker exec -tid $ID apache2ctl restart