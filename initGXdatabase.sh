#!/usr/bin/env bash

docker run --rm -it --network=host postgres:latest psql --port=5433 --host=127.0.0.1 --username=postgres -f setup.sql
