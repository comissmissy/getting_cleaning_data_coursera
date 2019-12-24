# Code Book
This code book that describes the variables, the data, and any transformations or work performed to clean up the data.


## Data Overview
Built from the recordings of 30 subjects performing 6 activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.


This project was completed using only the files below.  The raw signal data files were ignored.

1. **features.txt:** IDs and Names of the 561 features.

2. **activity_labels.txt:** IDs and Names for each of the 6 activities.

3. **X_train.txt:** 7352 observations with 561 variables representing each feature for 21 of the 30 subjects.

4. **subject_train.txt:** 7352 observations denoting the IDs of the subjects related to each of the observations in X_train.txt.

5. **y_train.txt:** 7352 observations denoting the IDs of the activities related to each of the observations in X_train.txt.

6. **X_test.txt:** 2947 observations with 561 variables representing each feature for 9 of the 30 subjects.

7. **subject_test.txt:** 2947 observations denoting the IDs of the subjects related to each of the observations in X_test.txt.

8. **y_test.txt:** 2947 observations denoting the IDs of the activities related to each of the observations in X_test.txt.


## Transformations and Work Performed
The following steps were performed to prepare a tidy data set that can be used for later analysis:
1. Read in the training and test data sets.  Merge to create one data set.
2. Read in and index the activity names data set.  Apply descriptive activity names to name the activities in the data set.
3. Read in the features data set.  Appropriately label the data set with descriptive variable names from the features data set.
4. Extract only the measurements on the mean and standard deviation for each measurement.
5. Create an independent tidy data set with the average of each variable for each activity and each subject.  Write the tidy data set output to a delimited TXT file.
