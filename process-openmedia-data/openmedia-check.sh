#!/bin/bash
. /root/.env

/bin/openmedia-check -i $ANNOVA -w >> $LOGS_FOLDER/process-openmedia-data/openmedia_check_`date +%Y-%m-%d`.json 2>&1


