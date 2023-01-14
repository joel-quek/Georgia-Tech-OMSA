library(plotly)

# THIS ONE
https://stackoverflow.com/questions/68721086/plotly-how-to-define-marker-color-based-on-category-string-value-for-a-3d-scatt
plot_ly(data_scaled, x = ~A2, y = ~A3, z = ~A8, color=~R1) # color function differentiates 0 and 1 for R1