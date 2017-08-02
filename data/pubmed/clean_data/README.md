* `mesh.txt` - 各个 MeSH 词条在 PubMed 文献中出现的次数，文件中的三列分别为
    - MeSH ID
    - 涉及该 MeSH 词条的文献数量
    - 涉及该 MeSH 词条且作为 major topic 的文献数量
* `mesh_root.txt` - 各个 MeSH 大类在文献中出现的频率统计，文件中的三列分别为
    - MeSH 大类缩写（具体含义见 mesh\_root\_name.txt）
    - 该大类下的 MeSH 词条在文献中出现的次数（同一篇文献中可能出现多次）
    - 该大类下的 MeSH 词条在文献中作为 major topic 出现的次数
* `pdat.count` - 同一篇文献拥有的 PDAT 数量，PDAT 为文献到达 PubMed 的时间，一般只有一个
* `pdat.day.txt` - PubMed 上每天的文献数量（截止到 2016-12-10）
* `pdat.month.txt` - PubMed 上每月的文献数量
* `pdat.year.txt` - PubMed 上每年的文献数量
