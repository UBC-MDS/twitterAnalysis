df <- data.frame(
  User = c("POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS"),
  text = c(
    "Jill and I send our deepest condolences to the families of all those killed in the tragic helicopter crash in Ukraine this morning – including Minister of Internal Affairs Monastyrskyy, a reformer and patriot. We grieve with all those who are mourning this heartbreaking tragedy.
",
    "An economy where a millionaire pays less in taxes than an educator or firefighter is an economy that doesn't work.   Our Administration's work to build a fairer tax code begins to right that wrong. https://t.co/hzxSc97kWl
",
    "Small business boom. I like the sound of that. Let's keep this momentum going, Administrator. https://t.co/J35qChJ0sv
",
    "Since I took office, over 10 million new small businesses have applied to set up shop.   That’s what it looks like to build an economy that looks out from Scranton — instead of looking down from Wall Street.
",
    "House Republicans have prioritized protecting rich tax cheats, allowing them to pay less in taxes than middle-class Americans. That's called trickle-down economics.  Let me tell you a secret: it doesn't work.",
    "Ordered a bacon cheeseburger from a local restaurant yesterday to celebrate over 10 million new small business applications during my presidency.   I may’ve caught Brittany off guard. https://t.co/rP8i8a0ny0
",
    "Today we learned the inflation rate for producers is at its lowest level since March 2021, leading to a decline in food and energy prices for working families.   Just the latest evidence that we're making progress tackling inflation. We're not letting up.",
    "Folks, the law is on our side of the student debt relief fight – we’re not giving up. Hang in there and keep the faith. https://t.co/CQZTd7yvWj
"
  )
)

test_that("shape of the dataframe is correct", {
  labeled_df <- sentiment_labeler(df, "text")
  expect_equal(dim(labeled_df), c(8, 3))
})

test_that("sentiment column is present in dataframe", {
  labeled_df <- sentiment_labeler(df, "text")
  expect_true("sentiment" %in% colnames(labeled_df))
})

test_that("only 3 unique sentiments are present", {
  labeled_df <- sentiment_labeler(df, "text")
  expect_equal(length(unique(labeled_df$sentiment)), 3)
})

test_that("count_tweets() returns a list", {
  labeled_df <- sentiment_labeler(df, "text")
  count_dict <- count_tweets(labeled_df)
  expect_true(is.list(count_dict))
})

test_that("count_tweets() returns correct proportions", {
  labeled_df <- sentiment_labeler(df, "text")
  count_dict <- count_tweets(labeled_df)
  expect_equal(count_dict, list(negative = 0.25, neutral = 0.375, positive = 0.375))
})
