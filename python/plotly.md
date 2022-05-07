# Plotly

## Figure

### Contour

```jupyterpython
import numpy as np
import plotly.graph_objects as go

x = np.linspace(0, 1, 10)
y = np.linspace(0, 1, 10)
xx, yy = np.meshgrid(x, y)
z = xx**2 + yy**3

fig = go.Figure(data =
    go.Contour(
        z=z,
        x=x,
        y=y,
        colorscale='Hot',
    ),
    layout=go.Layout(
        title={'text': 'Title', 'x': .5},
        xaxis={'title': 'X axis'},
        yaxis={'title': 'Y axis'},
        width=480,
        height=480,
    )
)
fig.show()
```
