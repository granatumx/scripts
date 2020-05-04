#!/usr/bin/env bash
# Prereqs: docker

echo -n "docker create --name gx-tmp1 $GX; docker cp gx-tmp1:/usr/src/app/gx-aliases.sh ./gx-aliases-local.sh; docker rm -f gx-tmp1; source gx-aliases-local.sh; alias gx='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v gx-tmp:/tmp-gx $GX'; rm -f gx-aliases-local.sh;"
