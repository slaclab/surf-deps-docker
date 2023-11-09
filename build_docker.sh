#!/bin/bash

docker image build . -t surf-deps-docker-${USER}:latest --build-arg user=${USER} --build-arg uid=$(id -u)
