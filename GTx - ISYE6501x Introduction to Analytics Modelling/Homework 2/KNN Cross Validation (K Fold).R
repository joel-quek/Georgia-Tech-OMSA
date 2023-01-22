library(kknn)

set.seed(1)

training <- data[1:524,] 

head(training)
#---------------------------------------------------------------------------------
# cv.kknn instantiates a K-Fold Cross Val model (instead of a leave one out model)
# kcv refers to "Number of partitions for k-fold cross validation."
# https://search.r-project.org/CRAN/refmans/kknn/html/train.kknn.html
# chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.esann.org/sites/default/files/proceedings/legacy/es2012-62.pdf
model1 <- cv.kknn(R1~A1+A2+A3+A8+A9+A10+A11+A12+A14+A15,data=training,kcv=50) 

model1 <- as.data.frame(model1) 

# model1[,2]

results <- (model1[,2])

for(i in 1:length(results)){results[i]=round(results[i])}

sum(results==training[,11])/nrow(training)
#--------------------------------------------------------------------------------------