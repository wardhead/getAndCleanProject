# read in all the data files
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
# pick out the columns for means and standard deviations
stds <- grep("std",features$V2)
means <- grep("mean",features$V2)
meanFreqs <- grep("meanFreq",features$V2)  # we don' want the mean Frequencies
featureIndices <- sort(c(stds,means))
featureIndices <- featureIndices[-c(meanFreqs)]
featureNames <- as.character(features[featureIndices,]$V2)
# combine the desired columns from test and train data sets
allData <- rbind(X_test[,featureIndices],X_train[,featureIndices])
names(allData)<-featureNames
# add the subjects to the data 
subject <- rbind(subject_test,subject_train)
names(subject)<-"subject"
activity <- rbind(Y_test,Y_train)
subject$action <- activity_labels[activity$V1,]$V2
allData <- cbind(subject,allData)
# I ran out of time
# I'm pretty sure that a single command will produce the final tidyData
# but I haven't figured out exactly what it is  
# this is the closest I've come
tidyData <- ddply(allData,.(subject,action),mean)
