#!/usr/bin/env bash

cat data/pubmed/clean_data/mesh-term/*.mesh \
    | cut -f2 \
    | grep '^D' \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1b,1 \
    > data/pubmed/clean_data/mesh.all.txt

cat data/pubmed/clean_data/mesh-term/*.mesh \
    | awk '$3=="Y"' \
    | cut -f2 \
    | grep '^D' \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1b,1 \
    > data/pubmed/clean_data/mesh.major.txt

join -a 1 -e 0 -o auto -t $'\t' \
    data/pubmed/clean_data/{mesh.all.txt,mesh.major.txt} \
    > data/pubmed/clean_data/mesh.txt
rm data/pubmed/clean_data/mesh.*.txt
