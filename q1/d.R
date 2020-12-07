# Import libraries
library(tidyverse)

# Read the data
data <- as.matrix(read.csv("q1/protein.csv", header = TRUE, row.names = 'Country'))

# Gathering the data the Fr.Veg variable will be plotted against
data.gathered <- data %>% as_tibble() %>% gather(key = "variable", value = "value",
                                                 -Fr.Veg)

# Plotting Fr.Veg category against the other food categories
ggplot(data.gathered, aes(y = value, x = Fr.Veg)) +
  geom_point() +
  facet_wrap(~variable)