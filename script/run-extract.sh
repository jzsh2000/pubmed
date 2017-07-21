#!/usr/bin/env bash

input_dir='data/pubmed/ftp.ncbi.nlm.nih.gov/pubmed/baseline'
output_dir='data/pubmed/clean_data'
mkdir -p $output_dir/{publication-date,mesh-term,publication-type,content,date}
find $input_dir -name '*.gz' \
    | parallel -j1 --verbose "./extract-pubdate.sh {} > $output_dir/publication-date/{/.}.pubdate"
find $input_dir -name '*.gz' \
    | parallel -j1 --verbose "./extract-mesh.sh {} > $output_dir/mesh-term/{/.}.mesh"
find $input_dir -name '*.gz' \
    | parallel -j1 --verbose "./extract-publication-type.sh {} > $output_dir/publication-type/{/.}.pt"
find $input_dir -name '*.gz' \
    | parallel -j1 --verbose "./extract-title-abstract.sh {} > $output_dir/content/{/.}.content"
find $input_dir -name '*.gz' \
    | parallel -j1 --verbose "./extract-date.sh {} > $output_dir/date/{/.}.date"
