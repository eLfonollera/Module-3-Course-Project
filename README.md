# Module-3-Course-Project
This contains my course project on Module 3
This repo explains how all of the scripts work and how they are connected.

Before starting the project, I downloaded first the file "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip it to my designated file location.

A. Merges the training and the test sets to create one data set.

Before doing the merging, I use the read.table function to access the files such as y_test.txt, y_train.txt, x_test.txt, x_train.txt, subject_train.txt, and subject_test.txt.

Then I used rbind function to bind y_train to y_test, x_train to x_test, and strain to stest. Finally I used cbind function to bind the rbind results and assign it to "data".

B. Extracts only the measurements on the mean and standard deviation for each measurement.

I used grep function to locate the mean and std values and assign it to "data"

C. Uses descriptive activity names to name the activities in the data set

First is to use the read.table function to access the activity_labels.txt file. Then used the factor function to rename the activities.

D. Appropriately labels the data set with descriptive variable names.

Gsub function is the main function to be used here. This is to substitute appropriate names to the file.

E. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I install "plyr" package to use the aggragate function.This function splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.

Thank you !!
