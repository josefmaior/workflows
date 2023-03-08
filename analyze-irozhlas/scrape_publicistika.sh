#!/bin/sh
#
#

scrape_main () {
  curl -s -L https://plus.rozhlas.cz/hlavni-zpravy-rozhovory-a-komentare-5997846 | grep "b-022__block" | grep href | grep publicistika | grep -v tag | awk -F'"' '{print "https://plus.rozhlas.cz"$8}' > /tmp/links.txt
}

scrape_factbox () {
  for i in `cat /tmp/links.txt` ;
    do curl -s -L "$i" | grep factbox | lynx --dump -assume_charset=utf-8 --display_charset=utf-8 -stdin  ;
  done
}

scrape_main || exit 1
scrape_factbox || exit 1
