#!/bin/bash
. /root/.env

filename=$LOGS_FOLDER/process-openmedia-data/openmedia_check_`date +%Y-%m-%d`.json
/bin/openmedia-check -i $ANNOVA -w > $filename


