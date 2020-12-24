#!/usr/bin/env bash
# Prereqs: docker

echo -e "\e[1;4;31mStopping webapp (if not running will give an error which you can ignore)...\e[0m"
./stopWebapp.sh

echo -e "\e[1;4;31mStopping taskrunner (if not running will give an error which you can ignore)...\e[0m"
./stopTaskrunner.sh

echo -e "\e[1;4;31mStopping database (if already running will give an error which you can ignore)...\e[0m"
./stopGXdatabase.sh
sleep 10
