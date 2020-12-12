# Read the data
data <- read.csv("q2/DartPoints.csv", header = TRUE, row.names = 'X')

# Remove NA rows
data <- data[complete.cases(data),]

colnames(data)

# Define the dependent variable
Y <- "Weight"

# Define the combinations of covariate
X <- c("Length", "Width", "Thickness")


# specifications of how to model,
# coming from somewhere else

# our modeling effort, 
# fully parameterized!
f <- as.formula(
  paste(Y, 
        paste(X, collapse = " + "), 
        sep = " ~ "))
print(f)

lin.mod <- lm(f, data = data)
