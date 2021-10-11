# Matplotlib

```python
import matplotlib.pyplot as plt
%matplotlib inline
```

## Configuration

### Title

`plt.title('foo')` or `ax.set_title('bar')`

### Axis label

`plt.xlabel('foo')` or `plt.ylabel('bar')`

### Integer X axis

```python
from matplotlib.ticker import MaxNLocator

ax.xaxis.set_major_locator(MaxNLocator(integer=True))
```

### Figure size

`fig = plt.figure(figsize=(16, 9))`

## Plots

### Subplot

`ax = fig.add_subplot()`

### Line plot

`plt.plot(x=foo, y=bar)`

### Bar plot

```python
plt.bar(x=range(0, 42), height=range(0, 42), width=1)
plt.show()
```

### Box plot

```python
plt.boxplot(x=range(0, 42), data=range(0, 42))
plt.show()
```

### Scatter plot

```python
ax = fig.add_subplot(1, 2, 1, projection='3d')
ax.scatter(X, Y, Z)
```

### Correlation matrix

```python
corr = df.corr()
plt.matshow(corr)
```

### Legend location

```python
plt.legend(loc='lower left')
```

## Images

### Load image from file

```python
import matplotlib.image as mpimg
img = mpimg.imread('image.png')
```

### Display image

`plt.imshow(img, cmap=format)`

## Shapes

### Circle

```python
circle = plt.Circle((0.5, 0.5), 0.1, color='r')
figure = plt.gcf()
axis = figure.gca()
axis.add_artist(circle)
```
