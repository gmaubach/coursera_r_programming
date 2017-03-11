# Coursera Data Science - R Programming
# Week 4 - Programming Assignment 3
# 

setwd(paste0("N:/2016/repos_2016/",
             "datasciencecoursera/Exams/", 
             "Programming_Assignment3/data"))


outcome <- 
  read.csv("outcome-of-care-measures.csv", 
           colClasses = "character")
nrow(outcome)
ncol(outcome)
names(outcome)
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
# You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

prog_dir <- "N:/2016/repos_2016/datasciencecoursera/Exams/Programming_Assignment3/programs"

source(file.path(prog_dir,"clean_data.R"))

source(file.path(prog_dir, "best.R"))
best(state = "SC", outcome = "heart attack")
best(state = "NY", outcome = "pneumonia")
best(state = "AK", outcome = "pneumonia")


source(file.path(prog_dir, "rankhospital.R"))
rankhospital(state = "NC", outcome = "heart attack", num = "worst")
rankhospital(state = "WA", outcome = "heart attack", num = 7)
rankhospital(state = "TX", outcome = "pneumonia", num = 10)
rankhospital(state = "NY", outcome = "heart attack", num = 7)

