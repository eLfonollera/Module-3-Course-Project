## Download the file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = courseproject.zip)
unzip(zipfile="./courseproject.zip")

## 1) Merges the training and the test sets to create one data set

ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")

xtest <- read.table("UCI HAR Dataset/test/x_test.txt")
xtrain <- read.table("UCI HAR Dataset/train/x_train.txt")

strain <- read.table("UCI HAR Dataset/train/subject_train.txt")
stest <- read.table("UCI HAR Dataset/test/subject_test.txt")

ydata <- rbind(ytrain, ytest)
xdata <- rbind(xtrain, xtest)
subdata <- rbind(strain, stest)

names(ydata) = c("activity")
xdatanames <- read.table(("UCI Har Dataset/features.txt"),header=FALSE)
names(xdata) <- xdatanames$V2
names(subdata) = c("subject")

data <- cbind(xdata, subdata, ydata)


## 2) Extracts only the measurements on the mean and standard deviation for each measurement

xdatanamesms <- xdatanames$V2[grep("mean\\(\\)|std\\(\\)", xdatanames$V2)]
data2 <- subset(data,select = c(as.character(xdatanamesms),"subject","activity"))

## 3) Uses descriptive activity names to name the activities in the data set

activitylabel <- read.table("UCI HAR Dataset/activity_labels.txt")
data$activity <- factor(data$activity, labels = activitylabel[,2])

## 4) Appropriately labels the data set with descriptive variable names.

names(data)
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("tBody", "temperatureBody", names(data))
names(data)<-gsub("JerkMean)", "JerkMean", names(data))

## 5) From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

install.packages("plyr")
library("plyr")
data3 <- aggregate(.~ subject + activity, data, mean)
data3 <- data2[order(data2$subject, data2$activity),]
write.table(data3, file = "subjectactivityaverage.txt", row.name=FALSE)
