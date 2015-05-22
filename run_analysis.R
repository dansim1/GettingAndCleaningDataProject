# load and use the following packages. dplyr, tidyr
library("dplyr")
library("tidyr")

# subset row numbers so that only the mean and standard deviation remain (before = 561, after = 70)
cols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 556:561)
rows <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 556:561)

# read the col1 subject type file
test_col1data <- read.table("UCI HAR Dataset/test/subject_test.txt")
# add the column name
colnames(test_col1data) <- "Subject_Number"
test_col1 <- test_col1data

# read the col2 activity type file
test_col2data <- read.table("UCI HAR Dataset/test/y_test.txt")
# add the column name
colnames(test_col2data) <- "Activity_Type"
test_col2 <- test_col2data
# convert the activity types "1-6" into easy-to-understand text
test_col2$Activity_Type[test_col2$Activity_Type==1] <- "Walking"
test_col2$Activity_Type[test_col2$Activity_Type==2] <- "Walking_Upstairs"
test_col2$Activity_Type[test_col2$Activity_Type==3] <- "Walking_Downstairs"
test_col2$Activity_Type[test_col2$Activity_Type==4] <- "Sitting"
test_col2$Activity_Type[test_col2$Activity_Type==5] <- "Standing"
test_col2$Activity_Type[test_col2$Activity_Type==6] <- "Laying"

# read the col3_72 headings for the measurement type
measuretype_data <- read.table("UCI HAR Dataset/features.txt")
# subset the data so it only contains the mean and standard deviation
subdelcolumn_measuretype_data <- measuretype_data[rows,]
# delete unnecessary column numbers
delcolumn_measuretype_data <- subdelcolumn_measuretype_data[,2]
# transpose the data (switch rows & columns)
test_colheadings_col3_72 <- t(delcolumn_measuretype_data)
# convert the col3_72 headings into text that without "-" signs
test_newcolheadings_col3_72 <-  gsub("-", "_",test_colheadings_col3_72)
# convert the col3_72 headings into text that without pseudo-variable names "X", "Y", "Z"
# these characters were changed since the "X" appeared to conflict with the mutate function
# note: use [()] to allow gsub to substitute the ()...
test_new2colheadings_col3_72 <-  gsub("X", "a",test_newcolheadings_col3_72)
test_new3colheadings_col3_72 <-  gsub("Y", "b",test_new2colheadings_col3_72)
test_new4colheadings_col3_72 <-  gsub("Z", "c",test_new3colheadings_col3_72)
test_new5colheadings_col3_72 <-  gsub("[()]", "",test_new4colheadings_col3_72)
test_new6colheadings_col3_72 <-  gsub("[,]", "_",test_new5colheadings_col3_72)

# read the col3_72 "values" data
col3_72test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
# subset the data so it only contains the mean and standard deviation
test_coldata_col3_72 <- col3_72test_data[,cols]
# add column names to data
colnames(test_coldata_col3_72) <- test_new6colheadings_col3_72
# create a copy of the col3_72 dataset
test_col3_72 <- test_coldata_col3_72

# use cbind to add the three test files together
test_col1_72 <- cbind(test_col1, test_col2, test_col3_72)

#### Repeat the above process for the training data
# read the col1 subject type file
train_col1data <- read.table("UCI HAR Dataset/train/subject_train.txt")
# add the column name
colnames(train_col1data) <- "Subject_Number"
train_col1 <- train_col1data

# read the col2 activity type file
train_col2data <- read.table("UCI HAR Dataset/train/y_train.txt")
# add the column name
colnames(train_col2data) <- "Activity_Type"
train_col2 <- train_col2data
# convert the activity types "1-6" into easy-to-understand text
train_col2$Activity_Type[train_col2$Activity_Type==1] <- "Walking"
train_col2$Activity_Type[train_col2$Activity_Type==2] <- "Walking_Upstairs"
train_col2$Activity_Type[train_col2$Activity_Type==3] <- "Walking_Downstairs"
train_col2$Activity_Type[train_col2$Activity_Type==4] <- "Sitting"
train_col2$Activity_Type[train_col2$Activity_Type==5] <- "Standing"
train_col2$Activity_Type[train_col2$Activity_Type==6] <- "Laying"

# read the col3_72 headings for the measurement type
measuretype_data <- read.table("UCI HAR Dataset/features.txt")
# subset the data so it only contains the mean and standard deviation
subdelcolumn_measuretype_data <- measuretype_data[rows,]
# delete unnecessary column numbers
delcolumn_measuretype_data <- subdelcolumn_measuretype_data[,2]
# transpose the data (switch rows & columns)
train_colheadings_col3_72 <- t(delcolumn_measuretype_data)
# convert the col3_72 headings into text that without "-" signs
train_newcolheadings_col3_72 <-  gsub("-", "_",train_colheadings_col3_72)
# convert the col3_72 headings into text that without pseudo-variable names "X", "Y", "Z"
# these characters were changed since they conflicted with the mutate function
train_new2colheadings_col3_72 <-  gsub("X", "a",train_newcolheadings_col3_72)
train_new3colheadings_col3_72 <-  gsub("Y", "b",train_new2colheadings_col3_72)
train_new4colheadings_col3_72 <-  gsub("Z", "c",train_new3colheadings_col3_72)
train_new5colheadings_col3_72 <-  gsub("[()]", "",train_new4colheadings_col3_72)
train_new6colheadings_col3_72 <-  gsub("[,]", "_",train_new5colheadings_col3_72)

