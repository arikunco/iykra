# Script ini digunakan sebagai bahan pengajaran Unsupervised Learning Sesi 1
# Author: Bernardus Ari Kuncoro 
# Tanggal 4 Mei 2018

# Sumber1: https://rpubs.com/williamsurles/310847 
# Sumber2: https://campus.datacamp.com/courses/unsupervised-learning-in-r/ 

#loading iris database
x <- iris

# Create the k-means model: km.out
km.out <- kmeans(iris[,1:4], center=3, nstart=50)

# Inspect the result
summary(km.out)

# Print the cluster membership component of the model
print(km.out$cluster)

# Print the km.out object
print(km.out)

# Scatter plot of x
plot(x[,2:3], col = km.out$cluster,
     main = "k-means with 3 clusters")

# Determine Number of Clusters
# Initialize total within sum of squares error: wss
wss <- 0

# For 1 to 15 cluster centers
for (i in 1:15) {
  km.out <- kmeans(x[,1:4], centers = i, nstart = 20)
  # Save total within sum of squares to wss variable
  wss[i] <- km.out$tot.withinss
}

# Plot total within sum of squares vs. number of clusters
plot(1:15, wss, type = "b", 
     xlab = "Number of Clusters", 
     ylab = "Within groups sum of squares")


