library(tm)
library(wordcloud)

#' Create a clean corpus of all the used words in a users tweets.
#'
#' @param df A dataframe containing a users tweets that has been preprocessed.
#'
#' @return A VCorpus of all the words used disregarding stopwords and punctuation.
#' @export
#'
#' @examples
#' \dontrun{
#'   docs <- clean_tweets(df)
#' }

clean_tweets <- function(df) {

  text <- df$text_clean
  docs <- tm::VCorpus(tm::VectorSource(text))
  docs <- docs %>%
    tm::tm_map(tm::removeNumbers) %>%
    tm::tm_map(tm::removePunctuation) %>%
    tm::tm_map(tm::stripWhitespace)
  docs <- tm::tm_map(docs, tm::content_transformer(tolower))
  docs <- tm::tm_map(docs, tm::removeWords, tm::stopwords("english"))

  return(docs)
}

#' Create a dataframe with all the words in a users tweets and how often they appear.
#'
#' @param docs A VCorpus of words used in a users tweets.
#'
#' @return A dataframe with all the words in the tweets and how often they appear.
#' @export
#'
#' @examples
#' \dontrun{
#'   df2 <- count_words(docs)
#' }

count_words <- function(docs) {

  dtm <- as.matrix(tm::TermDocumentMatrix(docs))
  words <- sort(rowSums(dtm), decreasing = TRUE)
  df_words <- data.frame(word = names(words), freq = words)

  return(df_words)
}

#' Create a wordcloud of a users tweets.
#'
#' @param df A dataframe with all the words in the tweets and how often they appear.
#'
#' @return A wordcloud of a users tweets.
#' @export
#'
#' @examples
#' \dontrun{
#'   create_wordcloud(df2)
#' }

create_wordcloud <- function(df) {

  set.seed(524)

  wc <- wordcloud(
    words = df$word,
    freq = df$freq,
    min.freq = 2,
    max.words = 200,
    random.order = FALSE,
    rot.per = 0.35,
  )
}
