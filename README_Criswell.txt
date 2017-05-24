The purpose of this script is to generate clean data from the given set. Produced by Università degli Studi di Genova, this data tracks various kinds of physical activity using a smartphone.

The script used to create tidy data employs the reshape2 package in order to take advantage of the dcast and melt functions. 

All of the relevant data is first assigned to the variables "SubTrain", "Subtest", "xtrain", "xtest", "ytrain", and "ytest". In the second group of code, names are set for the data in preparation for combining all of it into one set.

Using the variables "train", "test", and "combo", all of the data is merged into one set. With "meanstd", the mean and standard deviation of all activities and dimensions are generated. They are then added to the data using the second "combo" variable. Labels are set for the ACT field using "combo$ACT".

The variable "fliter" melts the data frame, making it long form. The variable "tidy" casts the molten data frame into a normal data frame. In the final line of code, the cleaned up data is written into a csv file.

