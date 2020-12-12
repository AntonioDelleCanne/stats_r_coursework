# Read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))

 
# We want to test if X.bar <= Y.bar (H_0)
# Where X is Starch and Y is Nuts
#
X <- data[,"Starch"]
m <- length(X)

Y <- data[,"Nuts"]
n <- length(Y)

# T test assuming unequal and unknown variance

# Effective degrees of freedom
nu <- (var(X)/m + var(Y)/n)^2/( var(X)^2/(m^2*(m-1)) + var(Y)^2/(n^2*(n-1)) )
nu

# Studentised variance
SV <- var(X)/m + var(Y)/n

# t-statistic
t0 <- (mean(X) - mean(Y))/sqrt(SV)

# Critical values

c.star <- qt(0.95, df = nu)

# check if t0 <= -c.star, if not H_0 is rejected
c.star
t0

# we can see that t0 greater than c.star, so the H_0 is rejected
# and we can conclude that the average consumption of starch is greater than the average consumption
# of nuts

# This test can be conducted in R using the command:
# Interpret the output

tt <- t.test(x = X, y = Y, alternative = c("greater"), 
             paired = FALSE, var.equal = FALSE, conf.level = 0.95)
tt
