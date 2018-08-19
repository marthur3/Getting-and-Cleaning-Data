if(!file.exists(".data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

##Creating sequences examples
s1 <- seq(1,10,by=2) ; s1
s2 <- seq(1,10, length=3); s2
x <- c(1,3,8,25,100); seq(along = x)

##subsetting variables

restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

### Creating categorical variables
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups, restData$zipCode)

##Easier cutting
install.packages("Hmisc")
library(Hmisc)
## cut2 function, break the zip code up into different groups by quantile
restData$zipGroups <- cut2(restData$zipCode, g=4)
table(restData$zipGroups)

## Creating factor variables
restData$zcf <- factor(restData$zipCode)

##Levels of factor variables
yesno <- sample(c("yes","no"), size=10, replace=TRUE)
yesnofac<- factor(yesno, levels=c("yes","no"))
relevel(yesnofac,ref="yes")
as.numeric(yesnofac)

##Cutting produces factor variables

##Using the mutate fuction
library(dplyr)
restData2 <- mutate(restData, zipGroups=cut2(zipCode,g=4))

table(restData2$zipGroups)
head(restData2)

###Common Transformations
http://statmethods.net/management/functions.html
