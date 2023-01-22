library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)
#https://www.youtube.com/watch?v=KmYUE7Of5rU
#---------------------------------------------------------------------------------
mydata=select(iris,c(1,2,3,4))

sseplot(mydata)
#--------------------------------------------------------------------------------
cluster_model = kmeans(mydata,2)

autoplot(cluster_model,mydata,frame=TRUE)

cluster_model$centers