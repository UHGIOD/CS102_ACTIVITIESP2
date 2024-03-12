library(readxl)

movies<-read_excel('C:/Users/User/Documents/Rstudio Files/Random/3KReviews.xlsx')

write.csv(movies, file = "3KReviewsCsv.csv")

read.csv('C:/Users/User/Documents/Rstudio Files/3KReviewsCsv.csv')

library(dplyr)

#checking NULL values
View(movies)
str(movies)

movies<-as_tibble(movies)
movies

#LOWERCASE ALL THE CHARACTERS
movies$Movie_Name<-tolower(movies$Movie_Name)
movies

movies$Name_Reviewer<-tolower(movies$Name_Reviewer)
movies

movies$Content_Review<-tolower(movies$Content_Review)
movies

movies$Reviews<-tolower(movies$Reviews)
movies

#CONVERTING THE DATE
#install.packages("lubridate")

library(lubridate)

movies$Date

movies$Date<-dmy(movies$Date)

as.POSIXct.Date(movies$Date,format="%d-%m-%Y")

View(movies)

#CONVERTING THE DATE and its AVERAGE
movies$User_Rating<-as.numeric(gsub("/.*", "", movies$User_Rating))

movies$User_Rating<-ifelse(is.na(movies$User_Rating), mean(movies$User_Rating, na.rm=TRUE)
                           
View(movies)

#Creating a dataframe
cleaned_movies <- data.frame(
  Name=movies$Movie_Name,
  Reviewer=movies$Name_Reviewer,
  Date=movies$Date,
  Rating=movies$User_Rating,
  Content=movies$Content_Review, 
  Review=movies$Reviews
)

write.csv(cleaned_movies, file = "Lab5_cleanedMovies_DUERO.csv")
  

