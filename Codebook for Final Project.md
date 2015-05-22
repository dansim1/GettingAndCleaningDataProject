---
title: "Codebook for Final Project"
author: "Dan Simerlink"
date: "May 24, 2015"
output: 
  html_document:
    keep_md: yes
---
 
## Project Description
This project consisted of analyzing accelerometer and and gyroscope data from Samsung Galaxy S smartphones. 
 
##Study design and data processing
The study was conducted with a group of 30 volunteers ages 19-48. The following activities were conducted by the volunteers and the data was captured via a Samsung Galaxy S II Smartphone. 
	WALKING 
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS 
	SITTING 
	STANDING 
	LAYING
 
###Collection of the raw data
The accelerometer and gyroscope signals were captured in 3-axial linear acceleration and 3-axial angular velocity readings. This data was captured for each subject and each of the six activities mentioned in the previous section. 
 
###Notes on the original (raw) data 
The raw data descriptions from the original readme file are inserted below:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
The following steps were taken to create the tidy data set.
1) The "dplyr" and "tidyr" libraries were loaded 
2) read.table was used to load the data
3) The 651 columns were subsetted so that only the 70 "mean & standard deviation" columns remained
4) The data was cleaned and cbind was used to combine the files (note: see "cleaning of the data" section for details)
5) To avoid stack overflow errors, two data frame tables were created using "tbl_df"
6) dplyr was used to group the data by Activity_Type and Subject_Number. Since this was a chained function, the "mutate" functions were done at the same time to calculated the mean of each of the aforementioned groups. 
7) The resulting "wide" file was turned into a "long" file using the "gather" and "arrange" functions of tidyr
 
###Cleaning of the data
Many steps were taken to clean the data and below are the highlights.
	Subset the row numbers so that only the mean and standard deviation remain (number of columns [before = 561, after = 70])
	Insert easy to read column and row names
	Replace the characters that will interfere with the mutate function (i.e. X, Y, Z, (), , ).
	Remove duplicate rows using the "unique" function
A detailed explanation may be found in "_ReadMe_Final_Project_DanSimerlink.txt."
 
##Description of the variables

 - The resulting dataset is 12,600 rows x 4 columns. The column headings and first six rows afre shown below.
 
 Subject_Number	Activity_Type	Measurement	Value
1	Laying	GrouptBodyAcc_mean_a	0.2215982439
1	Laying	GrouptBodyAcc_mean_b	-0.0405139534
1	Laying	GrouptBodyAcc_mean_c	-0.1132035536
1	Laying	GrouptBodyAcc_std_a	-0.9280564692
1	Laying	GrouptBodyAcc_std_b	-0.8368274056
1	Laying	GrouptBodyAcc_std_c	-0.8260614016

 - The data shown above is grouped by Subject_Number, then by Activity_Number, and then by Measurement. The data in this *.txt file is separated by spaces.
 
 - Variables present in the dataset
 The following variables are present in this dataset
 1) Subject_Number 
	1-30
 2) Activity_Type 
 	WALKING 
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS 
	SITTING 
	STANDING 
	LAYING
3) Measurement (Note: These are the calculated means for each distinct group of Subject_Number and Activity_Type)
	GrouptBodyAcc_mean_a
	GrouptBodyAcc_mean_b
	GrouptBodyAcc_mean_c
	GrouptBodyAcc_std_a
	GrouptBodyAcc_std_b
	GrouptBodyAcc_std_c
	GrouptGravityAcc_mean_a
	GrouptGravityAcc_mean_b
	GrouptGravityAcc_mean_c
	GrouptGravityAcc_std_a
	GrouptGravityAcc_std_b
	GrouptGravityAcc_std_c
	GrouptBodyAccJerk_mean_a
	GrouptBodyAccJerk_mean_b
	GrouptBodyAccJerk_mean_c
	GrouptBodyAccJerk_std_a
	GrouptBodyAccJerk_std_b
	GrouptBodyAccJerk_std_c
	GrouptBodyGyro_mean_a
	GrouptBodyGyro_mean_b
	GrouptBodyGyro_mean_c
	GrouptBodyGyro_std_a
	GrouptBodyGyro_std_b
	GrouptBodyGyro_std_c
	GrouptBodyGyroJerk_mean_a
	GrouptBodyGyroJerk_mean_b
	GrouptBodyGyroJerk_mean_c
	GrouptBodyGyroJerk_std_a
	GrouptBodyGyroJerk_std_b
	GrouptBodyGyroJerk_std_c
	GrouptBodyAccMag_mean
	GrouptBodyAccMag_std
	GrouptGravityAccMag_mean
	GrouptGravityAccMag_std
	GrouptBodyGyroMag_mean
	GrouptBodyGyroMag_std
	GrouptBodyGyroJerkMag_mean
	GrouptBodyGyroJerkMag_std
	GroupfBodyAcc_mean_a
	GroupfBodyAcc_mean_b
	GroupfBodyAcc_mean_c
	GroupfBodyAcc_std_a
	GroupfBodyAcc_std_b
	GroupfBodyAcc_std_c
	GroupfBodyAccJerk_mean_a
	GroupfBodyAccJerk_mean_b
	GroupfBodyAccJerk_mean_c
	GroupfBodyAccJerk_std_a
	GroupfBodyAccJerk_std_b
	GroupfBodyAccJerk_std_c
	GroupfBodyGyro_mean_a
	GroupfBodyGyro_mean_b
	GroupfBodyGyro_mean_c
	GroupfBodyGyro_std_a
	GroupfBodyGyro_std_b
	GroupfBodyGyro_std_c
	GroupfBodyAccMag_mean
	GroupfBodyAccMag_std
	GroupfBodyBodyAccJerkMag_mean
	GroupfBodyBodyAccJerkMag_std
	GroupfBodyBodyGyroMag_mean
	GroupfBodyBodyGyroMag_std
	GroupfBodyBodyGyroJerkMag_mean
	GroupfBodyBodyGyroJerkMag_std
	GroupangletBodyAccJerkMean_gravityMean
	GroupangletBodyGyroMean_gravityMean
	GroupangletBodyGyroJerkMean_gravityMean
	Groupanglea_gravityMean
	Groupangleb_gravityMean
	Groupanglec_gravityMean
