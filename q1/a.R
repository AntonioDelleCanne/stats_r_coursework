# Read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))

# Calucalte median for each variable
medianConsumption <- apply(X=data, MARGIN=2, FUN=median)
medianConsumption

# Calculate IQR for each variable
IQRConsumption <- apply(X=data, MARGIN=2, FUN=IQR)
IQRConsumption
