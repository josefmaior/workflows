#!/bin/sh

scrape_main(){
  curl -s -L https://plus.rozhlas.cz/hlavni-zpravy-rozhovory-a-komentare-5997846 | grep "b-022__block" | grep href | grep publicistika | grep -v tag | awk -F'"' '{print "https://plus.rozhlas.cz"$8}' > /tmp/links.txt;

  for i in `cat /tmp/links.txt` ; do

    # hlavicka nadpis
    curl -s -L "$i" | grep "h1" | grep -v display | lynx --dump -assume_charset=utf-8 --display_charset=utf-8 -stdin  | grep -v "'' + '' +" ;
    # datum zverejneni
    curl -s -L "$i" | grep node-block__block--date -A 3 | lynx --dump -assume_charset=utf-8 --display_charset=utf-8 -stdin ; 
    # hoste sedivy-box
    curl -s -L "$i" | grep factbox | lynx --dump -assume_charset=utf-8 --display_charset=utf-8 -stdin  ;
    printf "$i\n\n";
  done
}

scrape_rest(){
  ./irozhlas_porady_hoste_scraper/irozhlas_porady_hoste_scraper
}

############## RUN HERE ##################

scrape_main || exit 1


scrape_rest || exit 1

