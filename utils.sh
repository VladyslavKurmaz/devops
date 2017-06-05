#!/bin/sh

#[in] $1 - project name, $2 - version, $3 - docker file location
#[out]
buildImage(){
  docker build -t $1:$2 $3
}

#[in]  $1 - project name, $2 - version, $3 - port(s)  $4 - volume(s)
#[out]
startContainer(){
  docker run -tid --rm -p $3 -v $4 $1:$2
  ID=$(docker ps | grep "$1:$2" | awk '{print $1}')
}

#[in]  $1 - project name, $2 - version
#[out] $3 - container id
getContainerId(){
  ID=$(docker ps | grep "$1:$2" | awk '{print $1}')
  eval "$3=$ID"
}

#[in]  $1 - container id
#[out]
stopContainerById(){
  docker stop $1
}

docker stop $IDr

#[in]  $1 - project name, $2 - version
#[out]
isImagePresent(){
  KEY="$1:$2"
  NAME=$(docker images | grep "$1" | grep "$2" | awk '{print $1 ":" $2}')
  echo $KEY
  echo $NAME
  R=1
  if [ "$NAME" = "$KEY" ]; then
    return 0
  fi
  return 1
}

#PROJECT="$1"
#VER="$2"
#HOME="$3"

#echo "The script you are running has basename `basename $0`, dirname `dirname $0`"
#BASEDIR=$(dirname "$0")
#echo "$BASEDIR"

#SCRIPT=`realpath $0`
#SCRIPTPATH=`dirname $SCRIPT`
#echo "$SCRIPTPATH"


#  IMAGE=$(docker images | grep "$PROJECT" | grep "$VER" | awk '{print $1 ":" $2}')
#  CONTAINER=$(docker ps | grep "$ID" | awk '{print $1}')
