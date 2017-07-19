#!/usr/bin/env bash
set -ueo pipefail

# 关于 MeSH major topic：如果 descriptor 没有被判定为 majortopic，但其下的一个
# quantifier 被判定为 major topic，此时这一 MeSH 条目应被判定为 major topic
#
# <MeshHeading>
#   <DescriptorName UI="D001826" MajorTopicYN="N">Body Fluids</DescriptorName>
#   <QualifierName UI="Q000032" MajorTopicYN="Y">analysis</QualifierName>
# </MeshHeading>

# 示例输出：
# 1	D000445	N
# 1	D000818	N
# 1	D001826	Y
# 1	D002245	N
# 1	D005561	Y

zcat $@ \
    | xtract -pattern PubmedArticle \
                -element MedlineCitation/PMID \
                -block MeshHeading -sfx "\n\t" -tab "" \
                    -element DescriptorName@UI,DescriptorName@MajorTopicYN,QualifierName@MajorTopicYN \
    | grep -vP '\t$' \
    | awk 'NF>1' \
    | awk -F'\t' \
       'BEGIN {OFS="\t"}
        $1~/[0-9]/{i=$1}
        {
            mt = "N"
            for (f=3; f<=NF; f++) {
                if ($f == "Y") {
                    mt = "Y"
                    break
                }
            }
            print i,$2,mt
        }'
