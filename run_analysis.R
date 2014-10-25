library(dplyr)

# Load labels.
features <- read.table('UCI HAR Dataset//features.txt')
activities <- read.table('UCI HAR Dataset//activity_labels.txt', 
                         colClasses = c("character", "character"))

# Load and merge X.
x_test <- tbl_df(read.table('UCI HAR Dataset//test//X_test.txt', 
                            col.names = features[, 2]))
x_train <- tbl_df(read.table('UCI HAR Dataset//train//X_train.txt', 
                            col.names = features[, 2]))
x <- rbind(x_test, x_train)

# Load and merge Y.
y_test <- read.table('UCI HAR Dataset//test//y_test.txt', 
                     colClasses = "character")
y_train <- read.table('UCI HAR Dataset//train//y_train.txt', 
                      colClasses = "character")
y <- rbind(y_test, y_train)
y <- factor(y[, 1], levels = activities[, 1], labels = activities[, 2])

# Load and merge subjects.
subjects_test <- read.table('UCI HAR Dataset//test//subject_test.txt')
subjects_train <- read.table('UCI HAR Dataset//train//subject_train.txt')
subjects <- rbind(subjects_test, subjects_train)

# Select only mean and std variables, add activity and subject columns.
data <- x %>%
    select(contains('mean', ignore.case = F), contains('std'), 
           -contains('meanFreq')) %>%
    mutate(activity = y, subject = subjects[, 1])

# Create a new summarised dataset.
summ_data <- data %>% 
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

# Write data to file.
write.table(summ_data, row.name = F, file = 'output.txt')
