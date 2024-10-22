import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import os  # Modul untuk memeriksa keberadaan file

# 1. Tentukan jalur file
file_path = 'C:\\Users\\thifa\\Documents\\CPP Perkuliahan\\DataMinning\\diabetes.csv'

# 2. Memeriksa apakah file ada
if not os.path.exists(file_path):
    raise FileNotFoundError(f"File tidak ditemukan: {file_path}")

# 3. Membaca Dataset
data = pd.read_csv(file_path)  # Membaca file CSV
print(data.head())  # Menampilkan 5 baris pertama
print(data.describe())  # Deskripsi statistik
print(data.info())  # Informasi tipe data

# 4. Eksplorasi Data Awal
# Histogram untuk distribusi fitur
data.hist(bins=30, figsize=(15, 10))
plt.show()

# Heatmap untuk melihat korelasi antar fitur
plt.figure(figsize=(10, 8))
sns.heatmap(data.corr(), annot=True, fmt='.2f', cmap='coolwarm')
plt.show()

# 5. Persiapan Data
# Menangani Data yang Hilang
print(data.isnull().sum())  # Mengecek nilai yang hilang
data.fillna(data.mean(), inplace=True)  # Mengisi nilai yang hilang

# 6. Memisahkan Data Menjadi Fitur dan Target
X = data.drop('Outcome', axis=1)  # fitur
y = data['Outcome']  # target

# 7. Pembagian Data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 8. Pelatihan Model
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)

# 9. Evaluasi Kinerja Model
y_pred = model.predict(X_test)

# Menghitung Akurasi
accuracy = accuracy_score(y_test, y_pred)
print(f'Akurasi: {accuracy:.2f}')

# Laporan Klasifikasi
print(classification_report(y_test, y_pred))

# Matriks Kebingungan
cm = confusion_matrix(y_test, y_pred)
plt.figure(figsize=(8, 6))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues')
plt.ylabel('Aktual')
plt.xlabel('Prediksi')
plt.title('Matriks Kebingungan')
plt.show()

# Rekomendasi Berdasarkan Hasil
# Di sini, Anda bisa memberikan analisis dan rekomendasi berdasarkan hasil evaluasi model.
