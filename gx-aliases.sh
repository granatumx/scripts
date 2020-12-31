# These are useful aliases when dealing with docker containers
# Some of these can be turned into functions
# ear() { echo "$@"; $@; }
if [ -z ${DOCKER_SOCKET+"D"} ]; then export DOCKER_SOCKET="/var/run/docker.sock"; fi
alias m="make"
alias md="m docker && m docker-push"
alias d="docker"
alias dr="d run"
alias drit="dr -it"
alias drrmit="dr --rm -it"
alias drvrmit='dr -v $DOCKER_SOCKET:/var/run/docker.sock --rm -it'
alias dp='docker pull'
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
alias gx="drvrmit -e HOST_WD=\'pwd\' -e DOCKER_SOCKET=\$DOCKER_SOCKET -v gx-tmp:/tmp-gx -v \`pwd\`:/local {GX}"
alias gxdevchown="sudo chown -R \`whoami\`:\`whoami\` *.sh gx"
alias gxupdaterunimages='dp granatumx/webapp-dev:{VER}; dp granatumx/taskrunner-run:{VER}; dp granatumx/scripts:{VER}; dp granatumx/install-gbox-run:{VER};'
alias deit="docker exec -it"
alias dwebapp="deit gx-webapp bash"
alias gxtail="deit gx-webapp tail -f /var/granatum/error-webapp.log"
alias gxtailtaskrunner="deit gx-webapp tail -f /var/granatum/error-taskrunner.log"
alias errwebapp="deit gx-webapp cat /var/granatum/error-webapp.log"
alias errtaskrunner="deit gx-webapp cat /var/granatum/error-taskrunner.log"
alias gbuild="docker run -e HOST_WD=\`pwd\` --rm --network host -v \`pwd\`:/tmp/build -v /var/run/docker.sock:/var/run/docker.sock -it granatumx/gbox-build:1.0.0 gbox_build.sh"
alias gtest="rsync -av test/ runtest/ && docker run -e HOST_WD=\`pwd\` --rm --network host -v \`pwd\`:/tmp/build -v /var/run/docker.sock:/var/run/docker.sock -it granatumx/gbox-build:1.0.0 gbox_test.sh"
alias gstage="docker run -e HOST_WD=\`pwd\` --rm --network host -v \`pwd\`:/tmp/build -v /var/run/docker.sock:/var/run/docker.sock -it granatumx/gbox-build:1.0.0 gbox_staging.sh"

gpush() {
	docker push `cat GBOX_BASE_NAME.txt`:`cat VERSION.txt`
}

gxdoc() { 
	docker  --rm -d -it --name gx-tmp1 granatumx/doc:{VER} bash; 
	docker cp $1/$2 gx-tmp1:/tmp/.;
	docker exec -it gx-tmp1 doconce format pandoc $2 --github_md;
	docker cp gx-tmp1:/tmp/. $1/;
	docker stop gx-tmp1;
}
gxtest() { 
	docker exec -it gx-webapp bash -c "cd \`ls -d $1\` && tar zcvf ../tar.tgz *";
	rm -rf /tmp/tester;
	mkdir -p /tmp/tester;
	docker cp gx-webapp:/var/granatum/steps/tar.tgz /tmp/tester;
	curdir=`pwd`;
	pushd /tmp/tester;
	tar zxvf tar.tgz;
	rm -rf tar.tgz;
	rsync -av /tmp/tester/ $curdir/runtest/
	rm -rf /tmp/tester;
	popd;
}
gxcleantest() {
	rm -rf ./test/upload*/ ./test/imports/ ./test/exports/ ./test/debug/ ./test/*.json ./test/stderr ./test/stdout;
	rm -rf runtest;
}
gag() {
	if [ -z "$1" ]
	then
		comment="Updated...";
	else
		comment="$1";
	fi
	git add -A .;
	git commit -m "$comment";
	git push;
}
