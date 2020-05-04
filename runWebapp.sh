#!/usr/bin/env bash

docker run --rm --network=host -v gx:/var/granatum --name=gx-webapp -d -it granatumx/webapp-dev:{VER} bash -c 'yarn start &> /var/granatum/error-webapp.log'
