#!/bin/sh

if [ $# -eq 0 ]; then
  echo 'opendocker.sh requires at least 1 argument.'
  echo ''
  echo 'Usage: ./opendocker.sh <IMAGE_NAME>'
  exit 1
fi

docker run -it --rm \
  --net host \
  --privileged \
  --gpus all \
  -e DISPLAY=$DISPLAY \
  -v $HOME/X11-unix:/tmp/X11-unix \
  --mount type=bind,src=/dev,dst=/dev \
  --mount type=bind,src=$(pwd)/workspace,dst=/workspace/ \
  $1 \
  bash
