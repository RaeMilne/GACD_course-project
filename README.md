#README.md

##Original Data 

Original data downloaded from this source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original data include the following files:

'README.txt': Details the experiment and the features measured during the experiment. This document is included in full below for reference.

'activity_labels.txt': A list of the activities that subjects participated in during the experiment

'features_info.txt': A description of the variables that were measured in the experiment

'features.txt': A list of the variables that were measured

THE TEST SET
'test/subject_test.txt': Each row identifies the subject
'test/y_test.txt': Each row identifies the activity performed
'test/X_test.txt': Each row identifies the variables measured
'test/Inertial Signals': not used for this data set 

THE TRAINING SET
'train/subject_train.txt': Each row identifies the subject
'train/X_train.txt': Each row identifies the activity performed
'train/y_train.txt': Each row identifies the variables measured
'train/Inertial Signals': not used for this data set

##Script: "runanalysis.R"

###Introduction

This script combines the subject (subject), activity (y) and variable (x) data tables for test and training sets. It subsets the data to include only those variables that indicate mean or standard deviation measurements. Variables measuring 'meanFrequency' are excluded. Lastly, 'runanalysis.R' finds the average of each remaining variable for each activity performed by each participant.

###Script Breakdown

The steps taken during the 'runanalysis.R' script are as follows:

1. Each of the data tables from the training data set are read in.
2. Each of the data tables from the test data set are read in.
3. The training and test data sets are merged into a single set called 'allData'.
4. The file 'features.txt' is read in. 
5. Punctuation from 'features.txt' are removed.
6. Using the values 'SubjectID', 'Activity, and all of the variable names from 'features.txt', a 'dataNames' vector is created.
7. The column names for the data set 'allData' are renamed using 'dataNames'.
8. The 'allData' set is subset into a set called 'subsetData' to include only those features who measure mean or standard deviation. Variables that include 'meanFreq' are not included as 'mean frequency' is a different type of measurement than the other mean/standard deviation measurements included.
9. The 'subsetData' data set is broken down into a narrow data set called 'meltData' of four columns (SubjectID, Activity, Variable and and Value) using the 'mean' function.
10. The data set is then reassembled into a wide data set and condensed to include an average value for each feature measured for each activity by each participant.
11. The tidy data set is written to an external text file and saved into the working directory using the function 'write.table'.
12. The script returns the tidy data set to the working R environment.

### Final Tidy Data Set

There are 30 subjects who have performed 6 activities each for a total of 180 observations. The table contains the averages of 66 distinct features.

The training and test subject data is combined, but can be identified as either training or test subjects by their SubjectID number. The training subjects were: 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29 and 30. The test subjects were: 2, 4, 9, 10, 12, 13, 18, 20 and 24 . 

The final tidy data set is 180 rows, 68 columns (including a column that identifies the subject and a column that identifies the activity performed).


##Appendix
*from the original dataset's README.txt'*

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

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

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


