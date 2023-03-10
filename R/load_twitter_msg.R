library(twitteR)

#' Title Take four input parameters and stored in a list object
#' named "user_info" with keys "consumer_key", "consumer_secret", "access_token", and "access_token_secret".
#'
#' @param consumer_key_input twitter consumer key
#' @param consumer_secret_input twitter consumer secret
#' @param access_token_input twitter token
#' @param access_token_secret_input twitter token secret
#'
#' @return list contains above user info
#' @export
#'
#' @examples
#' \dontrun{
#' user_info(consumer_key_input, consumer_secret_input, access_token_input, access_token_secret_input)
#' }
user_info <- function(consumer_key_input, consumer_secret_input, access_token_input, access_token_secret_input) {

  user_info <- list(
    "consumer_key" = consumer_key_input,
    "consumer_secret" = consumer_secret_input,
    "access_token" = access_token_input,
    "access_token_secret" = access_token_secret_input
  )

  return(user_info)
}


#' Load dataframe which contains specific keyword return as a dataframe with total tweets
#'
#' @param keywords A str contains keywords
#' @param limit An integer shows how many tweets user want to return
#' @param user_info A list contains user info
#'
#' @return A dataframe
#' @export
#'
#' @examples
#' \dontrun{
#' x <- load_twitter_by_keywords('nice', 50, user_info)
#' }
load_twitter_by_keywords <- function(keywords, limit, user_info) {
  consumer_key <- user_info$consumer_key
  consumer_secret <- user_info$consumer_secret
  access_token <- user_info$access_token
  access_secret <- user_info$access_token_secret

  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  res = searchTwitter(keywords, n=limit)
  res_df <- twListToDF(res)

  final_df <- res_df |> select(screenName,id, created, favoriteCount, retweetCount, text)

}


#' Load dataframe which contains specific user and return as a dataframe with total tweets
#'
#' @param user_name A str contains tweets with specific user
#' @param limit An integer shows how many tweets user want to return
#' @param user_info A list contains user info
#'
#' @return A dataframe contains all tweets contains specific user tweets
#' @export
#'
#' @examples
#' \dontrun{
#' x <- load_twitter_by_user('Cristiano', 100, user1)
#' }
load_twitter_by_user <- function(user_name, limit, user_info) {
  consumer_key <- user_info$consumer_key
  consumer_secret <- user_info$consumer_secret
  access_token <- user_info$access_token
  access_secret <- user_info$access_token_secret

  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  res = userTimeline(user_name, n=limit)
  res_df <- twListToDF(res)

  final_df <- res_df |> select(screenName,id, created, favoriteCount, retweetCount, text)

}
