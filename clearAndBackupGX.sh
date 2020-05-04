#!/usr/bin/env bash
# Prereqs: docker

if [ -z ${gxbn+"DEF"} ]; then
	echo "Please provide a backup number in variable \$gxbn"
	echo "For example:"
        echo "$	gxbn=1 ./clearAndBackupGX.sh"
	exit 1
fi

echo "Stopping database (if running)..."
./stopGXdatabase.sh
echo "Stopping taskrunner and webapp (if running)..."
./stopWebapp.sh
./stopTaskrunner.sh

echo "Backing up database and GX filesystem to gx-db-data-backup$gxn and gx-backup$gxbn..."
echo "Note that if the backup volumes exist, cp -R may overwrite or clobber data"
docker run -v gx-db-data:/from -v "gx-db-data-backup$gxbn":/to --rm -it ubuntu:latest cp -R /from/* /to/*
docker run -v gx:/from -v "gx-backup$gxbn":/to --rm -it ubuntu:latest cp -R /from/* /to/*
docker volume rm gx
docker volume rm gx-db-data

echo "Recreating gx and gx-db-data..."
./createGXVolumes.sh

echo "Initializing database..."
./runGXdatabase.sh
sleep 4
./initGXdatabase.sh

echo "Database (gx-db-data) should be running and initialized..."
echo "gx filesystem should be clean..."
echo "You can initialize the db with gboxes and/or run the webapp and taskrunner..."
