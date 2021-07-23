library(rattle)
library(caret)
#USING WINE DATASET
wine
data<-wine
attach(data)
names(data)
dat<-scale(data[-1])
set.seed(1234)
km<-kmeans(dat,iter.max = 2000,3)
km$cluster
sum(km$cluster)
km$size
cm<-confusionMatrix(data$Type,as.factor(km$cluster))
cm


#USING IRIS DATASET
iris
data<-iris
attach(data)
names(data)
set.seed(1234)
km<-kmeans(data[-5],iter.max = 2000,3)
km$cluster
km$size
cm<-table(data$Species,km$cluster)
cm
acc<-sum(diag(cm)/sum(cm))
cat("accuracy",acc)

