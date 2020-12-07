# Read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))

# Calculate the correlation coefficient
vegetable_consumption_correlations = cor(data[,9], data[,-9], method="pearson")
vegetable_consumption_correlations
