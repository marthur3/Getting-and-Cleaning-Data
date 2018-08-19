setwd("~/R Folder/Getting and Cleaning Data/Week 3")

library(tidyverse)
library(Hmisc)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
codeBookurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(fileUrl,destfile="./data/acs.csv")
download.file(codeBookurl, destfile="./data/codebook.pdf")

acsData <- read.csv("./data/acs.csv")
glimpse(acsData)

bigHouse <- ifelse((acsData$ACR ==3 & acsData$AGS == 6), TRUE, FALSE)
which(bigHouse)

install.packages("jpeg")
library(jpeg)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
              , 'pic.jpg'
              , mode='wb' )

# Read the image
picture <- jpeg::readJPEG('./data/pic.jpg'
                          , native=TRUE)

# Get Sample Quantiles corressponding to given prob
quantile(picture, probs = c(0.3, 0.8) )


fileURLgdp <- "http://databank.worldbank.org/data/download/GDP.csv"
fileURLEd <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURLgdp, destfile = "./data/gdp.xlsx")
download.file(fileURLEd, destfile = "./data/education.xls")

GDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)



Ed <- read.csv("./data/education.csv")

intersect(names(GDP), names(Ed))

library(dplyr)
mergedData <- merge(GDP, Ed)
nrow(mergedData)
summary(mergedData)

head(mergedData)

mergedData$Ranking <- as.numeric(mergedData$Ranking)
mergedDataSorted <- arrange(mergedData, desc(Ranking))

mergedDataSorted %>% 
  group_by(Income.Group) %>% 
  summarize(averageRank = mean(Rank, digits = ))


mergedDataSorted$cutRank <- cut2(mergedDataSorted$Rank, g = 5)
table(mergedDataSorted$cutRank, mergedDataSorted$Income.Group)
