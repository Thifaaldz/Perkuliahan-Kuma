# 1. Import library yang diperlukan
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, classification_report
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
from sklearn.linear_model import LogisticRegression

# 2. Membuat dataset
data = {'Age': [25, 45, 35, 50, 23, 60, 33, 41, 52, 26],
        'Income': [40, 85, 60, 120, 30, 100, 50, 90, 75, 42],
        'Loan Amount': [5, 15, 7, 20, 4, 22, 9, 12, 16, 6],
        'Loan Purpose': ['Debt Consolidation', 'Credit Card', 'Home Improvement', 'Debt Consolidation', 'Credit Card', 
                         'Home Improvement', 'Credit Card', 'Debt Consolidation', 'Home Improvement', 'Credit Card'],
        'Credit Score': [650, 700, 600, 750, 680, 710, 640, 690, 720, 675],
        'Loan Term': [36, 60, 36, 60, 36, 60, 36, 60, 36, 36],
        'Employment Length': [2, 10, 5, 15, 3, 12, 6, 9, 14, 4],
        'Default': [0, 1, 0, 0, 1, 0, 0, 1, 0, 1]}

df = pd.DataFrame(data)

# 3. Exploratory Data Analysis (EDA)
# Visualisasi distribusi variabel numerik dan target
plt.figure(figsize=(10, 6))
df[['Age', 'Income', 'Credit Score']].hist(bins=20, figsize=(10, 8))
plt.show()

plt.figure(figsize=(6, 4))
sns.countplot(df['Default'])
plt.title('Distribusi Status Default')
plt.show()

# 4. Feature Engineering
# One-Hot Encoding untuk Loan Purpose
df = pd.get_dummies(df, columns=['Loan Purpose'], drop_first=True)

# Label Encoding untuk Loan Term
label_encoder = LabelEncoder()
df['Loan Term'] = label_encoder.fit_transform(df['Loan Term'])

# Tangani missing values di kolom Employment Length dengan median (meskipun tidak ada missing values di sini)
df['Employment Length'].fillna(df['Employment Length'].median(), inplace=True)

# Cek data setelah feature engineering
print(df.head())

# 5. Data Splitting
# Pisahkan data menjadi fitur dan target
X = df.drop(columns=['Default'])
y = df['Default']

# Split data menjadi training dan testing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

print("Data latih:", X_train.shape)
print("Data uji:", X_test.shape)

# 6. Modeling dengan Logistic Regression, Random Forest, dan Gradient Boosting

# Logistic Regression
log_reg = LogisticRegression()
log_reg.fit(X_train, y_train)
y_pred_log_reg = log_reg.predict(X_test)

# Evaluasi Logistic Regression
print("Logistic Regression")
print(classification_report(y_test, y_pred_log_reg))

# Random Forest
rf = RandomForestClassifier(random_state=42)
rf.fit(X_train, y_train)
y_pred_rf = rf.predict(X_test)

# Evaluasi Random Forest
print("Random Forest")
print(classification_report(y_test, y_pred_rf))

# Gradient Boosting
gb = GradientBoostingClassifier(random_state=42)
gb.fit(X_train, y_train)
y_pred_gb = gb.predict(X_test)

# Evaluasi Gradient Boosting
print("Gradient Boosting")
print(classification_report(y_test, y_pred_gb))

# 7. Hyperparameter Tuning untuk Random Forest dengan GridSearchCV
param_grid = {
    'n_estimators': [50, 100, 200],
    'max_depth': [None, 10, 20, 30],
    'min_samples_split': [2, 5, 10]
}

grid_search = GridSearchCV(RandomForestClassifier(random_state=42), param_grid, cv=3, scoring='accuracy')
grid_search.fit(X_train, y_train)

# Model terbaik Random Forest setelah tuning
print("Best parameters for Random Forest: ", grid_search.best_params_)
best_rf = grid_search.best_estimator_

# Evaluasi Random Forest setelah hyperparameter tuning
y_pred_best_rf = best_rf.predict(X_test)
print("Random Forest with Hyperparameter Tuning")
print(classification_report(y_test, y_pred_best_rf))

# 8. Feature Importance dari model Random Forest terbaik
importances = best_rf.feature_importances_
indices = np.argsort(importances)[::-1]

# Tampilkan ranking fitur
print("\nFeature Importance dari Random Forest:")
for i in range(X.shape[1]):
    print(f"{X.columns[indices[i]]}: {importances[indices[i]]}")

# Plot fitur terpenting
plt.figure(figsize=(10, 6))
sns.barplot(x=importances[indices], y=X.columns[indices])
plt.title('Feature Importance dari Random Forest')
plt.show()

# 9. Model Evaluation & Comparison
# Bandingkan performa model berdasarkan accuracy, precision, recall, dan F1-score

print("Evaluasi Akhir Model")
print("Logistic Regression Accuracy:", accuracy_score(y_test, y_pred_log_reg))
print("Random Forest Accuracy:", accuracy_score(y_test, y_pred_rf))
print("Gradient Boosting Accuracy:", accuracy_score(y_test, y_pred_gb))
print("Random Forest (Tuned) Accuracy:", accuracy_score(y_test, y_pred_best_rf))
