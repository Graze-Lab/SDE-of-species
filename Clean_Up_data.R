#Data cleaning in R Subsetting 


library(gtools)
library(matrixTests)
library(devtools)
library(ggplot2)

df <- read.csv(file.choose())
head(df)
nrow(df)

df1 <- subset(df,select=c(FBgnID,w1118_f_wb_R1:w1118_f_wb_R4,w1118_m_wb_R1:w1118_m_wb_R4))
head(df1)
nrow(df1)

res <- row_t_equalvar(df1[,2:5], df1[,6:9])
head(res)
nrow(res)


temp_df1 <- cbind(df1,res)

df1_Sig <- subset(temp_df1, pvalue <=0.05,
                   select=c(FBgnID,mean.x, mean.y,pvalue,stderr))
head(df1_Sig)

names(df1_Sig)[1] <- "GENEID-ENSEMBL"
names(df1_Sig)[2] <- "mean-nrc.f"
names(df1_Sig)[3] <- "mean-nrc.m"
names(df1_Sig)[4] <- "log1FoldChange"
names(df1_Sig)[5] <- "log1FoldChange"



#foldchange(num,denom)
foldchanges <- foldchange(df1_Sig$`mean-nrc.m`,df1_Sig$`mean-nrc.f`)
#logratio2foldchange(logratio, base=2)
log2MFratio <- foldchange2logratio(foldchanges, base=2)
#foldchange2logratio(foldchange, base=2)


temp_fc <- data.frame(foldchanges)
temp_logRatio <- data.frame(log2MFratio)

clean_data <- cbind(df1_Sig,temp_fc,temp_logRatio)

dmel_nrc_gene_fc_logration_wb_mf <- subset(clean_data, clean_data$`GENEID-ENSEMBL` != "-") 
nrow(clean_data)-nrow(dmel_nrc_gene_fc_logration_wb_mf)

head(dmel_nrc_gene_fc_logration_wb_mf)
nrow(dmel_nrc_gene_fc_logration_wb_mf)

setwd("C:/Users/Mursalin/Desktop/SAGD Pub 1/SAGD Data sets_current/GO_Erichment/data for GSEA")
write.csv(dmel_nrc_gene_fc_logration_wb_mf, "dmel_nrc_gene_fc_logration_wb_mf.csv", row.names = F)
