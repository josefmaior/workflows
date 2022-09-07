#!/bin/bash

WEEK=`date +%V`

echo WEEKNUMBER $WEEK

echo Updating source
git pull --rebase

echo sourcing .venv
source .venv/bin/activate

echo Updating cro-rundown
pip install -U .

echo Waiting for a while, you can cancel operation CTRL+C
sleep 1m

echo Runing arrange
cro-rundown-arrange --input /mnt/cro.cz/annova/export-avo

#process above is non-blocking, need to sleep here:
sleep 30m

echo Runing extract
cro-rundown-extract -i /mnt/cro.cz/annova/export-avo/2022/W$WEEK -o /mnt/R/GŘ/Strategický\ rozvoj/Kancelář/Analytics/Source/2022/

deactivate
