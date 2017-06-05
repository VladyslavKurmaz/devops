#!/bin/sh

PROJECT="$1"
VER="$2"
HOME="$3"

docker run -tid --rm -p 80:80 -v $HOME:/var/www/html $PROJECT:$VER
ID=$(docker ps | grep "$PROJECT:$VER" | awk '{print $1}')
docker exec -tid $ID apache2ctl restart