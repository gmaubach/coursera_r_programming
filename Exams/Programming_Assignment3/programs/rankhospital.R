#----------------------------------------------------------
rankhospital <- function(dataset = d_measures_3,
                         state = "AL",
                         outcome = "heart attack",
                         num = "best")
{
  ## Data is read outside the function to avoid multiple data loading.
  ## Dataset is an argument.
  # print(head(dataset, n = 3))
  
  ## Checks
  ### Check state
  state_list <- unique(dataset$state)
  # print(state_list)
  state_in_list <- state %in% state_list
  # print(paste("State in List", state_in_list))
  if (!state_in_list) stop("invalid state")
  
  ### Check outcome
  outcome_list <- unique(dataset$outcome)
  outcome_in_list <- outcome %in% outcome_list
  if (!outcome_in_list) stop("invalid outcome")
  
  d_subset <- dataset[dataset["state"] == state &
                      dataset["outcome"] == outcome , ]
  print(paste("nrow: ", nrow(d_subset), "n_col: ", ncol(d_subset)))
  # View(d_subset)
  
  d_complete <- d_subset[complete.cases(d_subset) , ]
  # View(d_complete)

  v_order <- order(d_complete["measure"],d_complete["hospital"])
  d_ordered <- d_complete[v_order , ]
  # View(d_ordered)
  
  # Transform 'num'
  if (is.character(num))
  {
    if (num == "best")
    {
      num_new <- 1
    } else if (num == "worst") 
    {
      num_new <- nrow(d_ordered)
    } else
    {
      stop("Given unknow rank specification in 'num'!")
    }
  } else if (is.numeric(num))
  {
    num_new <- num
  } else
  {
    stop("Argument 'num' neither 'character' nor 'numeric'!")
  }
  print(paste("num_new", num_new))
  
  d_ready <- d_ordered
  d_ready$num <- 1:nrow(d_ordered)
  
  return(d_ready[num_new , ])

}

#----------------------------------------------------------
rankhospital(state = "NC",
             outcome = "heart attack",
             num = "worst")

rankhospital(state = "WA",
             outcome = "heart attack",
             num = 7)

rankhospital(state = "TX",
             outcome = "pneumonia",
             num = 10)

rankhospital(state = "NY",
             outcome = "heart attack",
             num = 7)
#----------------------------------------------------------

