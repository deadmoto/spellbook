# Keras

## Import

```python
from keras.models import Sequential
from keras.layers import Conv2D, Dense, Dropout, Flatten, MaxPooling2D, SpatialDropout2D
from keras.optimizers import Adam
```

## Models

### Sequential

`model = Sequential()`

### Fit model

```python
model.compile(Adam(), loss='categorical_crossentropy', metrics=['accuracy'])
model.fit(x_train, y_train)
score = model.evaluate(x_test, y_test)
```

## Plot model

`tf.keras.utils.plot_model(model, show_shapes=True)`

## Layers

### Convolution

`model.add(Conv2D(filters=32, kernel_size=(5, 5), strides=(1, 1), activation='relu', input_shape=(42, 42)))`

### Dense

`model.add(Dense(512, input_shape=(32,), activation='relu'))`
or
`model.add(Dense(10, activation='softmax'))`
or
`model.add(Dense(1, activation='sigmoid'))`

### Dropout

`model.add(Dropout(0.5))`

### Dropout 2D

`model.add(SpatialDropout2D(0.25))`
> Useful for image filters

## Features

### One hot encoding

`y_train, y_test = map(keras.utils.np_utils.to_categorical, [y_train, y_test])`
