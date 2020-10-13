#!/usr/bin/bash

# Make sure docker is installed locally
# Sets up installation for development (does not include all gbox images)
# Pulls all source from the granatumx github repo.

PREFD="granatumx/"

dockers=(
	"scripts:1.0.0"
	"webapp-dev:1.0.0"
	"taskrunner-dev:1.0.0"
	"taskrunner-run:1.0.0"
	"gbox-py:1.0.0"
	"install-gbox-run:1.0.0"
	"install-gbox-dev:1.0.0"
	"gbox-template:1.0.0"
)

for dock in "${dockers[@]}"
do
	docker pull "$PREFD$dock"
done

mkdir gx
cd gx
PREF="git@github.com:granatumx/"
gitrepos=( 
	doc 
	scripts 
	taskrunner 
	webapp 
	install-gbox 
	gbox-template 
	gbox-base
	gbox-r-base
	gbox-r-sdk
	gbox-py-base
	gbox-py-sdk
	gbox-betatom
	gbox-broadgsea
	gbox-build
	gbox-clustering
	gbox-clusteringqualitymeasure
	gbox-combineassays
	gbox-deseq2
	gbox-differentialexpression
	gbox-dimreduction
	gbox-enrichment
	gbox-expressionlevelonscatterplot
	gbox-fgsea
	gbox-frobeniusnorm
	gbox-g2normalization
	gbox-genefiltering
	gbox-glog
	gbox-interactiveoutlierremoval
	gbox-jammit-base
	gbox-jammitanalyze
	gbox-jammitscan
	gbox-jammitscanjoint
	gbox-logtransformation
	gbox-mnnpy
	gbox-monoclepseudotime
	gbox-ppi
	gbox-py-genecentering
	gbox-py-genefiltering
	gbox-samplecoloring
	gbox-scanpyclustering
	gbox-scanpydownsampling
	gbox-scanpygenefiltering
	gbox-scanpymarkergenes
	gbox-scanpynormalization
	gbox-scanpypca
	gbox-scanpypseudotime
	gbox-scanpytsne
	gbox-umap
	gbox-uploadfiles
)

for repo in "${gitrepos[@]}"
do
	git clone "$PREF$repo"
done
