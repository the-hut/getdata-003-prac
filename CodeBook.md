# Getting and Cleaning Data Practical Assignment Code Book  
This code book describes the variables, measured data and the process that was followed to clean up to dataset provided for this practical assignment.

## Variables  
The variables in the clean dataset relate to a subset of features from the orinal dataset. From the original feature selection the following information is given:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

From that original dataset the mean and standard deviation variables from each measurement have been extracted. For the purposes of this data cleansing the following decision was made regarding mean and standard deviation values:  
* Only those variables ending in mean() or std(), with an optional -XYZ direction, were included.

The selected labels take on a standard readable format that can be derived from the original feature selection quoted above.  
Body refers to the body acceleration.  
Gravity refers to gravitational acceleration.  
Acceleration refers to the reading for the accelerometer.  
Time refers to time domain signals.  
AngularVelocity refers to the rate of change of angular displacement.  
Magnitude refers to the three-dimensional signal calculated using Euclidean norm.  
Jerk refers to body linear acceleration and angular velocity signals derived in time.  
Gyroscope refers to the gyroscopic signals.  
Frequency refers to the application of a Fast Fourier Transform.  

This resulted in 64 variables having the following lables:
* "BodyAccelerationTimeMeanX"
* "BodyAccelerationTimeMeanY"
* "BodyAccelerationTimeMeanZ"
* "BodyAccelerationTimeStdX"
* "BodyAccelerationTimeStdY"
* "BodyAccelerationTimeStdZ"
* "GravityAccelerationTimeMeanX"
* "GravityAccelerationTimeMeanY"
* "GravityAccelerationTimeMeanZ"
* "GravityAccelerationTimeStdX"
* "GravityAccelerationTimeStdY"
* "GravityAccelerationTimeStdZ"
* "BodyAccelerationJerkTimeMeanX"
* "BodyAccelerationJerkTimeMeanY"
* "BodyAccelerationJerkTimeMeanZ"
* "BodyAccelerationJerkTimeStdX"
* "BodyAccelerationJerkTimeStdY"
* "BodyAccelerationJerkTimeStdZ"
* "BodyGyroscopeTimeMeanX"
* "BodyGyroscopeTimeMeanY"
* "BodyGyroscopeTimeMeanZ"
* "BodyGyroscopeTimeStdX"
* "BodyGyroscopeTimeStdY"
* "BodyGyroscopeTimeStdZ"
* "BodyAngularVelocityMeanX"
* "BodyAngularVelocityMeanY"
* "BodyAngularVelocityMeanZ"
* "BodyAngularVelocityStdX"
* "BodyAngularVelocityStdY"
* "BodyAngularVelocityStdZ"
* "BodyAccelerationMagnitudeTimeMean"
* "BodyAccelerationMagnitudeTimeStd"
* "GravityAccelerationMagnitudeTimeMean"
* "GravityAccelerationMagnitudeTimeStd"
* "BodyAccelerationJerkMagnitudeTimeMean"
* "BodyAccelerationJerkMagnitudeTimeStd"
* "BodyGyroscopeMagnitudeTimeMean"
* "BodyGyroscopeMagnitudeTimeStd"
* "BodyGyroscopeJerkMagnitudeTimeMean"
* "BodyGyroscopeJerkMagnitudeTimeStd"
* "BodyAccelerationFrequencyMeanX"
* "BodyAccelerationFrequencyMeanY"
* "BodyAccelerationFrequencyMeanZ"
* "BodyAccelerationFrequencyStdX"
* "BodyAccelerationFrequencyStdY"
* "BodyAccelerationFrequencyStdZ"
* "BodyAccelerationJerkFrequencyMeanX"
* "BodyAccelerationJerkFrequencyMeanY"
* "BodyAccelerationJerkFrequencyMeanZ"
* "BodyAccelerationJerkFrequencyStdX"
* "BodyAccelerationJerkFrequencyStdY"
* "BodyAccelerationJerkFrequencyStdZ"
* "BodyGyroscopeFrequencyMeanX"
* "BodyGyroscopeFrequencyMeanY"
* "BodyGyroscopeFrequencyMeanZ"
* "BodyGyroscopeFrequencyStdX"
* "BodyGyroscopeFrequencyStdY"
* "BodyGyroscopeFrequencyStdZ"
* "BodyAccelerationMagnitudeFrequencyMean"
* "BodyAccelerationMagnitudeFrequencyStd"
* "BodyGyroscopeMagnitudeFrequencyMean"
* "BodyGyroscopeMagnitudeFrequencyStd"
* "BodyGyroscopeJerkMagnitudeFrequencyMean"
* "BodyGyroscopeJerkMagnitudeFrequencyStd"

## Data  
The resultant data are made up of one row for each of the variables mentioned above. The values represent the average value for the given variable in one of six different movements:  
* Laying
* Sitting
* Standing
* Walking
* Walking downstairs
* Walking upstairs

A sample header and row would look like:  
**SUBJECT**	**SITTING**	**STANDING**	**WALKING**	**WALKING_DOWNSTAIRS**	**WALKING_UPSTAIRS**  
BodyAccelerationFrequencyMeanX	0.3301359	0.3702165	0.3444245	0.3151089	0.2771606	0.3316856

The resultant dataset contains 7 columns and 64 rows.

## Transformations  
In order to transform the data into a tidy dataset a number of transformations needed to be performed:
* The feature headings were extracted from the zip file and loaded into R.
* The training and test data for the movements were extracted from the zip file, loaded into R and merged into one dataset.
* The activity headings were extracted from the zip file and loaded into R.
* The training and test data for the activity types were extracted from the zip file, loaded into R and merged into one dataset.
* All of these objects were saved to the file system as: X_headers.txt, X_merged.txt, activities.txt and Y_merged.txt
* The variables required for the tidy dataset were identified and a new file file was manually created with a mapping of the original variable name and the new tidy variable name. This file is called cleanedfeatures.txt
* cleanedfeatures.txt contains the 64 label mappings in the following format ("original_name","new_name"): "tBodyAcc-mean()-X","BodyAccelerationTimeMeanX"

Once all those files are in place the following processes can be run on the newly created files:
* Load up the X header labels file.
* Load up the cleaned features file.
* Merge the X header and cleaned features data frames together with an outer join resulting in 64 columns being mapped and the rest with NA values.
* Cast the merged header values to character.
* Update the NA values to the word "Discard".
* Load up the X merged data with the previously merged header values. Note that all the unwanted columns with get labels in the format "Discard.x", with x being a number.
* Load up the activity labels.
* Load up the Y merged data.
* Merge the Y data with the activity labels.
* Because the X and Y data have the same number of rows and are in the same order we can now append the Y data, using the activity labels, to the X data with a new column called Activity.
* All the columns containing the word "Discard" are then removed from the data frame.
* The data are aggregated by the means of the Activity.
* We then use the t function to switch the rows and columns of the data frame to get the data in the required format.
* This tidy data frame is then written out to a file called tidy_data.csv


