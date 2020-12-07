#We read data from file and we give appropriate name to the columns
features <- read.table("UCI HAR Dataset/features.txt")
colnames(features) <- c("function_code", "function_name")

activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_code", "activity_name")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- features$function_name

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(y_test) <- "activity_code"

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- "subject_code"

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(x_train) <- features$function_name

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(y_train) <-"activity_code"

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- "subject_code"

#We merge data in one set
merge_train <- cbind(subject_train, y_train, x_train)
merge_test <- cbind(subject_test, y_test, x_test)
combine_data <- rbind(merge_train, merge_test)

#We extract the measurements regarding mean and std in the set
library(dplyr)
tidy_data <- combine_data %>% select(subject_code, activity_code, contains("mean"), contains("std"))

#We set descriptive names to the columns
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data))
names(tidy_data) <- gsub("-std()", "Std", names(tidy_data))
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("-angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("-gravity", "Gravity", names(tidy_data))

#We make our final data set with average values
final_tidy_data <- tidy_data %>% group_by(subject_code, activity_code) %>% summarise_all(funs(mean))

#We write the data in a file
write.table(final_tidy_data, "final_tidy_data.txt", row.name=FALSE)
