###Tidy Data 
### Each variable forms a column
### Each observation forms a row
## Each table/file stores data about one kind of observation(eg.people/hospital)

library(reshape2)
head(mtcars)

##Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear","cyl"), measure.vars = c("mpg", "hp"))
head(carMelt,n=3)

##Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData

cylData<- dcast(carMelt, cyl ~ variable, mean)
cylData

##Averaging values - One Way
head(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, sum)

## Another Way - Split Apply Combine
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns

sprCount = sapply(spIns,sum)
sprCount

## Another Way = plyr package
library(plyr)
spraySums <- ddply(InsectSprays,.(spray), summarize, sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)






