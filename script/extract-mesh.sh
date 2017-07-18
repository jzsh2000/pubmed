#!/usr/bin/env bash
set -ueo pipefail

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block MeshHeading -sfx "\n\t" -tab "" \
                    -element DescriptorName@UI,DescriptorName@MajorTopicYN \
    | grep -vP '\t$' \
    | awk -F'\t' 'BEGIN{OFS="\t"}$1~/[0-9]/{i=$1}{print i,$2,$3}'
