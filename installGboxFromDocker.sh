#!/usr/bin/env bash

dockimage=$1

if [[ "$dockimage" != *"/"* ]]; then
	dockimage=granatumx/gbox-$1:1.0.0
fi

echo ""
echo "Pulling gbox: $dockimage"

docker pull $dockimage

echo ""
echo "Installing gbox: $dockimage"

./installGbox.sh $dockimage
