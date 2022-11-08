#!/usr/bin/env bash

#
# DESCRIPTION: Run the `cro-openmedia-extract` command.
#

YEAR=`date +%Y`
WEEK=`date +%V`

echo "The week ${YEAR}/${WEEK}."

echo "Pulling czech-radio/openmedia."
git pull --rebase origin main

echo "Activating virtual environment."
source /root/.venv/bin/activate

echo "Updating czech-radio/openmedia."
pip install -U /root/bin/openmedia

source /root/.env

echo "Runing cro-openmedia-extract command."
cro-openmedia-extract -i ${ANNOVA}/Rundowns/${YEAR}/W${WEEK} -o /mnt/R/GŘ/Strategický\ rozvoj/Kancelář/Analytics/Source/${YEAR}

echo "Deactivating virtual environment."
deactivate