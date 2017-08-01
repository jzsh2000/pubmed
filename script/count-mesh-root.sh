#!/usr/bin/env bash

join <(sort -k1b,1 data/mesh/mesh_id_to_root.txt) \
     <(sort -k1b,1 data/pubmed/clean_data/mesh.txt) \
    | tr ' ' '\t' \
    | cut -f2- \
    | sort -k1 \
    | datamash groupby 1 sum 2 sum 3 \
    > data/pubmed/clean_data/mesh_root.txt
