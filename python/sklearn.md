# Scikit-learn

## Feature processing

### StandardScaler

```python
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
```

### Polynomial features

```python
from sklearn.preprocessing import PolynomialFeatures

poly = PolynomialFeatures(degree=2)
X = poly.fit_transform(X)
```

### Scale into range [-1, 1]

```python
from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler((-1, 1))
prediction_normalized = scaler.fit_transform(prediction)
```

## Test-train split

```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.2, random_state=42)
```

## Model type

### LogisticRegression

```python
from sklearn.linear_model import LogisticRegression

model = LogisticRegression()
model.fit(X_train, y_train)
model.score(X_test, y_test)
```

### KNeighborsClassifier

```python
from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train, y_train)
knn.score(X_test, y_test)
```

### DecisionTreeClassifier

```python
from sklearn.tree import DecisionTreeClassifier

tree = DecisionTreeClassifier(
    max_depth=5,
    min_samples_split=50,
    min_weight_fraction_leaf=0.01,
    min_impurity_split=0.1,
    class_weight='balanced'
)
tree.fit(X_train, y_train)
tree.score(X_test, y_test)
```

### SVC (Support Vector Classifier)

```python
from sklearn.svm import SVC

svc = SVC(kernel='linear', C=0.025)
svc.fit(X_train, y_train)
svc.score(X_test, y_test)
```

### RandomForestClassifier

```python
from sklearn.ensemble import RandomForestClassifier

clf = RandomForestClassifier(
    n_estimators=1000,
    max_depth=5,
    max_features=0.5,
    random_state=42
)
```

### PCA

```python
from sklearn.decomposition import PCA

pca = PCA()
pca.fit(cov_matrix)
```

### t-NSE

```python
from sklearn.manifold import TSNE

tnse = TSNE(
    n_components=2,
    perplexity=50,
    n_iter=300,
    random_state=42
)
tsne_results = tnse.fit(log_ret_df_std[stock_tickers])
```

### TBD
from sklearn.metrics import jaccard_similarity_score
from sklearn.metrics import f1_score
from sklearn.metrics import log_loss
