#!/usr/bin/env bash

# Since this is running inside a docker image with access to the main docker...
# Need to assume a volume gx-tmp is mounted to /tmp-gx

dockimage=$1

echo ""
echo "Removing gbox: $dockimage"

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
  docker run --network=gx-net --rm -v gx-tmp:/tmp-gx -it granatumx/install-gbox-run:{VER} ./installGbox --gboxDir=/tmp-gx --remove=true
fi

rm -rf /tmp-gx/*
