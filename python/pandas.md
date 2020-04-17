# Pandas

`import pandas as pd`

or

`import modin.pandas as pd`

## Load data

### From constant

```
df = pd.DataFrame({
    'foo': [0],
    'bar': [42],
})
```

### From CSV

`df = pd.read_csv('iris_training.csv')`

### From HDF

`df = pd.read_hdf('df_train.h5', key='df')`

### Merge data sets

### Merge rows

`df = pd.concat([df_train, df_test], axis=0).reset_index(drop=True)`

### Merge columns
`df = pd.concat([df['foo'], df['bar']], axis=1)`

### Rename column

`df.rename(columns = {'foo': 'bar'}, inplace=True)`

### Drop column

`df.drop(labels=['foo', 'bar'], axis=1, inplace=True)`

## Explore data

### Data types

`df.info()`

### Show dataset head

`df.head()`

### Describe dataset

`df.desribe(include="all")`

### Quantiles

`df.quantile([0.1, 0.5 ,0.95, 0.9, 0.99])`

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

### Show histogram

`df['label'].plot.hist(bins=10, alpha=0.5)`

### Show shape

`df.shape`

### Show columns

`df.columns`

### Show first n records

`df.head()`

### Show whole dataset

`df`
> NOTE: Set option `pd.set_option('max_colwidth', -1)` if content is cropped

## Filter data

### Filter exact matches

`df[df.foo == 'bar']`
or
`df[df.foo.isin(['bar'])`

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

