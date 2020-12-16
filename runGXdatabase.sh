#!/usr/bin/env bash

docker run --rm -it -v gx-db-data:/var/lib/postgresql/data --network gx-net -e POSTGRES_PASSWORD=12qw --name gx-database --ip 192.168.4.101 -d postgres:latest -c 'listen_addresses=*'
