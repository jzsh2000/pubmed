#!/usr/bin/env bash
set -ueo pipefail

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block DateCreated -sep '-' -element Year,Month,Day \
                -block DateCompleted -sep '-' -element Year,Month,Day \
                -block DateRevised -sep '-' -element Year,Month,Day
