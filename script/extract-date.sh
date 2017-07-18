#!/usr/bin/env bash
set -ueo pipefail

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block DateCreated -sep '-' -element Year,Month,Day \
                -block DateCompleted -sep '-' -element Year,Month,Day \
                -block DateRevised -sep '-' -element Year,Month,Day \
    | awk -F'\t' 'BEGIN{OFS="\t"}NF==4{print}NF<4{print $1,$2,"",$3}'
