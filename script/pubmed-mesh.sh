#!/usr/bin/env bash

# merge pubmed_id/mesh_id relationship to one file and sort by pubmed_id, so as
# to run `join` command with other files

if [ ! -f data/pubmed/clean_data/pubmed-mesh.txt ]; then
    cat data/pubmed/clean_data/mesh-term/medline17n*.mesh \
        | sort -k1b,1 \
        > data/pubmed/clean_data/pubmed-mesh.txt
fi
