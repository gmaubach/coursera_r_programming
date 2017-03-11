select_hospital <- function(num)
{
  if (is.character(num))
  {
    if (num == "best")
    {
      num_new <- 1
    } else if (num == "worst") 
    {
      num_new <- ??? # How to I reference the data.frame columns?
    } else           # cause worst is dynamic depending on the
                     # number of hospitals in each state.
    {
      stop("Given unknown rank specification in 'num'!")
    }
  } else if (is.numeric(num))
  {
    num_new <- num
  } else
  {
    stop("Argument 'num' neither 'character' nor 'numeric'!")
  }
  print(paste("num_new", num_new))
  
  return()
}

rankall <- function(dataset = d_measures_3,
                    outcome,
                    num = "best")
{
  ## Data is read outside the function to avoid multiple data loading.
  ## Dataset is an argument.
  # print(head(dataset, n = 3))
  
  ## Checks
  ### Check outcome
  outcome_list <- unique(dataset$outcome)
  outcome_in_list <- outcome %in% outcome_list
  if (!outcome_in_list) stop("invalid outcome")
  
  d_ordered <- dataset[
    order(dataset["state"],
          dataset["outcome"],
          dataset["measure"],
          dataset["hospital"]) , ]
  
  l_split <- split(d_ordered, d_ordered["state"])
  
  result_list <- lapply(l_split, select_hospital, num = 4)
  
  return(result_list)
}

#----------------------------------------------------------
rankall(outcome = "heart attack", num = 4)
#----------------------------------------------------------

dataset <- d_measures_3

d_ordered <- dataset[
  order(dataset["state"],
        dataset["outcome"],
        dataset["measure"],
        dataset["hospital"]) , ]

l_split <- split(d_ordered, d_ordered$state)

test <- lapply(l_split, function() {print()})

