#### Final Submission April 12, 2021

# Sex dimorphic constitutive gene expression in eight Drosophila species.
Mursalin Khan & Krista Fincke

### Abstract:

### Introduction:

Quantitative genetics, molecular genetics, and evolutionary studies of different physiological and molecular pathways show remarkable differences between male and female physiology, morphology and behavioral phenotypes. (Klein & Flanagan, 2016; Meier et al., 2009; Kraaijeveld et al., 2008; Scotland et al., 2011, Fish, 2008). The sex dimorphism has been reported in all most all dioecious organism. These differences are caused by the differential expression of the genes which are regulated differently in sexes. The study of the dimorphic gene expression is important to understand gene regulation, evolution, development. In addition, sex difference is ubiquitous in many human diseases, such as autoimmune, cardiovascular, cancer, diabetes, neurological disorders [Camila 2020]. However, the sex dimorphism is not well studied to precisely determine underlying the molecular mechanisms and associated biological factors [Camila 2020].


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

#### Heatmap of the DE immune genes in the dmel

![heatmap of immune genes](https://github.com/Graze-Lab/SDE-of-species/blob/7372846f8dbb05f31ae8c0bf5773579a689721bd/heatmap.png)

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

# Walk Through the Codes:
To determine the sex dimorphic gene expression at the constitutive level in Drosophila species we are using data from the [Yang et al. 2018](https://www.life-science-alliance.org/content/1/6/e201800156). In the analysis we need to concern about model and non-model organisms as *D. melanogater*(dmel) is the model organism we are using dmel as reference to perform the analysis for non-model species. We are adding geneID(ensembl ID ) and gene symbol of the dmel to all nonmodel (such as *Drosophila ananassae* dana).

##### Step1: Data download
We downloaded the data from the [NCBI_GSE99574](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE99574) in and unzip.

##### Step2: Data clean up

```
#### Create Dataframe:
import pandas as pd
import numpy as np
```
##### Step3: Ortholog Identification 
[Code to remove.py](https://github.com/Graze-Lab/SDE-of-species/blob/57e0384f8c35f6f8341bc2a6efccaa6bdac522dd/keep-common-values-matched-cols.py)
##### Step4: Calculate the significantly sex-biased gene expression
##### Step5:



## Class demonstration for the SFB-students (last 3 Mins of the Presentation) 
Navigate the gene expression for the students. Specifically, students will choose a single gene by symbol and they will able to see the gene expression of the gene within and across the Drosophila species.
We need a separate R markdown file for the students to walk through the code.





