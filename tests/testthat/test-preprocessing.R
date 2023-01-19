#' Perform general preprocessing on df
#'
#' @param df A dataframe storing all the raw data with text column
#' @param output_path  The path that the newly generated csv should located at
#'
#' @return A dataframe contains preprocessed (fix type, drop unused column, arrange column order, add text column) dataframe and export as a csv file
#' @export
#'
#' @examples
#' x <- generalPreprocessing(df)





#' Clean all punctuations and special mark for each twitter message(s)
#'
#' @param tweets Tweets message for each twitter
#'
#' @return A String which represents tweets contains non-punctuations and special marks string message
#' @export
#'
#' @examples
#' x <- clean_punctuation('Today is a good day!')