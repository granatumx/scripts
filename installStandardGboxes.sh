#!/usr/bin/env bash

gboxes=( 
	"granatumx/gbox-uploadfiles:1.0.0"
	"granatumx/gbox-combineassays:1.0.0"
	"granatumx/gbox-scanpydownsampling:1.0.0"
	"granatumx/gbox-genefiltering:1.0.0"
	"granatumx/gbox-scanpygenefiltering:1.0.0"
	"granatumx/gbox-logtransformation:1.0.0"
	"granatumx/gbox-glog:1.0.0"
	"granatumx/gbox-expressionlevelonscatterplot:1.0.0"
	"granatumx/gbox-samplecoloring:1.0.0"
	"granatumx/gbox-scanpypca:1.0.0"
	"granatumx/gbox-scanpytsne:1.0.0"
	"granatumx/gbox-umap:1.0.0"
	"granatumx/gbox-heatmap:1.0.0"
	"granatumx/gbox-interactiveoutlierremoval:1.0.0"
	"granatumx/gbox-deepimpute:2.0.0"
	"granatumx/gbox-frobeniusnorm:1.0.0"
	"granatumx/gbox-scanpynormalization:1.0.0"
	"granatumx/gbox-scanpyclustering:1.0.0"
	"granatumx/gbox-clusteringqualitymeasure:1.0.0"
	"granatumx/gbox-scanpydownsampling:1.0.0"
	"granatumx/gbox-scanpymarkergenes:1.0.0"
	"granatumx/gbox-broadgsea:1.0.0"
	"granatumx/gbox-fgsea:1.0.0"
	"granatumx/gbox-scanpypseudotime:1.0.0"
	"granatumx/gbox-ppi:1.0.0"
	"granatumx/gbox-differentialexpression:1.0.0"
	"granatumx/gbox-standardrecipes:1.0.0"
)

for gbox in "${gboxes[@]}"
do
	./installGbox.sh $gbox
done
