# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project
Project Goal
The goal is to prepare tidy data that can be used for later analysis.

Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(data collected from the accelerometers from the Samsung Galaxy S smarthone)

Prerequisites
1. Set as working Directory the "Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project" folder
2. Install dplyr package

R script
run_analysis.R

Description of code
1. We read the data from the txt files and we assign them into appropriate variables
2. We give appropriate names to columns in each variable
3. We merge the data from train and test variables in one data set
4. We extract only the measurements regarding mean and std in the data set
5. We give appropriate name to columns in the data set
6. We make our final data by computing the average values
7. We write the final data in a txt file