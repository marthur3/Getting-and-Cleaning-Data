library(stringr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/cameras.csv")
list.files("./data")
dateDownloaded <- date()
dateDownloaded

camera <- read.csv("./data/cameras.csv")
names(camera)

camera_names <- str_split(names(camera),"wgtp") 

camera_names[123]


GDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                         , skip=5
                         , nrows = 190
                         , select = c(1, 2, 4, 5)
                         , col.names=c("CountryCode", "Rank", "Economy", "Total")
)

GDP$TotalClean <- as.integer(gsub(",","", GDP$Total))
mean(GDP$TotalClean, na.rm = T)

grep("^United", GDP$Economy, value = T)


fileURLEd <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURLEd, destfile = "./data/education.xls")
Ed <- data.table:: fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

mergedData  <- merge(Ed, GDP)

length(grep("Fiscal year end: June", mergedData$`Special Notes`))

install.packages("quantmod")

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

head(amznNew)
amznNew <- cbind(amzn, sampleTimes)

amznTimes <- as.data.frame(sampleTimes)

filtered <- (amznTimes %>% 
  filter(sampleTimes > "2011-12-31" & 
           sampleTimes <= "2012-12-31"))
filtered %>% 
  count()

filtered %>% 
filter(weekdays(sampleTimes) == "Monday") %>% 
  count()



