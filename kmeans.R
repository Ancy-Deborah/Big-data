
stud <-read.csv(file.choose(),header = TRUE)

## Loading required package: Rcpp
#STEP2:DATA PREPROCESSING
stud<-na.omit(stud)
stud$class[stud$G3>=10]<-'PASS'
stud$class[stud$G3<10]<-'FAIL'
attach(stud)

stud<-stud[c(1:17,24,34)]
as.factor(stud)
stud<-na.omit(stud)

#CONVERTIG TO NUMERIC
stud$school<-as.numeric(stud$school)
stud$address<-as.numeric(stud$address)
stud$sex<-as.numeric(stud$sex)
stud$famsize<-as.numeric(stud$famsize)
stud$Pstatus<-as.numeric(stud$Pstatus)
stud$Mjob<-as.numeric(stud$Mjob)
stud$Fjob<-as.numeric(stud$Fjob)
stud$reason<-as.numeric(stud$reason)
stud$guardian<-as.numeric(stud$guardian)
stud$schoolsup<-as.numeric(stud$schoolsup)
stud$famsup<-as.numeric(stud$famsup)

stud<-stud[1:18]
head(stud,n=6)

wssplot(stud)

#install.packages("stats")
library(dplyr)
library(stats)
library(ggplot2)
library(ggfortify)


#Compute k-means with k = 2
set.seed(123)
km.res <- kmeans(stud, 2, nstart = 25)
km.res$size
pred<-km.res$cluster
table(pred,stud$class)

