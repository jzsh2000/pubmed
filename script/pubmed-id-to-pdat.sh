#!/usr/bin/env bash
set -ueo pipefail

# input file format: each line is a pubmed id
# output to stdout
sort $1 \
    | join - data/pubmed/clean_data/pubmed-pdat.txt
