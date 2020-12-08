# Import libraries
library(tidyverse)

# Read the data
data <- read.csv("q2/DartPoints.csv", header = TRUE, row.names = 'X')

# Remove NA rows
data <- data[complete.cases(data),]

#defining numeric columns
numCols = c(FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
data.num = as.matrix(data[,numCols])


#defining discrete columns
discrCols = !numCols
data.discr = as.matrix(data[,discrCols])

# Gathering the data relative to the numeric variables the Length variable will be plotted against
data.gathered <- data.num %>% as_tibble() %>% gather(key = "variable", value = "value",
                                                 -Length)

# Plotting Length variable against the numeric variables
ggplot(data.gathered, aes(y = value, x = Length)) +
  geom_point() +
  facet_wrap(~variable)


# Plotting categorical variables and Lenght

# Define the canvas, we have to plot 7 discrete variables so our canvas will have 7 graphs
par(mfrow=c(2,4))

# Create the plots
for (col in colnames(data.discr))
{
  
  plot(factor(data.discr[,col]), data.num[,"Length"], col="white", pch = 19, xlab = col, ylab="Length", type="p")
  #plot(as.integer(factor(data.discr[,col])), #data.num[,"Length"], pch = 19, xlab = col, #ylab="Length", type="p", add=T)
}
