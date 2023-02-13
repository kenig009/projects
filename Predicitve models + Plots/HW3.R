library("caret")
library("e1071")
library("rpart")
library("rpart.plot")


setwd("C:/Users/sasha/OneDrive/Desktop/HW3")

short_data = read.csv("credit_short.csv")

short_data$DEFAULT <- ifelse(short_data$DEFAULT == "YES", "1_YES", "2_NO")

short_data$DEFAULT = as.factor(short_data$DEFAULT)

summary(short_data$DEFAULT)
  
ggplot(data= short_data, aes(x = LIMIT_BAL, fill = I("red"), col = I("orange"))) + 
  geom_histogram(alpha=0.8) +
  ggtitle("Balance Limit") +
  labs(x = "LIMIT_BAL", y = "Count")

train_rows = createDataPartition(y = short_data$DEFAULT, p = 0.8, list = FALSE)

data_train = short_data[train_rows,]

data_test = short_data[-train_rows,]

data_train_stand = data_train
data_test_stand = data_test

data_train_stand[, -17] = apply(data_train_stand[, -17], MARGIN =2, FUN = scale)
data_test_stand[, -17] = apply(data_test_stand[, -17], MARGIN =2, FUN = scale)

fitKNN <- train(data= data_train_stand, method = "knn", DEFAULT~.)
fitKNN

plot(fitKNN, ylab = "Accuracy")

knn_prediction = predict(fitKNN, data_test_stand)
confusion = confusionMatrix(knn_prediction, data_test_stand$DEFAULT, mode = "prec_recall", positive = "1_YES")
plot(confusion)

data = read.csv("credit_long.csv")
data$DEFAULT <- ifelse(data$DEFAULT == "YES", "1_YES", "2_NO")

data$DEFAULT = as.factor(data$DEFAULT)

summary(data$DEFAULT)

ggplot(data= data, aes(x = LIMIT_BAL, fill = I("red"), col = I("orange"))) + 
  geom_histogram(alpha=0.8) +
  ggtitle("Balance Limit") +
  labs(x = "LIMIT_BAL", y = "Count")

train_rows_long = createDataPartition(y = data$DEFAULT, p = 0.8, list = FALSE)

data_train_long = data[train_rows_long,]

data_test_long = data[-train_rows_long,]

fitDT = train(data=data_train_long, method = 'rpart', DEFAULT~.)
rpart.plot(fitDT$finalModel)

DT_predictions <- predict(fitDT$finalModel, newdata = data_test_long, type = "class")
confusionMatrix(DT_predictions, data_test_long$DEFAULT, mode = "prec_recall", positive = "1_YES")