library(rvest)
install.packages("polite")
library(dplyr)
library(writexl)
library(polite)


##1.SALTBURN
session <- bow(url = 'https://www.imdb.com/title/tt17351924/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session

session_scrape <- scrape(session)

scrape_reviews1 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  saltburn_df= data.frame(
    Movie_Name=c('Saltburn'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

saltburn_urls<-c('https://www.imdb.com/title/tt17351924/reviews?ref_=tt_urv',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrvrxq4oab62motb77faxcpuul5pjt6ubc7ouzfjnrcb4d23i275p2px3kvhogku35tid4c4',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnztrdr4uajz3mpdx77la7dpww35pjt6ubc6pe4vvprlb4dztfta4ew64mpjq5d4zkld4tvao',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwrlq46ajt3mpdr7hja7c7yul5pjt6ubc6oq2v7prnb4dzgei3zia4ibcxsk3ycjgo5fvco',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqrhqmqcb434nd37hia7b76w35pjt6ubc6oeyvtnjob4dtxb2zl77wgkbj2twtwx2dkoeow',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyqps4yab33upd377fa3cp2v3hoq366sssou2vtpzmcr4k52m4krzo4hmop55lb2cyr6qez6y',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzqlumybr52mmd36xpale7sutfoq366sssoq2v5mjncv4k425zel3hpn2ny2eadmyfgwmw55y',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwrlum2bjy3aptb7xpatc72ul5pjt6ubc6om3fxmjcb4dv3t7z3svojobkx6uhnp2dmajlq',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvrds4wazt2iodr4platd7wud5pjt6ubc6ou2f3nrlb4dywe5aag3a3vlqczb5ppkmb7cng',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqqps46az63iotz6hjahdpeul5pjt6ubc6oi3fvnblb4dzuxef22zunrtef6ljhyqbd3tyk',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryqpqmmajy3andt7hlapep4udgoq366sssouyfxmrnd54k4x5mkj7xdxka5qrc2odjv6sfhni',
                 'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzrhq42bbs3mpt36hfb3a7ev35pjt6ubc6oq2flnblb4d4kr34jmkf2c23spfcrkgzbgly4')

all_reviews1 <- lapply(saltburn_urls, scrape_reviews1)
final_all_reviews1 <- do.call(rbind, all_reviews1)
View(final_all_reviews1)


library(writexl)

write_xlsx(final_all_reviews1, "/cloud/project/ACTIVITY2_DUERO.xlsx")