#Run Analysis Script
#Rae Milne
#Jul 2014
#Coursera - Getting and Cleaning Data Course

runanalysis <- function() {

require(reshape2) #include reshape2 library for 'melt' and 'dcast' functions

#read in the training data sets
trainSubject <- read.table("./data/train/subject_train.txt", stringsAsFactors = FALSE)
trainActivity <- read.table("./data/train/y_train.txt", stringsAsFactors = FALSE)
trainDataX <- read.table("./data/train/X_train.txt", stringsAsFactors = FALSE)

#read in the test data sets
testSubject <- read.table("./data/test/subject_test.txt", stringsAsFactors = FALSE)
testActivity <- read.table("./data/test/y_test.txt", stringsAsFactors = FALSE)
testDataX <- read.table("./data/test/X_test.txt", stringsAsFactors = FALSE)

#merge the train and test data sets into single set
trainData <- cbind(trainSubject,trainActivity, trainDataX)
testData <- cbind(testSubject, testActivity, testDataX)
allData <- rbind(trainData, testData)

#read in features.txt and clean up to use as column names
xNames <- read.table("./data/features.txt", stringsAsFactors = FALSE)
xNames[,"V2"] <- gsub("[[:punct:]]", "", xNames[,"V2"]) #remove punctuation
dataNames <- c("SubjectID", "Activity", xNames[, "V2"]) #create vector of col names
names(allData) <- dataNames #rename all column names

#subset the merged dataset to include only relevant columns
subsetLogical <- grepl("SubjectID|Activity|mean|std", names(allData))
subsetData <- allData[, subsetLogical]

#remove meanFreq values from the dataset
extraColumns <- grepl("meanFreq", names(subsetData)) 
subsetData <- subsetData[, !extraColumns]

#create tidy data with average of each variable for each activity and each subject
meltData <- melt(subsetData, id=c("SubjectID", "Activity"),)
tidyData <- dcast(meltData, SubjectID + Activity ~variable,mean)

#replace activity numbers with names
activityNames <- c("Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying")
tidyData$Activity <- factor(tidyData$Activity, levels=c(1:6), labels=activityNames)

write.table(tidyData, file="tidyData.txt") #create a text file of the tidy data set

tidyData #return the tidy data set to the R working environment

}

