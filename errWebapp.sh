#!/usr/bin/env bash

docker run --rm -v gx:/var/granatum -it ubuntu cat /var/granatum/error-webapp.log
