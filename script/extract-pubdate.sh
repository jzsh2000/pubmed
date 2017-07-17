#!/usr/bin/env bash
set -ueo pipefail

# columns:
# 1: PMID
# 2: PubMedPubDate (entrez)
# 3: PubMedPubDate (pubmed)
# 4: PubMedPubDate (medline)

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block PubMedPubDate -sep '-' -element Year,Month,Day
