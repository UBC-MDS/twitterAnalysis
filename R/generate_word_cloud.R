#' Get top n words from a specific sentiment dataframe
#'
#' @param df A dataframe after sentiment_analysis
#' @param n An integer shows how many number of top existing words in dataframe with tweets msg column
#'
#' @return A dictionary with key as word that has highest frequency and value as how many number it show up
#' @export
#'
#' @examples
#' x <- get_top_n_word(df, 5)



#' Create Wordcloud for each user's tweets
#'
#' @param text A str contains tweets messages
#' @param output_path The path that the newly generated png should located at
#'
#' @return A png which contains the picture of the wordcount
#' @export
#'
#' @examples
#' x <- create_wordcloud('today is bad day', /output)