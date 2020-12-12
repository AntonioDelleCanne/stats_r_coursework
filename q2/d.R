# Read the data
data <- read.csv("q2/DartPoints.csv", header = TRUE, row.names = 'X')

# Remove NA rows
data <- data[complete.cases(data),]


# Create frequency table
ft <- table(data[,"Weight"], data[,"Blade.Sh"])

# Compute marginal distribution
ft.margin <- margin.table(ft, 2)

# compute conditional relative frequencies
ft.rel <- sweep(ft, 2, ft.margin, FUN = '/')
ft.rel

# Define the canvas, we have to plot 4 blade shapes so we will have 4 graphs
par(mfrow=c(2,2))


for (shape in levels(factor(data[,"Blade.Sh"])))
{
  plot(density(ft.rel[,shape]), xlab = "Values", ylab="Weigth", main=shape)
  
}
