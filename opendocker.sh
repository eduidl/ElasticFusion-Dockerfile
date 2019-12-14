#!/bin/sh

if [ $# -eq 0 ]; then
  echo 'opendocker.sh requires at least 1 argument.'
  echo ''
  echo 'Usage: ./opendocker.sh IMAGE_NAME'
  exit 1
fi

docker run -it --rm \
  --net host \
  --privileged \
  --gpus all \
  -e DISPLAY=$DISPLAY \
  -v $HOME/.Xauthority:/root/.Xauthority \
  -v /dev:/dev \
  -v `pwd`/workspace:/workspace/ \
  $1 \
  bash
