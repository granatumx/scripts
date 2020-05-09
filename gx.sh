#!/usr/bin/env bash
# Prereqs: docker

echo -n "docker create --name gx-tmp1 $GX; docker cp gx-tmp1:/usr/src/app/gx-aliases.sh ./gx-aliases-local.sh; docker rm -f gx-tmp1; source gx-aliases-local.sh; rm -f gx-aliases-local.sh;"
