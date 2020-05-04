#!/usr/bin/env bash

docker run --rm --network=host -v gx:/var/granatum --name=gx-webapp -d -it granatumx/webapp-dev:1.0.0 bash -c 'yarn start &> /var/granatum/error-webapp.log'
