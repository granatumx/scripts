#!/usr/bin/bash

# Make sure docker is installed locally

PREFD="granatumx/"
PREF="git@github.com:granatumx/"

# Just repositories to be created
gitrepos=( 
#	gbox-betatom
#	gbox-broadgsea
#	gbox-build
#	gbox-clustering
#	gbox-clusteringqualitymeasure
#	gbox-combineassays
	gbox-deseq2
	gbox-differentialexpression
	gbox-dimreduction
#	gbox-enrichment
#	gbox-expressionlevelonscatterplot
#	gbox-fgsea
#	gbox-frobeniusnorm
#	gbox-g2normalization
#	gbox-genefiltering
#	gbox-glog
#	gbox-interactiveoutlierremoval
#	gbox-jammit-base
#	gbox-jammitanalyze
#	gbox-jammitscan
#	gbox-jammitscanjoint
#	gbox-logtransformation
#	gbox-mnnpy
#	gbox-monoclepseudotime
#	gbox-ppi
#	gbox-py-base
#	gbox-py-genecentering
#	gbox-py-genefiltering
#	gbox-py-sdk
#	gbox-r-base
#	gbox-r-sdk
#	gbox-samplecoloring
#	gbox-scanpyclustering
#	gbox-scanpydownsampling
#	gbox-scanpygenefiltering
#	gbox-scanpymarkergenes
#	gbox-scanpynormalization
#	gbox-scanpypca
#	gbox-scanpypseudotime
#	gbox-scanpytsne
#	gbox-umap
#	gbox-uploadfiles
)

mkdir -p ghbuild
cd ghbuild

for repo in "${gitrepos[@]}"
do
	gh repo create $repo --public -y
	if [ $? -eq 0 ]; then
		echo "Success"
	else
		git clone git@github.com:granatumx/$repo.git
		echo "Checked out hopefully"
	fi
	pushd $repo
	rsync -av ../../$repo/ ./
	git add -A .
	git commit -m "Update all"
	git push --set-upstream origin master
	popd
done
