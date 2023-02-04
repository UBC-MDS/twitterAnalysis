# Define supporting variables

potus_df <- data.frame(
  User = c("POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS"),
  text = c(
    "In America, we go forward when we go together.",
    "Like Dr. King, I know that there is nothing beyond this nation's capacity. \n\nWe will fulfill the promise of America for all Americans. https://t.co/toXTEOtIVj",
    "Let us be guided by Dr. King's light today. And by the charge of Scripture:\n\n“Let us never grow weary in doing what is right – for if we do not give up we will reap our harvest in due time.”",
    "My Administration laid the foundation for a stronger, more resilient, and more equitable economy for decades to come.\n\nTwo years in – it's clear our economic plan is working. https://t.co/OtfL4abi2j",
    "This is a time for choosing. \n\nWill we choose democracy over autocracy?\nCommunity over chaos?\nLove over hate?\n\nThese are questions of our time that I ran for president to help answer. And of which Dr. King’s life and legacy will guide us forward.",
    "Tune in as I deliver remarks at the National Action Network Martin Luther King, Jr. Day Breakfast. https://t.co/q6IH0MDAvk",
    "In the Oval Office is a bust of Dr. King.\n \nI often think of the question Dr. King asked us all those years ago: “where do we go from here?”\n \nMy message today is that we go forward when we go together.",
    "Today, we honor the Reverend Dr. Martin Luther King, Jr. by continuing his unfinished work to redeem the soul of America. https://t.co/yJ4rmLyJyt"
  )
)

# Tests

test_that("Removes rows with FAV and RT.", {
  df <- data.frame(
    User = c("POTUS", "POTUS", "POTUS"),
    text = c("RT tweet gets removed", "FAV tweet gets removed", "tweet passes")
  )
  df_exp <- data.frame(
    row.names = c(as.integer(3)),
    User = c("POTUS"),
    text = c("tweet passes"),
    text_clean = c("tweet passes")
  )

  expect_identical(generalPreprocessing(df), df_exp)
})



test_that("Remove URLs, mentions, numbers.", {
  df <- data.frame(
    User = c("POTUS", "POTUS", "POTUS", "POTUS"),
    text = c(
      "tweet url https://t.co/q6IH0MDAvk",
      "tweet @POTUS mention",
      "tweet numbers 12345",
      "tweet https://t.co/yJ4rmLyJyt 8234 @mention, url, number"
    )
  )
  df_exp <- data.frame(
    User = c("POTUS", "POTUS", "POTUS", "POTUS"),
    text = c(
      "tweet url https://t.co/q6IH0MDAvk",
      "tweet @POTUS mention",
      "tweet numbers 12345",
      "tweet https://t.co/yJ4rmLyJyt 8234 @mention, url, number"
    ),
    text_clean = c(
      "tweet url ",
      "tweet  mention",
      "tweet numbers ",
      "tweet   , url, number"
    )
  )

  expect_identical(generalPreprocessing(df), df_exp)
})


test_that("Dimension of output", {
  expect_equal(dim(generalPreprocessing(potus_df)), as.integer(c(8, 3)))
})


test_that("Existance of text_clean column in output", {
  expect_true("text_clean" %in% colnames(generalPreprocessing(potus_df)))
})

test_that("Preprocessing of @POTUS tweets", {
  potus_df_exp <- data.frame(
    User = c("POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS", "POTUS"),
    text = c(
      "In America, we go forward when we go together.",
      "Like Dr. King, I know that there is nothing beyond this nation's capacity. \n\nWe will fulfill the promise of America for all Americans. https://t.co/toXTEOtIVj",
      "Let us be guided by Dr. King's light today. And by the charge of Scripture:\n\n“Let us never grow weary in doing what is right – for if we do not give up we will reap our harvest in due time.”",
      "My Administration laid the foundation for a stronger, more resilient, and more equitable economy for decades to come.\n\nTwo years in – it's clear our economic plan is working. https://t.co/OtfL4abi2j",
      "This is a time for choosing. \n\nWill we choose democracy over autocracy?\nCommunity over chaos?\nLove over hate?\n\nThese are questions of our time that I ran for president to help answer. And of which Dr. King’s life and legacy will guide us forward.",
      "Tune in as I deliver remarks at the National Action Network Martin Luther King, Jr. Day Breakfast. https://t.co/q6IH0MDAvk",
      "In the Oval Office is a bust of Dr. King.\n \nI often think of the question Dr. King asked us all those years ago: “where do we go from here?”\n \nMy message today is that we go forward when we go together.",
      "Today, we honor the Reverend Dr. Martin Luther King, Jr. by continuing his unfinished work to redeem the soul of America. https://t.co/yJ4rmLyJyt"
    ),
    text_clean = c(
      "In America, we go forward when we go together.",
      "Like Dr. King, I know that there is nothing beyond this nation's capacity. \n\nWe will fulfill the promise of America for all Americans. ",
      "Let us be guided by Dr. King's light today. And by the charge of Scripture:\n\n“Let us never grow weary in doing what is right – for if we do not give up we will reap our harvest in due time.”",
      "My Administration laid the foundation for a stronger, more resilient, and more equitable economy for decades to come.\n\nTwo years in – it's clear our economic plan is working. ",
      "This is a time for choosing. \n\nWill we choose democracy over autocracy?\nCommunity over chaos?\nLove over hate?\n\nThese are questions of our time that I ran for president to help answer. And of which Dr. King’s life and legacy will guide us forward.",
      "Tune in as I deliver remarks at the National Action Network Martin Luther King, Jr. Day Breakfast. ",
      "In the Oval Office is a bust of Dr. King.\n \nI often think of the question Dr. King asked us all those years ago: “where do we go from here?”\n \nMy message today is that we go forward when we go together.",
      "Today, we honor the Reverend Dr. Martin Luther King, Jr. by continuing his unfinished work to redeem the soul of America. "
    )
  )
  expect_identical(generalPreprocessing(potus_df), potus_df_exp)
})
