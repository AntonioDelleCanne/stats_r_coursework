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

# Coefficients
summ <- summary(lin.mod)
coeff.summ <- summ[["coefficients"]]

# Here we show the above mentioned correlations, applying the above described methodology

# variables with no significant correlation
corr.vars.idx <- abs(coeff.summ[, "t value"])  > coeff.summ[, "Pr(>|t|)"]
uncorr.vars <- row.names(coeff.summ)[corr.vars.idx == F]
uncorr.vars

# directly correlated variables
corr.dir.idx <- coeff.summ[corr.vars.idx, "Estimate"] > 0
corr.dir <- row.names(coeff.summ)[corr.dir.idx]
corr.dir

# inversely correlated variables
corr.inv <- row.names(coeff.summ)[corr.dir.idx == F]
corr.inv

