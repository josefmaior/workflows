#!/bin/bash

source /root/.env


#run openmedia-check /w changes to disk
sh $WORKFLOWS/process-openmedia-data/openmedia-check.sh
# commit logs
pushd $LOGS_FOLDER
git commit -am "`date` openmedia-check ran"
git pull --rebase
git push
popd

# run statistics
sh $WORKFLOWS/process-openmedia-data/stat-openmedia-data.sh

# commit logs
pushd $LOGS_FOLDER
git commit -am "`date` stat-openmedia-data ran"
git pull --rebase
git push
popd
