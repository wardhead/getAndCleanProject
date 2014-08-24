getAndCleanProject
==================

project for getting and cleaning data course

This repo contains an R script that works with data from UCI Machine Learning Repository.  The script assumes the data is located in the directory "UCI HAR Dataset" directly under the working directory.  It performs the following tasks: 

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

There is an output file that contains the tidy data set.  The code book for the variables was provided with the 
raw data.