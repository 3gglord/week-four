install.packages("RCurl")
library("RCurl")
x <- getURL("https://raw.githubusercontent.com/shawngraham/exercise/gh-pages/CND.csv", .opts = list(ssl.verifypeer = FALSE))
documents <- read.csv(text = x, col.names=c("Article_ID", "Newspaper Title", "Newspaper City", "Newspaper Province", "Newspaper Country", "Year", "Month", "Day", "Article Type", "Text", "Keywords"), colClasses=rep("character", 3), sep=",", quote="")
counts <- table(documents$Newspaper.City)
counts
barplot(counts, main="Cities", xlab="Number of Articles")

class(documents$Newspaper.City)

documents$Newspaper.City <- gsub("Edinbugh", "Edinburgh", documents$Newspaper.City)
barplot(counts, main="Cities", xlab="Number of Articles")

years <- table(documents$Year)
barplot(years, main="Publication Year", xlab="Year", ylab="Number of Articles")

titles <- table(documents$Newspaper.Title)
barplot(titles, main="Newspaper Titles", xlab="Title", ylab="Number of Articles")

type <- table(documents$Article.Type)
barplot(type, main="Types of Articles", xlab="Type", ylab="Number of Articles")
documents$Article.Type <- gsub("advertise", "advertisement", documents$Article.Type)
barplot(type, main="Types of Articles", xlab="Type", ylab="Number of Articles")
documents$Article.Type <- gsub("advertisement", "advertise", documents$Article.Type)
barplot(type, main="Types of Articles", xlab="Type", ylab="Number of Articles")

