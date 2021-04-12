#heatmap with one data col 

df <- read.csv(file.choose())

head(df)

# your data
df <- data.frame(
  City = c("New York", "LA", "DC", "Boston", "Chicago"),
  Data = c(780, 982, 111, 893, 989)
)

names(df)[1] <- "City"
names(df)[2] <- "Data"


# calculate distance/dissimilarity matrix (a dist object)
distance <- dist(df$Data, diag = TRUE, upper = TRUE)

# transform to matrix and set the labels
distanceM <- as.matrix(distance)
rownames(distanceM) <- df$City
colnames(distanceM) <- df$Sex

# create heatmap
heatmap(distanceM)

# or without reordering and without dendrograms
heatmap(distanceM, Colv = NA, Rowv = NA)



# your data
df <- data.frame(
  City = c("New York", "LA", "DC", "Boston", "Chicago"),
  Data = c(780, 982, 111, 893, 989)
)

# calculate distance/dissimilarity matrix (a dist object)
distance <- dist(df$Data, diag = TRUE, upper = TRUE)

# transform to matrix and set the labels
distanceM <- as.matrix(distance)
rownames(distanceM) <- df$City
colnames(distanceM) <- df$City

# create heatmap
heatmap(distanceM)

# or without reordering and without dendrograms
heatmap(distanceM, Colv = NA, Rowv = NA)
