#!/usr/bin/env bash

#
# DESCRIPTION: Run the `cro-openmedia-extract` command.
#

#YEAR=`date +%Y`
YEAR=$1
WEEK=$2

if [[ $# -ne 2 ]]; then
	echo "Invalid number of arguments, required: YYYY MM"
	exit 1
fi

echo "The week ${YEAR}/${WEEK}."

echo "Pulling czech-radio/openmedia."
#TODO: fixed version, tags
#git pull --rebase origin main

echo "Activating virtual environment."
source /root/.venv/bin/activate

echo "Updating czech-radio/openmedia."
pip install -U /root/bin/openmedia

source /root/.env

echo "Runing cro-openmedia-extract command."
cro-openmedia-extract -i ${ANNOVA}/Rundowns/${YEAR}/W${WEEK} -o /root/work

echo "Deactivating virtual environment."
deactivate
