#!/usr/bin/env bash
esearch -db pubmed -query "Casadaban MJ [AUTH] OR Berg CM [AUTH]" \
    | efetch -format xml \
    | ./coauthors.sh Casadaban Groisman Berg Garber \
    | ./extract-fuse.pl pubmed \
    > author_patterns.htm
