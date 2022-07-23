# Plotly

## Figure

### Line

```jupyterpython
import plotly.express as px

df = df.melt(
    id_vars=['foo', 'bar'],
    value_vars=['num', 'pct'],
)
px.line(
    df,
    x='foo',
    y='value',
    color='bar',
    facet_col='variable',
    facet_col_wrap=2,
    width=1080,
    height=480,
)

```

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

### Traces

```jupyterpython
fig.update_traces(
    textposition='auto',
    textinfo='value+percent total+percent previous',
)
```

## Subplots

```jupyterpython
import plotly.graph_objects as go
from plotly.subplots import make_subplots

fig = make_subplots(rows=1, cols=2, specs=[[{'type': 'domain'}, {'type': 'domain'}]])
fig.add_trace(
    go.Pie(
        labels=df.foo,
        values=df.bar,
        title={'text': 'Lorem ipsum', 'position': 'bottom center'},
        pull=[0.1, 0],
    ), 1, 1
)
fig.add_trace(
    go.Pie(
        labels=df.foo,
        values=df.bar,
        title={'text': 'Dolor sit amet', 'position': 'bottom center'},
        pull=[0.1, 0],
    ), 1, 2
)
fig.update_layout(
    width=720,
    height=480,
)
fig.show()
```
