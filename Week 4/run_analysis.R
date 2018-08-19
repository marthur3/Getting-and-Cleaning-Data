library(tidyverse)
library(data.table)

# setwd("~/GitHub/Getting and Cleaning Data/Week 4")
# wd <- "C:/Users/Michael A/Documents/GitHub/Getting and Cleaning Data/Week 4"
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# zippedFileName <- "wearables_data.zip"
# 
# if (!file.exists(zippedFileName)) {
#         download.file(fileUrl, destfile = "./data/wearables_data.zip")
#         dateDownloaded <- date()
# }
# 
# unzip(zipfile = "data/wearables_data.zip", exdir = paste0(wd,"/data"))


### Test ####
test_data <- fread("UCI HAR Dataset/test/X_test.txt")
test_activities <- (fread("UCI HAR Dataset/test/y_test.txt"))
activity_labels_test <- fread("UCI HAR Dataset/activity_labels.txt")
features_test <- fread("UCI HAR Dataset/features.txt")
subject_test <- fread("UCI HAR Dataset/test/subject_test.txt")

###Collect variable names from column two of the features table
features_test<- features_test %>% unite(V3, V1, V2)

feature_names_test <- features_test$V3
###Assign the variable names to the test_data
names(test_data) <- feature_names_test

##Create column                 ##Lookup table$Writtenoutnames[match(target$ids, lookup$ids)]
test_activities$Activity_name <- activity_labels_test$V2[match(test_activities$V1, activity_labels_test$V1)]


test_activities$Subjects <- subject_test

test_data <- cbind(test_data, test_activities)

### Train ####
train_data <- fread("UCI HAR Dataset/train/X_train.txt")
train_activities <- (fread("UCI HAR Dataset/train/y_train.txt"))
activity_labels_train <- fread("UCI HAR Dataset/activity_labels.txt")
features_train <- fread("UCI HAR Dataset/features.txt")
subject_train <- fread("UCI HAR Dataset/train/subject_train.txt")

###Collect variable names from column two of the features table
features_train<- features_train %>% unite(V3, V1, V2)

feature_names_train <- features_train$V3
###Assign the variable names to the train_data
names(train_data) <- feature_names_train

##Create column Activity_name                ##Lookup table$Writtenoutnames[match(target$ids, lookup$ids)]
train_activities$Activity_name <- activity_labels_train$V2[match(train_activities$V1, activity_labels_train$V1)]

### Add the column Subjects
train_activities$Subjects <- subject_train

###Combines the data with the labels
train_data <- cbind(train_data, train_activities)


#### Combine #####
###Join the test and train data
total_data <- rbind(test_data, train_data, fill = T)

### Test the join
total_data %>% 
        group_by(Activity_name) %>% 
        summarise(Count = n())

###Collect the column names
measurements <- as.tibble(names(total_data))


### Create a list of only the columns related to std and mean and the identifiers
my_measurements <- measurements %>% 
       filter(str_detect(value, pattern = c("mean", "std", "Activity_name", "Subjects")))

### Select the columns
select_data <- total_data %>% 
        select(match(my_measurements$value, measurements$value))

### Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_independent_data <- select_data %>% 
        group_by(Activity_name, Subjects) %>% 
        summarise_all (funs(mean))

