# These are useful aliases when dealing with docker containers
# Some of these can be turned into functions
# ear() { echo "$@"; $@; }
if [ -z ${DOCKER_SOCKET+"D"} ]; then export DOCKER_SOCKET="/var/run/docker.sock"; fi
alias d="docker"
alias dr="d run"
alias drit="dr -it"
alias drrmit="dr --rm -it"
alias drvrmit='dr -v $DOCKER_SOCKET:/var/run/docker.sock --rm -it'
alias di="d image"
alias dils="di ls"
alias dip="di prune"
alias dc="d container"
alias dcls="dc ls"
alias dclsa="dcls -a"
alias dcp="dc prune"
alias dv="d volume"
alias dvls="dv ls"
alias dvp="dv prune"
alias dprune="dip; dcp; dvp"
alias dprunef="dip -f; dcp -f; dvp -f"
alias dlsgx="dils granatumx/*; dvls | grep gx-; dcls | grep gx-"
alias gx='drvrmit -e DOCKER_SOCKET=$DOCKER_SOCKET -v gx-tmp:/tmp-gx {GX}'
alias deit="docker exec -it"
alias dwebapp="deit gx-webapp bash"
alias errwebapp="gx errWebapp.sh"
alias errtaskrunner="gx errTaskrunner.sh"
gxdoc() { 
	docker run --rm -d -it --name gx-tmp1 granatumx/doc:{VER} bash; 
	docker cp $1/$2 gx-tmp1:/tmp/.;
	docker exec -it gx-tmp1 doconce format pandoc $2 --github_md;
	docker cp gx-tmp1:/tmp/. $1/;
	docker stop gx-tmp1;
}
export -f gxdoc
