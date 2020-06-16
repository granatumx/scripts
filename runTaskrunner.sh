#!/usr/bin/env bash

docker run --rm --network=gx-net -v gx:/var/granatum -v $DOCKER_SOCKET:/var/run/docker.sock --name=gx-taskrunner -d -it granatumx/taskrunner-run:{VER} bash -c './taskrunner &> /var/granatum/error-taskrunner.log'
