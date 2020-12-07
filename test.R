#read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))
data
summary(data)
class(data)
dim(data)

help(table)
#marginal distribution
colSums(data)
rowSums(data)
