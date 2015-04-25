Inputs
    
    zip file containing Dataset 
(assumption: the zip file is named "getdata_projectfiles_UCI HAR Dataset" which contains all the Train and Test data in the respective directories

Variables

    Extracted Data (train): 
    train_data: Training data extracted from the data file
    train_activity: Codes that describe the activity 
    train_subjects: The codes that specify the subjects for the activity
    
    Extracted Data (test): 
    test_data: Test data extracted from the data file
    test_activity: Codes that describe the activity 
    test_subjects: The codes that specify the subjects for the activity
    
    x_train / x_test: combined data sets with (activity, subjects and data)
    
    valid_column_names: column names were taken from the dataset to be used as variable names.  
    These names did not comply to the standard naming convention and had to be validated.  
    In the process some characters were truncated.
    
            "LAYING" 1 "tBodyAcc.mean...X" 0.22159824394
            "LAYING" 1 "tBodyAcc.mean...Y" -0.0405139534294
            "LAYING" 1 "tBodyAcc.mean...Z" -0.11320355358
            "LAYING" 1 "tBodyAcc.std...X" -0.9280564692
            "LAYING" 1 "tBodyAcc.std...Y" -0.83682740562
            "LAYING" 1 "tBodyAcc.std...Z" -0.826061401628
            "LAYING" 1 "tBodyAcc.mad...X" -0.9321111728
            "LAYING" 1 "tBodyAcc.mad...Y" -0.84091058864
            "LAYING" 1 "tBodyAcc.mad...Z" -0.82176998216
    
    merged_data: single merged dataset with the two datasets
    melted: the melt function was used to sumarize the data by the (2) variables "activity" and "subject"

Outputs:
    1. mean_std_measurements: Extract only the measurements on the mean and standard deviation for each measurement
    2. mean_subject_activity: independent tidy data set with the average of each variable for each activity 
        and each subject
    3. avg_var_activity_subject.txt: data file derived from mean_subject_activity

Processing:
    1. Download and Extract the zip file to a directory
    2. Copy the script (run_analysis.R) to the working directory
    3. Run the script to produce the output


=====================================================================================================

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
