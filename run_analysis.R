library(reshape2)

SubTrain<-read.table("subject_train.txt")
SubTest<-read.table("subject_test.txt")
xtrain<-read.table("X_train.txt")
xtest<-read.table("X_test.txt")
ytrain<-read.table("y_train.txt")
ytest<-read.table("y_test.txt")

names(SubTrain)<-"SubID"
names(SubTest)<-"SubID"
featnames<-read.table("features.txt")
names(xtrain)<-featnames$V2
names(xtest)<-featnames$V2
names(ytrain)<-"ACT"
names(ytest)<-"ACT"

train<-cbind(SubTrain,ytrain,xtrain)
test<-cbind(SubTest,ytest,xtest)
combo<-rbind(train,test)

meanstd<-grepl("mean\\(\\)",names(combo))|grepl("std\\(\\)",names(combo))
meanstd[1:2]<-TRUE

combo<-combo[,meanstd]
combo$ACT<-factor(combo$ACT,labels=c("Walking",
"Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

filter<-melt(combo,id=c("SubID","ACT"))
tidy<-dcast(filter,SubID+ACT~variable,mean)
write.csv(tidy,"tidy.csv",row.names=FALSE)
