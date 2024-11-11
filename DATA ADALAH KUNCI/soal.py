# 1. Import library yang diperlukan
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.cluster import KMeans

# 2. Membuat data pelanggan
data = {'Age': [23, 45, 31, 22, 35, 40, 25, 50, 30, 28],
        'Annual Income': [15, 80, 60, 40, 70, 90, 20, 85, 75, 55],
        'Spending Score': [39, 81, 6, 77, 40, 56, 35, 95, 60, 29]}

df = pd.DataFrame(data)

X = df[['Annual Income', 'Spending Score']]

kmeans = KMeans(n_clusters=3, random_state=42)
df['Cluster'] = kmeans.fit_predict(X)

print(df)


plt.figure(figsize=(8, 6))
sns.scatterplot(x='Annual Income', y='Spending Score', hue='Cluster', data=df, palette='Set1', s=100)
plt.title('K-Means Clustering of Customers')
plt.xlabel('Annual Income (k$)')
plt.ylabel('Spending Score (1-100)')
plt.show()
