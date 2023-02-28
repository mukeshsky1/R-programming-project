library(rvest)
library(dplyr)
performance=  read.csv("final (1).csv")
View(performance)
performance$date <- gsub("[-]", "/",performance$date)
View(performance)
str(performance)

# changing data types
performance$runs <- as.numeric(performance$runs)
performance$name <- as.character(performance$opponent)
performance$ground <- as.character(performance$ground)
performance$match <- as.character(performance$match)
performance$Match_No <- as.numeric(performance$Match_No)
performance$total <- as.numeric(performance$total)
View(performance)

# creating bar chart
ggplot(data=performance  ,aes(x=match,y=runs))+
  geom_bar(stat = "identity", fill ="red")+
  labs(x="match",y="runs",title="comparing runs as per matchs")
cm <- performance[2]
dt <- performance[6]
rs <- rowSums(cm)
match_runs <- data.frame(dt,rs)
View(match_runs)

# creating line plot
ggplot(data=performance,aes(x=match, y=runs)) +geom_line(color="red",size=1) + labs(x="matchs",y="runs",title="comparing runs as per matchs")


ggplot(data=performance,aes(x=match,y=runs)) + geom_point() + labs(x= "matches", y="runs",title = "comparing runs as per matchs")

# creating histogram
ggplot(performance,aes(x=runs)) +geom_histogram(binwidth = 5, color ="black",fill = "blue")

# data splitting
split=sample.split(performance$runs,SplitRatio=0.8)
training_set=subset(performance,split==TRUE)
View(training_set)
testing_set=subset(performance,split==FALSE)
View(testing_set)

