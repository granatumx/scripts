#!/usr/bin/bash

# Make sure docker is installed locally

PREFD="granatumx/"
PREF="git@github.com:granatumx/"

# Just repositories to be created
# Order matters
# gbox-build must be built first :)
gitrepos=( 
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

RESULTS=""

for repo in "${gitrepos[@]}"
do
	pushd $repo
	if [ $? -eq 0 ]; then
		echo -e "\033[0;32mSuccess... building\033[0m"
		START=$(date +%s.%N)
		command
		docker run -e HOST_WD=`pwd` --rm --network host -v `pwd`:/tmp/build -v /var/run/docker.sock:/var/run/docker.sock -it granatumx/gbox-build:1.0.0 gbox_build.sh
		END=$(date +%s.%N)
		DIFF=$(echo "$END - $START" | bc)
		RESULTS+="$repo: $DIFF\n"
		popd
	else
		echo -e "\033[0;31mERROR with $repo\033[0m"
	fi
	echo -e "\033[0;32mECurrent status... \033[0m"
	echo -e "$RESULTS"
done
