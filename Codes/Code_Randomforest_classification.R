## Random forest crop classification-MDA score
#Training and test data are stored in *.csv file
# C-band SAR features as predictors
#Load Library and Set working directory
library(randomForest)
setwd("F:/Siddhart_BookChapter_Springer/Codes_RF")

#Load train Data
C26_Train_Data <- read.csv('TrainingData_C.csv')
C26_Train_Data$Class = factor(C26_Train_Data$Class)

#To create randomforest with 1000 trees
C26_Train_Data.rf <- randomForest(Class ~ ., data=C26_Train_Data, ntree=1000, importance=TRUE)

#Load test data
Data_To_Use_New <- read.csv('TestData_C.csv')

#Prediction
output <- predict(C26_Train_Data.rf,Data_To_Use_New)

#Save predicted output
write.csv(output,file='prediction_Data.csv')
