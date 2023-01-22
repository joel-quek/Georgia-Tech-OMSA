# KNN Leave one Out Cross Validation
library(kknn)
# KKNN Documentation
## documentation for KKNN can be found at 
## https://www.rdocumentation.org/packages/kknn/versions/1.3.1/topics/train.kknn
#-------------------------------------------------------------------------------
# Open the credit_card_data.header dataset and scale it 
# data_scaled[1:10] <- as.data.frame(scale(data[1:10]))
head(data)
#-------------------------------------------------------------------------------
# Choose any seed for the cross-validation choices
set.seed(1)
#-------------------------------------------------------------------------------
# The KKNN Model 
# Set K Max to be 30
model<-train.kknn(R1~.,data,kmax=30,scale=TRUE)

#instantiate a blank accuracy score list for imputing of accuracy values
accuracy_score<-rep(0,30) # 30 is based on the kmax value

for (k in 1:30){
     predicted<-as.integer(fitted(model)[[k]][1:nrow(data)]+0.5) 
     accuracy_score[k]<-sum(predicted==data$R1)/nrow(data)
}
# +0.5 is to allow the as.integer function to round to either 0 or 1 
# https://www.educative.io/answers/what-is-the-asinteger-function-in-r
accuracy_score