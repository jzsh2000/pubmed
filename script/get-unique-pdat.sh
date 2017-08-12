#!/usr/bin/env bash

cat data/pubmed/clean_data/publication-date/*.pubdate \
    | awk '$2=="pubmed"' \
    | cut -f1,3 \
    | awk 'BEGIN{i=0}{if($1!=i){i=$1;print}}' \
    | sort -k1b,1 \
    > data/pubmed/clean_data/pubmed-pdat.txt
