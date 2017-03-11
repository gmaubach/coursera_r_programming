library(tidyr)
library(dplyr)


#----------------------------------------------------------
best <- function(dataset = d_measures_3, state, outcome) {
  ## Data is read outside the function to avoid multiple data loading.
  ## Dataset is an argument.
  
  ## Check that state and outcome are valid
  ### Check state
  state_list <- unique(dataset$state)
  # print(state_list)
  state_in_list <- state %in% state_list
  # print(paste("State in List", state_in_list))
  if (!state_in_list) stop("invalid state")
  
  # Check outcome
  outcome_list <- unique(dataset$outcome)
  outcome_in_list <- outcome %in% outcome_list
  if (!outcome_in_list) stop("invalid outcome")
  
  d_temp <- dataset[
    dataset["state"] == state &
      dataset["outcome"] == outcome, ]
  
  d_temp <- d_temp[order(d_temp["measure"]) , ]
  
  head(d_temp, n = 1)
}
#----------------------------------------------------------
best(state = "AL", outcome = "heart attack")
#----------------------------------------------------------