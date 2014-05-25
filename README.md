getdata-003-prac
================
This readme file discribes the files in this repository and explains the run_analysis.R script file in depth.

## Files
### CodeBook.md
A code book describing the data and how it was created.

### README.md
This read me file.

### UCI HAR Dataset.zip
The zipped original data.

### X_headers.txt
A merged file of all the X headers from both the training and test data files.

### X_merged.txt
A merged file of all the X values from both the training and test data files.

### Y_merged.txt
A merged file of all the Y (activity) values from both the training and test data files.

### activities.txt
A merged file of all the Y (activity) headers from both the training and test data files.

### cleanedfeatures.txt
A manually created file listing all the required X variables together with a new 'tidy' name.

### run_analysis.R
An R script file containing all the code to create the tidy data.

### tidy_data.csv
The resultant tidy data file.

## Scripts
All the scripts for this assignment are contained in the run_analysis.R file.  
This file contains one function, tidy_data(), which performs the entire transformation. It loads up the testing and training data along with headings for both the X and Y files and merges them into the X_headers.txt, X_merged.txt, Y_merged.txt and activities.txt files menationed above.

These files are then loaded up into R and merged together to create a unified dataset with only the required variables as specified in the cleanedfeatures.txt file. This dataset is then aggregated via the means function to get the mean(average) value for each reading per activity. The aggregated data have their column and rows inverted and we use the t function to swith them around to create the final tidy data.

### Execution
In order to generate the final tidy dataset the following commands need to be executed:  
* source("run_analysis.R")  
* tidy_data()


