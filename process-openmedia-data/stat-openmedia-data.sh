#!/bin/bash

. /root/.env

filename=$LOGS_FOLDER/process-openmedia-data/stat_openmedia_data_`date +%Y-%m-%d`.tsv

statFolder () {
	if [ -d $1 ]; then
	count=`ls $1 | wc | awk -F' ' '{print $1}'`
	count_mon=`ls $1 | grep Mon | wc | awk -F' ' '{print $1}'`
	count_tue=`ls $1 | grep Tue | wc | awk -F' ' '{print $1}'`
	count_wed=`ls $1 | grep Wed | wc | awk -F' ' '{print $1}'`
	count_thu=`ls $1 | grep Thu | wc | awk -F' ' '{print $1}'`
	count_fri=`ls $1 | grep Fri | wc | awk -F' ' '{print $1}'`
	count_sat=`ls $1 | grep Sat | wc | awk -F' ' '{print $1}'`
	count_sun=`ls $1 | grep Sun | wc | awk -F' ' '{print $1}'`
	printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$2" `basename $1` "$count" "$count_mon" "$count_tue" "$count_wed" "$count_thu" "$count_fri" "$count_sat" "$count_sun"
	fi
}

statYear() {
  for i in $ANNOVA/Rundowns/$1/*; do
    folder_stat=`statFolder $i $1`
    echo $i $folder_stat
    echo "$folder_stat" >> $filename
  done

}

printf "year\tweek\tcount\tcount_mon\tcount_tue\tcount_wed\tcount_thu\tcount_fri\tcount_sat\tcount_sun\n" > $filename

statYear 2020
statYear 2021
statYear 2022
statYear 2023

