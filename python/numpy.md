# Numpy

`import numpy as np`

## Arrays

### Create

#### Array of constants

`np.array([0, 1, 2])`

#### Copy of array

`foo = np.copy(bar)`

#### Array of zeros

`np.zeros(10)`

#### Array or matrix of ones

`np.ones(10)` or `np.ones((3, 3))`

#### Range of values

`np.arange(1, 100)`

#### Linear space

`np.linspace(start=0, stop=41, num=42)`

#### Random sample

`np.random.choice(foo, 10)`

### Transform

#### Add new axis

`array3d = array2d[:,:,newaxis]`

#### Reshape array

`array2d = array1d.reshape((-1, 2))`

#### Flip array

`np.flip(foo, axis=1)`

#### Locate non-zero elements

`np.argwhere(array)`

### Modify

#### Conditional update

`x[x < 42] = 0`

#### Concatenate

`np.concatenate((foo, bar), axis=0)`
