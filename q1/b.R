# Read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))

# Create the box plot
boxplot(x=data, names= colnames(data))

