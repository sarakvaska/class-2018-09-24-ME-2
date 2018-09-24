# Handy code for loading up and saving the data. In the problem sets, you will
# soon take care of this yourself.

library(tidyverse)

x <- read_csv("elections-poll-me02-1.csv") %>% 
  transmute(response = as_factor(response),
         ager = factor(ifelse(ager == "[DO NOT READ] Refused", NA, ager)),
         educ = factor(ifelse(educ == "[DO NOT READ] Refused", NA, educ),
                          levels= c("Grade school",
                                    "High school",
                                    "Some college or trade school",
                                    "Bachelors' degree",
                                    "Graduate or Professional Degree")),
         race = factor(ifelse(file_race == "Unknown", NA, file_race)),
         gender = factor(gender),
         weight = final_weight)

x %>% 
  write_rds("survey.rds")
  
