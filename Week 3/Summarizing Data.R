if(!file.exists(".data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

summary(restData)

table(restData$councilDistrict, restData$zipCode)

any(is.na(restData))

colSums(is.na(restData))

data(UCBAdmissions)

DF = as.data.frame(UCBAdmissions)

xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

data("warpbreaks")

xt = xtabs(breaks ~., data=warp)