# GettingCleaningData
Coursera Assignment Wk 4

This Repo is the submission for Getting and Cleaning Data end of course project

Dataset can be found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files:

CodeBook.md:
  Code Book which describes varaibles, data, and how the data was cleaned

run_Analysis.R:
  Preps data as described by the course project by doing the following:
     1. Merges the training and the test sets to create one data set.
     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
     3. Uses descriptive activity names to name the activities in the data set
     4. Appropriately labels the data set with descriptive variable names. 
     5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Summary.txt:
  The data from part 5 of run_Analysis.R which summarizes the data
