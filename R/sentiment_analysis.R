#' Labelling each row in a given column of tweets/text with positive, negative or neutral sentiment
#'
#' @param df dataframe after pre-processing
#' @param col Column name of the tweets in the dataset
#'
#' @return A dataframe contains all tweets the corresponding labels
#' @export
#'
#' @examples
#' x <- get_sentiment_result(df, "text")


#' Count the propotion of different sentiment tweets in a labelled sentiment dataframe
#'
#' @param df A dataframe after pre-processing
#' @param boolean A boolean value if True: returns the proportion; otherwise, return the counts
#'
#' @return A dictionary which calculates the proportion of three sentiments of tweets
#' @export
#'
#' @examples
#' x <- count_tweets(labelled_df)