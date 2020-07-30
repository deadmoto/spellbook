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

## Layers

### Freeze layer

`layer.training = False`
