#!/usr/bin/env bash
# Executed inside of a building gbox and assumes VER set

echo "Translating in *.sh: {VER} to $VER"
echo "Translating in *.sh: {GX} to $GX"
GBOXescaped="$(echo $GX | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')"

find . -name "*.sh" -exec sed -i "s/{VER}/$VER/g" {} +
find . -name "*.sh" -exec sed -i "s/{GX}/$GBOXescaped/g" {} +
