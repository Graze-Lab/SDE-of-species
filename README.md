#### Final Submission April 12, 2021

# Sex dimorphic constitutive gene expression in eight Drosophila species.
Mursalin Khan & Krista Fincke

### Abstract:

### Introduction:

Quantitative genetics, molecular genetics, and evolutionary studies of different physiological and molecular pathways show remarkable differences between male and female physiology, morphology and behavioral phenotypes. (Klein & Flanagan, 2016; Meier et al., 2009; Kraaijeveld et al., 2008; Scotland et al., 2011, Fish, 2008). The sex dimorphism has been reported in all most all dioecious organism. These differences are caused by the differential expression of the genes which are regulated differently in sexes. The study of the dimorphic gene expression is important to understand gene regulation, evolution, development. In addition, sex difference is ubiquitous in many human diseases, such as autoimmune, cardiovascular, cancer, diabetes, neurological disorders [Camila 2020]. However, the sex dimorphism is not well studied to precisely determine underlying the molecular mechanisms and associated biological factors [Camila 2020].

![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)

Recent advancement of the RNA-seq technology provide the opportunity to understand the sex dimorphism in the whole organisms on a transcriptome-wide scale. Number of studies reported the sex dimorphic gene expression in various organisms such as human, mice, fruit flies with or without treatments. Nevertheless, there is a deficit of knowledge in the comprehensive understanding of the constitutive sex dimorphic gene expression even in well-studied model systems. Besides, it has been underexplored whether the sex dimorphism is conserved or diverged across the species. A better understanding of sex dimorphism in related species will contribute to our overall understanding of the evolution of sex differences, as well as our understanding of variation in morphology, physiology and lifespan.To understand constitutive sex dimorphic (SD) gene expression in species level, we will use publicly available deferential gene expression (DEG) data of the fruit fly (GSE99574). 


### Materials and Methods:

#### Dataset:

We extracted the data from database of NCBI Gene Expression Omnibus, GSE99574. The data set contains polyA+ transcriptional profiling of sexed adult tissues/body parts and whole adults of eight Drosophila species: *Drosophila melanogaster* (FBsp00000001) from two strains [w1118 (FBst0005905) and Oregon-R (FBst0025211)], *Drosophila yakuba* (FBsp00000254), *Drosophila ananassae* (FBsp00000052), *Drosophila pseudoobscura* (FBsp00000201), *Drosophila persimilis* (FBsp00000188), *Drosophila willistoni* (FBsp00000253), *Drosophila mojavensis* (FBsp00000160), and *Drosophila virilis* (FBsp00000251).There are 856 samples from different body parts of the Drosophila species including the whole body. In our analysis we used the RNA-seq data of the whole body for the drosophila species.

In the study, they used the similar RNA-seq experiments to create a whole data based for sex associated genes across 8 species. They used the **‘TRANSCRIPTOMIC’** library source, **‘ILLUMINA’** platform, and **‘RNA-Seq’** library strategy. All selected groups of rawRNA-seq data sets were processed through the same pipeline. The raw RNA-seq data mapped to corresponding reference genomes by **HISAT2** (version 2.0.5) under the guidance of gene re-annotation from Yang et al. 2018. **HTSeqcount** (version 0.9.1) was employed to quantify the reads uniquely aligned to each gene so that one read would not be assigned to several paralogs. Read counts were merged by sample so that technical replicates would be integrated. The normalized read counts and identified differentially expressed genes between female and male samples in each group by **DESeq2** (version 1.20.0). They also normalized read counts into the TPM values (Transcript per Million mapped reads). 

#### Identification of the Sex dimorphic Genes:

In our analysis, we used the normalized read counts (NRC) to identify the significantly sex biased gene in the Drosophila species. We extracted the whole body normalized read counts for the 8 species along with Ensembl ID for the genes. We defined the sex biased genes at p-value <0.05 (t-test) and calculated the foldchange for the significantly different genes. In addition, we calculated the log2FoldChange of the genes to identify male and female genes for each species (Create Clean_Up_data.R).

#### Data preparation:

To perform the function analysis we used the convert ENSEMBL ID to Gene Symbol and Entrez. We will lose some genes here because not all IDs will be converted. For the non-model species ( 7 other species except dmel) we added the Drosophila melanogaster based orthologs to perform the functional analysis.

#### Data Representation:

We used the male and female biased genes to show the sex dimorphic expression across the species. (Krista Task2).
We generated scripts to know the sex specific expression of the specific gene within and across the species. (Krista Task1)

#### Immune Gene Analysis:

The immune response in the diecious organism has been reported sex dimorphic for number of diseases such as bacterial infection, viral diseases, fungal attack, cancer, autoimmune diseases, cardiovascular and neural diseases. We extracted the immune and defense related genes from the Flybase for the Drosophila melanogaster and other species to understand the immune gene expression variation across species. We performed the gene enrichment analysis to see the enriched GO, GSEA and KEGG pathways for immune genes to have clear understanding of the process at constitutive level. 

