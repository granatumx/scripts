#!/usr/bin/env bash

docker run --rm -it -v gx-db-data:/var/lib/postgresql/data -p 127.0.0.1:5433:5432 -e POSTGRES_PASSWORD=12qw --name gx-database -d postgres:latest -c 'listen_addresses=*'
