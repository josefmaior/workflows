#!/bin/bash

TODAY=$(date +%Y-%m-%d)
root_folder=`pwd`

echo "Script init $TODAY from $root_folder"

function dump_all_xmls_and_sort_by_entity_repeat_count () {
	cd $1
	types=(organization person location general);
	for ii in ${types[*]};
	do
		for i in `find -iname "*.xml" -newermt $(date +%Y-%m-%d -d '1 week ago') -type f -print`;
		do cat $i | grep entity | grep $ii | awk -F'[<>]' '{print $2}' | awk -F'[=/"]' '{print $9}'
		done | sort | uniq -c | sort -nr > /tmp/$ii.txt;
	done

	echo "dump_all_xmls_and_sort_by_entity_repeat_count: ran Ok"
	return 0
}

function run_graphing () {
	pidof Xvfb && echo "Xvfb already started" || Xvfb :99 &
	export DISPLAY=:99
	cd $1/graphEntities/ && /root/bin/pp
	
	echo "run_graphing: ran Ok"	
	return 0
}

function copy_and_commit_graphs_gh () {
	cp $1/graphEntities/*.png $1/graphs
	cd $1/graphs

	git add .
	git commit -am "Graphs update `date`"
	git pull
	git push 

	echo "copy_and_commit_gh: ran Ok"
	return 0
}

function commit_data_gh () {
	cd /root/irozhlas-scraper-geneea-output
	git add .
	git commit -am "Automatic data update `date`"
	git pull
	git push || return 1

	echo "commit_gh: ran Ok"
	return 0
}

function run_batch_analysis_geneea () {
	
	source /root/irozhlas/cro-geneea-sdk2/.venv/bin/activate
	source /root/irozhlas/cro-geneea-sdk2/secret


	cd /root/irozhlas/irozhlas-scraper/
	for i in `ls /root/irozhlas/irozhlas-scraper/output/$1*.txt`; do
		cro.geneea -i $i -t analysis -f xml > /root/irozhlas/irozhlas-scraper/output/`basename $i .txt`.xml;
		echo "Processing $i"
		sleep 1;
	done
	deactivate

	mv /root/irozhlas/irozhlas-scraper/output/$1*.xml /root/irozhlas/irozhlas-scraper/output/xml
	echo "run_batch_analysis_geneea: ran Ok"
	return 0
}

function move_results () {
	mkdir /root/irozhlas-scraper-geneea-output/txt/$1
	mkdir /root/irozhlas-scraper-geneea-output/xml/$1
	mkdir /root/irozhlas-scraper-geneea-output/html/$1

	for i in `ls /root/irozhlas/irozhlas-scraper/output/$1*.txt`; do
		cp -ar $i /root/irozhlas-scraper-geneea-output/txt/$1 
	done

	for i in `ls /root/irozhlas/irozhlas-scraper/output/xml/$1*.xml`; do
		cp -ar $i /root/irozhlas-scraper-geneea-output/xml/$1 
	done

	for i in `find /root/irozhlas/irozhlas-scraper/*.html -newermt $(date +%Y-%m-%d -d '1 day ago') -type f -print`; do
		cp -ar $i /root/irozhlas-scraper-geneea-output/html/$1 
	done
	
	echo "move_results: ran Ok"
	return 0
}


# Run analysis
run_batch_analysis_geneea $TODAY || (echo "run_batch_analysis_genee: Failed" && exit 1)
move_results $TODAY || (echo "move_results: Failed" && exit 1)
dump_all_xmls_and_sort_by_entity_repeat_count $root_folder/xml || (echo "dump_all_xmls_and_sort_by_entity_repeat_count Failed" && exit 1)
# Run graphs
run_graphing $root_folder || (echo "run_graphing: Failed" && exit 1)
# GH Commit
commit_data_gh || (echo "commit_data_gh: Failed" && exit 1)
copy_and_commit_graphs_gh $root_folder || (echo "copy_and_commit_graphs_gh: Failed" && exit 1)
