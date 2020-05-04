#!/usr/bin/env bash

gboxes=( "granatumx/gbox-py:1.0.0" "granatumx/gbox-differentialexpression:1.0.0" "granatumx/gbox-multitool:1.0.0" "granatumx/gbox-deepimpute:2.0.0" )

for gbox in "${gboxes[@]}"
do
	./installGbox.sh $gbox
done
