# Read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))


# function to calculate the confidence interval 

# define sample size
n <- dim(data)[1]

# define alpha
alpha <- 0.05

# define c as the 1 - alpha/2 quantile of the t distribution of n-1 degrees of freedom
c <- qt(1-alpha/2, n-1)

# calculate x bar
x_bar <- apply(X=data, MARGIN=2, FUN=mean)
  
#calculate S
s <- apply(X=data, MARGIN=2, FUN=sd)


# calculate 95% confidence interval mean values for each food category
u_mean_confidence_95 = x_bar + (c * s / sqrt(n))
l_mean_confidence_95 = x_bar - (c * s / sqrt(n))
  
mean_confidence_95 = rbind(u_mean_confidence_95, l_mean_confidence_95)
rownames(mean_confidence_95) = c("U", "L")
mean_confidence_95
