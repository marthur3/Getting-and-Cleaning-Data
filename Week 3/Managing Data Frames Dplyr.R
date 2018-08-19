##Assumptions of dplyr
## One observation per row
## Each column is a variable
## Other implementations, particulary relational databases

##dplyr Verbs
c("select",
"filter",
"arrange",
"rename",
"mutate",
"summarise")

library(dplyr)

chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)

names(chicago)
##Select function by names
head(select(chicago, city:dptp))
##Minus can look at all but the selected columns

##Filter
chic.f <- filter(chicago, pm25tmean2 >30)
chic.f <- filter(chicago, pm25tmean2 >30 & tmpd > 80)
chic.f

### Argange
chicago <- arrange(chicago, date)
head(chicago)
tail(chicago)

##Rename

chicago <- dplyr::rename(chicago, pm25 = pm25tmean2)
?rename

##Mutate
chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25,na.rm =TRUE))
tail(select(chicago, pm25, pm25detrend))

chicago  <- mutate(chicago, tempcat = factor(1*(tmpd >80),
                                             labels =c("COLD",
                                                       "HOT")))
hotcold <- group_by(chicago, tempcat)
hotcold
summarise(hotcold, pm25 = mean(pm25, na.rm =T), o3 = max(o3tmean2), 
          no2 = median(no2tmean2))
detach(package:plyr)

### Pipeline
chicago <- rename(chicago, dewpoint = dptp, 
                  pm25 = pm25tmean2)

chicago <- mutate(chicago, 
                  year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2, na.rm = TRUE), 
          no2 = median(no2tmean2, na.rm = TRUE))

df <- chicago %>% 
  mutate(month = as.POSIXlt(date)$mon + 1) %>% 
  group_by(month) %>% 
  dplyr::summarize(pm25 = mean(pm25, na.rm = TRUE), 
              o3 = max(o3tmean2, na.rm = TRUE), 
              no2 = median(no2tmean2, na.rm = TRUE))
