import numpy as np
import pandas as pd
import ssl

ssl._create_default_https_context = ssl._create_unverified_context
dataset = pd.read_csv('https://raw.githubusercontent.com/Aniket0761/Solar-Radiation-prediction/main/example/assets/Dataset.csv')
dataset.head()
dataset_new = dataset.dropna()
dataset_new.head()
X = dataset_new['x'].values
# Y = dataset_new['y'].values
x_mean = np.mean(X)
# y_mean = np.mean(Y)
n = len(X)
print(n)