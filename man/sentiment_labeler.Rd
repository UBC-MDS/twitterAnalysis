% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentiment_analysis.R
\name{sentiment_labeler}
\alias{sentiment_labeler}
\title{Labelling each row in a given column of tweets/text with positive, negative or neutral sentiment}
\usage{
sentiment_labeler(df, col)
}
\arguments{
\item{df}{dataframe after pre-processing}

\item{col}{Column name of the tweets in the dataset}
}
\value{
A dataframe contains all tweets the corresponding labels
}
\description{
Labelling each row in a given column of tweets/text with positive, negative or neutral sentiment
}
\examples{
df <- data.frame(User = c("Youri"), text = c("Hi, how are you!"))
labelled_df <- sentiment_labeler(df, "text")

}
