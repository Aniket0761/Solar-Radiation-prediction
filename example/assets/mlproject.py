import numpy as np
import pandas as pd
import ssl

ssl._create_default_https_context = ssl._create_unverified_context
dataset = pd.read_csv('https://www1.ncdc.noaa.gov/pub/data/cdo/samples/PRECIP_HLY_sample_csv.csv')
dataset.head()
dataset_new = dataset.dropna()
dataset_new.head()
X = dataset_new['HPCP'].values
# Y = dataset_new['y'].values
x_mean = np.mean(X)
# y_mean = np.mean(Y)
n = len(X)
print(n)