### Results:

#### 3.1 Sex dimorphism in gene expression (Krista Task2) Figure 1
The gene expression analysis across the three Drosophila species found the marked difference across the male and female biased gene expression.
In general, the analysis demonstrates the male and female biased constitutive GEs in not conserved across the closed related species.

#### 3.2 Sex dimorphism in gene expression of a Single Gene (Krista Task1)
Figure 2

#### 3.3 Enrichment of the Gene Ontology terms (Immune Genes)
Figure 3
In our functional studies, we identified the enriched gene ontology terms for male and female in three species (Figure 4).

#### 3.4 Cluster and Network Enrichment (Immune Genes)
Our functional study of the enriched networks showed the differences in male and female for all the three species (Figure 5).

#### 3.5 Gene Set Enrichment Analysis (Immune Genes)
We performed the gene set enrichment analysis to identify the enriched gene sets in sexes for the D. melanogaster, D. simulans and D. yakuba (Figure 6). 

#### 3.6 Enriched KEGG Pathways 
To detected the differentially expressed pathways in the male and female across the species we performed pathway enrichment analysis (Figure 7).

#### Table 1:
Show the clean data file Final with ID.
#### Figure 1:
#### Figure 2:
#### Figure 3:
#### Figure 4:
#### Figure 5:

### Discussion:


### Conclusion and Future direction:

##Walk Through the Codes:
We will add how to use the codes in a step-by-step manner. 



## Class demonstration for the SFB-students (last 3 Mins of the Presentation) 
Navigate the gene expression for the students. Specifically, students will choose a single gene by symbol and they will able to see the gene expression of the gene within and across the Drosophila species.
We need a separate R markdown file for the students to walk through the code.

#### OLD SUBMISSION

# SDE-of-species
##Authors: Mursalin Khan & Krista Fincke

**Summary**: Using [publicly available RNA-seq data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE99574) from 8 *Drosophila* species, we aim to characterize how sex-differential expression(SDE) changes amongst lineages. Specifically, we are interested in changes amongst lineages in regards to immunity and hormone-signaling genes. We will use differential expression analysis to accomplish these aims. After running the data through established pipelines, we will write a script to display differential expression and other statistics based on comparisons chosen by the user.

###Introduction: ###
Quantitative genetics, molecular genetics, and evolutionary studies of different physiological and molecular pathways show remarkable differences between male and female physiology, morphology and behavioral phenotypes. (Klein & Flanagan, 2016; Meier et al., 2009; Kraaijeveld et al., 2008; Scotland et al., 2011, Fish, 2008). The sex dimorphism has been reported in all most all dioecious organism. These differences are caused by the differential expression of the genes which are regulated differently in sexes. The study of the dimorphic gene expression is important to understand gene regulation, evolution, development. In addition, sex difference is ubiquitous in many human diseases, such as autoimmune, cardiovascular, cancer, diabetes, neurological disorders [Camila 2020]. However, the sex dimorphism is not well studied to precisely determine underlying the molecular mechanisms and associated biological factors [Camila 2020].

Recent advancement of the RNA-seq technology provide the opportunity to understand the sex dimorphism in the whole organisms on a transcriptome-wide scale. Number of studies reported the sex dimorphic gene expression in various organisms such as human, mice, fruit flies with or without treatments. Nevertheless, there is a deficit of knowledge in the comprehensive understanding of the constitutive sex dimorphic gene expression even in well-studied model systems. Besides, it has been underexplored whether the sex dimorphism is conserved or diverged across the species. A better understanding of sex dimorphism in related species will contribute to our overall understanding of the evolution of sex differences, as well as our understanding of variation in morphology, physiology and lifespan.

To understand constitutive sex dimorphic (SD) gene expression in species level, we will use publicly available deferential gene expression (DEG) data of the fruit fly (GSE99574).  

###Objectives 
We examined the expression of female and male in eight related Drosophila species: Drosophila melanogaster, D. simulans, D. yakuba, D. ananassae, D. pseudoobscura, D. mojavensis, and D. virilis to retrive the following information for genes.

For a specific gene(FlybaseID or Gene Symbol), our script will provide 
1) Gene expression in female and male (Normalized_TPM) within Species 
2) Difference in the gene expression across the species
3) Fold change
4) P values for difference between male and female
5) Log2(male/Female) ratio 
6) What are the interactive pathways the SD genes are related

###Plan of Action 
- download publically available RNA-seq data
- recreate output using bioinformatics pipeline as originally outlined in Yang et al. 2018
- obtain single file of read acounts amongst sex and species
- create a script that outputs parameters as outlined in "Objectives" based on the data in the read count file

###Expected Output
- A processed and normalized file of read counts
- a pdf report displaying the parameters of interest to the user



