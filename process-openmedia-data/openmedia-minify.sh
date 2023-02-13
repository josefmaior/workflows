#!/bin/bash
. /root/.env

YEAR=`date +%Y`
# processing last week
WEEK=`date -d '-7 day' '+%V'`

filename=$LOGS_FOLDER/process-openmedia-data/openmedia_minify_`date +%Y-%m-%d`.log
/root/openmedia-minify/openmedia-minify -i $ANNOVA/Rundowns/$YEAR/W$WEEK -o $ANNOVA/Temporary/Minify/$YEAR > $filename



