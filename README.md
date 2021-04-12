#### Final Submission April 12, 2021

# Sex dimorphic constitutive gene expression in eight Drosophila species.
Mursalin Khan & Krista Fincke
### Introduction:

Quantitative genetics, molecular genetics, and evolutionary studies of different physiological and molecular pathways show remarkable differences between male and female physiology, morphology and behavioral phenotypes [Camila 2020](https://www.cell.com/cell-reports/pdf/S2211-1247(20)30776-2.pdf). Sex dimorphism has been reported in almost all dioecious organisms. These differences are caused by the differential expression of the genes which are regulated differently in sexes. The study of dimorphic gene expression is important to understand gene regulation, evolution, and development. In addition, sex difference is ubiquitous in many human diseases, such as autoimmune, cardiovascular, cancer, diabetes, neurological disorders [Camila 2020](https://www.cell.com/cell-reports/pdf/S2211-1247(20)30776-2.pdf). However, sex dimorphism is not well studied to precisely determine underlying the molecular mechanisms and associated biological factors [Camila 2020](https://www.cell.com/cell-reports/pdf/S2211-1247(20)30776-2.pdf).

Recent advancement of RNA-seq technology provides the opportunity to understand sex dimorphism in the whole organisms on a transcriptome-wide scale. A number of studies reported the sex dimorphic gene expression in various organisms such as human, mice, fruit flies with or without treatments. Nevertheless, there is a deficit of knowledge in the comprehensive understanding of the constitutive sex dimorphic gene expression even in well-studied model systems. Additionally, it has been underexplored whether sex dimorphism is conserved or diverged across the species. A better understanding of sex dimorphism in related species will contribute to our overall understanding of the evolution of sex differences, as well as our understanding of variation in morphology, physiology and lifespan. To understand constitutive sex dimorphic (SD) gene expression at the species level, we will use publicly available differential gene expression (DEG) data of the fruit fly (GSE99574). 


### Materials and Methods:

#### Dataset:

We extracted the data from database of NCBI Gene Expression Omnibus, GSE99574. The data set contains polyA+ transcriptional profiling of sexed adult tissues/body parts and whole adults of eight Drosophila species: *Drosophila melanogaster* (FBsp00000001) from two strains [w1118 (FBst0005905) and Oregon-R (FBst0025211)], *Drosophila yakuba* (FBsp00000254), *Drosophila ananassae* (FBsp00000052), *Drosophila pseudoobscura* (FBsp00000201), *Drosophila persimilis* (FBsp00000188), *Drosophila willistoni* (FBsp00000253), *Drosophila mojavensis* (FBsp00000160), and *Drosophila virilis* (FBsp00000251).There are 856 samples from different body parts of the Drosophila species including the whole body. In our analysis we used the RNA-seq data of the whole body for the Drosophila species.

The research team that provided the data used similar RNA-seq experiments to create a whole database for sex-associated genes across 8 species. They used the **‘TRANSCRIPTOMIC’** library source, **‘ILLUMINA’** platform, and **‘RNA-Seq’** library strategy. All selected groups of rawRNA-seq data sets were processed through the same pipeline. The raw RNA-seq data mapped to corresponding reference genomes by **HISAT2** (version 2.0.5) under the guidance of gene re-annotation from Yang et al. 2018. **HTSeqcount** (version 0.9.1) was employed to quantify the reads uniquely aligned to each gene so that one read would not be assigned to several paralogs. Read counts were merged by sample so that technical replicates would be integrated. The normalized read counts and identified differentially expressed genes between female and male samples in each group by **DESeq2** (version 1.20.0). They also normalized read counts into the TPM values (Transcript per Million mapped reads). 

#### Identification of the Sex dimorphic Genes:

In our analysis, we used the normalized read counts (NRC) to identify the significantly sex-biased genes in the Drosophila species. We extracted the whole body normalized read counts for the 8 species along with Ensembl ID for the genes. We defined the sex-biased genes at p-value <0.05 (t-test) and calculated the foldchange for the significantly different genes. In addition, we calculated the log2FoldChange of the genes to identify male and female genes for each species (Create Clean_Up_data.R).

#### Data preparation:

To perform the function analysis we used the bitr package in R convert ENSEMBL ID to Gene Symbol and Entrez. We will lose some genes here because not all IDs will be converted. For the non-model species ( 7 other species except dmel) we added the Drosophila melanogaster based orthologs to perform the functional analysis.

#### Data Representation:

We used the male and female biased genes to show the sex dimorphic expression across the species. (Krista Task2).
We generated scripts to know the sex specific expression of the specific gene within and across the species. (Krista Task1)

#### Immune Gene Analysis:

The immune response in  dioecious organisms has been reported to be sex dimorphic for number of diseases such as bacterial infection, viral diseases, fungal infection, cancer, autoimmune diseases, cardiovascular and neural diseases. We extracted the immune and defense related genes from Flybase for Drosophila melanogaster and other species to understand the immune gene expression variation across species. We performed the gene enrichment analysis to see the enriched GO, GSEA and KEGG pathways for immune genes to have clear understanding of the process at constitutive level. 

### Results:

#### 3.1 Sex dimorphism in gene expression
The gene expression analysis across the two Drosophila species showed difference across the male and female biased gene expression.

![Figure 1 Differential Gene Expression in *D. melanogaster* and *Drosophila ananassae* at log2FoldChange >1 (pval<0.05)](https://github.com/Graze-Lab/SDE-of-species/blob/a6debd33fdac4c775caefa35520a9b277481016f/Figure1_MF_1FoldChange0.05.png)

**Figure 1 Differential Gene Expression in *D. melanogaster* and *Drosophila ananassae* at log2FoldChange >1 (pval<0.05)**

N.B. We showed only two species data not the 8 species.
#### 3.2 Sex dimorphism in gene expression of a Single Gene


![Figure 2](https://github.com/Graze-Lab/SDE-of-species/blob/a6debd33fdac4c775caefa35520a9b277481016f/Figure1_MF_1FoldChange0.05.png)

**Figure 2 Differential Gene Expression in *D. melanogaster* and *Drosophila ananassae* for a single gene (pval<0.05)**

N.B. We showed only two species data not the 8 species.

# Walk Through the Codes:
To determine the sex dimorphic gene expression at the constitutive level in Drosophila species we are using data from the [Yang et al. 2018](https://www.life-science-alliance.org/content/1/6/e201800156). In the analysis we must know which species are the model and non-model organisms as *D. melanogater*(dmel) is the model organism we are using dmel as reference to perform the analysis for non-model species. We are adding geneID(ensembl ID) and gene symbol of dmel to all nonmodel (such as *Drosophila ananassae* dana).

## Part1 Sex-dimorphic Gene Expression Determination (For All Genes) 

##### Step1: Data download
We downloaded the data from the [NCBI_GSE99574](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE99574) in and unzip.

##### Step2: Data clean up
The data was prepared by using [Calculate-Foldchanges-and-log2Foldchanges.R](https://github.com/Graze-Lab/SDE-of-species/blob/07233bc2d59f9917872254cdf0d2db359c155c2a/Calculate-Foldchanges-and-log2Foldchanges.R) at the begining of the foldchange and log2foldchange calculation. We used the `subset` fuction for the necessary data selection. The was checked number of times by using `head` and `nrow` in `R`. 

#### Step3: Calculate Foldchanges and log conversion
The second part of the [Calculate-Foldchanges-and-log2Foldchanges.R](https://github.com/Graze-Lab/SDE-of-species/blob/07233bc2d59f9917872254cdf0d2db359c155c2a/Calculate-Foldchanges-and-log2Foldchanges.R) performed the `t-test` to find the genes differentially expressed in males and females (*p-val <0.05*). We used `row_t_equalvar` to create the t-test table of the `library(matrixTests)`. We used the `subset` to extract only the genes *p-val <0.05*. The fold change was calculated by using `foldchange` of `library(gtools)`. Finally, the log base2 was performed to get male and female gene expression. We used male as reference thus positive values are male biased and negative values are female biased in the col `log2FoldChangeMF`. We generated final `csv` file by using some basic merging of the data.
```
clean_data <- cbind(df1_Sig,temp_fc,temp_logRatio)
```
**N.B.** Remove the missing values part is necessary for [Yang et al. 2018](https://www.life-science-alliance.org/content/1/6/e201800156) as they have a new Reannotation ID YO annotation is not found in all Ensenble annotation. Do not need for regular Ensembl annotation file.

##### Step4: Gene ID Conversion 

Now we have the file like the following.

ENSEMBL	| mean.nrc.f |	mean.nrc.m	| pvalue |	stderr |	foldchangesMF |	log2FoldChangeMF
--------|------------|--------------|--------|---------|----------------|-----------------
FBgn0031214 | 2.520484397 |	19.40384798 |	0.000232543 |	2.161937704 |	7.698459868 |	2.944569853

We need to add the Gene Symbol and Entrez to perform fuctional analysis. We used the [gene-id-conversion.R](https://github.com/Graze-Lab/SDE-of-species/blob/07233bc2d59f9917872254cdf0d2db359c155c2a/gene-id-conversion.R). For the dosophila we used the `library("org.Dm.eg.db")` of the `Annotationdbi`. *(You need to check if you want to use other organism. Annotationdbi can also create annotationdbi for non-model organism.)* We checked the id availability by using `keytypes(org.Dm.eg.db)` and finally converted the id and kept only matched IDSv by 
```
ids<-bitr(names(original_gene_list), fromType = "ENSEMBL", toType = "ENTREZID", OrgDb=org.Dm.eg.db)

```
It is worth to mention there will be some (specially for non-model) duplicated values for the ENTREZID thus we removed the duplicates `

```
#remove duplicate IDS (here I use "ENSEMBL", but it should be whatever was selected as keyType)
dedup_ids = ids[!duplicated(ids[c("ENSEMBL")]),]
head(dedup_ids)
df2 = df1[df1$ENSEMBL %in% dedup_ids$ENSEMBL,] #VVI match and remove like awk
head(df2)
nrow(df2)
nrow(df1)
lostgene <- (nrow(df1)-nrow(df2))
```

**N.B.** `ENTREZID` are the same as `ncbi-geneid` for `org.Dm.eg.db` so we use this for toTypeAs. Read the box in the [code](https://github.com/Graze-Lab/SDE-of-species/blob/07233bc2d59f9917872254cdf0d2db359c155c2a/gene-id-conversion.R).

ENSEMBL	| mean.nrc.f |	mean.nrc.m	| pvalue |	stderr |	foldchangesMF |	log2FoldChangeMF | ENTREZID | SYMBOL
--------|------------|--------------|--------|---------|----------------|----------------- |----------|-------
FBgn0031214 | 2.520484397 |	19.40384798 |	0.000232543 |	2.161937704 |	7.698459868 |	2.944569853| 33163 | CG11374

##### Step5: Ortholog Identification 

In non-model organisms the orthologs of dmel need to be added for the functional analysis and to identify gene level expression variation accross the species. (*We performed the dana ortholog identification only but you can perform any species*) In case of the ortholog identification, we extracted orthologs based on the ensembl guideline from [ENSEMBL](https://useast.ensembl.org/index.html). In the [Ortholog_merge_for non model organism in R](https://github.com/Graze-Lab/SDE-of-species/blob/062f0e89f06b8a0d8deb9319a8832c4eebba1db5/Ortholog_merge_for%20non%20model%20organism%20in%20R.R) our *df1 will be the normalized (gene count/TPM/FPKM) file* is the file from **Step2 and Step3** and *df2 is the ortholog file* from [ENSEMBL](https://useast.ensembl.org/index.html). We removed all the dana genes which are not orthologus in dmel using `tidyr` function `drop_na`.

```
df5 <- df3 %>% drop_na(ENSEMBL_DMel,SYMBOL_DMel) #both ENSEMBL and SYMBOL

#how many genes are not getting orthologs in the model organism 
lost_gene <- nrow(df1)-nrow(df5)
lost_gene 
```
**N.B.** Some dana genes do not have dmel orthologs.

## Part2 Sex-dimorphic Gene Expression Determination (For Immune Genes)

##### Step2.1: Immune and defense gene identification in Flybase
We downloaded the data from the [Flybase](http://flybase.org/) for the dmel andother species. The ortholog info of the other non-model organism indicated all the other-species Drosophila immune genes are present in model organism Drosophila data. Thus, we used ony the dmel immune genes(591) and defense genes(432). From the previous references we know that there is some common genes in these two lists. We are cleaning the data in the following steps.  

##### Step2.2: Merge the immune and defense gene list

We perfomed the merging of the two `txt` files by using [merge.py](https://github.com/Graze-Lab/SDE-of-species/blob/68a5ad6ad860770d5eabaf45e0c363ab630a303c/merge.py). 

##### Step2.3: Keep only unique immune and defense genes

The output of the [merge.py](https://github.com/Graze-Lab/SDE-of-species/blob/68a5ad6ad860770d5eabaf45e0c363ab630a303c/merge.py) is used as input for [remove-duplicates.py](https://github.com/Graze-Lab/SDE-of-species/blob/68a5ad6ad860770d5eabaf45e0c363ab630a303c/remove-duplicates.py). we used the `panda(drop_duplicates)` to remove the duplicates in the genes. 

```
#### Create Dataframe:
import pandas as pd
import numpy as np
# Import data from .csv file
df = pd.read_csv('C.search-immune-defense-dmel-FlyBase_IDs.txt', delimiter = "\t")
df1 = df.drop_duplicates()
df1.to_csv('D.search-immune-defense-unique-dmel.csv', index=False)
```
##### Step2.4: Keep only unique immune and defense genes

After getting the unique immune-defense gene list we mactched the genes with **PART1** final file to have only the immune-defense gene exression in male and female.
We used the `panda` to perform the matching based on col values in [keep-common-values-matched-cols.py](https://github.com/Graze-Lab/SDE-of-species/blob/68a5ad6ad860770d5eabaf45e0c363ab630a303c/keep-common-values-matched-cols.py)

```
match=df2.columns.intersection(df1.columns).tolist() #finds matching cols in both df
df3 = df2.merge(df1,on=match).reindex(df2.columns,axis=1) #merge and reindex to df2.columns
```

##### Step2.5: Visualization of the gene expressioin (heatmap)
Finally, we are demonstrating the differentally expressed (382genes) immune-defense gene expression in male and female by using a one col based heatmap [heatmap](https://github.com/Graze-Lab/SDE-of-species/blob/e1571db51325f572ff366a0f89913382229c5a2d/heatmap-with-one-data.R). 

![heatmap of immune genes](https://github.com/Graze-Lab/SDE-of-species/blob/7372846f8dbb05f31ae8c0bf5773579a689721bd/heatmap.png)

**N.B.** We removed 11 genes which expressed only in male or female. Giving inf for log2FoldChanges

## Class demonstration for the SFB-students (last 3 Mins of the Presentation) 
Navigate the gene expression for the students. Specifically, students will choose a single gene by symbol and they will able to see the gene expression of the gene within and across the Drosophila species.
We need a separate R markdown file for the students to walk through the code.





