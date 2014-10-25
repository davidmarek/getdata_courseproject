Readme
======

Included files
--------------

* run_analysis.R - script for creating a tidy dataset from Human Activity Recognition Using Smartphones Dataset.
* CodeBook.md - description of the dataset and transformations done to create it.

Usage
-----

* Download original dataset from <
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
* Extract the dataset, directory "UCI HAR Dataset" should be in the same directory as run_analysis.R
* Call script run_analysis.R, depends on dplyr package.
* The script merges data from "UCI HAR Dataset/test/X\_test.txt", "UCI HAR Dataset/test/X\_train.txt", adds labels from "UCI HAR Dataset/test/y\_test.txt", "UCI HAR Dataset/test/y\_test.txt".
* Labels and names are added from files "UCI HAR Dataset/features.txt" and "UCI HAR Dataset/activity\_labels.txt".
* dplyr is used to select only mean and standard variation variables, grouped by activity and subject, a mean value is computed for each variable.
* New file output.txt will be created containing the new tidy dataset.