4) Value
The values are listed for each unique combination of the previous three items. 

###Variable 1 (repeat this section for all variables in the dataset)
A summary of the data in the tidy dataset is shown below:

Subject_Number  Activity_Type    Measurement          Value 
     "integer"    "character"       "factor"      "numeric" 

 Subject_Number Activity_Type     
 Min.   : 1.0   Length:12600      
 1st Qu.: 8.0    
 Median :15.5    
 Mean   :15.5                     
 3rd Qu.:23.0                     
 Max.   :30.0  
                                          
 GrouptBodyAcc_mean_a	:180      
 GrouptBodyAcc_mean_b	:180   
 GrouptBodyAcc_mean_c	:180   
 GrouptBodyAcc_std_a	:180   
 GrouptBodyAcc_std_b	:180   
 GrouptBodyAcc_std_c	:180   
 GrouptGravityAcc_mean_a	:180                     
 GrouptGravityAcc_mean_b	:180                     
 GrouptGravityAcc_mean_c	:180                     
 GrouptGravityAcc_std_a	:180                     
 GrouptGravityAcc_std_b	:180                     
 GrouptGravityAcc_std_c	:180                     
 GrouptBodyAccJerk_mean_a	:180                     
 GrouptBodyAccJerk_mean_b	:180                     
 GrouptBodyAccJerk_mean_c	:180                     
 GrouptBodyAccJerk_std_a	:180                     
 GrouptBodyAccJerk_std_b	:180                     
 GrouptBodyAccJerk_std_c	:180                     
 GrouptBodyGyro_mean_a	:180                     
 GrouptBodyGyro_mean_b	:180                     
 GrouptBodyGyro_mean_c	:180                     
 GrouptBodyGyro_std_a	:180                     
 GrouptBodyGyro_std_b	:180                     
 GrouptBodyGyro_std_c	:180                     
 GrouptBodyGyroJerk_mean_a	:180                     
 GrouptBodyGyroJerk_mean_b	:180                     
 GrouptBodyGyroJerk_mean_c	:180                     
 GrouptBodyGyroJerk_std_a	:180                     
 GrouptBodyGyroJerk_std_b	:180                     
 GrouptBodyGyroJerk_std_c	:180                     
 GrouptBodyAccMag_mean	:180                     
 GrouptBodyAccMag_std	:180                     
 GrouptGravityAccMag_mean	:180                     
 GrouptGravityAccMag_std	:180                     
 GrouptBodyGyroMag_mean	:180                     
 GrouptBodyGyroMag_std	:180                     
 GrouptBodyGyroJerkMag_mean	:180                     
 GrouptBodyGyroJerkMag_std	:180                     
 GroupfBodyAcc_mean_a	:180                     
 GroupfBodyAcc_mean_b	:180                     
 GroupfBodyAcc_mean_c	:180                     
 GroupfBodyAcc_std_a	:180                     
 GroupfBodyAcc_std_b	:180                     
 GroupfBodyAcc_std_c	:180                     
 GroupfBodyAccJerk_mean_a	:180                     
 GroupfBodyAccJerk_mean_b	:180                     
 GroupfBodyAccJerk_mean_c	:180                     
 GroupfBodyAccJerk_std_a	:180                     
 GroupfBodyAccJerk_std_b	:180                     
 GroupfBodyAccJerk_std_c	:180                     
 GroupfBodyGyro_mean_a	:180                     
 GroupfBodyGyro_mean_b	:180                     
 GroupfBodyGyro_mean_c	:180                     
 GroupfBodyGyro_std_a	:180                     
 GroupfBodyGyro_std_b	:180                     
 GroupfBodyGyro_std_c	:180                     
 GroupfBodyAccMag_mean	:180                     
 GroupfBodyAccMag_std	:180                     
 GroupfBodyBodyAccJerkMag_mean	:180                     
 GroupfBodyBodyAccJerkMag_std	:180                     
 GroupfBodyBodyGyroMag_mean	:180                     
 GroupfBodyBodyGyroMag_std	:180                     
 GroupfBodyBodyGyroJerkMag_mean	:180                     
 GroupfBodyBodyGyroJerkMag_std	:180                 
 GroupangletBodyAccJerkMean_gravityMean: 180                     
 GroupangletBodyGyroMean_gravityMean	:180                     
 GroupangletBodyGyroJerkMean_gravityMean:180                     
 Groupanglea_gravityMean	:180                     
 Groupangleb_gravityMean	:180                     
 Groupanglec_gravityMean	:180                 
 
##Sources 
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
 
##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
