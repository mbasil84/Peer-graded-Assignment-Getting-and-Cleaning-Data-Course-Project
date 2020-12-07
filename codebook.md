# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project
Variables

1. The following variables contain the data from the txt files
features
activity_labels
x_test
y_test
subject_test
x_train
y_train
subject_train

2. The following variables contain the data when merging the values from above variables 
merge_train
merge_test
combine_data

3. The following variable contain the data regarding only mean and std values
tidy_data

4. The following variable contain the data regarding only average values
final_tidy_data

Code steps

1. We read the data from the txt files and we assign them into appropriate variables
2. We give appropriate names to columns in each variable
3. We merge the data from train and test variables in one data set
4. We extract only the measurements regarding mean and std in the data set
5. We give appropriate name to columns in the data set
6. We make our final data by computing the average values
7. We write the final data in a txt file