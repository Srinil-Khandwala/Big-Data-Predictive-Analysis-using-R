#Install pre-requisite packages
install.packages("stats")
install.packages("dplyr")
install.packages("randomForest")

#Load required library
library(stats)
library(dplyr)
library(randomForest)

#Load data in mydata object
mydata= iris

#Inspect mydata
View(mydata)

#variable selection
str(mydata)

#Splitting Data in Training and Testing
#A vector that has sample of training values
index = sample(2,nrow(mydata),replace = TRUE,prob=c(0.7,0.3))

#Training data
Training= mydata[index==1,]

#Testing data
Testing = mydata[index==2,]

#Random Forest Model
RFM =randomForest(Species~.,data=Training)

#Evaluating Model Accuracy
Species_Pred = predict(RFM,Testing)
Testing$Species_Pred = Species_Pred
View(Testing)

#Building confusion matrix
CFM = table(Testing$Species,Testing$Species_Pred)
CFM

Classification_Accuracy = sum(diag(CFM)/sum(CFM)) 
Classification_Accuracy

