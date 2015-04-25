Variables

Extracted Data (train): 
train_data: Training data extracted from the data file
train_activity: Codes that describe the activity 
train_subjects: The codes that specify the subjects for the activity

Extracted Data (test): 
test_data: Test data extracted from the data file
test_activity: Codes that describe the activity 
test_subjects: The codes that specify the subjects for the activity

x_train / x_test: comboned data sets with (activity, subjects and data

merged_data: single merged dataset with the two datasets

Outputs:
mean_std_measurements: Extract only the measurements on the mean and standard deviation for each measurement
mean_subject_activity: independent tidy data set with the average of each variable for each activity and each subject
avg_var_activity_subject.txt: data file derived from mean_subject_activity

Processing:
1. Download and Extract the zip file to a directory
2. Copy the script (run_analysis.R) to the working directory
3. Run the script to produce the output
