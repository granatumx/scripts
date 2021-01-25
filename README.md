> gbox-scripts is an image that provides shell scripts for automating GranatumX deployment on your server or local machine



### Prerequisites

You mainly need a working copy of [Docker](http://docker.com). It is used
exclusively to manage system configurations for running numerous tools
across numerous platforms. There are some pros and cons to this approach. 
There is also an implicit assumption that your bash installation allows process substitution (most modern bash versions).

Pros:
* You do not need to set up environments.
* Likely, there are fewer errors due to misconfigurations.
* Development and deployment are streamlined.
* Testing can be isolated.

Cons:
* High memory (each image is likely 1-2GB) (But you are processing matrices which are large as well).

** This memory cost is reduced through overlays as each gbox may share base images
* Knowledge of GranatumX architecture and Docker.

** There are online tutorials for using Docker
** GranatumX has its own SDK for R and python to develop gboxes (containerized units)

If you are on Windows 10 you can install the Windows Insider edition
and set up [WSL2](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install).
It is recommended you create a group for docker and add your user
to the [docker group](https://docs.docker.com/engine/install/linux-postinstall/).
The performance of WSL2 is fairly good &ndash; however, you will want to ensure you set
a memory limit for your installation as garbage collection may still have difficulty.

You should also have a working copy of bash installed for your platform. For windows,
it is recommended to use the standard Ubuntu app and have WSL2 installed. For MacOS users,
zsh should work OK.

### Installation

* All docker images are at "https://hub.docker.com/u/granatumx".
* All github repos are at "https://github.com/granatumx/*".

First set up your scripts and aliases to make things easier. This command should pull the container if
it does not exist locally which facilitates installing on a server.

```
source <( docker run --rm -it granatumx/scripts:1.0.0 gx.sh )
```

This command makes `gx` available. You can simply run `gx` to obtain a list of scripts available.
The normal initialization sequence for GranatumX is as follows.


```
$ gx init.sh	# Kick off database, init database, install gboxes, and run
                # Initially it will tail the webapp startup
                # Once server running, ctrl+c to exit the tail
```

The normal startup sequence for GranatumX after it was initialized is as follows.


```
$ gx run.sh    	# Will start the database, taskrunner, and webapp
                # Initially it will tail the webapp startup
                # Once server running, ctrl+c to exit the tail

# Now you should be able to navigate to http://localhost:34567 and see GranatumX running.
# If you would like to enable ssl, use apache or other webserver with proxy forwarding.
```

### Notes

Sourcing gx.sh output with `source <( docker run --rm -it granatumx/scripts:1.0.0 gx.sh )` will expose
numerous shortcuts to docker. You will be able to compress things like `docker image ls` to `dils`.
These shortcuts will not be as helpful if you do not have a working knowledge of `docker`, but can
shorten your time for doing simple things once you are knowledgeable in what the commands execute.

Note that scripts kicks off 
[sibling processes](https://medium.com/@andreacolangelo/sibling-docker-container-2e664858f87a).
This approach allows you to isolate the components of the system and reduce side-effects. If you
edit one container when running with the `--rm` option, content may not persist (except through 
[volumes](https://docs.docker.com/storage/volumes/)). 

You can determine errors with running the taskrunner or webapp using `errwebapp`, `errtaskrunner`,
or `gxtail`. `gxtail` is preferred as it runs an active tail to monitor the webapp.

If you have `docker` installed to another location, you can specify where the `docker.sock` file is
by overriding `DOCKER_SOCKET` in bash. `export DOCKER_SOCKET="/var/docker.sock" && gx run.sh`.

If you would like to develop a Gbox, see the [online steps](https://docs.google.com/document/d/1XxFoXasQeeJXH_gnwLYvDtPo16DCwLdeo4nidDH4WsI/view).

