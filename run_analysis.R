## Coursera: Getting and Cleaning Data - Week 4: Peer-graded Assignment
## 2017-04-09 by Marc Boulet

# load TEST and TRAINING data
library(readr)
subject_test <- read_csv("~/UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)
x_test <- read_csv("~/UCI HAR Dataset/test/X_test.csv", col_names = FALSE)
y_test <- read_csv("~/UCI HAR Dataset/test/y_test.txt", col_names = FALSE)

subject_train <- read_csv("~/UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
x_train <- read_csv("~/UCI HAR Dataset/train/x_train.csv", col_names = FALSE)
y_train <- read_csv("~/UCI HAR Dataset/train/y_train.txt", col_names = FALSE)

# add descriptive FEATURES labels to TEST and TRAINING measurements
features <- read_delim("~/UCI HAR Dataset/features.txt"," ", escape_double = FALSE, col_names = FALSE)
features <- t(features)
colnames(x_test) <- features
colnames(x_train) <- features

# put TEST subject, activity and measurement data together
library(dplyr)

x_test <- cbind (ACTIVITY=0, x_test)
x_test <- cbind (SUBJECT=0, x_test)
x_test[,1] <- subject_test
x_test[,2] <- y_test

# put TRAIN subject, activity and measurement data together
x_train <- cbind (ACTIVITY=0, x_train)
x_train <- cbind (SUBJECT=0, x_train)
x_train[,1] <- subject_train
x_train[,2] <- y_train

# merge TEST and TRAIN data togehter
mergedata <- rbind(x_test, x_train)

# recode ACTIVITY column to add descriptive labels to MERGE data
activity_labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
mergedata[,2] <- recode (mergedata[,2], '1' = activity_labels[1], '2' = activity_labels[2],
                        '3' = activity_labels[3], '4' = activity_labels[4], 
                        '5' = activity_labels[5], '6' = activity_labels[6])

# select mean and std dev. variables from the MERGE data
meansd <- select(mergedata, contains("SUBJECT"), contains ("ACTIVITY"), 
                                 contains("mean()"), contains("std()"))

# group MEANSD data according to SUBJECT and ACTIVITY and derive mean values
bysubject <- group_by(meansd, SUBJECT)
meanbysubject <- summarise_all(bysubject, mean)

byactivity <- group_by(meansd, ACTIVITY)
meanbyactivity <- summarise_all(byactivity, mean)

# merge the two MEANSD datasets together
meanbyactivity$SUBJECT <- "NA"
finaldata <- rbind(meanbysubject, meanbyactivity)
write.table(finaldata, file = "finaldata.txt", row.name = FALSE)
