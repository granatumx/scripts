#!/usr/bin/env bash

cp setup.sql /tmp-gx/.
docker run --rm -it --network gx-net -v gx-tmp:/tmp-gx -e PGPASSWORD=12qw -e POSTGRES_PASSWORD=12qw postgres:latest psql --port=5432 --host=192.168.1.101 --username=postgres -f /tmp-gx/setup.sql
rm -f /tmp-gx/setup.sql
