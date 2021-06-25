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
#---------------------------------------------------------------------------------
# Probably should combing stuff below with purge of columns we do not need
#colnames(enes.stata)

# Question 1
#-------------------------
#PRE: SUMMARY: RESPONDENT AGE
names(enes.stata)[names(enes.stata) == "V201507x"] <- "Pre_Summary_Resp_Age"
#PRE: SUMMARY: PARTY ID
names(enes.stata)[names(enes.stata) == "V201231x"] <- "Pre_Summary_Party_ID" #PRE: SUMMARY: PARTY ID
    
#Question 2
#-------------------------
#POST: REASON R IS NOT REGISTERED - DIFFICULTY WITH ENGLISH
names(enes.stata)[names(enes.stata) == "V202114i"] <- "Post_Registration_Difficulty" 
#POST: DID R ENCOUNTER ANY PROBLEMS VOTING - DIFFICULTY OBTAININ ABSENTEE BALLOT
names(enes.stata)[names(enes.stata) == "V202120c"] <- "Post_Absentee_Ballot_Difficulty"
# POST: DID R ENCOUNTER ANY PROBLEMS VOTING - DIFFICULTY GETTING TO POLLING PLACE
names(enes.stata)[names(enes.stata) == "V202120e"] <- "Post_Difficulty_Arriving"

#Question 3
#-------------------------
#POST: HOW MUCH DO PEOPLE NEED HELP FROM EXPERTS TO UNDERSTAND SCIENCE
names(enes.stata)[names(enes.stata) == " V202309"] <- "Post_Science_Experts"
#POST: HOW IMPORTANT SHOULD SCIENCE BE FOR DECISIONS ABOUT COVID-19
names(enes.stata)[names(enes.stata) == "V202310"] <- "Post_Science_COVID_Important"
#POST: GSS: APPROVE OR DISAPPROVE R’S GOVERNOR HANDLING OF COVID-19
names(enes.stata)[names(enes.stata) == "V202604"] <- "Post_Governor_COVID_Approval"
#POST: GSS: HOW MUCH APPROVE OR DISAPPROVE R’S GOVERNOR HANDLING OF COVID-19
names(enes.stata)[names(enes.stata) == "V202605"] <- "Post_Governor_COVID_Approval_Strength"
#POST: GSS: SUMMARY: APPROVE/DISAPPROVE R’S GOVERNOR HANDLING OF COVID-19
names(enes.stata)[names(enes.stata) == "V202606x"] <- "Post_Governor_COVID_Approval_Summary"

# Check column names
colnames(enes.stata)

