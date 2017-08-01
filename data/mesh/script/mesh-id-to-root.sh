#!/usr/bin/env bash

cd $(dirname $0)/..

cat 2017MeshTree.txt \
    | tail -n+2 \
    | cut -f 1-2 \
    | awk 'BEGIN{OFS="\t"}{print substr($2,2),$2,substr($1,1,1)}' \
    | sort -u \
    | sort -k1n \
    | cut -f2- \
    > mesh_id_to_root.txt

cat mesh_id_to_root.txt \
    | cut -f2 \
    | sort \
    | uniq -c \
    | awk 'BEGIN{OFS="\t"}{print $2,$1}' \
    | sort \
    > mesh_root.txt
