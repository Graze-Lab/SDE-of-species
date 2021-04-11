#! /usr/bin/env python3

"A script to perform the linear regression and create the plot."
#REF https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html
#REF https://towardsdatascience.com/how-to-export-pandas-dataframe-to-csv-2038e43d9c03

#### Create Dataframe:
import pandas as pd
import numpy as np

# Import data from .csv file

df1 = pd.read_csv('D.search-immune-defense-unique-dmel.csv', delimiter = ",")
df2 = pd.read_csv('Final_IDs_dmel_nrc_gene_fc_logration_wb_mf.csv', delimiter = ",")

#print(df)
match=df2.columns.intersection(df1.columns).tolist() #finds matching cols in both df
df3 = df2.merge(df1,on=match).reindex(df2.columns,axis=1) #merge and reindex to df2.columns
df3.to_csv('E.Final-IDs-dmel-immune-defense.csv', index=False)
