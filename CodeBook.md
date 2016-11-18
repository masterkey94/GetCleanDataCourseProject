#run_analysis.R Code Book
CodeBook.md created 11/18/2016


##Objective of run_analysis.R
The object of run_analysis.R is to calculate the mean of the estimates of the mean and standard deviations for each feature for each subject's activity in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" that is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. (reference: "README.txt" file)

Please reference the 'README.txt' and 'features_info.txt' files located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for a full description of the data set and the features measured.


##run_analysis.R process
'run_analysis.R' is a set of code that combines the original train and trial data sets to calculate the mean value of the estimates of the mean and standard deviation of the measured features for each subject's activity.

* Downloaded and unzipped data files
* Added variable labels to training (x_train) and test (x_test) data sets
* Extracted mean and standard deviations of feature measurement estimates for both training (x_train) and test (x_test) data sets
* Created column 'set_type' to designate if subject is part of training or testing data set
* Combined train extracted data (mean and standard deviation calculations) with subjects (y_train) into train_data
* Combined test extracted data (mean and standard deviation calculations) with subjects (y_test) into test_data
* Combined training data (train_data) and testing data (test_data) into a single data table (complete_data)
* Converted activity column values into text labels
* Melted complete_data and performed mean calculation, resulting in result_data table
* Exported result_data table as week4_project_results.txt


##List of Variables

* subject - denotes the volunteer (values: #1 through #30)
* set_type - denotes if the subject belonged to the training or test data set (values: 'train' or 'test')
* activity - denotes the activity performed by the subject (values: 'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

The numeric variables listed below contain the mean value of the estimates of the mean and standard deviation of the specified feature for each subject's activity.  Note that "-XYZ" '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-mean()-XYZ
* tBodyAcc-std()-XYZ
* tGravityAcc-mean()-XYZ
* tGravityAcc-std()-XYZ
* tBodyAccJerk-mean()-XYZ
* tBodyAccJerk-std()-XYZ
* tBodyGyro-mean()-XYZ
* tBodyGyro-std()-XYZ
* tBodyGyroJerk-mean()-XYZ
* tBodyGyroJerk-std()-XYZ
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-XYZ
* fBodyAcc-std()-XYZ
* fBodyAcc-meanFreq()-XYZ
* fBodyAccJerk-mean()-XYZ
* fBodyAccJerk-std()-XYZ
* fBodyAccJerk-meanFreq()-XYZ
* fBodyGyro-mean()-XYZ
* fBodyGyro-std()-XYZ
* fBodyGyro-meanFreq()-XYZ
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()
