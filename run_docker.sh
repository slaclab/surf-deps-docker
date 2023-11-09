#!/bin/bash

if [ -d "/u1" ]; then
   mkdir -p /u1/$USER
else
   echo "/u1 does not exists"
   exit 1
fi

docker run -ti \
   --net=host \
   -e DISPLAY=${DISPLAY} \
   -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
   -v /etc/localtime:/etc/localtime:ro \
   -v /u1:/u1 \
   surf-deps-docker-${USER}:latest /bin/bash