# read the col3_72 "values" data
col3_72train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
# subset the data so it only contains the mean and standard deviation
train_coldata_col3_72 <- col3_72train_data[,cols]
# add column names to data
colnames(train_coldata_col3_72) <- train_new6colheadings_col3_72
# create a copy of the col3_72 dataset
train_col3_72 <- train_coldata_col3_72

# use cbind to add the three train files together
train_col1_72 <- cbind(train_col1, train_col2, train_col3_72)

### Use rbind to combine the test and train data into a "wide" file for non-DBAs
all_col1_72 <- rbind(test_col1_72, train_col1_72)

###############################################################
# create a data frame table
smartphone_data1 <- tbl_df(all_col1_72)
smartphone_data2 <- tbl_df(all_col1_72)

#View(smartphone_data)

#From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
# group the data for each activity type and each subject number

# note: review "Grouping and Chaining with dplyr" to troubleshoot the next section
grouped_smartphonedata1 <- smartphone_data1 %>%
  group_by(Activity_Type, Subject_Number) %>%
  mutate(GrouptBodyAcc_mean_a = mean(tBodyAcc_mean_a)) %>%
  mutate(GrouptBodyAcc_mean_b = mean(tBodyAcc_mean_b)) %>%
  mutate(GrouptBodyAcc_mean_c = mean(tBodyAcc_mean_c)) %>%
  mutate(GrouptBodyAcc_std_a = mean(tBodyAcc_std_a)) %>%
  mutate(GrouptBodyAcc_std_b = mean(tBodyAcc_std_b)) %>%
  mutate(GrouptBodyAcc_std_c = mean(tBodyAcc_std_c)) %>%
  mutate(GrouptGravityAcc_mean_a = mean(tGravityAcc_mean_a)) %>%
  mutate(GrouptGravityAcc_mean_b = mean(tGravityAcc_mean_b)) %>%
  mutate(GrouptGravityAcc_mean_c = mean(tGravityAcc_mean_c)) %>%
  mutate(GrouptGravityAcc_std_a = mean(tGravityAcc_std_a)) %>%
  mutate(GrouptGravityAcc_std_b = mean(tGravityAcc_std_b)) %>%
  mutate(GrouptGravityAcc_std_c = mean(tGravityAcc_std_c)) %>%
  mutate(GrouptBodyAccJerk_mean_a = mean(tBodyAccJerk_mean_a)) %>%
  mutate(GrouptBodyAccJerk_mean_b = mean(tBodyAccJerk_mean_b)) %>%
  mutate(GrouptBodyAccJerk_mean_c = mean(tBodyAccJerk_mean_c)) %>%
  mutate(GrouptBodyAccJerk_std_a = mean(tBodyAccJerk_std_a)) %>%
  mutate(GrouptBodyAccJerk_std_b = mean(tBodyAccJerk_std_b)) %>%
  mutate(GrouptBodyAccJerk_std_c = mean(tBodyAccJerk_std_c)) %>%
  mutate(GrouptBodyGyro_mean_a = mean(tBodyGyro_mean_a)) %>%
  mutate(GrouptBodyGyro_mean_b = mean(tBodyGyro_mean_b)) %>%
  mutate(GrouptBodyGyro_mean_c = mean(tBodyGyro_mean_c)) %>%
  mutate(GrouptBodyGyro_std_a = mean(tBodyGyro_std_a)) %>%
  mutate(GrouptBodyGyro_std_b = mean(tBodyGyro_std_b)) %>%
  mutate(GrouptBodyGyro_std_c = mean(tBodyGyro_std_c)) %>%
  mutate(GrouptBodyGyroJerk_mean_a = mean(tBodyGyroJerk_mean_a)) %>%
  mutate(GrouptBodyGyroJerk_mean_b = mean(tBodyGyroJerk_mean_b)) %>%
  mutate(GrouptBodyGyroJerk_mean_c = mean(tBodyGyroJerk_mean_c)) %>%
  mutate(GrouptBodyGyroJerk_std_a = mean(tBodyGyroJerk_std_a)) %>%
  mutate(GrouptBodyGyroJerk_std_b = mean(tBodyGyroJerk_std_b)) %>%
  mutate(GrouptBodyGyroJerk_std_c = mean(tBodyGyroJerk_std_c)) %>%
  mutate(GrouptBodyAccMag_mean = mean(tBodyAccMag_mean)) %>%
  mutate(GrouptBodyAccMag_std = mean(tBodyAccMag_std)) %>%
  mutate(GrouptGravityAccMag_mean = mean(tGravityAccMag_mean)) %>%
  mutate(GrouptGravityAccMag_std = mean(tGravityAccMag_std)) %>%
  mutate(GrouptBodyGyroMag_mean = mean(tBodyGyroMag_mean)) %>%
  mutate(GrouptBodyGyroMag_std = mean(tBodyGyroMag_std)) %>%
  mutate(GrouptBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean)) %>%
  mutate(GrouptBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std)) %>%
  mutate(GroupfBodyAcc_mean_a = mean(fBodyAcc_mean_a)) %>%
  mutate(GroupfBodyAcc_mean_b = mean(fBodyAcc_mean_b)) %>%
  mutate(GroupfBodyAcc_mean_c = mean(fBodyAcc_mean_c)) %>%
  mutate(GroupfBodyAcc_std_a = mean(fBodyAcc_std_a)) %>%
  mutate(GroupfBodyAcc_std_b = mean(fBodyAcc_std_b)) %>%
  mutate(GroupfBodyAcc_std_c = mean(fBodyAcc_std_c)) %>%
    select(-(tBodyAcc_mean_a:anglec_gravityMean))
