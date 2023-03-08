#!/bin/sh

function scrape_main {
  curl -s -L https://plus.rozhlas.cz/hlavni-zpravy-rozhovory-a-komentare-5997846 | grep "b-022__block" | grep href | grep publicistika | grep -v tag | awk -F'"' '{print "https://plus.rozhlas.cz"$8}' > /tmp/links.txt

  for i in `cat /tmp/links.txt` ; do
    curl -s -L "$i" | grep "h1" | grep -v display | lynx --dump -assume_charset=utf-8 --display_charset=utf-8 -stdin  | grep -v "'' + '' +" ;
    curl -s -L "$i" | grep factbox | lynx --dump -assume_charset=utf-8 --display_charset=utf-8 -stdin  ;
    echo -e "\n"
    echo -e "[link]($i)"
    echo -e "\n"
  done
}

function scrape_pro_a_proti {
  curl -s -L https://plus.rozhlas.cz/pro-a-proti-6482952 | grep "b-022__block" | grep -v tag |  awk -F'"' '{print "https://plus.rozhlas.cz"$8}' > /tmp/links.txt
}

function scrape_dvacet_min_rz {
  curl -s -L https://plus.rozhlas.cz/dvacet-minut-radiozurnalu-5997743 | grep "b-022__block" | grep -v tag |  awk -F'"' '{print "https://plus.rozhlas.cz"$8}' > /tmp/links.txt
}
function scrape_interview_plus {
  curl -s -L https://plus.rozhlas.cz/interview-plus-6504167 | grep "b-022__block" | grep -v tag |  awk -F'"' '{print "https://plus.rozhlas.cz"$8}' > /tmp/links.txt
}


############## RUN HERE ##################
scrape_main || exit 1

# need more parsing
#scrape_pro_a_proti
#scrape_dvacet_min_rz
#scrape_interview_plus
