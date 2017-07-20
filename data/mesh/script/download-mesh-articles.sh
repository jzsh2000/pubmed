#!/usr/bin/env bash

mkdir -p papers
esearch -db pubmed -query '"Medical Subject Headings"[majr]' \
    | efetch -format medline \
    > papers/mesh-papers.medline.txt
