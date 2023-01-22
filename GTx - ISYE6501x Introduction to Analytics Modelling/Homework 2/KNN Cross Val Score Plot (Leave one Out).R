x=list(1:30)

y=accuracy_score

plot(x[[1]],y, type="l", col="blue", lwd=2, xlab="K Value", ylab="Accuracy", main="KNN Cross Validation Accuracy Scores")

# x[[1]] is used because x is a list of a list. 