#!/usr/bin/env bash

#
# DESCRIPTION: Run the `cro-openmedia-extract` command.
#

. /root/.env

YEAR=`date +%Y`
# get last week
WEEK=`date -d '-7 day' '+%V'`

echo "The week ${YEAR}/${WEEK}."

#echo "Pulling czech-radio/openmedia."
#git pull --rebase origin main

echo "Activating virtual environment."
source /root/.venv/bin/activate

echo "Updating czech-radio/openmedia."
pip install -U /root/bin/openmedia

source /root/.env

echo "Runing cro-openmedia-extract command."
mkdir ${ANNOVA}/Temporary/Extracts/${YEAR}/W${WEEK}
#cro-openmedia-extract -i ${ANNOVA}/Rundowns/${YEAR}/W${WEEK} -o ${ANNOVA}/Temporary/Extracts/${YEAR}/W${WEEK}
## export primo na R disk
cro-openmedia-extract -i ${ANNOVA}/Rundowns/${YEAR}/W${WEEK} -o /mnt/R/GŘ/Strategický\ rozvoj/Kancelář/Analytics/Analýzy/Data/2023

echo "Deactivating virtual environment."
deactivate
