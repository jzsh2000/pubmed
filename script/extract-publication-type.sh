#!/usr/bin/env bash
set -ueo pipefail

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block PublicationTypeList -sep "\n\t" \
                    -element PublicationType@UI \
    | grep -vP '\t$' \
    | awk -F'\t' 'BEGIN{OFS="\t"}$1~/[0-9]/{i=$1}{print i,$2}'
