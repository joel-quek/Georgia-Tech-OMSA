x=list(5,10,15,20,25,30,35,40,45,50,55,60)

y=prediction_percent

plot(x,y, type="l", col="blue", lwd=2, xlab="K Folds Split", ylab="Accuracy", main="KNN Cross Validation (K-Folds) Accuracy Scores")
