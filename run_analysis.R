
if (!file.exists("UCI HAR Dataset.zip")) {
     stop("Error: UCI HAR Dataset.zip is required for this script to run!")     
}

if (!file.exists("X_merged.txt")) {
     con <- unz(description="UCI HAR Dataset.zip", filename="UCI HAR Dataset/features.txt")
     open(con, open="r")
     headers = read.table(con)
     close(con)
     write.table(headers[,-1], "X_headers.txt", row.names=F, col.names=F)
     
     con <- unz(description="UCI HAR Dataset.zip", filename="UCI HAR Dataset/test/X_test.txt")
     open(con, open="r")
     testData = readLines(con)
     close(con)
     write(testData, "X_merged.txt", sep="\t")
     
     con <- unz(description="UCI HAR Dataset.zip", filename="UCI HAR Dataset/train/X_train.txt")
     open(con, open="r")
     testData = readLines(con)
     close(con)
     write(testData, "X_merged.txt", sep="\t", append=TRUE)
     
     ## Activity Data
     
     con <- unz(description="UCI HAR Dataset.zip", filename="UCI HAR Dataset/activity_labels.txt")
     open(con, open="r")
     activities = readLines(con)
     write(activities, "activities.txt", sep="\t")
     close(con)
     
     con <- unz(description="UCI HAR Dataset.zip", filename="UCI HAR Dataset/test/y_test.txt")
     open(con, open="r")
     testYData = readLines(con)
     close(con)
     write(testYData, "Y_merged.txt", sep="\t")
     
     con <- unz(description="UCI HAR Dataset.zip", filename="UCI HAR Dataset/train/y_train.txt")
     open(con, open="r")
     testYData = readLines(con)
     close(con)
     write(testYData, "Y_merged.txt", sep="\t", append=TRUE)
}
headerLabels <- read.table("X_headers.txt")
cfeatures <- read.table("cleanedfeatures.txt", sep=",")
headerLabels <- merge(headerLabels, cfeatures, by="V1", all=T)
headerLabels[,2] <- as.character(headerLabels[,2])
headerLabels[with(headerLabels, is.na(headerLabels$V2)),]$V2 <- "Discard"

data <- read.table("X_merged.txt", col.names=as.vector(headerLabels[,2]))
dataY <- read.table("Y_merged.txt")

activityLabels <- read.table("activities.txt")

dataJ <- merge(dataY, activityLabels, by="V1")
data$Activity <- dataJ[2]$V2

library(data.table)
data <- data[,c(which(!like(names(data), "*Discard*")))]

data <- aggregate(. ~ Activity, data=data, FUN="mean")
cnames <- data$Activity
data <- as.data.frame(t(data[,-1]))
colnames(data) <- cnames
data$SUBJECT <- row.names(data)
data <- data[,c(7,1:6)]
write.csv(data, file="./tidy_data.csv", row.names=FALSE)
