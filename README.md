# gcd_project
Repository for Getting and Cleaning Data Project

This project was undertaken to achieve the requirements to complete the project for the Getting and Cleaning Data Coursera Course.

The specific requirements were as follows:

1. Download and extract smartphone data from the following location: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2. Perform the following tasks:
    <ul> a. create one R script called run_analysis.R that does the following. </ul>
    <ul> b. Merges the training and the test sets to create one data set. </ul>
    <ul> c. Extracts only the measurements on the mean and standard deviation for each measurement. </ul>
    <ul> d. Uses descriptive activity names to name the activities in the data set </ul>
    <ul> e. Appropriately labels the data set with descriptive variable names. </ul>
    <ul> f. From the data set in step 4, creates a second, independent tidy data set with the average of each variable                  for each activity and each subject. </ul>

A script was created to perform the tasks (run_analysis.R).  

The script should be placed in the directory where the downloaded data is extracted.  If no data is found then nothing is processed.  If the extracted data directory is found then the script processes the data files and produces the output dataset specified in task (2f).

This is version 1.0 so only rudimentary checks are done.  It is assumed that if the data directory exists then the data files should be extracted in their corresponding directories.

