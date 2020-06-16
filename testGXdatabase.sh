#!/usr/bin/env bash

docker run --rm -it --network=gx-net -e PGPASSWORD=12qw postgres:latest psql --port=5432 --host=192.168.1.101 --username=postgres -d granatum
