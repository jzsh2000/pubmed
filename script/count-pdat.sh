#!/usr/bin/env bash

echo -e "date\tcount" > data/pubmed/clean_data/pdat.count
cat data/pubmed/clean_data/publication-date/*.pubdate \
    | awk '$2=="pubmed"' \
    | cut -f1 \
    | sort \
    | uniq -c \
    | awk '{print $1}' \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1n \
    >> data/pubmed/clean_data/pdat.count

cat data/pubmed/clean_data/publication-date/*.pubdate \
    | awk '$2=="pubmed"' \
    | cut -f3 \
    | cut -d- -f1 \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1 \
    > data/pubmed/clean_data/pdat.year.txt

cat data/pubmed/clean_data/publication-date/*.pubdate \
    | awk '$2=="pubmed"' \
    | cut -f3 \
    | cut -d- -f1-2 \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1 \
    > data/pubmed/clean_data/pdat.month.txt

cat data/pubmed/clean_data/publication-date/*.pubdate \
    | awk '$2=="pubmed"' \
    | cut -f3 \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort -k1 \
    > data/pubmed/clean_data/pdat.day.txt
