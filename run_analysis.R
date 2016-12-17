## run_analysis()
## Extracts accelerometer and gyroscope data from the public site from 
## "Human Activity Recognition Using Smartphones Data Set" project
## and produces two consolidated data sets in .txt format.
##
## The first data set, 'MergedDataSet.txt', merges both training and 
## testing data sets and selects the mean/std derived metrics for all samples
##
## The second data set, 'SummaryDataSet.txt', summarises (averages) the 
## metrics of the previous set by Activiy/Subject
##
## For debugging/testing purposes, the originally downloaded and unzipped
## data is being left in a local folder ('tempdata') (clean up of these 
## could be added later)


run_analysis <- function()
{
	##############################################################
	## PART 1: Download and Uncompress
	download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='localcopy.zip')
	unzip('localcopy.zip', files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".\\tempdata", unzip = "internal", setTimes = FALSE)

	##      Read Activity descriptions from the file provided
	activitynames <- read.table('.\\tempdata\\UCI HAR Dataset\\activity_labels.txt',stringsAsFactors=FALSE)


	##############################################################
	## PART 2: Read Data into dataframes (training) via read table and column-merge

	## 	read general metrics
	xtrain <- read.table('.\\tempdata\\UCI HAR Dataset\\train\\X_train.txt')

	## 	read subject data
	subjtrain <- read.table('.\\tempdata\\UCI HAR Dataset\\train\\subject_train.txt')

	## 	read activity -position- data and transform into descriptive strings
	activity <- read.table('.\\tempdata\\UCI HAR Dataset\\train\\y_train.txt')
	activity <- merge(x=activity, y=activitynames, by.x='V1', by.y='V1')[,2]

	##      create a single data set for test by binding columns
	train <- cbind(xtrain, activity, subjtrain)

	##############################################################
	## PART 3: Read Data into dataframes (test) via read table and column-merge

	## 	read general metrics
	xtest <- read.table('.\\tempdata\\UCI HAR Dataset\\test\\X_test.txt')

	## 	read subject data
	subjtest <- read.table('.\\tempdata\\UCI HAR Dataset\\test\\subject_test.txt')

	## 	read position data and transform into descriptive strings
	activity <- read.table('.\\tempdata\\UCI HAR Dataset\\test\\y_test.txt')
	activity <- merge(x=activity, y=activitynames, by.x='V1', by.y='V1')[,2]


	##      create a single data set for test by binding columns
	test <- cbind(xtest, activity, subjtest)

	##############################################################
	## PART 4: Merge training + test into totalset
	totalset <- rbind(train, test)


	##############################################################
	##  PART 5: rename data frame names using the standards, 
	##  suggested by Jeffrey (basically, lower case, no punctuation)

	## Read variable names & transform into -nameless- vector
	labels <- read.table('.\\tempdata\\UCI HAR Dataset\\features.txt',stringsAsFactors=FALSE)[,2]

	## Add variable names for position and subject (remember they were
	## added at the end of the train and test data sets)
	labels[length(labels)+1] <- 'activity'
	labels[length(labels)+1] <- 'subject'

	## perform basic cleanup of original variable names
	## by setting:
	##    - all lower case
	##    - remove dashes
	##    - remove dots
	##    - remove parenthesis

	labels <- tolower(labels)
	labels <- gsub("[[:punct:]]" ,"",labels)

	## But we're not done yet as there are metrics with the same name!
	## (fortunately none of which goes into the final extract but the
	## duplication will affect the workings of dplyr verbs), so the
	## renaming of metric labels will be selective, leaving the duplicates 
	## under their current Vxxx name.
	## (duplicates correspond to histogram bands)

	names(totalset)[!grepl('bands',labels)] <- labels[!grepl('bands',labels)]

	##############################################################
	## From now onwards, using mainly dplyr functions to manipulate the
	## data frame
	##############################################################

	##############################################################
	## PART 6: Select mean + stdev for each measurement, + the Activity and 
	## Position columns

	subset1 <- select(totalset, matches('(mean)|(std)|(activity)|(subject)'))

	## and produce .txt file (this one will not be submitted but still nice to have)
	write.table(subset1, 'MergedDataSet.txt')

	##############################################################
	## PART 7: Now group by activity subject and produce averages for 
	## each parameter

	subset2  <- group_by(subset1, activity, subject)
	sumdata <- summarise_each(subset2,funs(mean))

	## and produce .txt file (this one will be submitted)
	write.table(sumdata, 'SummaryDataSet.txt', row.name=FALSE)
}