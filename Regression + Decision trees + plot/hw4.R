library(caret)
library(rpart.plot)
library(gridExtra)
library(labelVector)
library(tidyverse)
library(standardize)
library(ggplot2)

setwd("C:/Users/sasha/OneDrive/Desktop/HW4")

data = read.csv("bike_day.csv")

summary(data)
ggplot(data= data, aes(x = cnt_bike, fill = I("red"), col = I("orange"))) + 
  geom_histogram(alpha=0.8) +
  ggtitle("Bike transactions") +
  labs(x = "Bike transactions", y = "Count")



set.seed(1)

trainRows = createDataPartition(y=data$cnt_bike, p=0.8, list = FALSE)
train_set = data[trainRows,]
test_set = data[-trainRows,]

data_train_stand = train_set
data_test_stand = test_set

data_train_stand[, -1] = apply(data_train_stand[, -1], MARGIN =2, FUN = scale)
data_test_stand[, -1] = apply(data_test_stand[, -1], MARGIN =2, FUN = scale)


knn_model = train(cnt_bike~., data_train_stand, method ="knn")
knn_model

knn_Pred = predict(knn_model, data_test_stand)

ggplot(data= data_test_stand, aes(x = knn_Pred)) + 
  geom_histogram(colour = "lightblue", fill = "darkblue") +
  xlim (0, 33000) +
  ggtitle("KNN, Distribution of Predicted bike rides") +
  labs(x = "Predicted bike rides")


ggplot(data=test_set, aes(x = cnt_bike)) + 
  geom_histogram(colour = "grey", fill = "black") +
  xlim (0, 33000) +
  ggtitle("Original bike rides") +
  labs(x = "bike rides")

knn_error = knn_Pred - data_test_stand$cnt_bike

ggplot(data= data_test_stand, aes(x = knn_error)) + 
  geom_histogram(colour = "lightblue", fill = "blue") +
  ylim (0, 150) + 
  ggtitle("KNN, Distribution of Prediction Error") +
  labs(x = "Prediction Error")

ggplot(data = data_test_stand, aes(x=cnt_bike, y=knn_error)) +
  geom_point(size=2, color = "blue") +
  xlim (0, 30000) +
  ggtitle("KNN, Prediction Error vs Actual bikes rented") +
  labs(x = "True bikes rented", y = "KNN Prediction Error")

knnMAE = MAE(pred=knn_Pred, obs = data_test_stand$cnt_bike)
knnMAE
knnRMSE = RMSE(pred = knn_Pred, obs = data_test_stand$cnt_bike)
knnRMSE

set.seed(1)
rtree<-train(cnt_bike~., data=train_set, method = 'rpart')
rtree

rpart.plot(rtree$finalModel, digits=-3)

treePred = predict(rtree, test_set)


ggplot(data= test_set, aes(x = treePred)) + 
  geom_histogram(colour = "red", fill = "darkred") +
  xlim (0,30000) + 
  ylim (0, 300) + 
  ggtitle("Tree, Distribution of Predictions") +
  labs(x = "Predictions")

tree_error = treePred - test_set$cnt_bike

ggplot(data= test_set, aes(x = tree_error)) + 
  geom_histogram(colour = "darkred", fill = "red") +
  xlim (-6000, 6000) + 
  ylim (0, 150) + 
  ggtitle("Tree, Distribution of Prediction Error") +
  labs(x = "Prediction Error")


ggplot(data = test_set, aes(x=cnt_bike, y=tree_error)) +
  geom_point(size=2, color = "red") +
  ylim (-6000, 8000) +
  xlim (0, 30000) +
  ggtitle("Tree, Prediction Error vs Actual Price") +
  labs(x = "Actual Price", y = "Tree Prediction Error")

treeMAE <- MAE(pred = treePred, obs = test_set$cnt_bike)
treeMAE
treeRMSE <- RMSE(pred = treePred, obs = test_set$cnt_bike)
treeRMSE

res_tree<- c(treeMAE, treeRMSE)
names(res_tree) <-c("MAE", "RMSE")
res_tree <- set_label(res_tree, "Regression Tree")

res_knn<- c(knnMAE, knnRMSE)
names(res_knn) <-c("MAE", "RMSE")
res_knn <- set_label(res_knn, "KNN")

res_knn
res_tree