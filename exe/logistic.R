data<-read.csv(file.choose(),header = TRUE)
sum(is.na(data))
data<-na.omit(data)
sum(is.na(data))
names(data)
attach(data)
set.seed(1)
train_index<-sample(1:nrow(data),0.8*nrow(data))
train<-data[train_index,]
test<-data[-train_index,]
nrow(train)
nrow(test)

mod<-glm(Survived~.,data=train,family=binomial(link='logit'))
mod
pred<-plogis(predict(mod,test,type="response"))
cm<-table(pred,test$Survived)
accuract<-sum(diag(cm)/sum(cm))
cat("accuracy",accuract)
