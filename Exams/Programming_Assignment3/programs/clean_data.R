d_measures_1 <- 
  read.csv("outcome-of-care-measures.csv", 
           na.strings = "Not Available",
           stringsAsFactors = FALSE)

d_measures_2 <- d_measures_1[, 
                             c("Provider.Number",
                               "Hospital.Name",
                               "State",
                               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                               "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
names(d_measures_2) <- c("number",
                         "hospital",
                         "state",
                         "Heart.Attack",
                         "Heart.Failure",
                         "Pneumonia")

d_measures_3 <- d_measures_2 %>%
  gather(key = outcome,  value = measure,
         c(Heart.Attack,
           Heart.Failure,
           Pneumonia))

d_measures_3[d_measures_3["outcome"] == "Heart.Attack" , "outcome"] <- "heart attack"
d_measures_3[d_measures_3["outcome"] == "Heart.Failure" , "outcome"] <- "heart failure"
d_measures_3[d_measures_3["outcome"] == "Pneumonia" , "outcome"] <- "pneumonia"

