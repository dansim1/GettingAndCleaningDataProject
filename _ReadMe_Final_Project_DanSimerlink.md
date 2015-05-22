#ReadMe_Final_Project

This ReadMe file contains a detailed explanation of the code used for this project. For details on the process used, as well as a description of the variables, please see "Codebook for Final Project.txt." 

The following explanation mirrors the flow of the code. Some items were included at the beginning of the code even though they were not needed until much later. This was done to ensure that everything would be preloaded for subsequent uses. Below are the detailed steps that the code follows.

1. Load and use the following packages. dplyr, tidyr
2. For the "test" files. Load the files and then...
  *Subset the row numbers so that only the mean and standard deviation remain (number of columns [before = 561, after = 70])
  *Read the column 1 Subject_Type file and add the column name "Subject_Type"
  *Read the column 2 Activity_Type file and add the column name "Activity_Type." Convert the Activity_Type numbers into the following easy-to-understand words.
    *WALKING 
    *WALKING_UPSTAIRS
    *WALKING_DOWNSTAIRS 
    *SITTING 
    *STANDING 
    *LAYING
  *Read the headings for the Measurement_Type, and subset the data so that it only contains the relevant 70 columns. Delete the unnecessary column numbers, and transpose the data. Replace the characters that will interfere with the mutate function (i.e. X, Y, Z, (), , ). Subset the data so that it only contains the 70 relevant columns and add the aforementioned headings to it. 
  *Use cbind to combine the three test files together. 
3. Repeat the process outlined in step two for the "train" data
4. Use rbind to combine the "test" and "train" data into a wide file. Create a data frame table using tbl_df
5. Use dplyr to group the data by Activity_Type then by Subject_Number. Chained "mutate" functions should be used to calculate the group mean for each combination of Activity_Type and Subject_Number. (Note: The chaining should be done in two sections to avoid stack overflow errors).
6. Remove duplicate rows using the "unique" function
7. Use the "gather" and "arrange" functions in the tidyr library to create a tidy dataset. The Subject_Number and Activity_Type columns can be used "as is", but the remaining 70 columns in the wide dataset need to be transposed into two columns (key value pairs)in order to create a short dataset. 

