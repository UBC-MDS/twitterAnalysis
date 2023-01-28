library(syuzhet)
library(dplyr)
#' Labelling each row in a given column of tweets/text with positive, negative or neutral sentiment
#'
#' @param df dataframe after pre-processing
#' @param col Column name of the tweets in the dataset
#'
#' @return A dataframe contains all tweets the corresponding labels
#' @export
#'
#' @examples
#' df <- data.frame(User = c("Youri"), text = c("Hi, how are you!"))
#' labelled_df <- sentiment_labeler(df, "text")
#'
sentiment_labeler <- function(df, col) {
  df$score <- syuzhet::get_nrc_sentiment(df[, col])
  df <- df |>
    dplyr::mutate(
      sentiment =
        ifelse(score$positive > score$negative,
          "positive",
          ifelse(score$positive < score$negative,
            "negative",
            ifelse(score$positive == score$negative,
              "neutral",
              "ERROR"
            )
          )
        )
    )
  df <- df |>
    dplyr::select(-score)
  return(df)
}


#' Count the propotion of different sentiment tweets in a labelled sentiment dataframe
#'
#' @param df A dataframe after pre-processing
#' @param proportion A boolean value if True: returns the proportion; otherwise, return the counts
#'
#' @return A list which calculates the proportion of three sentiments of tweets
#' @export
#'
#' @examples
#' df <- data.frame(User = c("Youri"), text = c("Hi, how are you!"))
#' labelled_df <- sentiment_labeler(df, "text")
#' count_list <- count_tweets(labelled_df)
count_tweets <- function(df, proportion = TRUE) {
  if (proportion) {
    sentiment_counts <- prop.table(table(df$sentiment))
  } else {
    sentiment_counts <- table(df$sentiment)
  }

  return(as.list(sentiment_counts))
}
