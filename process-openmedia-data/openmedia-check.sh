#!/bin/bash
source /root/.env

/bin/openmedia-check -i $ANNOVA -w >> $LOGS_FOLDER/process-openmedia-data/openmedia_check_log.json 2>&1


