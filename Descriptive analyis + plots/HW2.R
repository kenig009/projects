library(arules)
library(arulesViz)
library(ggplot2)
library(stats)
library(factoextra)
library(plyr)
setwd("C:/Users/sasha/OneDrive/Desktop/HW2")

data_telco = read.csv("TelcoData.csv")

summary(data_telco$Age)
summary(data_telco$Tenure.Months)
summary(data_telco$Monthly.Charges)




ggplot(data= data_telco, aes(x = Age)) +
  geom_histogram(fill="blue", color = "black", alpha = 0.5) +
  ggtitle("Distribution of Age") +
  labs(x = "Number of people", y = "Age")


standard_norm <- function(x) {
  return ((x - mean(x)) / sd(x))
}

data_telco$Partner_cat <-ifelse(data_telco$Partner_cat=="Yes", 1, 0)

norm_data = as.data.frame(apply(data_telco[,-1], MARGIN = 2, FUN = standard_norm))

distance_matrix_norm = dist(norm_data, method = 'euclidean')
h1 = hclust(distance_matrix_norm, method = 'ward.D')

plot(h1, hang = 0, cex = 0.5, labels = FALSE)

rect.hclust(h1, k = 5, border = 2:6)


hcluster_5 = cutree(h1, k=5)
table(hcluster_5)

data_telco$hcluster_5 = hcluster_5

ddply(data_telco, .(hcluster_5), summarize, n = length(CustomerID), Monthly.Charges = mean(Monthly.Charges),
      Tenure.Months = mean(Tenure.Months), Age = mean(Age), Partner_cat =  sum(Partner_cat)/n,
      Senior.Citizen = sum(Senior.Citizen/n), Online.Backup=sum(Online.Backup/n),
      Tech.Support = sum(Tech.Support/n), Streaming.Movies = sum(Streaming.Movies/n),
      Streaming.TV = sum(Streaming.TV/n), Online.Security = sum(Online.Security/n),
      Unlimited.Data = sum(Unlimited.Data/n))

table(data_telco$hcluster_5)

set.seed(123)
WSS_curve = c()
BSS_curve = c()
for (n in 1:20){
  k = kmeans(norm_data, centers = n, nstart = 10)
  wss = k$tot.withinss
  bss = k$betweenss
  WSS_curve[n] = wss
  BSS_curve[n] = bss
}

plot(1:20, WSS_curve, type='b', col ='red', ylab= 'wss',
     xlab='K', 
     main = 'Elbow Plot')
lines(1:20, BSS_curve,type="o",col="blue")

k1 = kmeans(norm_data, centers = 4, nstart = 10)
k1$cluster
data_telco$k_clust = k1$cluster
fviz_cluster(k1, geom = "point", data = norm_data) + labs(x ="Total.Charges ", y = "Age")

str(k1) 
k1$size 
k1$centers 