#!/usr/bin/env bash
set -ueo pipefail

zcat $@ \
    | xtract -pattern PubmedArticle -def '-' \
                -element MedlineCitation/PMID ArticleTitle \
                -first Abstract/AbstractText \
                -first Language \
                -element MedlineJournalInfo/NlmUniqueID
