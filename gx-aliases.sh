# These are useful aliases when dealing with docker containers
# Some of these can be turned into functions
# ear() { echo "$@"; $@; }
alias d="docker"
alias dr="d run"
alias drit="dr -it"
alias drrmit="dr --rm -it"
alias drvrmit="dr -v /var/run/docker.sock:/var/run/docker.sock --rm -it"
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
alias gx="drvrmit -v gx-tmp:/tmp-gx";
export mntvol="-v gx:/var/granatum"
alias gx-db-run="docker run --rm -it -v gx-db-data:/var/lib/postgresql/data -p 127.0.0.1:5433:5432 -e POSTGRES_PASSWORD=12qw --name temporary-postgres-instance -d postgres:latest -c 'listen_addresses=*'"
alias gx-db-init="docker run --rm -it --network=host postgres:latest psql --port=5433 --host=127.0.0.1 --username=postgres -f setup.sql"
alias gx-db-check="docker run --rm -it --network=host postgres:latest psql --port=5433 --host=127.0.0.1 --username=postgres -d granatum"
alias gx-db-stop="docker stop temporary-postgres-instance"
alias gx-build-gboxes="docker run -v /var/run/docker.sock:/var/run/docker.sock --network=host --name=gx --rm -it gx make gbox-build"
alias gx-bash="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $mntvol --network=host --name=gx -it gx tmux new-session -s test 'bash'"
alias gx-bash-debug="docker run -v /var/run/docker.sock:/var/run/docker.sock $mntvol --network=host -it gx tmux new-session -s test 'bash'"
alias gx-start="docker run -v /var/run/docker.sock:/var/run/docker.sock $mntvol --network=host --name=gx --rm -it gx make start"
alias gx-start-debug="docker run -v /var/run/docker.sock:/var/run/docker.sock $mntvol --network=host -it gx make start"
alias gx-kickoff="gx-db-run && sleep 4 && gx-db-init && gx-build-gboxes && gx-start"
alias gx-start-daemon="docker run -v /var/run/docker.sock:/var/run/docker.sock $mntvol --network=host --name=gx --rm -d -it gx make start"
alias gx-docker='sudo service docker start'
alias gx-docker-stop='sudo service docker stop'
alias gx-db='cdgx; gx-docker; source setupGXDockerVolumes.sh; gx-db-run; sleep 4; gx-db-init; sleep 4; make gbox-build'
alias gbox-run="docker run --rm --network=host -it"
alias err-taskrunner='docker run --rm $mntvol -it ubuntu cat /var/granatum/error-taskrunner.log'
alias err-webapp='docker run --rm $mntvol -it ubuntu cat /var/granatum/error-webapp.log'
