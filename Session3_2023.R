############################################################
# BUS 462 | Spring 2023 | Session 3
# Managing Data aka Data Wrangling Basics
# CK 
# 23 JAN 2023 
### REFERENCES
# R Data import tutorial -  https://www.datacamp.com/community/tutorials/r-data-import-tutorial
# R Style GUIDE: http://adv-r.had.co.nz/Style.html
## attribution: adopted from  PhilChodrow @ MIT https://philchodrow.github.io/cos_2017/ 
# data  link on canvas in Module 3
#Download data from  https://philchodrow.github.io/cos_2017/1_terminal_and_git/taxi_data.csv  
# courtesy of of the New York City Taxi and Limousine Commission and PhilChodrow @ MIT
############################################################

# Please save data files on your computer from Canvas!


#### PREAMBLE : ## Clearing mem buffers ####
cat("\014")  # Clear Console
rm(list = ls(all.names = TRUE))# clear all
gc()

#INSTALLING PACKAGES (ONE-TIME ONLY)
# Option 1: 
 # Click on Tools -> Install Packages -> type in package name -. profit!
# Option 2:
  # manual command - either in script (one-time) or console 
  #install.packages("data.table")
# Once you install a package, you never need to re-install it again

# remember - you need to call packages after you install it 
require(data.table)
# alternate  command
  # library(data.table)


############################
## WORKING WITH CSV FILES ##
############################

#STEP A: Load the csv DATA
  
  #OPTION 1/  Use GUI  to open file
    # Click on File -> Import Dataset -> Choose option
    # make apropos selections
    # Voila!
    # practice in Taxi Data - remember to download on your computer from canvas
  
  #OPTION 2/ # traditional # Load csv files using read.csv
  taxi_data <- read.csv("C:/Users/CK/Downloads/taxi_data.csv", header = TRUE)
  # header = TRUE is usually ASSUMED, so not strictly necessary
  # NOTE --- look at syntax to call a file! It's / and not \
  
  #OPTION 3 / Using data table alternate - fast and effecient!
  dt <- fread("C:/Users/CK/Downloads/taxi_data.csv")
  
  #OPTION 4/ directly from the internet using data.table
  taxi_data <- fread("https://philchodrow.github.io/cos_2017/1_terminal_and_git/taxi_data.csv")


#STEP B: Look at the DATA

  # Use names() to extract column names
  names(taxi_data)
  
  # Use str to look at details of columns
  str(taxi_data)
  
  # Use head() to look at the first several rows
  head(taxi_data)
  
  # Use the $ command to look at specific columns
  taxi_data$vendor_id
  
  taxi_data$rate_code
  
  ####################################################
  ## BASIC STATISTICS, PLOTTING, AND SUMMARY TABLES ##
  ####################################################
  
  # Calculate the mean, standard deviation, and other statistics
  mean(taxi_data$passenger_count)
  sd(taxi_data$passenger_count)
  summary(taxi_data$passenger_count)
  hist(taxi_data$passenger_count)
  # Plot fare amount vs trip distance
  plot(taxi_data$trip_distance, taxi_data$fare_amount)
  
  
  # Plot with a title, x- and y-axis labels
  plot(taxi_data$trip_distance, taxi_data$fare_amount, 
       main="Fare Amount vs. Trip Distance", 
       xlab = "Trip Distance [mi]", 
       ylab = "Fare Amount [$]")
  
  # For other plots and information about the default graphics package
  library(help = "graphics")
  
  # We'll use ggplot2 soon enough - that is really really COOL!
  
  # Create a table to summarize the data
  # Here, we look at mean trip distance, based on the number of passengers in the taxi
  tapply(taxi_data$trip_distance, taxi_data$passenger_count, mean)
  
  # We can also create a table to look at counts 
  table(taxi_data$passenger_count, taxi_data$payment_type)
  
  # we can save these as R data objects!
  
  
  ## Try out a few other basic statistics and graphing functions
  
  min(taxi_data$trip_distance)
  median(taxi_data$trip_distance)
  max(taxi_data$trip_distance)
  summary(taxi_data$trip_distance)
  hist(log(taxi_data$trip_distance))
  
  sum(taxi_data$total_amount)
  
  hist(taxi_data$total_amount)
  boxplot(taxi_data$fare_amount)
 
  
