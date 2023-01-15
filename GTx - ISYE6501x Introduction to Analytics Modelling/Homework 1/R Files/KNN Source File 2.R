# https://www.youtube.com/watch?v=htnZp__02qw
data <- data_scaled

row_labels=data[,11]

set.seed(123)

size<-floor(0.8*nrow(data))

train_ind<-sample(seq_len(nrow(data)),size=size)

train_labels<-data[train_ind,11]

test_labels<-row_labels[-train_ind]

data_train<-data[train_ind,1:10]

data_test<-data[-train_ind,1:10]

library(class)

predictions<-knn(train=data_train,
                 test=data_test,
                 cl=train_labels,
                 k=round(sqrt(nrow(data_train))))

sum(predictions==data[-train_ind,11])/nrow(data_test)
#---------------------------------------------------------------
knn_prediction<-c()

for(i in 1:length(k_list)){
  predictions<-knn(train=data_train,
                   test=data_test,
                   cl=train_labels,
                   k=i)
  knn_prediction[i]<-sum(predictions==data[-train_ind,11])/nrow(data_test)
} 

do.call(rbind, Map(data.frame, K=k_list, knn_prediction=knn_prediction))
