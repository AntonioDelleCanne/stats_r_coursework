# Read the data
data <- read.csv("q2/DartPoints.csv", header = TRUE, row.names = 'X')

# Remove NA rows
data <- data[complete.cases(data),]

# Calculate the correlation coefficient
length_correlation = cor(data[,"Length"], data[,c("Weight", "Width")], method="pearson")
length_correlation