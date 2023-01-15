library(kernlab)
# https://www.isical.ac.in/~arnabc/multi/lecsvm4.html

model <- ksvm(as.matrix(data[,1:10]),as.factor(data[,11]),type="C-svc",kernel="vanilladot",C=100,scaled=TRUE)

a <- colSums(model@xmatrix[[1]] * model@coef[[1]])
a

a0 <- model@b
a0

pred <- predict(model,data[,1:10])
pred

sum(pred == data[,11]) / nrow(data)

