#!/usr/bin/env bash
set -ueo pipefail
cd $(dirname $0)/..

categories=`cat data/mesh/mesh_id_to_root.txt | cut -f2 | sort -u`
mkdir -p data/mesh/branch
for category in $categories
do
    echo $category
    cat data/mesh/mesh_id_to_root.txt \
        | awk -v c=$category '$2==c{print $1}' \
        > data/mesh/branch/${category}.txt
done
