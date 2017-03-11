# datasciencecoursera
# Course: Programming with R
# Week 2: Programming Assignemnt
# Part 2
# Write a function that reads a directory full of files and
# reports the number of completely observed cases in each
# data file. The function should return a data frame where
# the first column is the name of the file and the second
# column is the number of complete cases. A prototype of this
# function follows

# complete <- function(directory,
#                      id = 1:332) {
#   # 'directory' is a character vector of length 1 indicating
#   # the location of the csv files.
#
#   # 'id' is an integer vector indicating the monitor ID
#   # numbers to be used.
#
#   # Return a data frame of the form
#   # id nobs
#   # 1  117
#   # 2  1041
#   # ...
#   where ID is the monitor ID number and 'nobs' is the
#   number of complete cases.
# }

complete <- function(directory, ids = 1:332)
{
  saved_workdir <- getwd()
  setwd(directory)

  complete_cases <- data.frame(id = numeric(),
                                    nobs = numeric())

  for (id in ids)
  {
    csv_file <- read.csv(
      file = paste0(sprintf("%03d", id), ".csv"),
      header = TRUE
    )

    complete <- sum(complete.cases(csv_file))

    complete_cases <- rbind(complete_cases, c(id, complete))
  }

  names(complete_cases) <- c("id", "nobs")

  setwd(saved_workdir)

  invisible(complete_cases)
}

