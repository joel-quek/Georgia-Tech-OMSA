library(kknn)

set.seed(1)

training <- data[1:524,] 
#-------------------------------------------------------------------
split_list <- list(5,10,15,20,25,30,35,40,45,50,55,60) # creating the splits
#-------------------------------------------------------------------
prediction_percent <- c() # empty list/vector
#-------------------------------------------------------------------
for(i in seq_along(split_list)){ #seq_along() is a function that creates a vector that contains a sequence of numbers from 1 to the length of the object.
  c<-split_list[[i]]
  
  model1 <- cv.kknn(R1~A1+A2+A3+A8+A9+A10+A11+A12+A14+A15,data=training,kcv=c) # K-fold cross val
  
  model1 <- as.data.frame(model1) 
  
  results <- (model1[,2])
  
  for(j in 1:length(results)){results[j]=round(results[j])}
  
  prediction_percent[i]<-sum(results==training[,11])/nrow(training)
}
# ---------------------------------------------------------------------------------------------
# The code below puts all the accuracy scores in a table
do.call(rbind, Map(data.frame, K_Split=split_list, Accuracy=prediction_percent))
# ---------------------------------------------------------------------------------------------