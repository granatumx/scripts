#!/usr/bin/env bash

docker run --rm --network=gx-net -p 34567:34567 -v gx:/var/granatum --name=gx-webapp -d -it granatumx/webapp-dev:{VER} bash -c 'yarn start &> /var/granatum/error-webapp.log'
