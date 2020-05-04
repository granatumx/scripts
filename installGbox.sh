#!/usr/bin/env bash

# Since this is running inside a docker image with access to the main docker...
# Need to assume a volume gx-tmp is mounted to /tmp-gx

dockimage=$1

echo ""
echo "Installing gbox: $dockimage"

docker create --name gboxImage $dockimage > /dev/null
docker cp gboxImage:/gbox.tgz /tmp-gx > /dev/null
docker rm -f gboxImage > /dev/null
cd /tmp-gx
tar zxf gbox.tgz
rm -rf gbox.tgz
echo "===> Definition files from gbox"
ls
echo "<==="
if [ -f "/tmp-gx/package.yaml" ]; then
  docker run --network=host --rm -v gx-tmp:/tmp-gx -it granatumx/gbox-install-run:{VER} ./installGbox --gboxDir=/tmp-gx
fi

if [ -d "/tmp-gx/recipes" ]; then
  docker run --network=host --rm -v gx-tmp:/tmp-gx -it granatumx/gbox-install-run:{VER} ./installGbox --recipesDir=/tmp-gx/recipes
fi
rm -rf /tmp-gx/*
