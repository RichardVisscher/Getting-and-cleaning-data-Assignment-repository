---
title: "README"
output: html_document
---
Loading the data from the internet
I downloaded a zipfile from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unpacked it with 7-Zip 9.20
(www.7-zip.org)

used this version of RStudio:
Version 0.98.1102 - © 2009-2014 RStudio, Inc.
on windows 8.1
using a laptop with 4 GB RAM
64 bits operating system x64 processor

Unpacked it had the following structure

UCI HAR dataset 
this main directory contains 4 files:
        features_info.txt 
	features.txt
	activity_labels,txt
	README.TXT
and two subdirectories test and train

test contains 
	subject_test.ytxt
	X_test.txt
	y_test.txt
and a subdirectory Inertial signals containing files with measurements		

train contains 
	subject_train.ytxt
	X_train.txt
	y_train.txt
and a subdirectory Inertial signals containing files with measurements		

Raw data
In this assignment there are two levels of rawness of the data, the first is the level of the inertial signals. From this level a second level of raw data is computed. The second level contains the raw data used for this assignment

Second level raw data
For this assignment I used the following files as raw data :
	features.txt
	activity_labels,txt
	subject_test.txt
	X_test.txt
	y_test.txt
	subject_train.ytxt
	X_train.txt
	y_train.txt
I placed these files together in a subdirectory called HARUS, directly beneath my C directory

The following files contain useful information about how the files in the HARUS directory relate to each other
	features_info.txt 
	README.TXT

*********************************************************************

I used loaded the txt fules into my working directory using load.table

Then I added 561 column names to X_test (561 columns, 2947 rows) and X_train (561 columns, 7352 rows) using features

I removed the columns not containing mean and std from X_test and X_train

I added subjects to X_test and X_train by adding subject_test and subject_train 

I added activities to X_test and X_train using y_test and y_train and replaced the numbers 1 to 6 in activities with text using activity_labels

I combined test and train in a new dataframe total

I created a variable ActivitySubject from the columns Activity and Subject and removed these two columns.

I used group by and summarise to obtain the mean for every unique combination of activity and subject an created a new dataframe tidy

I created a text file tidy.txt from the dataframe using write.table




This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
