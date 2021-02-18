# SDE-of-species
## Authors: Mursalin Khan & Krista Fincke

**Summary**: Using [publicly available RNA-seq data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE99574) from 8 *Drosophila* species, we aim to characterize how sex-differential expression(SDE) changes amongst lineages. Specifically, we are interested in changes amongst lineages in regards to immunity and hormone-signaling genes. We will use differential expression analysis to accomplish these aims. After running the data through established pipelines, we will write a script to display differential expression and other statistics based on comparisons chosen by the user.

### Introduction: ###
Quantitative genetics, molecular genetics, and evolutionary studies of different physiological and molecular pathways show remarkable differences between male and female physiology, morphology and behavioral phenotypes. (Klein & Flanagan, 2016; Meier et al., 2009; Kraaijeveld et al., 2008; Scotland et al., 2011, Fish, 2008). The sex dimorphism has been reported in all most all dioecious organism. These differences are caused by the differential expression of the genes which are regulated differently in sexes. The study of the dimorphic gene expression is important to understand gene regulation, evolution, development. In addition, sex difference is ubiquitous in many human diseases, such as autoimmune, cardiovascular, cancer, diabetes, neurological disorders [Camila 2020]. However, the sex dimorphism is not well studied to precisely determine underlying the molecular mechanisms and associated biological factors [Camila 2020].

Recent advancement of the RNA-seq technology provide the opportunity to understand the sex dimorphism in the whole organisms on a transcriptome-wide scale. Number of studies reported the sex dimorphic gene expression in various organisms such as human, mice, fruit flies with or without treatments. Nevertheless, there is a deficit of knowledge in the comprehensive understanding of the constitutive sex dimorphic gene expression even in well-studied model systems. Besides, it has been underexplored whether the sex dimorphism is conserved or diverged across the species. A better understanding of sex dimorphism in related species will contribute to our overall understanding of the evolution of sex differences, as well as our understanding of variation in morphology, physiology and lifespan.

To understand constitutive sex dimorphic (SD) gene expression in species level, we will use publicly available deferential gene expression (DEG) data of the fruit fly (GSE99574).  

### Objectives 
We examined the expression of female and male in eight related Drosophila species: Drosophila melanogaster, D. simulans, D. yakuba, D. ananassae, D. pseudoobscura, D. mojavensis, and D. virilis to retrive the following information for genes.

For a specific gene(FlybaseID or Gene Symbol), our script will provide 
1) Gene expression in female and male (Normalized_TPM) within Species 
2) Difference in the gene expression across the species
3) Fold change
4) P values for difference between male and female
5) Log2(male/Female) ratio 
6) What are the interactive pathways the SD genes are related

### Plan of Action 

### Expected Output
