#!/usr/bin/env bash

cp setup.sql /tmp-gx/.
docker run --rm -it --network=host -v gx-tmp:/tmp-gx -e PGPASSWORD=12qw -e POSTGRES_PASSWORD=12qw postgres:latest psql --port=5433 --host=127.0.0.1 --username=postgres -f /tmp-gx/setup.sql
rm -f /tmp-gx/setup.sql
