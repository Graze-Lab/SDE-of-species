#! /usr/bin/env python3

"A script to perform the linear regression and create the plot."
#REF https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html
#REF https://towardsdatascience.com/how-to-export-pandas-dataframe-to-csv-2038e43d9c03

#### Create Dataframe:
import pandas as pd
import numpy as np

# Import data from .csv file

df = pd.read_csv('C.search-immune-defense-dmel-FlyBase_IDs.txt', delimiter = "\t")
#print(df)
df1 = df.drop_duplicates()
df1.to_csv('D.search-immune-defense-unique-dmel.csv', index=False)
