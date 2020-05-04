!bquote
gbox-scripts is an image that provides shell scripts for automating GranatumX deployment
!equote

TITLE: Gbox Scripts Manual
AUTHOR: D. Garmire at Department of EECS, University of Michigan -- Ann Arbor
DATE: today
TOC: on

===== Prerequisites =====

You mainly need a working copy of "Docker": "http://docker.com". It is used
exclusively to manage system configurations for running numerous tools
across numerous platforms.

If you are on Windows 10 you can install the Windows Insider edition
and set up "WSL2": "https://docs.microsoft.com/en-us/windows/wsl/wsl2-install".
It is recommended you create a group for docker and add your user
to the "docker group": "https://docs.docker.com/engine/install/linux-postinstall/".
The performance of WSL2 is fairly good -- however, you will want to ensure you set
a memory limit for your installation as garbage collection may still have difficulty.

You should also have a working copy of bash installed for your platform. For windows,
it is recommended to use the standard Ubuntu app and have WSL2 installed. For MacOS users,
zsh should work OK.

===== Installation =====

* All docker images are at "https://hub.docker.com/u/granatumx".
* All github repos are at "https://github.com/granatumx/*". Note that each git repo is cloned
in the corresponding docker image. You can git pull and commit from within the docker image so you do not need
anything special installed on your base system. This approach is achieved by using 
"Docker sibling processes": "https://medium.com/@andreacolangelo/sibling-docker-container-2e664858f87a".

First set up your scripts and aliases to make things easier. This command should pull the container if
it does not exist locally which facilitates installing on a server.
!bc sys
source <( docker run --rm -it granatumx/scripts:1.0.0 gx.sh )
!ec

This command makes `gx` available. You can simply run `gx` to obtain a list of scripts available.
The normal startup sequence for GranatumX is as follows.

!bc sys
$ gx run.sh    			# Will start the database, taskrunner, and webapp
$ gx installStandardGboxes.sh   # Install standard gboxes (install specific ones with installGbox.sh)

# Now you should be able to navigate to http://localhost:34567 and see GranatumX running.
!ec

===== Notes =====

Sourcing gx.sh output with `source <( docker run --rm -it granatumx/scripts:1.0.0 gx.sh )` will expose
numerous shortcuts to docker. You will be able to compress things like `docker image ls` to `dils`.
These shortcuts will not be as helpful if you do not have a working knowledge of `docker`, but can
shorten your time for doing simple things once you are knowledgeable in what the commands execute.
