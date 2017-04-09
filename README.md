# Coursera Cleaning Peer Assignment
Coursera Getting and Cleaning Data Peer-Graded Assignment by Marc Boulet

---

## Project Description
Refer to the project description on the Coursera website: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

###Collection of the raw data

Data (in .zip form) was downloaded from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on the original (raw) data

Two of the raw data files (X_test.txt and X_train.txt) were pre-processed in Excel and converted to .csv files, as I encountered parsing errors when trying to load them first into R. The other raw files were directly imported into R.

###Creating the tidy datafile

The run_analysis.R script contains the code for converting the raw data to the finaldata.csv tidy data file.
The steps are as follows:

1) load TEST and TRAINING data, including the subject_test.txt, y_test.txt, x_test.csv, subject_train.txt, y_train.txt, and x_train.csv files.
2) load features.txt, which provides the descriptive labels for the measurement variables. The measurement variables are described in the Code Book.
3) the subject, x, and y files were combined together in the x_test and x_train data frames, which are then merged into the mergedata dataframe.
4) the ACTIVITY column was recoded from numerical values (1-6) to descriptive variable names (WALKING, LAYING, etc).
5) from the mergedata data frame, 66 variables, which contain mean() and std() calculations, were selected from the original 561 variables and placed into the meansd data frame.
6) the meansd data frame was grouped by subject and activity. The average of each variable was calculated for each subject and activity.
7) the two sets of averages (meanbysubject and meanbyactivity) were merged together to create the finaldata.csv data set.

###Guide to create the tidy data file

The finaldata.csv data set conforms to the tidy data conventions:
1) Each variable you measure should be in one column
2) Each different observation of that variable should be in a different row
