# datasciencecoursera
# Course: Programming with R
# Week 2: Programming Assignemnt
# Part 1
# Write a function named 'pollutantmean' that calculates
# the mean of a pollutant (sulfate or nitrate) across a
# specified list of monitors. The function 'pollutantmean'
# takes three arguments:'directory', 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads
# that monitors' particulate matter data from the directory
# specified in the 'directory' argument and returns the mean
# of the pollutant across all of the monitors, ignoring any
# missing values coded as NA. A prototype of the function is
# as follows:
#
# pollutantmean <- function(directory,
#                           pollutant,
#                           id = 1:332) {
#   # 'directory' is a character vector of length 1 indicating
#   # the location of the csv files.
#
#   # 'pollutant' is a character vector of length 1 indicating
#   # the name of the pollutant for which we will calculate
#   # the mean; either 'sulfate' or 'nitrate'.
#
#   # 'id' is an integer vector indicating the monitor ID
#   # numbers to be used.
#
#   # Return the mean of the pollutant across all monitors
#   # list in the 'ID' vector (ignoring NA values).
#   # Note: Do not round the result!
#
#
# }

work_dir <- "C:/Users/maubach.WEIN_WOLF/Desktop/temp/Documents/datasciencecoursera/Data/specdata"

pollutantmean <- function(directory,
                          pollutant,
                          id = 1:332) {

  saved_workdir <- getwd()
  setwd(directory)

  ids = id

  file_list <- paste0(sprintf("%03d", ids), ".csv")


  dataset <- data.frame()

  for (file in file_list)
  {
    csv_file <- read.csv(
      file.path(
        directory,
        file),
      header = TRUE)

    dataset <- rbind(dataset, csv_file)
  }

  result <- mean(dataset[[pollutant]], na.rm = TRUE)

  setwd(saved_workdir)

  return(result)
}
