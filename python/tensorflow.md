# TensorFlow

```python
import tensorflow as tf
print(tf.__version__)
```

> Run `!pip install --quiet tensorflow==2.1.0` to install TensorFlow 2

```python
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import concatenate, Dense, DenseFeatures
```

## Model

### Compile

```python
model.compile(
    optimizer='adam',
    loss={'tap': 'binary_crossentropy', 'view_time': 'mse'},
    loss_weights=[1., .2],
    metrics={'tap': ['accuracy'], 'view_time': ['mse']}
)
```

### Build

`model.build(input_shape=(None, len(X_train.iloc[0])))`

### Plot model

`tf.keras.utils.plot_model(model, show_shapes=True)`

## Layers

### Freeze layer

`layer.training = False`

## Regularizers

```
from tensorflow.keras.regularizers import L1, L2, L1L2

model = Sequential([
    Dense(128, activation='relu', kernel_regularizer=L2(0.1)),
    Dense(1, activation='sigmoid'),
])
```
