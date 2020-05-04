# prerequisites: docker

FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/New_York

WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y tmux vim
RUN apt-get install -y curl
RUN apt-get install -y rsync
RUN curl https://getmic.ro | bash
RUN mv micro /usr/local/bin

# Allow granatumx to kick off docker containers itself
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update

RUN apt-get install -y docker-ce-cli

RUN apt-get install -y sed bash

ARG VER=1.0.0
ARG GX=granatumx/scripts:1.0.0
ENV VER=$VER
ENV GX=$GX
ENV PATH="$PATH:./"
ENV BASH_ENV=/etc/profile

COPY . .

COPY gx-aliases.sh /root/.bash_aliases

ENV TERM=xterm-256color

SHELL [ "/bin/bash", "-i", "-l", "-c" ]

CMD echo "Please choose a shell script that is available." && ls ./*.sh

# RUN source ~/.bashrc
