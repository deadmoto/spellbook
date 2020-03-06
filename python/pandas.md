# Pandas

```python
import pandas as pd
```

## Load data

### From CSV
```python
df = pd.read_csv('iris_training.csv')
```

### From HDF
```python
df = pd.read_hdf('df_train.h5', key='df')
```

### From dataframe
```python
series = df.toPandas()
```

or

```python
percentiles = df['arrival_delay_deciles'].apply(pd.Series)
```

### Merge series
```python
df = pd.concat([df['departure_delay'], percentiles], axis=1)
```

## Explore data

### Describe dataset

`df.desribe(include="all")`

### Show dataset head

`df.head()`

### Show random sample

`df.sample(5)`

### Show dataset tail

`df.tail()`

### Show n smallest

`df.nsmallest(10, 'sepal.length')`

### Show n largest

`df.nlargest(10, 'petal.length')`

### Show missing values

`df.isnull()` or `df.isnull().describe()`

### Show value counts

`df['variety'].value_counts(normalize=True,dropna=True)`

### Show shape
```python
df.shape
```

### Show columns
```python
df.columns
```

### Show first n records
```python
df.head()
```

### Rename columns
```python
percentiles.rename(columns = lambda x : '{0}%'.format(x*10), inplace=True)
```

### Drop columns
```python
df.drop(labels=['0%', '100%'], axis=1, inplace=True)
```

#### Percent changes
`changes = asset_prices.pct_change()`

#### Mean
`mean = asset_returns.mean()`

#### Standard deviation
`std_dev = asset_returns.std()`

#### Rolling average
```python
short_rolling_spx = pd.rolling_mean(spx_index, 20)
long_rolling_spx = pd.rolling_mean(spx_index, 100)
```

#### Access data
```python
csv_data[['col1', 'col2']]
csv_data.iloc[0:1]
```

#### Export data to Python dictionary
`records = csv.to_dict('records')`

# Shuffle data
csv_data = csv_data.sample(frac=1).reset_index(drop=True)

# convert string to datetime:
df['date'] = pd.to_datetime(df['string'], format='%d.%m.%Y')

# convert datetime to string
df['year'] = df['date'].apply(lambda x: x.strftime('%Y'))
df['month'] = df['date'].apply(lambda x: x.strftime('%m'))
df['day'] = df['date'].apply(lambda x: x.strftime('%d'))

## filter rows
`df2 = df[df['year'] == '1999']`

## filter missing values
`df.drop(labels=['0%', '100%'], axis=1, inplace=True)`

# collect distinct values
df['column'].unique()

# group by + sum
grouped = df[['item_id', 'item_count']].groupby('item_id').sum().dropna()

# sort by column
sorted = df.sort_values('column', ascending=False)

# multiply columns
df['total'] = df['item_price'] * df['item_count']

## Indices and values
total_num_items_sold = sales.values
days = sales.index.values

## Plot data
plt.plot(days, total_num_items_sold)
plt.ylabel('Num items')
plt.xlabel('Day')
plt.title("Daily revenue for shop_id = 25")
plt.show()

## Plot values
df.select('Attrition').toPandas().Attrition.value_counts().plot.bar()

## Plot options
pd.set_option('display.max_columns', 35)

