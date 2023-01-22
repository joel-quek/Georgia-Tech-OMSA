# WSS Stands for "Within Sums of Squares"
sseplot<-function(data,nc=15,seed=1)
{
  sse<-(nrow(data)-1)*sum(apply(data,2,var))
  for(i in 2:nc){
    set.seed(seed)
    sse[i]<-sum(kmeans(data,centers=i)$withinss)}
  plot(1:nc,sse,type="l", col="blue", xlab="Number of Clusters",
       ylab="SSE")
}

