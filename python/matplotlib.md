# Matplotlib

## Import Matplotlib

```python
import matplotlib.pyplot as plt
%matplotlib inline
```

## Configuration

### Title

`plt.title('Title')`

### Axis label

`plt.xlabel('foo')`
or
`plt.ylabel('bar')`

### Figure size

`fig = plt.figure(figsize=(16, 9))`

## Plots

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

# TODO
## stacked barplot
## boxplot
