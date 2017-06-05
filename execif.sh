#!/bin/sh

. "`(dirname "$0")`/utils.sh"

#
export PROJECT="$1"
export VER="$2"

buildImage $PROJECT $VER
if [ $? -eq 0 ]; then
  echo "ok"
else
  echo "error"
fi

isImagePresent $PROJECT $VER "IMAGE"
echo $IMAGE

#
if [ ! "$PROJECT" ];then
  echo "First parameter should be project's name"
  exit 1
fi

if [ ! "$VER" ];then
  echo "Second parameter should be project's version"
  exit 1
fi



#
ID=$PROJECT:$VER
if [ "$PROJECT" ] && [ "$VER" ]; then
  IMAGE=$(docker images | grep "$PROJECT" | grep "$VER" | awk '{print $1 ":" $2}')
  CONTAINER=$(docker ps | grep "$ID" | awk '{print $1}')
#  echo $IMAGE
#  echo $CONTAINER

#  if [ "$IMAGE" == "$PROJECT:$VER" ]; then
#    if [ "$ID" ]; then
#      echo not NULL
#    else
#      echo NULL
#    fi
#  fi
fi
