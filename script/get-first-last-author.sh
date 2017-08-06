#!/usr/bin/env bash
set -ueo pipefail

cat data/pubmed/clean_data/author/*.author \
    | awk -F'\t' \
       'BEGIN {OFS="\t"; i=0; line=""} \
       {
           if($1 != i) {
               if(line != "") {
                   print line
                   line=""
               }
               print
               i=$1
           }
           else {line = $0}
       }' \
    > data/pubmed/clean_data/author_fl.txt
