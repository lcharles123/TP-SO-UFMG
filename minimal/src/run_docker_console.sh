#!/bin/sh

set -e

clear() {
  if [ ! "`docker ps -a | grep minimal`" = "" ] ; then
    docker stop `docker ps -a | grep minimal | awk '{print $1}'`
    docker rm `docker ps -a | grep minimal | awk '{print $1}'`
  fi

  if [ ! "`docker images -a | grep minimal`" = "" ] ; then
    docker rmi `docker images -a | grep minimal | awk '{print $1}'`
  fi
}

run() {
  docker import mll_image.tgz minimal-linux-live:latest
  docker run -it minimal-linux-live /bin/sh
}

clear
run
clear
