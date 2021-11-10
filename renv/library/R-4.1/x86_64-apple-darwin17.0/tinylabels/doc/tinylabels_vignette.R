## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(tinylabels)

x <- rnorm(6)
variable_label(x) <- "Values randomly drawn from a standard-normal distribution"
x

## -----------------------------------------------------------------------------
# Extract the variable label from a vector (e.g., a numeric vector)
variable_label(x)

## -----------------------------------------------------------------------------
# View original data set ----
str(npk)

## -----------------------------------------------------------------------------
# Assign labels to the built-in data set 'npk' ----
variable_label(npk) <- c(
  N = "Nitrogen"
  , P = "Phosphate"
  , yield = "Pea yield"
)

# View the altered data set ----
str(npk)

## -----------------------------------------------------------------------------
variable_labels(npk)

## ----error = TRUE-------------------------------------------------------------
variable_label(npk) <- c(wrong_column_name = "A supposedly terrific label")

## -----------------------------------------------------------------------------
# Return as a simple factor ----
unlabel(npk$N)

# Remove all labels (and class 'tiny_labelled') from all columns ----
npk <- unlabel(npk)
str(npk)

## -----------------------------------------------------------------------------
data_1 <- data_2 <- data.frame(
  x = rnorm(10)
  , y = rnorm(10)
)

variable_label(data_1) <- c(x = "Label for x", y = "Label for y")
variable_label(data_2) <- c(x = "Label for x", y = "Another label for y")

## -----------------------------------------------------------------------------
library(dplyr)
combined_data <- bind_rows(data_1, data_2)
variable_label(combined_data)

## -----------------------------------------------------------------------------
test <- npk %>%
  group_by(N, P) %>%
  summarize(yield = mean(yield), .groups = "keep") %>%
  label_variables(N = "Nitrogen", P = "Phosphate", yield = "Average yield")

variable_labels(test)

