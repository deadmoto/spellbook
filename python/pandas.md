# Pandas

`import pandas as pd`

or

`import modin.pandas as pd`

## Load

### From constant

`df = pd.DataFrame({'foo': [0], 'bar': [42]})`
or
`df = pd.DataFrame([[0, 42]], columns=['foo', 'bar'])`

### From CSV

`df = pd.read_csv('data.csv', names=['foo', 'bar'])`

### From HDF

`df = pd.read_hdf('df_train.h5', key='df')`

### From BigQuery

```python
import pandas as pd

df = pd.io.gbq.read_gbq(f'''
  SELECT * FROM foo
''', project_id='bar')
```

### Copy

`df2 = df.copy(deep=True)`

## Save

### CSV

`df.to_csv('foo.csv', header=True, index=False)`

### Excel

`df.to_excel('foo.xls')`

## Manipulate

### Index

`df = df.set_index('foo')`

### Join rows

`df = pd.concat([df_hi, df_lo], axis=0).reset_index(drop=True)`

### Join columns

`df = pd.concat([df['foo'], df['bar']], axis=1)`

### Join columns (multi-index)

`df = pd.concat([df_left, df_right], axis=1, keys=['left', 'right'], join='outer')`

### Melt

`df = df.melt(id_vars=['foo'])`

### Pivot

`df.pivot_table(index=['foo','bar'])`

### Rename column

`df.rename(columns = {'foo': 'bar'}, inplace=True)`

### Drop column

`df.drop(labels=['foo', 'bar'], axis=1, inplace=True)`

### Replace value

`df.foo = df.foo.replace(24, 42)`

### Sort by column

`df.sort_values('foo', ascending=True)`

### Sort by multiple columns

`df.sort_values(by = ['foo', 'bar'], ascending = [True, False], na_position = 'first')`

### Shuffle data

`df = df.sample(frac=1).reset_index(drop=True)`

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
`df[df.foo.eq('bar')]`
or
`df[df.foo.isin(['bar'])`
or
`df[df['foo'].isna()]`

### Filter substring matches

`df[df.foo.str.contains('bar'')]`

### Distinct

`values = df['foo'].unique()`

## Aggregate

### Percent changes

`changes = asset_prices.pct_change()`

### Mean

`mean = df.mean()`

### Standard deviation

`std_dev = asset_returns.std()`

### Rolling average

```python
short_rolling_spx = pd.rolling_mean(spx_index, 20)
long_rolling_spx = pd.rolling_mean(spx_index, 100)
```

### Bins

`pd.cut(df.foo, bins=2)`
or
`pd.cut(df.foo, bins=[0, 24, 42], labels=['foo', 'bar'])`

### Group By

`foo_mean = df.groupby(by='foo').mean()`
or
`foo_mean = df.groupby(['foo'], as_index=True).agg({'bar': 'mean'})`

### Value count

`values = df['foo'].value_counts()`

## Transform

### Fill missing values

`df.fillna('foo', inline=True)`

### Apply function

`df['foo'] = df['bar'].apply(lambda x: f(x))` for individual values
or
`df['foo'] = df['bar'].apply(lambda x: f(x)), axis=1` for complete rows

## Access data

### Index

`df.iloc[cols]`
or
`df.iloc[rows, cols]`

### Values

`df.loc[:, ['foo', 'bar']]`
> NOTE: `loc` is the preferred way to update values based on a filter

### Dictionaries

`records = df.to_dict(orient='records')`

### Iterate

```python
for idx, row in df.iterrows():
    print(idx, row)
```    

### convert string to datetime:
df['date'] = pd.to_datetime(df['string'], format='%d.%m.%Y')

### convert datetime to string
df['year'] = df['date'].apply(lambda x: x.strftime('%Y'))
df['month'] = df['date'].apply(lambda x: x.strftime('%m'))
df['day'] = df['date'].apply(lambda x: x.strftime('%d'))

### filter missing values
`df.drop(labels=['0%', '100%'], axis=1, inplace=True)`

### group by + sum
grouped = df[['item_id', 'item_count']].groupby('item_id').sum().dropna()

### sort by column
sorted = df.sort_values('column', ascending=False)

### multiply columns
df['total'] = df['item_price'] * df['item_count']

### Indices and values
total_num_items_sold = sales.values
days = sales.index.values

## Plot data
plt.plot(days, total_num_items_sold)
plt.ylabel('Num items')
plt.xlabel('Day')
plt.title("Daily revenue for shop_id = 25")
plt.show()

### Plot values

`df['foo'].value_counts().plot.bar()`

## Rendering options

### Maximum rows

`pd.set_option('display.max_rows', 42)`

### Maximum columns

`pd.set_option('display.max_columns', 35)`
    
### Align text

`df.style.set_properties(**{'text-align': 'left'})`
