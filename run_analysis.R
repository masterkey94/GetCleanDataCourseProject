#  Getting and Cleaning Data Week 4 Project

#  The resulting data table will have the following columns
#  subject (1:30) | set_type e.g. (train or test) | activity (e.g. Walking, etc.) | feature 1 | ... | feature n
#  Which meet the criteria for TIDY DATA:
#  1) Each variable forms a column - each feature in the data set is considered a variable
#  2) Each observation forms a row - the combination of subject and activity forms an observation
#  3) Each type of observation unit forms a table - all observations of 30 subjects with 6 activities from this 
#     experiment constitute data for a single experiment


#  install dplyr and reshape package
library(dplyr)
library(reshape2)
print("dplyr and reshape2 packages installed")


#  Load zip data file and unzip data files
zipfilename <- "data.zip"
if(!file.exists(zipfilename)) {
  FileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(FileURL, zipfilename)
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipfilename) 
}

print("data files downloaded and unzipped")


#  Load text files into memory
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "subject"
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", sep = "")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "subject"
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", sep = "")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

print("text files have been loaded")


#  Add column labels ("features.txt") to "x_train" and "x_test" tables
names(x_test) <- features[,2]
names(x_train) <- features[,2]


#  Subset train and test variables to mean() and std() of measurements only
req_columns <- grep(".*mean.*|.*std.*", features[,2])
x_train_req <- x_train[, req_columns]
x_test_req <- x_test[, req_columns]


#  Create "set_train" and "set_test" vector to designate set_type (if subject was assigned for to training or testing set)
set_train <- c(rep(c("train"), times= nrow(y_train)))
set_test <- c(rep(c("test"), times= nrow(y_test)))


#  Merge the following text files to create a data table of training and testing data
train_data <- cbind(subject_train, set_train, y_train, x_train_req)
train_data <- rename(train_data, set_type = set_train, activity = V1)
test_data <- cbind(subject_test, set_test, y_test, x_test_req)
test_data <- rename(test_data, set_type = set_test, activity = V1)

print("training and testing data have been merged into separate tables, respectively")


#  Merge training and testing data into one data table
complete_data <- rbind(train_data, test_data)


#  Reassign subject and activity to factors
complete_data$subject <- as.factor(complete_data$subject)
complete_data$activity <- factor(complete_data$activity, activity_labels[,1], labels = activity_labels[,2])

print("training and testing data have been merged into one table")


#  Melt dataset and calculate mean values for all measurements
melt_data <- melt(complete_data, id=c("subject", "set_type", "activity"))
result_data <- dcast(melt_data, subject + set_type + activity ~ variable, mean)

print("Mean calculations completed")


#  Write result_data table to csv file
write.table(result_data, file = "week4_project_results.txt", quote=FALSE, row.names = FALSE)

print("data written to file week4_prodject_results.txt")
