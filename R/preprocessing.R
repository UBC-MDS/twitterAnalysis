library(stopwords)
#'  Perform general preprocessing on df. Removes retweets/favourites and cleans URLs, Mentions, and Numbers.
#'
#' @param df dataframe storing all the raw data with text column
#'
#' @return processed tweet dataframe.
#' @export
#'
#' @examples
#' df <- data.frame(User = c("James"), text = c("Hi, how are you!"))
#' x <- generalPreprocessing(df)
generalPreprocessing <- function(df) {
  # get rid of retweets / favourites (rows)
  df <- df[!grepl("(RT|FAV)", df$text),]

  # remove Numbers
  df$text_clean <- gsub("[0-9]+", "", df$text)

  # remove  URL's
  url_pattern <- "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"
  df$text_clean <- gsub(url_pattern, "", df$text_clean)

  #remove mentions
  df$text_clean <- gsub("@\\w*", "", df$text_clean)

  return(df)
}

