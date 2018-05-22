#set working directory
#importdata
words<-read.table("insults.txt", header=FALSE, comment.char="", quote="\"", sep='\t')

#worddata
#change to lowercase
#split into words
#remove numbers
wordssmall<- sapply(words, tolower)
#split string into words
wordssplit<- strsplit(wordssmall," ")
x<-gsub("   ","",wordssplit)
wordlist<-gsub("[0-9]","",x)
wordlist

#import stopwords
#add stopwords to dict
stopwords<- read.table("stopwords.txt", header=FALSE, comment.char="", quote="\"", sep='\t')
stopwords<- as.character(stopwords$V1)
stopwords<- c(stopwords, stopwords)

#create corpus to remove stopwords from wordlist
library(tm)
review_words<-Corpus(VectorSource(wordlist))
wordsremoved<-tm_map(review_words, removeWords,stopwords())

#remove non-alphanumeric characters from stopwords
stopwords2<- gsub("[^a-z]","",stopwords)

#remove punctuation from wordsremoved
#remove updated stopwords
#create matrix and sort into frequency
review_words2<-Corpus(VectorSource(wordsremoved))
wordsend<-tm_map(review_words2,removePunctuation)
wordsend<-tm_map(wordsend, removeWords,stopwords2())
wordsend<-tm_map(wordsend, stripWhitespace)
wordsendmatrix1<-DocumentTermMatrix(wordsend)
wordsendmatrix2<-as.matrix(wordsendmatrix1)
frequency<-colSums(wordsendmatrix2)
frequency<-sort(frequency, decreasing=TRUE)
frequency


#sort for top 25 words
#change array into list
list<-head(frequency, 25)
library(tidyr)
as.data.frame(list) %>% separate(list, into = paste("V", 1, sep = "_"))