#!/usr/bin/env bash
set -ueo pipefail

# example output:
# 1   pubmed  1975-06-01
# 1   medline 1975-06-01
# 1   entrez  1975-06-01
# 2   pubmed  1975-10-27
# 2   medline 1975-10-27
# 2   entrez  1975-10-27

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block PubMedPubDate -element @PubStatus -sep '-' -element Year,Month,Day \
    | awk '{
        pmid = $1;
        for(i=2; i<NF; i+=2) {
            pubstatus = $i;
            pubdate = $(i+1);
            split(pubdate, pd, "-");
            printf "%s\t%s\t%04d-%02d-%02d\n",pmid,pubstatus,pd[1],pd[2],pd[3];
        }}'
