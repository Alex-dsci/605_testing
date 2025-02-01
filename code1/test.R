# Get Work Directory
getwd()

#I need these package to do the test read
library(tidyverse)
library(dplyr)

Add your code here for this assignment.
# Set Work Directory
getwd()
setwd("/home/rstudio/Module2")

#I need these package to do the test read
library(tidyverse)
library(dplyr)

# Read the data.
Salaries <- read_csv("Salaries.csv")

# To select columns througout the data frame 

selected_column <- select(Salaries, rank, discipline, sex, salary)

print(selected_column)

# Filter the rows where “salary” is not missing value.

filtered_mv <- filter(selected_column, !is.na(salary))
print(filtered_mv)

# Group based on the required columns (“rank”,”discipline”, “sex”)
# Use select(), filter(), group_by(), count() in this part and combine them with pipe operator

Salaries_new <- Salaries %>%
  
  # Select the required columns
  select(rank, discipline, sex, salary) %>%
  
  # Filter the required columns
  filter(!is.na(salary)) %>%
  
  #group_by the selected columns
  group_by(rank, discipline, sex) %>%
  
  # Tally the count operation
  count()

print(Salaries_new)

# Use spread() to create separate columns for each value in "sex"
wide <- Salaries_new %>%
  spread(key = sex, value = n, fill = FALSE)

# View the output
print(wide)

# Reshape the table from wide to long format using gather()
long <- wide %>%
  gather(key = sex, value = n, Female, Male, na.rm = TRUE)

# View the reshaped long data frame
print(long)
