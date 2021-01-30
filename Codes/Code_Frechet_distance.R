#Calculate Frechet distance between 2 partial probability plots.
#Load library and set directory
library(randomForest)
library(rfUtilities)
library(longitudinalData)	
#Other required packages if not loaded automatically (clv, cluster, class, rgl, misc3d)
setwd("F:/Siddhart_BookChapter_Springer/Codes_RF")

#To load train Data
C26_Train_Data <- read.csv('TrainingData_C.csv')
C26_Train_Data$Class = factor(C26_Train_Data$Class)

#To create randomforest with 1000 trees
C26_Train_Data.rf <- randomForest(Class ~ ., data=C26_Train_Data, ntree=1000, importance=TRUE)

#Create partial probability plot for single parameter(yamaguchi4_odd_c) of particular crop (Barley)
A1<-rf.partial.prob(C26_Train_Data.rf, C26_Train_Data , "yamaguchi4_odd_c", "Barley", smooth="spline", raw.line=TRUE, rug=FALSE)
A2<-rf.partial.prob(C26_Train_Data.rf, C26_Train_Data , "entropy_c", "Barley", smooth="spline", raw.line=TRUE, rug=FALSE)

#Calculate Frechet distance
B<-distFrechet(A1$x,A1$y,A2$x,A2$y)

#Probability plot data has 2 values x (parameter value) and y (Probability between 0 and 1)