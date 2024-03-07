library(DBI)
library(dplyr)
connection<-dbConnect(RMariaDB::MariaDB(),
                      dsn="RMaria-connection",
                      dbname="sample_db",
                      Server="localhost",
                      user="root")

#Checking the connect
dbListTables(connection)
dbListFields(connection,"posts")
posts_data_database <- dbGetQuery(connection, "SELECT * FROM sample_db.posts")

save(papers, file = "Arxiv_on_Database.RData")
write.csv(papers, file = "Arxiv papers on database.csv")