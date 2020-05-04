#!/usr/bin/env bash

docker run --rm --network=host -v gx:/var/granatum -v /var/run/docker.sock:/var/run/docker.sock --name=gx-taskrunner -d -it granatumx/taskrunner-run:1.0.0 bash -c './taskrunner &> /var/granatum/error-taskrunner.log'
