library(dplyr)

#initiate download from url and check for file existence

fname <- "Coursera_DS3_Final.zip"
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(fname)){
  download.file(furl, fname, method="curl")
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(fname) 
}

#store feature and activity data into tables within R

feat <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","func"))
act <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("cd","act"))

#store test data into tables within R

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subj")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feat$func)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "cd")

#store training data into tables within R

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subj")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feat$func)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "cd")

#combine training and test

subject_comb <- rbind(subject_test, subject_train)
X_comb <- rbind(X_train, X_test)
y_comb <- rbind(y_train, y_test)

#put the data into one big file
mergedData <- cbind(subject_comb, X_comb, y_comb)

#clean the data into just the mean/stddev and subject
tidy <- mergedData %>% select(subj, cd, contains("mean"), contains("std"))

#names activities what they were labeled instead of using the code
tidy$cd <- act[tidy$cd, 2] 

#label the data set with descriptive variable names
names(tidy)[2] <- "activity"

names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))

#create independent tidy data set with the average of each variable for each activity and each subject
tidySummary <- tidy %>%  group_by(subj, activity) %>%  summarise_all(mean)
write.table(tidySummary, "Summary.txt")

