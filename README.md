
<!-- README.md is generated from README.Rmd. Please edit that file -->

# twitterAnalysis

<!-- badges: start -->
<!-- badges: end -->

The goal of twitterAnalysis is to assess a twitter user’s character
based on their recent tweets

## Installation

You can install the development version of twitterAnalysis like so:

``` r
# Todo
```

## Summary

Twitter is a popular social media app with over 1 billion user accounts.
While a diversity of users is a strength, some individuals have concerns
with the prevalence of “troll” accounts and individuals who exhibit
unconstructive tone and diction whom they deem not worth engaging with.
The package twitterAnalysis is intended to provide insight into a
twitter user based on their tweet history in effort to determine if an
account is worth engaging with. The package provides an easy to use
interface for determining the general sentiment expressed by a user.

## Functions

**load_twitter** : Returns a user’s recent tweets (as a dataframe) given
their `user id` using the Twitter API.

**generalPreprocessing** : Cleans the recent tweet dataframe generated
by `load_twitter`. Includes features such as removing punctuation and
extracting emojis.

**get_sentiment_result** : Determines the general (average) sentiment of
recent tweets.

**create_wordcloud** : Generates a word cloud of most frequently used
words in tweets.

## Scope and Fit

There are existing packages that preform tweet analysis (including
[twitter-sentiment-analysis](https://github.com/abdulfatir/twitter-sentiment-analysis),
[tweetlytics](https://github.com/UBC-MDS/tweetlytics), and
[pytweet](https://github.com/UBC-MDS/pytweet)). However, none of these
packages focus of providing metrics in the context of determining if the
twitter user is worth engaging with.

## Contributing

Interested in contributing? Check out the contributing guidelines in
CONTRIBUTING.md. Please note that this project is released with a Code
of Conduct. By contributing to this project, you agree to abide by its
terms.

## License

`twitterAnalysis` was created by Andy Wang, Renzo Wijngaarden, Roan
Raina, Yurui Feng. It is licensed under the terms of the MIT license.

## Credits

`twitterAnalysis` was created with
[`cookiecutter`](https://cookiecutter.readthedocs.io/en/latest/) and the
`py-pkgs-cookiecutter`
[template](https://github.com/py-pkgs/py-pkgs-cookiecutter).

## Example

Todo:

``` r
library(twitterAnalysis)
## basic example code
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />
