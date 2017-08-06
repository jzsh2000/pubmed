#!/usr/bin/env bash
set -ueo pipefail

# 提取文献的第一个作者和最后一个作者，当两者为同一人时，不重复输出
# 示例输出：
# 四列分别为 pubmed_id | last_name | fore_name | initials
# 1	Makar	A B	AB
# 1	Tephly	T R	TR
# 2	Bose	K S	KS
# 2	Sarma	R H	RH
# 4	Wiesmann	U N	UN
# 4	Herschkowitz	N N	NN

cat data/pubmed/clean_data/author/*.author \
    | awk -F'\t' \
       'BEGIN {OFS="\t"; i=0; line=""} \
       {
           if($1 != i) {
               if(line != "") {
                   print line
                   line=""
               }
               print
               i=$1
           }
           else {line = $0}
       }' \
    > data/pubmed/clean_data/author_fl.txt
