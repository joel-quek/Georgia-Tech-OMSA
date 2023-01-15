library(kernlab)
# https://www.isical.ac.in/~arnabc/multi/lecsvm4.html
# http://rstudio-pubs-static.s3.amazonaws.com/282934_5b5d7d0c9b334686ab8f8b9c521f1ec0.html

model <- ksvm(as.matrix(data[,1:10]),as.factor(data[,11]),type="C-svc",kernel="polydot",C=100,scaled=TRUE)

a <- colSums(model@xmatrix[[1]] * model@coef[[1]])
a

a0 <- model@b
a0

pred <- predict(model,data[,1:10])
pred

sum(pred == data[,11]) / nrow(data)

