#!/bin/bash

VER=1.0.0
docker build -t attlas:$VER .
docker run -tid --rm -p 80:80 -v /root/html:/var/www/html attlas:$VER
ATTLAS=$(docker ps | grep "attlas:$VER" | awk '{print $1}')
docker exec -tid $ATTLAS apache2ctl restart