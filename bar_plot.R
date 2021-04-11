library(dplyr)
library(ggplot2)
#one bar graph per gene. 
#Some sort of expression(?) on the y. 
#X axis will be the 8 different species, so you can see how the gene expression(?) changes across species

#data for all genes and 2 species (until we get final file):
data <- read.csv("C:/Users/kfinc/Documents/Documents/Graze Lab/SDE_Oliver_data/Sample_clean_file.csv")

#to get an idea for code, filter down to just 1 gene so we can make a practice bar graph
sample <- data[1,]

ggplot(sample, aes(x=as.factor(cyl), fill=as.factor(cyl) )) + 
  geom_bar( ) +
  scale_fill_brewer(palette = "Set1") +
  theme(legend.position="none")
