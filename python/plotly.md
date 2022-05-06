# Plotly

## Figure

### Contour

```jupyterpython
import plotly.graph_objects as go

x = np.linspace(0, 1, 10)
y = np.linspace(0, 1, 10)
xx, yy = np.meshgrid(x, y)
z = xx**2 + yy**3

fig = go.Figure(data =
    go.Contour(
        z=z,
        colorscale='Hot',
        x=x,
        y=y,
    ))
fig.update_layout(
    width=480,
    height=480,
)
fig.show()
```
