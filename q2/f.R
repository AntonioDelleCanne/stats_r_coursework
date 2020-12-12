# Read the data
data <- read.csv("q2/DartPoints.csv", header = TRUE, row.names = 'X')

# Remove NA rows
data <- data[complete.cases(data),]

colnames(data)[c(-8,-1)]

# Define the dependent variable
Y <- "Weight"

# Define the combinations of covariate
X <- colnames(data)[c(-8,-1)]


# specifications of how to model,
# coming from somewhere else

# our modeling effort, 
# fully parameterized!
f <- as.formula(
  paste(Y, 
        paste(X, collapse = " + "), 
        sep = " ~ "))
print(f)

# fit the model
lin.mod <- lm(f, data = data)


# check the fit of the model

# summary of the linear model
summ <- summary(lin.mod)
summ

str(summ)

# Coefficients
coef(lin.mod)
b.est <- lin.mod$coefficients

# Standard deviation of the errors
sigma.u <- summ$sigma

#  R squared
summ$r.squared

#  Adjusted R squared
summ$adj.r.squared

# Other values
summ[["coefficients"]]

summ[["coefficients"]][, 1]
summ[["coefficients"]][, 2]
summ[["coefficients"]][, 3]


#--------------------------------
# Diagnostic plots
#--------------------------------

plot(lin.mod)
