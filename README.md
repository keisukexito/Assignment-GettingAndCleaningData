## Getting and Cleaning Data Final Assignment

### This repository contains three files
### 1. README.md: 
(this file) which has descriptions of the scripts ("run_analysis.R") to create a tidy data file.
### 2. CODEBOOK.md: 
Code book of the tidy data.
### 3. run_analysis.R: 
script file to create a tidy data file ("Assignment-GettingAndCleaningData.txt") from Human Activity Recognition Using Smartphones Dataset

### Description of the script ("run_analysis.R")
1. Load library to reshape data frames
2. Read tables from the source data files 
  X_train.txt,
  y_train.txt,
  subject_train.txt,
  X_test.txt,
  y_test.txt,
  subject_test.txt,
  features.txt
  activity_labels.txt
3. Combine X, y, and subject data frames (data_train & data_test)
4. Combine train and test data frames (data_all)
5. Label the combined dataset with appropriate names
6. Extract only the measurements on the mean and standard deviation for each measurement (data_mean_std)
7. Use descriptive activity names to name the activities in the data set
8. Create tidy data set with the average of each variable for each activity and each subject (dataMean)
9. Write the tidy dataset to a file (Assignment-GettingAndCleaningData.txt) 
