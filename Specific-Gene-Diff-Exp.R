#Sex-dimorphic Gene Expression of a specific gene across Species 

#load necessary library
library(dplyr)
library(devtools)
library(ggplot2)


#Prepare Input data
df_model <- read.csv(file.choose()) # choose the data for model organism
head(df_model) #check
nrow(df_model) #check


df_non_model <- read.csv(file.choose()) # choose the data for non-model organism
head(df_non_model) #check
nrow(df_non_model) #check


#Selecting the rows for the specific gene 

df_model_Gene <- subset(df_model, SYMBOL == "Gs1",
                  select=c(mean.nrc.f,mean.nrc.m))

head(df_model_Gene) #check

df_non_model_Gene <- subset(df_non_model, SYMBOL_DMel == "Gs1",
                   select=c(mean.nrc.f,mean.nrc.m))

head(df_non_model_Gene) #check



#Create data frames

#model organisms 
df3_model_Gene <- data.frame(
  NRC = c(df_model_Gene$mean.nrc.m),
  Species = c("D. melanogater"),
  Sex = c("M")
)

df4_model_Gene <- data.frame(
  NRC = c(df_model_Gene$mean.nrc.f),
  Species = c("D. melanogater"),
  Sex = c("F")
)

#non-model organism 
df3_non_model_Gene <- data.frame(
  NRC = c(df_non_model_Gene$mean.nrc.m),
  Species = c("D. ananassae"),
  Sex = c("M")
)

df4_non_model_Gene <- data.frame(
  NRC = c(df_non_model_Gene$mean.nrc.f),
  Species = c("D. ananassae"),
  Sex = c("F")
)


#merge the data frame 

df_mel <- bind_rows(df3_model_Gene,df4_model_Gene)
df_ana <- bind_rows(df3_non_model_Gene,df4_non_model_Gene)
df_for_plot <- bind_rows(df_mel,df_ana)

#Change the header 

names(df_for_plot)[1] <- "Read_Counts"
names(df_for_plot)[2] <- "Species"
names(df_for_plot)[3] <- "Sex"

#Create plots

p <- ggplot(data=df_for_plot, aes(x=Species, y=Read_Counts, fill=Sex, label=Read_Counts)) +
  geom_bar(stat="identity") +
  geom_text(size = 3.0, position = position_stack(vjust = 0.5))+
  scale_fill_manual(values = c("firebrick","dodgerblue4"))
p1 <- p + theme(axis.text.x = element_text(angle = 0))

#Visualize the plot 
p1