#View(grouped_smartphonedata1) 

grouped_smartphonedata2 <- smartphone_data2 %>%
  group_by(Activity_Type, Subject_Number) %>%      
  mutate(GroupfBodyAccJerk_mean_a = mean(fBodyAccJerk_mean_a)) %>%           
  mutate(GroupfBodyAccJerk_mean_b = mean(fBodyAccJerk_mean_b)) %>%
  mutate(GroupfBodyAccJerk_mean_c = mean(fBodyAccJerk_mean_c)) %>%
  mutate(GroupfBodyAccJerk_std_a = mean(fBodyAccJerk_std_a)) %>%
  mutate(GroupfBodyAccJerk_std_b = mean(fBodyAccJerk_std_b)) %>%
  mutate(GroupfBodyAccJerk_std_c = mean(fBodyAccJerk_std_c)) %>%
  mutate(GroupfBodyGyro_mean_a = mean(fBodyGyro_mean_a)) %>%
  mutate(GroupfBodyGyro_mean_b = mean(fBodyGyro_mean_b)) %>%
  mutate(GroupfBodyGyro_mean_c = mean(fBodyGyro_mean_c)) %>%
  mutate(GroupfBodyGyro_std_a = mean(fBodyGyro_std_a)) %>%
  mutate(GroupfBodyGyro_std_b = mean(fBodyGyro_std_b)) %>%
  mutate(GroupfBodyGyro_std_c = mean(fBodyGyro_std_c)) %>%
  mutate(GroupfBodyAccMag_mean = mean(fBodyAccMag_mean)) %>%
  mutate(GroupfBodyAccMag_std = mean(fBodyAccMag_std)) %>%
  mutate(GroupfBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean)) %>%
  mutate(GroupfBodyBodyAccJerkMag_std = mean(fBodyBodyAccJerkMag_std)) %>%
  mutate(GroupfBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean)) %>%
  mutate(GroupfBodyBodyGyroMag_std = mean(fBodyBodyGyroMag_std)) %>%
  mutate(GroupfBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean)) %>%
  mutate(GroupfBodyBodyGyroJerkMag_std = mean(fBodyBodyGyroJerkMag_std)) %>%
  mutate(GroupangletBodyAccJerkMean_gravityMean = mean(angletBodyAccJerkMean_gravityMean)) %>%
  mutate(GroupangletBodyGyroMean_gravityMean = mean(angletBodyGyroMean_gravityMean)) %>%
  mutate(GroupangletBodyGyroJerkMean_gravityMean = mean(angletBodyGyroJerkMean_gravityMean)) %>%
  mutate(Groupanglea_gravityMean = mean(anglea_gravityMean)) %>%
  mutate(Groupangleb_gravityMean = mean(angleb_gravityMean)) %>%
  mutate(Groupanglec_gravityMean = mean(anglec_gravityMean)) %>%
    select(-(Subject_Number:anglec_gravityMean)) 
        #View(grouped_smartphonedata2)

# since the "select" statement did not delete the first two columns, the following statement was used
grouped_smartphonedata2a <- grouped_smartphonedata2[, -c(1:2)]

grouped_smartphonedata3 <- cbind(grouped_smartphonedata1, grouped_smartphonedata2a)  
#Remove duplicate rows
grouped_smartphonedata4 <- unique(grouped_smartphonedata3)

#Create a tidy dataset
grouped_smartphonedata5 <- gather(grouped_smartphonedata4, Measurement, Value, GrouptBodyAcc_mean_a:Groupanglec_gravityMean)
grouped_smartphonedata6 <- arrange(grouped_smartphonedata5, Subject_Number, Activity_Type)
#dim(grouped_smartphonedata6)
View(grouped_smartphonedata6)
#write.table(grouped_smartphonedata6, file = "DataProjectFile_DanSimerlink.txt", row.name=FALSE)
summary(grouped_smartphonedata6, maxsum = 13000)
sapply(grouped_smartphonedata6, class)
