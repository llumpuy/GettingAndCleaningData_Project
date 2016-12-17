BRIEF

The Summarised Data set contained in 'SummaryDataSet.txt' is originally sourced
from the data shared by the Center for Machine Learning and Intelligent Systems 
in UCI, as presented in the project's web site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

more specifically, the data files contained in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A set of R data manipulation actions produced a single data set that merges the
original Training and Test data sets collected, takes a subset of the variables 
included, and produces an average (aritmethic mean) value for each of this metrics, 
grouping them by the Subject and Activity of the samples.

No manipulation is applied over the original data sets aside those inteded for 
consolidation (test + training), focus (subset of all the available metrics) and
clarity (variable renaming, numerical values of Activities matched to their textual
meaning).


DESCRIPTION OF THE DATA SET

The data set contains a row per Subject/Activity combination, containing the
following metrics:

* activity:	The main activity performed by the subject during the measurement. 
		The values belong to the list: WALKING, WALKING_UPSTAIRS,
		WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* subject:	The identifier of the subject during the experiment

* tbodyaccmeanx, 
  tbodyaccmeany, 
  tbodyaccmeanz: 	time domain- triaxial acceleration for Body (mean)

* tbodyaccstdx, 
  tbodyaccstdy, 
  tbodyaccstdz		time domain- triaxial acceleration for Body (std)

* tgravityaccmeanx, 
  tgravityaccmeany, 
  tgravityaccmeanz	time domain- triaxial acceleration for Gravity (mean)

* tgravityaccstdx, 
  tgravityaccstdy, 
  tgravityaccstdz	time domain- triaxial acceleration for Gravity (std)

* tbodyaccjerkmeanx, 
  tbodyaccjerkmeany, 
  tbodyaccjerkmeanz	time domain- triaxial accel jerk for Bdy (mean)

* tbodyaccjerkstdx,
  tbodyaccjerkstdy,
  tbodyaccjerkstdz	time domain- triaxial accel jerk for Bdy (std)

* tbodygyromeanx,
  tbodygyromeany,
  tbodygyromeanz	time domain- triaxial Gyro angle (mean)

* tbodygyrostdx,
  tbodygyrostdy,
  tbodygyrostdz		time domain- triaxial Gyro angle (std)

* tbodygyrojerkmeanx,
  tbodygyrojerkmeany,
  tbodygyrojerkmeanz	time domain- triaxial Gyro jerk (mean)

* tbodygyrojerkstdx,
  tbodygyrojerkstdy,
  tbodygyrojerkstdz	time domain- triaxial Gyro jerk (std)

* tbodyaccmagmean,
  tbodyaccmagstd,	time domain- body accel magnitude (mean & std)

* tgravityaccmagmean,
  tgravityaccmagstd	time domain- gravity accel magnitude (mean & std)

* tbodyaccjerkmagmean,
  tbodyaccjerkmagstd	time domain- jerk accel magnitude (mean & std)

* tbodygyromagmean,
  tbodygyromagstd	time domain- angle magnitude (mean & std)

* tbodygyrojerkmagmean,
  tbodygyrojerkmagstd	time domain- angle jerk magnitude (mean & std)

* fbodyaccmeanx,
  fbodyaccmeany,
  fbodyaccmeanz		FFT - triaxial acceleration for Body (mean)

* fbodyaccstdx,
  fbodyaccstdy,
  fbodyaccstdz		FFT - triaxial acceleration for Body (std)

* fbodyaccmeanfreqx,
  fbodyaccmeanfreqy,
  fbodyaccmeanfreqz	FFT - triaxial acceleration freq for Body (mean)

* fbodyaccjerkmeanx,
  fbodyaccjerkmeany,
  fbodyaccjerkmeanz	FFT - triaxial accel jerk for Body (mean)

* fbodyaccjerkstdx,
  fbodyaccjerkstdy,
  fbodyaccjerkstdz	FFT - triaxial accel jerk for Body (mean)

* fbodyaccjerkmeanfreqx,
  fbodyaccjerkmeanfreqy,
  fbodyaccjerkmeanfreqz	FFT - triaxial accel freq for Body (mean)

* fbodygyromeanx,
  fbodygyromeany,
  fbodygyromeanz	FFT - triaxial Gyro angle (mean)

* fbodygyrostdx,
  fbodygyrostdy,
  fbodygyrostdz		FFT - triaxial Gyro angle (std)

* fbodygyromeanfreqx,
  fbodygyromeanfreqy,
  fbodygyromeanfreqz	FFT - triaxial Gyro angle freq (mean)

* fbodyaccmagmean,
  fbodyaccmagstd	FFT - body accelaration magnitude (mean & std)

* fbodyaccmagmeanfreq 	FFT - body accelaration magnitude freq (mean)

* fbodybodyaccjerkmagmean,
  fbodybodyaccjerkmagstd 	FFT - body accel jerk  magnitude (mean & std)

* fbodybodyaccjerkmagmeanfreq	FFT - body accel jerk  magnitude (mean & std)

* fbodybodygyromagmean,		FFT - angle magnitude (mean & std)
  fbodybodygyromagstd

* fbodybodygyromagmeanfreq	FFT - angle magnitude (mean & std)

* fbodybodygyrojerkmagmean,
  fbodybodygyrojerkmagstd	FFT - angle jerk magnitude (mean & std)

* fbodybodygyrojerkmagmeanfreq	FFT - angle jerk magnitude (freq)

* angletbodyaccmeangravity	

* angletbodyaccjerkmeangravitymean

* angletbodygyromeangravitymean

* angletbodygyrojerkmeangravitymean

* anglexgravitymean,
  angleygravitymean,
  anglezgravitymean		triaxial Gravity angle (mean)


(please refer to the original features_info.txt file provided in the source data set 
for details on these metrics)

DATA PROCESSING

The following items summarise the stages applied to produce the final data set:

* Download and Uncompress the original data sets (PART 1)
* Read training data into R dataframes (metrics, actions, subjects) and column-merge 
it into a single training data frame (PART 2)
* Map the Activity Codes in this data set to their textual descriptions (PART 2)
* Read test data into R dataframes via read table and column-merge it into a 
single test data frame (PART 3)
* Map the Activity Codes in this data set to their textual descriptions (PART 3)
* Merge the training and test data sets into a single one (PART 4)
* Rename the orginal variable names using JL's standard recommendations (PART 5)
* Create a preliminary data subset that selects the *mean* and *std* metrics as 
well as includes the Subject identified and Activity description (PART 6)
* Then groups by Subject and Activity and produces as summarised data set with
the averages per metric (PART  7)

A single R script (run_analysis.R, included in this repo) contains all the actions
performed on the original data set. The stages described above are matched in the
script comments for further details


 