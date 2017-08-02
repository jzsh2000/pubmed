#!/usr/bin/env bash
set -ueo pipefail

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block Author -sfx "\n\t" -tab "" \
                    -element LastName,ForeName,Initials \
    | grep -vP '\t$' \
    | awk 'NF>1' \
    | awk -F'\t' \
       'BEGIN {OFS="\t"}
        $1~/[0-9]/{i=$1}
        {print i,$2,$3,$4}'
