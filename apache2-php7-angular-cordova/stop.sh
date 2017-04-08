#!/bin/bash

PROJECT="$1"
VER="$2"

ID=$(docker ps | grep "$PROJECT:$VER" | awk '{print $1}')
docker stop $ID