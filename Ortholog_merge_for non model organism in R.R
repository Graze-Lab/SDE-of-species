#load necessary library
library(devtools)
library(ggplot2)
library(dplyr)
library(tidyr)


#data loading 
#df1 will be the normalized (gene count/TPM/FPKM) file
df1 <- read.csv(file.choose()) #the Ana SAGD file
head(df1)
nrow(df1)
names(df1)[1] <- "ENSEMBL_DAna" # According to the species name of non-model speices 
names(df1)[2] <- "SYMBOL_DAna" # According to the species name of non-model speices 
#names(df1)[8] <- "log2FoldChange"

#df2 is the ortholog file 
#REF Presenation: How to get all the orthologous genes between two species
# we are using melanogater orhtologs to match with non-model drosophila 

df2 <- read.csv(file.choose()) #ensemble database file 
head(df2)
nrow(df2)
names(df2)[1] <- "ENSEMBL_DAna"
names(df2)[3] <- "ENSEMBL_DMel"
names(df2)[4] <- "SYMBOL_DMel"

#Subsetting to make it clean 
#only selected col we need 
df2 <- subset(df2,select=c(ENSEMBL_DAna,ENSEMBL_DMel,SYMBOL_DMel))

#Only Unique gene in the file Ensemble metazoa file
df2_deduped <- df2[!duplicated(df2[c("ENSEMBL_DAna")]),] #removal of duplication based on col name 

#matched with ensemble metazoa count (13098 / 15546 Ana Genes have 13374/16349 Yak Genes
#homolog with Dmel)

head(df2_deduped)
nrow(df2_deduped) #this number should match with ensemble metazoa count for the non-model species 

#matched based on common name col 
#There sould be one only 
#left_join is a dplyr function

df3 <- left_join(df1,df2_deduped) #matched based on commone name col There sould be one only #dplyr function
head(df3)
nrow(df3)
nrow(df1)
tail(df3)

#just to remove the names based on the col match it will not merge the data frames 
#df4 = df1[df2_deduped$ENSEMBL_DAna %in% df1$ENSEMBL_DAna,]
#head(df4)
#nrow(df3)

#there many Ana genes do not have Dmel orthologs It is better to remove those for futhrer use 
#tidyr has a new function drop_na
#based on col name 
#df5 <- df3 %>% drop_na(ENSEMBL_DMel) # you can use this one as well ONLY ENSEMBL 
#df5 <- df3 %>% drop_na(SYMBOL_DMel) # you can use this one as well ONLY SYMBOL

df5 <- df3 %>% drop_na(ENSEMBL_DMel,SYMBOL_DMel) #both ENSEMBL and SYMBOL
head(df5)
tail(df5)
nrow(df5)
lost_gene <- nrow(df1)-nrow(df5)
lost_gene #how many genes are not getting orthologs in the model organism 

#set directory and save the file 
setwd("C:/Users/Mursalin/Desktop/SAGD Pub 1/SAGD Data sets_current/GO_Erichment/data for GSEA")
write.csv(df5, "Final_ID_dana_with_dmel_Ensemble_Symbol_removed_NA.csv", row.names = F)
#write.csv(df5, "Background_Final_Ana_with_Dmel_Ensemble_Symbol_removed_NA.csv", row.names = F)
