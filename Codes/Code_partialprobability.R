#Create Partial probability plot
#Load library and set directory
library(randomForest)
library(rfUtilities)
setwd("F:/Siddhart_BookChapter_Springer/Codes_RF")

#To load train Data
C26_Train_Data <- read.csv('TrainingData_C.csv')
C26_Train_Data$Class = factor(C26_Train_Data$Class)

#To create randomforest with 1000 trees
C26_Train_Data.rf <- randomForest(Class ~ ., data=C26_Train_Data, ntree=1000, importance=TRUE)

#Create partial probability plot for single parameter(yamaguchi4_odd_c) of particular crop (Barley)
rf.partial.prob(C26_Train_Data.rf, C26_Train_Data , "yamaguchi4_odd_c", "Barley", smooth="spline", raw.line=TRUE, rug=FALSE)
