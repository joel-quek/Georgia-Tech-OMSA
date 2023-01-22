library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

#---------------------------------------------------------------------------------
mydata=select(iris,c(1,2,3,4))

sseplot(mydata)
#--------------------------------------------------------------------------------
cluster_model = kmeans(mydata,2)

autoplot(cluster_model,mydata,frame=TRUE)

cluster_model$centers