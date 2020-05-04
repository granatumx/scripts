#!/usr/bin/env bash

gboxes=( "gbox-scimpute" "gbox-doubletdetection" )

for gbox in "${gboxes[@]}"
do
	./installGbox.sh $gbox
done
