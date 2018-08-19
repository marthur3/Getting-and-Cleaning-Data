if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
tolower(names(cameraData))


##strssplit() split on periods
## have to use the escape character

splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]


#Quick aside on list
mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)

mylist[1]
mylist$letters
mylist[[1]]


## Fixing character vectors - sapply()
## Applies a function to each element in a vector
## Important parameters X,Fun

firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)


## Peer review data


## Fixing character vectors - sub()
## Important parameters: pattern, replacement, x

names(reviews)
sub("_","",names(reviews),)

## Gsub vs Sub
testName <- "this_is_a_test"

##Sub just replaces the first
sub("_","",testName)

## Gsub replaces all
gsub("_","",testName)

## Finding values - grep(), grepl()
## Takes a search string "Alameda, and produces the elements that
## contain the string
grep("Alameda",cameraData$intersection)

### Returns a vector thats true when alameda appears
table(grepl("Alameda",cameraData$intersection))

##Subset
## IF alemeda doesn't appear subset to only that data
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

## More on grep()
## value = true will actually return the values
grep("Alameda",cameraData$intersection,value=TRUE)

## Can check if a value appears in the vector and look for length
## if the length is zero it doesn't appear
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

library(stringr)
### Number of characters
nchar("Jeffrey Leek")

## Take out part of the string
substr("Jeffrey Leek",1,7)

## past strings together
paste("Jeffrey","Leek")
## set the speration with the sep = 

## str_trim will trim off excess space

