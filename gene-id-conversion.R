#ENSEMBL to Gene Symbol and Entrez Conversion 
#Specifically for the model organism as we need to add orthologs in the non-model organism
#you can use it for any species 

#################################################################################################################

#VVI READ IT
#For KEGG pathway enrichment using the gseKEGG() function, we need to convert id types. 
#We can use the bitr function for this (included in clusterProfiler). 
#It is normal for this call to produce some messages / warnings.
#In the bitr function, the param fromType should be the same as keyType from the gseGO function above (the annotation source).
#This param is used again in the next two steps: creating dedup_ids and df2.
#toType in the bitr function has to be one of the available options from keyTypes(org.Dm.eg.db) and must map to one of 'kegg',
#'ncbi-geneid', 'ncib-proteinid' or 'uniprot' because gseKEGG() only accepts one of these 4 options as it's keytype parameter.
#In the case of org.Dm.eg.db, none of those 4 types are available,
#but 'ENTREZID' are the same as ncbi-geneid for org.Dm.eg.db so we use this for toType.

#################################################################################################################

#load necessary library
library("org.Dm.eg.db") # we are using specifically memalogater database 
#optionals 
library(enrichplot)
library(clusterProfiler)
library(ggplot2)
library(DOSE)
library(pathview)

#Prepare Input data

df1 <- read.csv(file.choose()) # choose the data file 
head(df1)
nrow(df1)

#rename the headers 

names(df1)[1] <- "ENSEMBL"
names(df1)[2] <- "SYMBOL"
names(df1)[3] <- "Sex"
names(df1)[4] <- "Chromosome"
names(df1)[8] <- "log2FoldChange"
names(df1)[10] <- "ENSEMBL"
names(df1)[11] <- "SYMBOL"
names(df1)[8] <- "log2FoldChange"

# We want the log2 fold change # we will keep other col as well

original_gene_list <- df1$log2MFratio #make sure name is matching 

# name the vector
#names(original_gene_list) <- df$X
names(original_gene_list) <- df1$ENSEMBL
# omit any NA values 
gene_list<-na.omit(original_gene_list)

# sort the list in decreasing order (required for clusterProfiler)

gene_list = sort(gene_list, decreasing = TRUE) # it will help you for heatmap and functional analysis 
head(gene_list) #check it LIST(matrix)
head(original_gene_list) #check it VECTOR

#Check which options are available with the keytypes command, for example 
keytypes(org.Dm.eg.db) # you can perform anytype WE will use ENTERZ and SYMBOL


#As our intial input, we use original_gene_list which we created above.


# Convert gene IDs for gseKEGG function
# We will lose some genes here because not all IDs will be converted

#Step1:
  
ids<-bitr(names(original_gene_list), fromType = "ENSEMBL", toType = "ENTREZID", OrgDb=org.Dm.eg.db)

#remove duplicate IDS (here I use "ENSEMBL", but it should be whatever was selected as keyType)

dedup_ids = ids[!duplicated(ids[c("ENSEMBL")]),]
head(dedup_ids)

# Create a new dataframe df2 which has only the genes which were successfully mapped using the bitr function above
df2 = df1[df1$ENSEMBL %in% dedup_ids$ENSEMBL,] #VVI match and remove like awk
head(df2)
nrow(df2)
nrow(df1)
lostgene <- (nrow(df1)-nrow(df2))

# Create a new column in df2 with the corresponding ENTREZ IDs
df2$Y = dedup_ids$ENTREZID


head(df2)
nrow(df2)
#check the match 

#Step2
ids<-bitr(names(original_gene_list), fromType = "ENSEMBL", toType = "SYMBOL", OrgDb=org.Dm.eg.db)

#remove duplicate IDS (here I use "ENSEMBL", but it should be whatever was selected as keyType)

dedup_ids = ids[!duplicated(ids[c("ENSEMBL")]),]
head(dedup_ids)
nrow(df2)

# Create a new dataframe df2 which has only the genes which were successfully mapped using the bitr function above
df3 = df2[df2$ENSEMBL %in% dedup_ids$ENSEMBL,] #VVI match and remove like awk
head(df3)
nrow(df3)
nrow(df2)
lostgene <- (nrow(df2)-nrow(df3))

df3$SYMBOL = dedup_ids$SYMBOL
names(df3)[8] <- "ENTREZID"
head(df3)

#set directory and save the file 
setwd("C:/Users/Mursalin/Desktop/SAGD Pub 1/SAGD Data sets_current/GO_Erichment/data for GSEA")
write.csv(df3, "Final_IDs_dmel_nrc_gene_fc_logration_wb_mf.csv", row.names = F)
