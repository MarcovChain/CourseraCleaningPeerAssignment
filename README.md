# CourseraCleaningPeerAssignment
Coursera Getting and Cleaning Data Peer-Graded Assignment 

---

## Project Description
Refer to the project description on the Coursera website: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

###Collection of the raw data

Data (in .zip form) was downloaded from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on the original (raw) data

Some of the raw data files (X_test.txt and X_train.txt) was pre-processed in Excel and converted to .csv files, as I encountered parsing errors when trying to load them first into R. The other raw files were directly imported into R.

##Creating the tidy datafile

The run_analysis.R script contains the code for converting the raw data to the tidy data finaldata.csv file.
The steps are as follows:

1) load TEST and TRAINING data, consisting of subject_test.txt, y_test.txt (activity data), x_test.csv, subject_train.txt, y_train.txt (activity data), and x_train.csv which contain the actual measurements
2) load features.txt, which provides the descriptive labels for the measurement variables. The measurement variables are described in the Code Book.
3) the subject, x, and y files are combined together in an x_test and x_train data frames, then merged into a mergedata dataframe.
4) the ACTIVITY column is recoded from 1-6 to descriptive variable names (WALKING, LAYING, etc).
5) from the mergedata data frame, 66 variables which contain mean() and std() calculations are selected from the original 561 variables and placed into the meansd data frame.
6) the meansd data frame is grouped by subject and activity. The average of each variable is calculated for each subject and activity.
7) the two sets of averages (meanbysubject and meanby activity) are merged together to create the finaldata.csv data set.

###Guide to create the tidy data file
The finaldata.csv data set conforms to the tidy data conventions:
1) Each variable you measure should be in one column
2) Each different observation of that variable should be in a different row




###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
