library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)
#https://www.youtube.com/watch?v=KmYUE7Of5rU
#---------------------------------------------------------------------------------
mydata=select(iris,c(1,2,3,4))

wssplot(mydata)
#--------------------------------------------------------------------------------
KM = kmeans(mydata,2)

autoplot(KM,mydata,frame=TRUE)

KM$centers