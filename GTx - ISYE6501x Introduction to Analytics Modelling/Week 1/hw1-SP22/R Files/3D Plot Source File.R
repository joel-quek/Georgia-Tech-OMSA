library(plotly)
plot_ly(z = ~xtabs(A2 ~ A3 + A8, data = card_data)) %>% add_surface()


# https://stackoverflow.com/questions/60369552/how-do-i-create-a-3d-surface-plot-in-r-if-i-have-a-dataframe-of-3-columns

# https://plotly.com/python/3d-scatter-plots/

# http://www.sthda.com/english/wiki/ggplot2-scatterplot-easy-scatter-plot-using-ggplot2-and-r-statistical-software

library(devtools)

library(easyGgplot2)

ggplot2.scatterplot(data=data, xName='A2',yName='A8',
                        +                     groupName="R1")
View(credit_card_data.headers)

ggplot2.scatterplot(data=data, xName='A3',yName='A8',
                      +                     groupName="R1")
ggplot2.scatterplot(data=data, xName='A3',yName='A2',groupName="R1")
ggplot2.scatterplot(data=data, xName='A14',yName='A2',groupName="R1")
ggplot2.scatterplot(data=data, xName='A15',yName='A2',groupName="R1")
ggplot2.scatterplot(data=data, xName='A15',yName='A3',groupName="R1")
ggplot2.scatterplot(data=data, xName='A15',yName='A8',groupName="R1")
ggplot2.scatterplot(data=data, xName='A15',yName='A14',groupName="R1")