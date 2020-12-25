#!/usr/bin/env bash
# Prereqs: docker

echo -e "\e[1;4;31mStarting database (if already running will give an error which you can ignore)...\e[0m"
./createGXNetwork.sh
./runGXdatabase.sh
sleep 4

echo -e "\e[1;4;31mInitializing database...\e[0m"
./initGXdatabase.sh
sleep 4

echo -e "\e[1;4;31mInstalling standard gboxes...\e[0m"
./installStandardGboxes.sh

echo -e "\e[1;4;31mInstalling standard recipes...\e[0m"
./installGbox.sh granatumx/gbox-standardrecipes:1.0.0

echo -e "\e[1;4;31mStopping taskrunner (if not running will give an error which you can ignore)...\e[0m"
./stopTaskrunner.sh
echo "Starting taskrunner (restart if already running)..."
echo "You can check errors by running ./errTaskrunner.sh"
./runTaskrunner.sh

echo -e "\e[1;4;31mStopping webapp (if not running will give an error which you can ignore)...\e[0m"
./stopWebapp.sh
echo "Starting webapp (restart if already running)..."
echo "You can check errors by running ./errWebapp.sh"
./runWebapp.sh

echo -e "\e[32mEverything is kicked off, may take a few minutes to start...\e[0m"
echo -e "\e[32mNavigate to localhost:34567 to check if running.\e[0m"
echo ""
echo -e "\e[4;33mThis command is now tailing the webapp using gxtail, you can ctrl+c\e[0m"
shopt -s expand_aliases
. gx-aliases.sh
gxtail