####################################################
## Data Manipulations ##
####################################################
  
  # sub-setting Data
  
  # How many types of vendor_Id's exit?
  table(taxi_data$vendor_id) # two types!
  
  # how many types of payment methods?
  # fill in the blanks!
  table()
  
  # 
  
  
  
  
  # splitting Data
  
  # create a new table/csv file for each vendor type!
  dt_1 <- taxi_data[taxi_data$vendor_id=="CMT"] # creates a new data table called dt_1 with the condition within [ ]
  # now do the same for the other vendor!
  dt_2 <- #FILL IN THE BLANKS!! - try to come up with 2 ways to do this!
  
## Homework: Look up subset function! and performt the same operations with subset function!
    
  
  # Joining Data
  # now join the 2 subsets dt_1 and dt_2 into a new data table called dt
    # Q: which of these commands can we use? Google and figure out how to use each command!
  dt <- cbind()
  dt <- merge.data.table(dt_1,dt_2, all = TRUE)
  
  # what does by.x and by.y do?
  
  
  
  #####################################3
  ##### BONUS: IF TIME PERMITS!
  ### DEALING WITH RAW DATA
  #####################################3
  
  
  #### PREAMBLE : ## Clearing mem buffers ####
  cat("\014")  # Clear Console
  rm(list = ls(all.names = TRUE))# clear all
  gc()
  
  
  
  ## Loading Libraries / Packages ####
  # if you haven't instlled these packages, run
  # install.packages("data.table","dplyr")
  require(data.table)
  require(dplyr)
  
  ## LOADING DATA ####
  # for this example, we load data from the internet directly
  url <- "https://www.dropbox.com/s/9bykqkzuw2i9qih/nashville_airbnb.csv?dl=1"
  
  #dt is an R object called a data table 
  ## Other ways to read data (read_csv, etc...)
  dt <- fread(url) # Data.table command to read in data
  #  if you want to load from your own computer, command is
  dt <- fread("C:/Users/kalig/Downloads/nashville_airbnb.csv") # remember - / and not \
  
  ## Looking at the data ####
  head(dt) # First 5 entries
  tail(dt) # LAst 5 entries
  dim(dt) # Num of rows and column
  
  # view entire data
  View(dt)
  # also see details in the global enviroment
  
  
  ### THIS IS WHAT what most raw/ scapped data looks like!
  
  
  # Summarizing the data:
  ls(dt) # lists all column names
  objects(dt) # Same as above 
  
  summary(dt) # produces summar stats for numerical / int data.
  
  
  ## It's too large -  let's go by individual colums:
  # To call columns in data frames or data tables, format is <data.table.name>$<column name>
  # column names should autofill
  
  summary(dt$bathrooms)
  
  summary(dt$bedrooms)
  
  # check individual columns
  class(dt$name)
  attributes(dt$price)
  
  # we can visualize numeric / factor columns
  hist(dt$bedrooms)
  plot(dt$bathrooms,dt$bedrooms)
  
  
  
  ## Let's get back to some basic structures and ideas with data wrangling in R with clean data before getting back to raw / messy data
  
  
  
  ##########################
  ##### COMMAND LISTS ######
  ##########################
  ##1/ EXPLORATION
  
  # for some data table / data frame object called mydata, these are some commands and desc. 
  summary(mydata)  # Provides basic descriptive statistics and frequencies. 
  edit(mydata)     # Open data editor
  str(mydata)      # Provides the structure of the dataset
  names(mydata)    # Lists variables in the dataset
  
  head(mydata)     # First 6 rows of dataset
  head(mydata, n=10)# First 10 rows of dataset
  head(mydata, n= -10)  # All rows but the last 10
  
  tail(mydata)     # Last 6 rows
  tail(mydata, n=10)    # Last 10 rows
  tail(mydata, n= -10)  # All rows but the first 10
  mydata[1:10, ]   # First 10 rows
  mydata[1:10,1:3] # First 10 rows of data of the first 3 variables
