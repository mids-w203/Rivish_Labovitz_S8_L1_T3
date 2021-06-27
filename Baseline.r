#####################################################################
# Program Name: Lab1_Question3.R
# Analyst     : Shane Kramer
#             : Section 8 - Team 3
#
#####################################################################

#####################################################################

library(tidyverse)
library(haven)
library(ggplot2)

# Set working dir
setwd("~/W203/repos/Lab1/Rivish_Labovitz_S8_L1_T3")

# Read in .dta file
enes.stata <- read_dta(file = "ANES_data_material/anes_timeseries_2020_stata_20210324.dta")

# Convert strata labels to factors using haven (https://www.fragilefamilieschallenge.org/using-dta-files-in-r/)
as_factor(enes.stata)

#TODO need to make sure all empty values are populated with "NA"

#---------------------------------------------------------------------------------
# Now lets use real (meaningful) labels
# https://www.datanovia.com/en/lessons/rename-data-frame-columns-in-r/
#---------------------------------------------------------------------------------
# TODO Probably should combing stuff below with purge of columns we do not need
colnames(enes.stata)

enes.stata <- enes.stata %>%
  rename(
    #Question 1
    Pre_Summary_Resp_Age = V201507x, #PRE: SUMMARY: RESPONDENT AGE
    Pre_Summary_Party_ID = V201231x, #PRE: SUMMARY: PARTY ID
    #Question 2
    Post_Registration_Difficulty = V202114i, #POST: REASON R IS NOT REGISTERED - DIFFICULTY WITH ENGLISH
    Post_Absentee_Ballot_Difficulty = V202120c, #POST: DID R ENCOUNTER ANY PROBLEMS VOTING - DIFFICULTY OBTAININ ABSENTEE BALLOT
    Post_Difficulty_Arriving = V202120e, # POST: DID R ENCOUNTER ANY PROBLEMS VOTING - DIFFICULTY GETTING TO POLLING PLACE
    #Question 3
    Post_Science_Experts = V202309, #POST: HOW MUCH DO PEOPLE NEED HELP FROM EXPERTS TO UNDERSTAND SCIENCE
    Post_Science_COVID_Important = V202310, #POST: HOW IMPORTANT SHOULD SCIENCE BE FOR DECISIONS ABOUT COVID-19
    Post_Governor_COVID_Approval = V202604, #POST: GSS: APPROVE OR DISAPPROVE R’S GOVERNOR HANDLING OF COVID-19
    Post_Governor_COVID_Approval_Strength = V202605, #POST: GSS: HOW MUCH APPROVE OR DISAPPROVE R’S GOVERNOR HANDLING OF COVID-19
    Post_Governor_COVID_Approval_Summary = V202606x #POST: GSS: SUMMARY: APPROVE/DISAPPROVE R’S GOVERNOR HANDLING OF COVID-19
  )

# Check column names
colnames(enes.stata)

#---------------------------------------------------------------------------------
# Examine our data
#---------------------------------------------------------------------------------
enes.stata$Pre_Summary_Resp_Age # Couple of negative ages (-9 = refused)
length(enes.stata$Pre_Summary_Resp_Age) #8280

enes.stata$Pre_Summary_Party_ID #Looks good
length(enes.stata$Pre_Summary_Party_ID) #8280

enes.stata$Post_Registration_Difficulty #Looks good
length(enes.stata$Post_Registration_Difficulty) #8280

enes.stata$Post_Absentee_Ballot_Difficulty #Looks good
length(enes.stata$Post_Absentee_Ballot_Difficulty) #8280

enes.stata$Post_Difficulty_Arriving #Looks good
length(enes.stata$Post_Difficulty_Arriving) #8280

enes.stata$Post_Science_Experts #Looks good
length(enes.stata$Post_Science_Experts) #8280

enes.stata$Post_Science_COVID_Important #Looks good
length(enes.stata$Post_Science_COVID_Important) #8280

enes.stata$Post_Governor_COVID_Approval #Looks good
length(enes.stata$Post_Governor_COVID_Approval) #8280

enes.stata$Post_Governor_COVID_Approval_Strength #Looks good
length(enes.stata$Post_Governor_COVID_Approval_Strength) #8280

enes.stata$Post_Governor_COVID_Approval_Summary #Looks good
length(enes.stata$Post_Governor_COVID_Approval_Summary) #8280
