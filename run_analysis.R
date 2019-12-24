#   Data: data collected from the accelerometers from the Samsung Galaxy S smartphone

#   Load required packages.
library(dplyr)

#   Read in test datasets.
x_test_loc <- "test/X_test.txt"
x_test <- read.table(x_test_loc, header=FALSE)

y_test_loc <- "test/y_test.txt"
y_test <- read.table(y_test_loc, header=FALSE)
y_test <- rename(y_test, activity=V1)

subject_test_loc <- "test/subject_test.txt"
subject_test <- read.table(subject_test_loc, header=FALSE)
subject_test <- rename(subject_test, subject=V1)

#   Read in training datasets.
x_train_loc <- "train/X_train.txt"
x_train <- read.table(x_train_loc, header=FALSE)

y_train_loc <- "train/y_train.txt"
y_train <- read.table(y_train_loc, header=FALSE)
y_train <- rename(y_train, activity=V1)

subject_train_loc <- "train/subject_train.txt"
subject_train <- read.table(subject_train_loc, header=FALSE)
subject_train <- rename(subject_train, subject=V1)

# 1 Merge test and training sets to create one data set.
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
full <- merge(test, train, all = TRUE)

#   Read in the activity names data set.
activity_loc <- "activity_labels.txt"
activity <- read.table(activity_loc, header=FALSE)
activity <- rename(activity, activity=V1, desc=V2)

#   Index activity names data set.
activity_desc <- factor(full$activity)
levels(activity_desc) <- activity[,2]

# 3 Apply descriptive activity names to name the activities in the data set.
full$activity <- activity_desc

#   Read in the features data set.
features_loc <- "features.txt"
features <- read.table(features_loc, header=FALSE)

#   Remove () from names in features data set.
labels <- features %>% mutate(label=gsub("[()]", "", features$V2)) %>%
  select(label)

#   Replace - with . in labels data set, add subject and activity features.
labels <- mutate(labels, fin=gsub("-", "\\.", labels$label)) %>%
  select(fin)
labels <- rbind(c("subject"), c("activity"), labels)

# 4 Appropriately label the data set with descriptive variable names from the features data set.
names(full) <- labels[,1]

# 2 Extract only the measurements on the mean and standard deviation for each measurement.
meanstd <- full[ , grepl("subject|activity|mean|std", names(full))]

# 5 Create an independent tidy data set with the average of each variable for each activity and each subject.
tidy <- meanstd %>% group_by(subject, activity) %>% 
  summarise_each(funs(mean))

#   Write tidy dataset to an output file.
write.table(tidy, "tidy_data.txt", sep = ",", row.names = FALSE)