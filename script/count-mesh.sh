#!/usr/bin/env bash

cat data/pubmed/clean_data/mesh-term/*.mesh \
    | cut -f2 \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1 \
    > data/pubmed/clean_data/mesh.all.txt

cat data/pubmed/clean_data/mesh-term/*.mesh \
    | awk '$3=="Y"' \
    | cut -f2 \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1 \
    > data/pubmed/clean_data/mesh.major.txt

join -e 0 data/pubmed/clean_data/{mesh.all.txt,mesh.major.txt} \
    > data/pubmed/clean_data/mesh.txt
rm data/pubmed/clean_data/mesh.*.txt
