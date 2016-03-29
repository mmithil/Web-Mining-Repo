setwd('d:/web mining/project')
readers <- read.csv('d:/Web Mining/Project/csv_files/user_data.csv')
head(readers)

reader_Data <- readers
#converting date fields to date format
reader_Data$joined <- as.POSIXct(paste0(as.character(reader_Data$joined),"/01"), format = "%m/%Y/%d")
reader_Data$last_active <- as.POSIXct(paste0(as.character(reader_Data$last_active),"/01"), format = "%m/%Y/%d")

mean(na.omit(reader_Data$age))

install.packages('ggmap')
library("ggmap")
library(maptools)
library(maps)
install.packages('rworldmap')
library(rworldmap)
#geocode(reader_Data$location)
coordinates <- geocode(as.character(reader_Data$location))
reader_Data$lat <- coordinates$lat
reader_Data$lon <- coordinates$lon
xmean <- mean(as.numeric(na.exclude(reader_Data$y)))
ymean <- mean(as.numeric(na.exclude(reader_Data$x)))
xmean
ymean
map <- qmap(location = c(40,10), zoom = 2)
map
map + geom_point(data = reader_Data,
                 aes(lon,lat),
                   alpha = 1,
                   color = "orange")
colnames(reader_Data)

(reader_Data$age)


mean_age <- mean(reader_Data$age,na.rm = T)

reader_Data[is.na(reader_Data$age),'age'] <- mean_age


data_subset <- data.frame(reader_Data$age,reader_Data$lat,reader_Data$lon,reader_Data$gender,reader_Data$joined,reader_Data$last_active)
data_subset

data_subset <- data_subset[is.na(data_subset$reader_Data.last_active),]

is.na(data_subset$reader_Data.last_active)
data_subset <- na.omit(data_subset)
dim(data_subset)
k <- kmeans(data_subset,centers = 10)




