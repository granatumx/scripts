# prerequisites: docker

FROM ubuntu:latest
MAINTAINER "granatumx" granatumx@github.com

ENV TERM=xterm-256color
ENV PATH="$PATH:."

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/New_York

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y rsync
RUN apt-get install -y bash-completion

# If you want micro to edit, uncomment below
# RUN curl https://getmic.ro | bash
# RUN mv micro /usr/local/bin

# Allow granatumx to kick off docker containers itself
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update

RUN apt-get install -y docker-ce-cli

RUN apt-get install -y sed bash

# RUN apt install -y python3 python3-pip
# WORKDIR /tmp
# RUN git clone https://github.com/hplgit/doconce.git
# RUN cd doconce && pip3 install .
# RUN cd .. && rm -rf doconce

ARG VER=1.0.0
ARG GX=granatumx/scripts:1.0.0
ENV VER=$VER
ENV GX=$GX
ENV BASH_ENV=/etc/profile

WORKDIR /usr/src/app
COPY . .

RUN GXtranslateVERinSH.sh

# The Makefile is copied inside the docker image and running make here
# may be useful if there are docker image utilities that need built
# RUN make

COPY gx-aliases.sh /root/.bash_aliases
COPY .bashrc /root/.bashrc

ENV DOCKER_SOCKET="/var/run/docker.sock"

SHELL [ "/bin/bash", "-i", "-l", "-c" ]

CMD echo "Please choose a shell script that is available." && ls ./*.sh

# RUN source ~/.bashrc
