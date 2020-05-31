install.packages('tidyverse')
install.packages('tidytext')

library(tidyverse)
library(tidytext)

cb  <- read_csv("chapbooks-text.csv")

cb_df <- tibble(id = cb$line, text = (str_remove_all(cb$text, "[0-9]")), date = cb$date)

tidy_cb <- cb_df %>%
  unnest_tokens(word, text)

data(stop_words)

tidy_cb <- tidy_cb %>%
  anti_join(stop_words)

cb_words <- tidy_cb %>%
  count(id, word, sort = TRUE)

head(cb_words)

dtm <- cb_words %>%
  cast_dtm(id, word, n)

install.packages("tm")
library(tm)

dtm <- cb_words %>%
  cast_dtm(id, word, n)

require(topicmodels)

install.packages("topicmodels")
library(topicmodels)

require(topicmodels)

K <- 15

set.seed(9161)

topicModel <- LDA(dtm, K, method="Gibbs", control=list(iter = 500, verbose = 25))

tmResult <- posterior(topicModel)
attributes(tmResult)
ncol(dtm)
beta <- tmResult$terms   # get beta from results
dim(beta)
# for every document we have a probability distribution of its contained topics
theta <- tmResult$topics
dim(theta)    

top5termsPerTopic <- terms(topicModel, 5)
topicNames <- apply(top5termsPerTopic, 2, paste, collapse=" ")
topicNames

# load libraries for visualization
library("reshape2")
library("ggplot2")

exampleIds <- c(2, 100, 200)

N <- length(exampleIds)

topicProportionExamples <- theta[exampleIds,]
colnames(topicProportionExamples) <- topicNames

vizDataFrame <- melt(cbind(data.frame(topicProportionExamples), document = factor(1:N)), variable.name = "topic", id.vars = "document")  

ggplot(data = vizDataFrame, aes(topic, value, fill = document), ylab = "proportion") +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
  coord_flip() +
  facet_wrap(~ document, ncol = N)

#topics over time
# append decade information for aggregation
cb$decade <- paste0(substr(cb$date, 0, 3), "0")
# get mean topic proportions per decade
topic_proportion_per_decade <- aggregate(theta, by = list(decade = cb$decade), mean)
# set topic names to aggregated columns
colnames(topic_proportion_per_decade)[2:(K+1)] <- topicNames

# reshape data frame, for when I get the topics over time thing sorted
vizDataFrame <- melt(topic_proportion_per_decade, id.vars = "decade")

# plot topic proportions per deacde as bar plot
require(pals)
install.packages('pals')
library('pals')

require(pals)
ggplot(vizDataFrame, aes(x=decade, y=value, fill=variable)) +
  geom_bar(stat = "identity") + ylab("proportion") +
  scale_fill_manual(values = paste0(alphabet(20), "FF"), name = "decade") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#more than 15 topic models
K <- 20
set.seed(9161)
topicModel <- LDA(dtm, K, method="Gibbs", control=list(iter = 500, verbose = 25))
tmResult <- posterior(topicModel)
attributes(tmResult)
# lengthOfVocab
ncol(dtm)
# topics are probability distributions over the entire vocabulary
beta <- tmResult$terms   # get beta from results
dim(beta)
# for every document we have a probability distribution of its contained topics
theta <- tmResult$topics
dim(theta)        
top5termsPerTopic <- terms(topicModel, 5)
topicNames <- apply(top5termsPerTopic, 2, paste, collapse=" ")
topicNames
# load libraries for visualization
library("reshape2")
library("ggplot2")
# select some documents for the purposes of
# sample visualizations
# here, the 2nd, 100th, and 200th document
# in our corpus
exampleIds <- c(2, 100, 200)
N <- length(exampleIds)
# get topic proportions form example documents
topicProportionExamples <- theta[exampleIds,]
colnames(topicProportionExamples) <- topicNames
# put the data into a dataframe just for our visualization
vizDataFrame <- melt(cbind(data.frame(topicProportionExamples), document = factor(1:N)), variable.name = "topic", id.vars = "document")  
# specify the geometry, aesthetics, and data for a plot
ggplot(data = vizDataFrame, aes(topic, value, fill = document), ylab = "proportion") +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
  coord_flip() +
  facet_wrap(~ document, ncol = N)
#topics over time
# append decade information for aggregation
cb$decade <- paste0(substr(cb$date, 0, 3), "0")
# get mean topic proportions per decade
topic_proportion_per_decade <- aggregate(theta, by = list(decade = cb$decade), mean)
# set topic names to aggregated columns
colnames(topic_proportion_per_decade)[2:(K+1)] <- topicNames
# reshape data frame, for when I get the topics over time thing sorted
vizDataFrame <- melt(topic_proportion_per_decade, id.vars = "decade")
# plot topic proportions per deacde as bar plot
require(pals)
ggplot(vizDataFrame, aes(x=decade, y=value, fill=variable)) +
  geom_bar(stat = "identity") + ylab("proportion") +
  scale_fill_manual(values = paste0(alphabet(20), "FF"), name = "decade") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# five topic models
K <- 5
set.seed(9161)
topicModel <- LDA(dtm, K, method="Gibbs", control=list(iter = 500, verbose = 25))
# have a look a some of the results (posterior distributions)
tmResult <- posterior(topicModel)
# format of the resulting object
attributes(tmResult)
# lengthOfVocab
ncol(dtm)
# topics are probability distributions over the entire vocabulary
beta <- tmResult$terms   # get beta from results
dim(beta)
# for every document we have a probability distribution of its contained topics
theta <- tmResult$topics
dim(theta)        
top5termsPerTopic <- terms(topicModel, 5)
topicNames <- apply(top5termsPerTopic, 2, paste, collapse=" ")
topicNames
# load libraries for visualization
library("reshape2")
library("ggplot2")
# select some documents for the purposes of
# sample visualizations
# here, the 2nd, 100th, and 200th document
# in our corpus
exampleIds <- c(2, 100, 200)
N <- length(exampleIds)
# get topic proportions form example documents
topicProportionExamples <- theta[exampleIds,]
colnames(topicProportionExamples) <- topicNames
# put the data into a dataframe just for our visualization
vizDataFrame <- melt(cbind(data.frame(topicProportionExamples), document = factor(1:N)), variable.name = "topic", id.vars = "document")  
# specify the geometry, aesthetics, and data for a plot
ggplot(data = vizDataFrame, aes(topic, value, fill = document), ylab = "proportion") +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
  coord_flip() +
  facet_wrap(~ document, ncol = N)
#topics over time
# append decade information for aggregation
cb$decade <- paste0(substr(cb$date, 0, 3), "0")
# get mean topic proportions per decade
topic_proportion_per_decade <- aggregate(theta, by = list(decade = cb$decade), mean)
# set topic names to aggregated columns
colnames(topic_proportion_per_decade)[2:(K+1)] <- topicNames
# reshape data frame, for when I get the topics over time thing sorted
vizDataFrame <- melt(topic_proportion_per_decade, id.vars = "decade")
# plot topic proportions per deacde as bar plot
require(pals)
ggplot(vizDataFrame, aes(x=decade, y=value, fill=variable)) +
  geom_bar(stat = "identity") + ylab("proportion") +
  scale_fill_manual(values = paste0(alphabet(20), "FF"), name = "decade") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

