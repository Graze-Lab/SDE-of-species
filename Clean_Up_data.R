#Data cleaning and calculate foldchanges 

#load necessary library
library(gtools)
library(matrixTests)
library(devtools)
library(ggplot2)

#Prepare Input data

df <- read.csv(file.choose()) # choose the data file 
head(df) #check
nrow(df) #check

#Subsetting the data based on the sample/tissue 
# For example, we are using only wb=whole body data

df1 <- subset(df,select=c(FBgnID,dana_f_wb_R1:dana_f_wb_R4,dana_m_wb_R1:dana_m_wb_R4)) #FBgnID = ENSEMBL ID =STABLE gene ID
head(df1)
nrow(df1)

#Perform ttest based on rows. Example 2,3,4,5=Control and 6,7,8,9=Treatment 
res <- row_t_equalvar(df1[,2:5], df1[,6:9])
head(res) #check
nrow(res) #check

#Create a temporary file to bind main data and results
#nrow(res) and nrow(df) should match

temp_df1 <- cbind(df1,res)

#Select only the significant genes p<0.05, average(mean) normalized gene counts(control and treatment), 
df1_Sig <- subset(temp_df1, pvalue <=0.05,
                   select=c(FBgnID,mean.x, mean.y,pvalue,stderr))

head(df1_Sig)

#rename the headers 
#to make your downstream works easu 
names(df1_Sig)[1] <- "GENEID-ENSEMBL"
names(df1_Sig)[2] <- "mean-nrc.f"
names(df1_Sig)[3] <- "mean-nrc.m"
#names(df1_Sig)[4] <- "log1FoldChange"
#names(df1_Sig)[5] <- "log1FoldChange"


#calculate fold change and log2foldchange for significantly Expressed genes 

#foldchange(num,denom)
foldchanges <- foldchange(df1_Sig$`mean-nrc.m`,df1_Sig$`mean-nrc.f`) #function of gtools
#logratio2foldchange(logratio, base=2)
log2FoldChangeMF <- foldchange2logratio(foldchanges, base=2) #function of gtools
#foldchange2logratio(foldchange, base=2)


#create data fram from the matrix to merger the fold change and log2foldchange

temp_fc <- data.frame(foldchanges)
temp_logRatio <- data.frame(log2FoldChangeMF)

clean_data <- cbind(df1_Sig,temp_fc,temp_logRatio) #merge fold change and log2foldchange

#Remove the missing values 
# This is necessary for Yang et al. 2018 as they have a new Reannotation 
#YO annotation is not found in all Ensenble annotation 

dmel_nrc_gene_fc_logration_wb_mf <- subset(clean_data, clean_data$`GENEID-ENSEMBL` != "-") #remove all missing -
nrow(clean_data)-nrow(dmel_nrc_gene_fc_logration_wb_mf) #count how many removed YO-FB #see Yang et al. 2018

head(dmel_nrc_gene_fc_logration_wb_mf)
nrow(dmel_nrc_gene_fc_logration_wb_mf)

#set directory and save the file 
setwd("C:/Users/Mursalin/Desktop/SAGD Pub 1/SAGD Data sets_current/GO_Erichment/data for GSEA")
write.csv(dmel_nrc_gene_fc_logration_wb_mf, "dana_nrc_gene_fc_logration_wb_mf.csv", row.names = F)


