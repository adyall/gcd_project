setwd("~/Coursera/gcd_project")

data_dir <- "getdata_projectfiles_UCI HAR Dataset"

if (file.exists(data_dir)){

          ## Get Training Data set
          train_data     <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
          train_activity <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
          train_subjects <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
          
          
          ## Get Test Data set
          test_data     <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
          test_activity <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
          test_subjects <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
          
          ## 1. Merge the training and the test sets to create one data set.
          x_train <- cbind(train_activity, train_subjects,train_data)
          x_test  <- cbind(test_activity, test_subjects, test_data)
          
          merged_data <- rbind(x_train, x_test)
          
          ## 4. Appropriately label the data set with descriptive variable names
          activity_labels  <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
          Variable_names   <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt" , stringsAsFactors = FALSE)
          valid_column_names <- make.names(names=Variable_names$V2, unique=TRUE, allow_ = TRUE)
          x <- length(valid_column_names) + 2
          
          names(merged_data)[1]   <- "activity"
          names(merged_data)[2]   <- "subject"
          names(merged_data)[3:x]  <- valid_column_names
          
          
          ## 3. Usesdescriptive activity names to name the activities in the data set
          merged_data <- mutate(merged_data, activity = 
                            ifelse (activity == 1, activity_labels$V2[1], 
                            ifelse (activity == 2, activity_labels$V2[2],
                            ifelse (activity == 3, activity_labels$V2[3], 
                            ifelse (activity == 4, activity_labels$V2[4],
                            ifelse (activity == 5, activity_labels$V2[5],
                            ifelse (activity == 6, activity_labels$V2[6],
                            NA)))))))
          
          
          ## 2. Extract only the measurements on the mean and standard deviation for each measurement
          mean_std_measurements <- merged_data %>% 
                                   select(subject, activity, contains("mean"), contains("std"))
          
          
          ## 5. From the data set in step 4, 
          ##    creates a second, independent tidy data set with the average of each variable for each activity and each subject.
          
          melted <- melt(merged_data, id.vars=c("activity", "subject"))
          mean_subject_activity <- ddply(melted, 
                                         c("activity", "subject", "variable"), 
                                         summarise,
                                         mean = mean(value, na.rm = TRUE))
          
          write.table(mean_subject_activity,
                      file="./avg_var_activity_subject.txt", 
                      na = 'NA', 
                      sep = ' ',
                      row.names = FALSE, 
                      col.names = TRUE)

} else {
  print("No data to process...")
  
}
