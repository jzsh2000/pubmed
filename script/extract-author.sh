#!/usr/bin/env bash
set -ueo pipefail

# 示例输出：
# 四列分别为 pubmed_id | last_name | fore_name | initials
# 1       Makar   A B     AB
# 1       McMartin        K E     KE
# 1       Palese  M       M
# 1       Tephly  T R     TR
# 2       Bose    K S     KS
# 2       Sarma   R H     RH

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
