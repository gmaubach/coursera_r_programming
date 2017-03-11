# datasciencecoursera
# Course: Programming with R
# Week 2: Programming Assignemnt
# Part 3
# Write a function that takes a directory of data files and
# a threshold for complete cases and calculates the
# correlation between sulfate and nitrate for monitor
# locations where the number of completely observed cases
# (on all variables) is greater than the threshold. The
# function should return a vector of correlations for the
# monitors that meet the threshold requirement. If no
# monitors meet the threshold requirement, then the function
# should return a numeric vector of length 0. A prototype of
# this function follows

# corr <- function(directory,
#                 threshold = 0) {
#   # 'directory' is a character vector of length 1 indicating
#   # the location of the csv files.
#   #
#   # 'threshold' is a numeric vector of length 1 indicating
#   # the number of completely observed observations (on all
#   # variables) required to compute the correlation between
#   # nitrate and sulfate; the default is 0.
#   #
#   # Return a numeric vector of correlations.
#   #
#   # Note: Do not round the result!
# }
#
# Please read '?cor' as this function is needed to fulfil
# this programming assignment.

source(file.path("C:/Users/maubach.WEIN_WOLF/Desktop",
                 "temp/Documents/datasciencecoursera",
                 "Programs",
                 "complete.R"))

corr <- function(directory, threshold = 0)
{
  complete_cases <- complete(directory)
  complete_cases_with_threshold <- complete_cases[
    complete_cases[["nobs"]] > threshold ,]

  saved_workdir <- getwd()
  setwd(directory)

  corr_results <- numeric()

  for (id in complete_cases_with_threshold$id)
  {
    dataset <- read.csv(
      file = paste0(sprintf("%03d", id), ".csv"),
      header = TRUE
    )
    result <- cor(x = dataset$sulfate,
                  y = dataset$nitrate,
                  use = "pairwise.complete.obs")
    corr_results <- c(corr_results, result)
  }

  setwd(saved_workdir)

  return(corr_results)
}
