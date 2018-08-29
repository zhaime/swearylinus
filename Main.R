# Point to insults & stopwords files
insults_filename <- "insults-debug.txt"
stopwords_filename <- "stopwords-debug.txt"

# Function that accepts a list of raw (un-separated) lines, returns a list of words
get_words_from_file <- function(rawLines, wordList) {
    lines <- strsplit(rawLines, "\n")
    n <- 1
    for (line in unlist(lines)) {
        # Split each line into a list of words
        line_words <- strsplit(as.character(line), " ")
        for (word in unlist(line_words)) {
            # Add each word into the "raw" list
            wordList[[n]] <- word
            n <- n + 1
        }
    }

    return(wordList)
}

# Read insults & stopwords as raw lines (not a table or other 2D structure)
insults_txt <- file(insults_filename, encoding="UTF8")
insults <- readLines(insults_txt)
stopwords_txt <- file(stopwords_filename, encoding="UTF8")
stopwords <- readLines(stopwords_txt)

# Get raw insult & stopword words
raw_insult_words <- get_words_from_file(insults, list())
raw_stopword_words <- get_words_from_file(stopwords, list())

print("raw_insult_words length is:")
print(length(raw_insult_words))
print(unlist(raw_insult_words))

print("raw_stopword_words length is:")
print(length(raw_stopword_words))
print(unlist(raw_stopword_words))

# for (insult_line in insults) {
#     # insult_words<-strsplit(insult_line, " ")
#     # lower_insult_words<-sapply(insult_words, tolower)
#     # x<-gsub("  ", "", lower_insult_words)
#     # wordlist<-gsub("[0-9]", "", x)
# }

# #import stopwords
# #add stopwords to dict
# stopwords<-read.table("stopwords.txt", header=FALSE, comment.char="", quote="\"", sep='\n')
# stopwords<-as.character(stopwords$V1)
# stopwords<-c(stopwords, stopwords)

# #create corpus to remove stopwords from wordlist
# library(tm)
# review_words<-Corpus(VectorSource(wordlist))
# wordsremoved<-tm_map(review_words, removeWords, stopwords())
# #remove only-letter stopwords fro wordlist

# #remove non-letter characters from stopwords
# stopwords<-gsub("[^a-z]", "", stopwords)

# #remove punctuation from wordsremoved
# #remove updated stopwords
# #create matrix and sort into frequency
# review_words2<-Corpus(VectorSource(wordsremoved))
# wordsend<-tm_map(review_words2, removePunctuation)
# wordsend<-tm_map(wordsend, removeWords, stopwords())
# wordsend<-tm_map(wordsend, stripWhitespace)
# wordsendmatrix1<-DocumentTermMatrix(wordsend)
# wordsendmatrix2<-as.matrix(wordsendmatrix1)
# frequency<-colSums(wordsendmatrix2)
# frequency<-sort(frequency, decreasing=TRUE)

# #sort for top 25 words
# #change array into list
# list<-head(frequency, 25)
# library(tidyr)
# as.data.frame(list) %>% separate(list, into = paste("V", 1, sep = "_"))