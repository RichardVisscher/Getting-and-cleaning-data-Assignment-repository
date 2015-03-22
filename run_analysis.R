## Leave the main directory and work with the data in a subdirectory called HARUS
oldwd <- getwd()
setwd("C:/HARUS")

library(plyr)
library(dplyr)

## read the features in a table called features
## create a third column where the number and the featuretext
## are combined into a new variable V3
features = read.table("features.txt", as.is=TRUE)
features <- mutate(features, V3 = paste(V1,V2))

## read the testresluts from X-test.txt in a table called test
## change the names into the names from the new variable V3 
## from features
## Create a new dataframe testmean by selecting the colums that contain "mean"
## Create a new dataframe teststd by selecting the colums that contain "std"
## Combine testmean and trainmean by adding the columns and create a new dataframe test
test = read.table("X_test.txt")
names(test) <- features[,3]
testmean <- select(test, contains("mean"))
teststd <- select(test, contains("std"))
test <- bind_cols(testmean, teststd)

## Repeat the procedure used for test to create a new dataframe train with only the 
## columns that contain "mean"and "std"
train = read.table("X_train.txt")
names(train) <- features[,3]
trainmean <- select(train, (contains("mean")))
trainstd <- select(train, (contains("std")))
train <- bind_cols(trainmean, trainstd)

## Read the subjectlabels into two tables called subject_test and subject_train
## Add a column name Subject
subject_test = read.table("subject_test.txt")
subject_train = read.table("subject_train.txt")
names(subject_test) <- c("Subject")
names(subject_train) <- c("Subject")

## Read the activitylabels in a table called activitylabels
activitylabels = read.table("activity_labels.txt")
## Read the activity codes 1 through 6 from "y_test.txt" and "y_train.txt"
## into two tables, add a column name "Activity"
## Add an extra column to both tables with the strings from activity labels
activity_test = read.table("y_test.txt")
activity_train = read.table("y_train.txt")
names(activity_test) <- c("Activity")
names(activity_train) <- c("Activity")
activity_test <- mutate(activity_test, Activity = as.character(activitylabels[Activity,2]))
activity_train <- mutate(activity_train, Activity = as.character(activitylabels[Activity,2]))

## Add subject and activity columns to test and train
test <- bind_cols(subject_test, activity_test, test)
train <- bind_cols(subject_train, activity_train, train)

## Combine test and train by adding the rows and create a new dataframe total
total <- bind_rows(test, train)

## Tidy the dataframe total by combining Subject and Activity in a new variable SubjectActivity
## Delete the original columns Subject and Activity
## Get the mean for every unique combination of Subject and Activity by
## grouping and summarising
## Write the resulting table to the desired text file
tidy <- mutate(total, SubjectActivity = paste(as.character(Subject), Activity))
tidy <- select(tidy, -Activity, -Subject)
tidy <- tidy %>% group_by(SubjectActivity) %>% summarise_each(funs(mean))
write.table(tidy, file="tidy.txt", row.name=FALSE)

## Return to working directory
setwd(oldwd)