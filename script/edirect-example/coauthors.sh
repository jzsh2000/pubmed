#!/bin/bash -norc

# from https://www.ncbi.nlm.nih.gov/books/NBK179288/ (page 88-89)

if [ "$#" -lt 2 ]
then
    echo "Must supply at least two author names"
    exit 1
fi

query="xtract -pattern PubmedArticle -element MedlineCitation/PMID"

# append a -block statement for each author argument
for auth in "$@"
do
query=`echo "$query -block Author -if LastName -equals \"$auth\"" \
            "-sep \" \" -element LastName,Initials"`
done

query=`echo "$query | sort -t \$'\\t' -k 2f -k 1,1n"`

if [ -t 0 ]
then
    # stand-alone command, print constructed query for later use
    echo "$query"
else
    # dynamically execute query on XML data piped to script
    res=`eval "$query"`
    echo "$res"
fi
