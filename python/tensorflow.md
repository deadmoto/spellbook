# TensorFlow

```python
import tensorflow as tf
print(tf.__version__)
```

> Run `!pip install --quiet tensorflow==2.0.0` to instal TensorFlow 2

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
