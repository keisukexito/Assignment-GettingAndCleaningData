## Getting and Cleaning Data
## Final Assignment

## Load library to reshape data frames
library(reshape2)

## Read tables from the source data files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
data_names <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

## Combine X, y, and subject data
data_train <- cbind(subject_train, y_train, X_train)
data_test <- cbind(subject_test, y_test, X_test)

## Combine train and test data
data_all <- rbind(data_train, data_test)

## Label the dataset with appropriate names
data_names_vector <- data_names[,"V2"]
data_names_vector_new <- c("subject","activity", data_names_vector)
names(data_all) <- data_names_vector_new

## Extract only the measurements on the mean and standard deviation for each measurement.
mean_std_colnum <- grep("mean\\(|std\\(", data_names_vector_new)
mean_std_colnum_new <- c(1:2,mean_std_colnum)
data_mean_std <- data_all[,mean_std_colnum_new]

## Use descriptive activity names to name the activities in the data set
activity_names_vector <- activity_names[,"V2"]
data_mean_std$activity <- activity_names_vector[data_mean_std$activity]

## Create tidy data set with the average of each variable for each activity and each subject
variables <- names(data_all)[mean_std_colnum]
dataMelt <- melt(data_mean_std, id=c("activity","subject"), measure.vars=variables)
dataMean <- dcast(dataMelt,activity + subject ~ variable, mean)
write.table(dataMean,file="Assignment-GettingAndCleaningData.txt",row.name=FALSE)
