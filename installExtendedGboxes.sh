#!/usr/bin/env bash

gboxes=( "granatumx/gbox-scimpute:1.0.0" "granatumx/gbox-doubletdetection:1.0.0" "granatumx/gbox-differentialexpression:1.0.0" )

for gbox in "${gboxes[@]}"
do
	./installGbox.sh $gbox
done
