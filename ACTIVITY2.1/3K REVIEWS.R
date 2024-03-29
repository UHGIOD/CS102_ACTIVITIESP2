library(rvest)
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


##PHANTOM THREAD
session2 <- bow(url = 'https://www.imdb.com/title/tt5776858/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session2

session_scrape2 <- scrape(session2)

scrape_reviews2 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  phantom_df= data.frame(
    Movie_Name=c('Phantom Thread'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

phantom_urls<-c('https://www.imdb.com/title/tt5776858/reviews?ref_=tt_urv',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbzr3smmarz3untz77ja7e76ul5pjt6uck3oy2flmbkb4drqe7eauirauwzu6tuj5e66m7w4',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqr3t4ycjt3qntr67oa3cpswt5pjt6uck3oqyvzpzmb4dv45p2bxrmnmi7cck7irr2f6g7a',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzqpsmscb23uodz77mahe7yud5pjt6uck3ouzvvmrmb4drw6hpzzfztpbb4iikbixebuuee',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvrtrmmbr43qmtd4pna3cp6wtgoq366ss7oazflmzndz4k5epqjcoyl7vktfdwv2nu33yen3a',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjtrdumsab53qkdx7xka3ap4u3hoq366ss7oq3fjmrndb4k4nfwahglutgs7qashqqmk4lo5gi',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryqlrmscj52mkdd4pkapb7uv35pjt6uck3ou3f5mrkb4dtpvhsngxfge7gellu7f2exsvvi',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrwqlrmsaj43aktx4peb3dpeutcoq366ss5oqyfxnjpdb4k5p5gerkiyfmxpierahjkb7wvnea',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmruqpsmoaby2indz77jb3dpsulfoq366ss6oe3frnbcdv4k4vh4rilnktlx4nqyxqrtxc2y5jy',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrdu44az73upd367katbp6wt5pjt6uck3om3fvmbkb4dzdbxuphe3kofhxbq4byufobvvw',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrtrdumsab53qkdx7xka3ap4ud5pjt6uck6o4yf7mzpb4dzucrujymlaha7bzj4gyc7ukaas',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrrqlqm6cby3imdr6xiatapetttfjrksdc7ou2fjnjyobsrabk2zuop4qoyow2bxy7txfja')

all_reviews2 <- lapply(phantom_urls, scrape_reviews2)
final_all_reviews2 <- do.call(rbind, all_reviews2)
View(final_all_reviews2)


#PUSS IN BOOTS
session3 <- bow(url = 'https://www.imdb.com/title/tt3915174/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session3

session_scrape3 <- scrape(session3)

scrape_reviews3 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  pussinboots_df= data.frame(
    Movie_Name=c('Puss in Boots'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

pussinboots_urls<-c('https://www.imdb.com/title/tt3915174/reviews?ref_=tt_urv',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzvqltmyars3ikd57xjb7c7yv35pjt6ubktou4vvnjdb4dqjgyyo7ci5i5gce2ur66cibz36',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqr3rmscj53yndv6hiapdp2wt5pjt6ubksom2fvprcb4d6rdxh3ndafvnhsotfpxb456ijq',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjsr3t46ar73akdb6ppa3dpsv35pjt6ubkspayfjmbmb4d7lh2m6yp7xlgo32h6ve56tp7e6',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzr3umuar33yodb7pmb3bpgud5pjt6ubksoe4flmbnb4dsbofscyhfgewd5fyx3hajzwizm',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrxt44cby2imtr7pfaxcpuvd5pjt6ubk4pe2v7njpb4d4j2f7khfgpb7s4cgobbcgaeh32',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrtqlu4wbry2ikdb67jahe76ud5pjt6ubktoyzvtnbjb4d6nuwtg22yxgeg3ad5o3jdkhqbe',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrqrps4qbz32imdz4hlb7cpgu35pjt6ubczom2vrmzdb4dsv7h5tai24wqjhu6c3o254ux2a',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrrrlum4ab33aodd6hfb3bpyudeoq366ssto43vznjcdr4k4axsgle44esrgjvnvcywpucik2y',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzzqpsmybzz3upd767mb7ep4vtfoq366ssto44f5nrpdf4k4554up46pyet4ck3ge3n5nr466y',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzwqpq42aj73amd54hoaha7evl5pjt6ubc3oq2vvnrjb4dxf3udoz6camgz2jq55ru7fs5xw',
                    'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzxrxr4mcb63amdb6xiapd72vd5pjt6ubktouzfvmrkb4dslvlvsd5cdrnskibgdjdzq5nqy')

all_reviews3 <- lapply(pussinboots_urls, scrape_reviews3)
final_all_reviews3 <- do.call(rbind, all_reviews3)
View(final_all_reviews3)

##THE MEG
session4 <- bow(url =  'https://www.imdb.com/title/tt9224104/reviews/?ref_=tt_ov_rt', user_agent = "Student's Demo Educational")

session4

session_scrape4 <- scrape(session4)

scrape_reviews4 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  themeg_df= data.frame(
    Movie_Name=c('The Meg'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

themeg_urls<-c( 'https://www.imdb.com/title/tt5776858/reviews?ref_=tt_urv',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbzr3smmarz3untz77ja7e76ul5pjt6uck3oy2flmbkb4drqe7eauirauwzu6tuj5e66m7w4',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqr3t4ycjt3qntr67oa3cpswt5pjt6uck3oqyvzpzmb4dv45p2bxrmnmi7cck7irr2f6g7a',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzqpsmscb23uodz77mahe7yud5pjt6uck3ouzvvmrmb4drw6hpzzfztpbb4iikbixebuuee',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvrtrmmbr43qmtd4pna3cp6wtgoq366ss7oazflmzndz4k5epqjcoyl7vktfdwv2nu33yen3a',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjtrdumsab53qkdx7xka3ap4u3hoq366ss7oq3fjmrndb4k4nfwahglutgs7qashqqmk4lo5gi',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryqlrmscj52mkdd4pkapb7uv35pjt6uck3ou3f5mrkb4dtpvhsngxfge7gellu7f2exsvvi',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrwqlrmsaj43aktx4peb3dpeutcoq366ss5oqyfxnjpdb4k5p5gerkiyfmxpierahjkb7wvnea',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmruqpsmoaby2indz77jb3dpsulfoq366ss6oe3frnbcdv4k4vh4rilnktlx4nqyxqrtxc2y5jy',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrdu44az73upd367katbp6wt5pjt6uck3om3fvmbkb4dzdbxuphe3kofhxbq4byufobvvw',                
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrtrdumsab53qkdx7xka3ap4ud5pjt6uck6o4yf7mzpb4dzucrujymlaha7bzj4gyc7ukaas',
                'https://www.imdb.com/title/tt5776858/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrrqlqm6cby3imdr6xiatapetttfjrksdc7ou2fjnjyobsrabk2zuop4qoyow2bxy7txfja')

all_reviews4 <- lapply(themeg_urls, scrape_reviews4)
final_all_reviews4 <- do.call(rbind, all_reviews4)
View(final_all_reviews4)


##SCHLINDER'S LIST
session5 <- bow(url = 'https://www.imdb.com/title/tt0108052/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session5

session_scrape5 <- scrape(session5)

scrape_reviews5 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  schlinderslist_df= data.frame(
    Movie_Name=c('Schlinders List'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

schlinderslist_urls<-c( 'https://www.imdb.com/title/tt0108052/reviews?ref_=tt_urv',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrqqlr4war234md36hmaddpqw35pjt6udstoezfxnjlb4dziulpagzwleyrf2kwxx2gqk5cm',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzsqls4mbr23yptr7pea7e72u35pjt6ud22pa3vvpzmb4d5wi7lyn55hz2yvhfdgm4oifljw',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzqqltmybz32ikdz7poalc7ww35pjt6uds4om2f5nbdb4dtmmjjzbxyjzurxmz3xpmfmxv3i',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzrr7smwbjy3eptt7xialb7uvd5pjt6ud24oeyv7njnb4dvtxinsznevrggbomneaxq6apoq',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbyrxqmucby34ktt6xjadcp4v35pjt6ud25oqyv5nrjb4d5vleimgv2wywbsweo6etl4mx66',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbzrxrmmabs34odr7hla7c7yvt5pjt6ud23oiyf3mblb4dsp5tcrwtq7vhc3zgzar4cvydq6',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwqlqmoar42modr6hja7a74ud5pjt6udkyoi4vznjpb4dsqz6k6gy6ewcuec4meg3fctuw2',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbxqptmubb23ekd76poahbp6wt5pjt6udc3o43vzmzib4dtjfnuazec2i2g3hw4en42uytmo',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbxrdrmwcbz3qpt77hpb3d7gwt5pjt6udcyoizv5nbnb4drbg37hecacpgk5p6mwknrrz3gu',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnburxum6cbz3antx6pmadcpqud5pjt6uds5ou3vrnbob4drpdxnucumbkcosml6qbthyzifi',
                        'https://www.imdb.com/title/tt0108052/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnburpu46cb33qnd74hlb7bp2ud5pjt6ud26omyf7mrnb4d5gohngt7aunejbxob5zxfzgje4')

all_reviews5 <- lapply(schlinderslist_urls, scrape_reviews5)
final_all_reviews5 <- do.call(rbind, all_reviews5)
View(final_all_reviews5)

##MALEFICIENT
session6 <- bow(url =  'https://www.imdb.com/title/tt1587310/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session6

session_scrape6 <- scrape(session6)

scrape_reviews6 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  maleficient_df= data.frame(
    Movie_Name=c('Maleficient'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

maleficient_urls<-c( 'https://www.imdb.com/title/tt1587310/reviews?ref_=tt_urv',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbyr7rmwars2ipd74hia3c74vl5pjt6uds3oi2fjnzdb4d2aqn32w7ejqtt7wcrryenozvwo',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbtr7rm4cj63mnt367jahapyul5pjt6uds3o4yv7mbob4dzspzcmfni2zniiqpj5pxlpmbpy',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyrtumqcbs2iktv7pjb3d7evd5pjt6uds3pe3vrnjmb4dvmrmmz6o3u7z5izckiqg7jkbhq',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwrdr4wcjs3aptx4ppada7svd5pjt6ubc7oy4v3mrkb4d5k4ddmscfgiunqbgsp7e4sobew',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjurdqm2aj72iod767madc7gvt5pjt6uds3oi2fxprdb4dwllgtuzkm4rzdqpcanspnqloeo',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjtrhs4ubr43ukt77pnb3a7uv35pjt6uck3oizvznjpb4dvdwqcf3z5atgzgrfsbgazds2a6',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjrrxrmobj73ymdb4hnb7d7stttfjrksds7pe2fzpzyoaa3ybi35wqmuzddaba6cyld7gzq',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryrpt42br734md37xfa3d72u35pjt6uds3oi2vjnzpb4dsvideylys5krsjrtkcl46w4pse',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrwrtumwars3emd57xjb3bpgtttfjrk4dkyoiyflnbyoaokxtptzz6erj657tmgaxyvjbnq',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrxrhtmmar53uktz6peadepwv35pjt6uc2toi4vlnrjb4dyb36zq5c3o2gh57wsz25ypux46',
                     'https://www.imdb.com/title/tt1587310/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrxumwbr23qmd54piaxe7gwt5pjt6ucc5oiyv7nbnb4d44txpytpa7fqsjndjl2aboazjk')

all_reviews6 <- lapply(maleficient_urls, scrape_reviews6)
final_all_reviews6 <- do.call(rbind, all_reviews6)
View(final_all_reviews6)

##SPIRITED AWAY
session7 <- bow(url =  'https://www.imdb.com/title/tt0245429/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session7

session_scrape7 <- scrape(session7)

scrape_reviews7 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  spiritedaway_df= data.frame(
    Movie_Name=c('Spirited Away'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

spiritedaway_urls<-c( 'https://www.imdb.com/title/tt0245429/reviews?ref_=tt_urv',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzqr3tmqajs2iot367lb7apqvl5pjt6ucc6ou2vlnrib4dwbb47ecu5x34u5sbqw4lil2j5o',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqr7u4uabs3uodr6xob3dp6vl5pjt6udc5o4yf5mbcb4d6eqmfxxdgt52aby4qxx3pas2su',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjxrlu4uabs3umtx4pfaxapyvd5pjt6udc3pezf5mrpb4duky4ztfis2td7wet6hxrfqclvy',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqrts4mab73qodz6pnate74u3goq366ss3o4zvvnbodb4k5e37v7uwj3yixjz26ge4xqyqzsy',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryqlt4ybz73apdx6heapepyvl5pjt6ucs2pe2f5njjb4dquyzwxqpbx4eka37vjyie62dvy',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzrdq4ybbt3andd77nate7wvthoq366ss2pa3vtprndn4k5uswdc4zyszhhomemko6t7umjha',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrwrpr4qbbz3umtt77ma7b74wt5pjt6udc7oyzvtmblb4d532wcmfyvhogfeowxva3b4osas',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrxrls4ycjy2motr4hea7cpevlfoq366sszoi4vzmzddf4k43rsmtwjj7fm3i2lnef3qbjjdpa',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrurps46bzy2mktx6xnapdpqwt5pjt6udk4oi3fzpzpb4d72lde2i4i44nkrekd7m6pg4lxs',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrhumybzt3amd76pka3dpsudeoq366ss3o4zvvmrmcv4k5hmiqxtyi3x5uk3mkmtn5rutzgy',
                     'https://www.imdb.com/title/tt0245429/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrsr7q4ybbt34odb7piale7stttfjrkkc23oiyflnryodp2cehelbf5vr273hsynfzw6p4q')

all_reviews7 <- lapply(spiritedaway_urls, scrape_reviews7)
final_all_reviews7 <- do.call(rbind, all_reviews7)
View(final_all_reviews7)



##PARASITE
session8 <- bow(url =  'https://www.imdb.com/title/tt6751668/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session8

session_scrape8 <- scrape(session8)

scrape_reviews8 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  parasite_df= data.frame(
    Movie_Name=c('Parasite'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

parasite_urls<-c( 'https://www.imdb.com/title/tt6751668/reviews?ref_=tt_urv',
                      'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzvqpqmwbbs3motx7hja3apyvl5pjt6ucc7oi4vzmjjb4d6wjluxnoqnv3lgk4xynnjm6fim',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnztrpsm2ar63endb67fahep4w35pjt6ucc7oa4flmrnb4dqwsqlqaj7xr5mejqyjfghy2pi2',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzqrdsmqbj33qktz4hpb7b72vt5pjt6uccyo43frprmb4dyj6pqrq4ioma4aateaxo7zzlxi',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzrrtq42bzt3mntt4pma7e6mqbdf4qk6cc6oi2fxjchkuvy2yf2rbomw3uzbpuqqi4qlu',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbyqlt4ocbz3yptx4ppb3bp4ud5pjt6ucc7o4yv7nbnb4d4aifsnw2hqfjpqx3zdgt2mbefm',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbyrpq4uaj72ikd76xkapbpqv35pjt6ucc7oy3f3mjmb4d4be57iqwccfay4p5luk26bjmrw',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbzrht4ybbs3ypdd4hpaldpwvt5pjt6ucc7oqyv5nbpb4d3ge6luhoxxfghjibfdolcu4nxe',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwqlsmucj63aptx7pfa7b7qvl5pjt6ucc6oi2fvmrob4d6doz6mq46guwhaeb7sanunekzm',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwrlumqcb22indr6pma3e7wtttfjrkqck4ou4vlnzyoaisuc5q2hm6wokvnd2e7zj4owia',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbxrhrmqbzz3akt74pkahe74v35pjt6ucczoyzv5mjkb4dvfopfi3rutd7if3ydekci3bu3g',
                  'https://www.imdb.com/title/tt6751668/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbur7u4yars3amd56hfb3dpqv35pjt6ucc7o42f3pzib4d6hlfiypze2zlpwrlkgyfrr3wi4')

all_reviews8 <- lapply(parasite_urls, scrape_reviews8)
final_all_reviews8 <- do.call(rbind, all_reviews8)
View(final_all_reviews8)


##GRAVE OF THE FIREFLIES
session9 <- bow(url =  'https://www.imdb.com/title/tt6751668/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session9

session_scrape9 <- scrape(session9)

scrape_reviews9 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  graveotf_df= data.frame(
    Movie_Name=c('Grave of the Fireflies'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

graveotf_urls<-c( 'https://www.imdb.com/title/tt0095327/reviews?ref_=tt_urv',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrxrpq4oaz334kd76piada76vd5pjt6udkzou4vzmjob4dqqwny32bwubu22qv6zkbog436e',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzvrdrmwaz23amdb7hjate7wtttfjrk2d26pazf3nryoas46ubnnlkdok7l5tydrcx4wyoa',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbur7u4sar52motx7plaxap4w35pjt6uds3pe2vlprob4dxg77ljlx2xz74n7ykdje4t4lj4',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbrqpqmsbr63int37pla7d74vd5pjt6udc5om3fjnzjb4dw66mjrfmtkntvfjk77w6n3krs6',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzrhs42cb42ipdt4hla3bpyvt5pjt6udksoy2fzpzmb4d7qyvl5yn5jcg26ivpqyrf25yos',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvrxrmyab33qktt7hiadcpgw3foq366sszom3vvpzndf4k56riul6pyv7b7f6poquhzhqlqsa',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjtqlt4mbz73uotz7pna7ap4uleoq366sszo44v5njcdr4k5x46jiakmq7w6zimjsjtruvlhvq',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqrdq44cjt3ymdx6hoaxdpwul5pjt6uds6ouyfzmjnb4dsrdfghmqduamyd3tao4gpbkn3k',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryqpqmqbr434pdv4plahep6vtfoq366ssyoqzftnjldr4k4ubfsa6ywdh554v2tt7voxm4wua',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzrdumyar43ekd767nadcpgvl5pjt6udkzou4vzmzlb4d272physhmvlouvm3qpitnxyymw',
                  'https://www.imdb.com/title/tt0095327/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrxrpu42bz73iktb4heahb7gvtgoq366ss2oe4vxmjidf4k4kvaxtvjvph5twfhbkowarkzj5a')

all_reviews9 <- lapply(graveotf_urls, scrape_reviews9)
final_all_reviews9 <- do.call(rbind, all_reviews9)
View(final_all_reviews9)

##10. COCO
session10 <- bow(url =  'https://www.imdb.com/title/tt2380307/reviews?ref_=tt_urv', user_agent = "Student's Demo Educational")

session10

session_scrape10 <- scrape(session10)

scrape_reviews10 <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  coco_df= data.frame(
    Movie_Name=c('Coco'),
    Name_Reviewer = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

coco_urls<-c( 'https://www.imdb.com/title/tt2380307/reviews?ref_=tt_urv',
                  'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzxrpqmqcj33imdb4heahcp4tttfjrksdk5o4yv7mryoa5plfgmd4xmv6nvlys2jdd5zi4q',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzqpum4bzy34kdd4hkatep6vd5pjt6ucczoiyvrmrpb4d5jdc4kpvjfcyopsxnwjdlvggi2',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvrlqm6az334ktv4hka7dpgu3coq366ss7om2vjnrodv4k5cyjb5u2djtlynkcbs4qlslcodi',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqrhqmyabz3mpdd7xkatep2ud5pjt6ucssouzv7pzpb4dyiux75nljxgzwmpnpeyvrcbozw',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzr3s4obb634ndd4hfadb7uwthoq366ss7omyfrpridr4k4euyayiztv24gedcvtrh5hv5xji',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrxr7rmmbz53iodt6hea7a7eu3hoq366ss7oe2vrnzkdb4k5i3obzzog4xemlcvbkfw3jst2wa',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrurprm2bz63aktr4hnb3ep2v35pjt6uck7oiyvlmbpb4dznectwhf5cmum4agoe65i7szco',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrprm6cj634ktr7xladapyw3coq366ssypa3fznrodf4k5ychcgxu7zz2g44ulm476z7sjxa',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrtrhtmyaj42imt367paxb7stttfjrkqbc3om2f3nbyoao4yguygnipedfm2svw3iavsy6a',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrrqpu4wajy3entz4ppatdpqw3coq366ssypa3vjnzddr4k4lyd5stlik6mpi6oqbjcniguhgi',
              'https://www.imdb.com/title/tt2380307/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzyrxtmsab534ptx67fade76vd5pjt6udsto43fvprlb4ducpv6vlutng4xvmlpouuvxcanq')

all_reviews10 <- lapply(coco_urls, scrape_reviews10)
final_all_reviews10 <- do.call(rbind, all_reviews10)
View(final_all_reviews10)

##BINDING ALL DATAFRAME
ACTIVITY2.1_DUERO<-rbind(final_all_reviews1, final_all_reviews2, final_all_reviews3, final_all_reviews4, final_all_reviews5, final_all_reviews6, final_all_reviews7, final_all_reviews8, final_all_reviews9, final_all_reviews10)
ACTIVITY2.1_DUERO<-as.data.frame(ACTIVITY2.1_DUERO)

##MAKING EXCEL FILE
install.packages("writexl")
library(writexl)

write_xlsx(ACTIVITY2.1_DUERO, "C:/Users/User/Documents/Rstudio Files/3KReviews.xlsx")
