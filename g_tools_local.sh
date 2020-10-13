#!/usr/bin/env bash
# Prereqs: docker

echo -e "\e[1;4;31mCopying tools to your install directory...\e[0m"
cp dev_setup_gx.sh /local
mkdir -p /local/gx
cp create_and_push_repos.sh /local/gx
cp build_all_images.sh /local/gx
