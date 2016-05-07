library(twitteR)
library(knitr)
setwd('~mg/R/twitteRstats')
source('../twitter.auth')
blog_dir <- '~mg/R/Blog/'

setup_twitter_oauth(consumer_key = consumer_key,
                    consumer_secret = consumer_secret,
                    access_token = access_token,
                    access_secret = access_secret)

register_sqlite_backend('tweets.db')
tweets <- load_tweets_db(as.data.frame = TRUE)
tweets_new <- Rtweets(sinceID = max(tweets$id), n = 2000)
if (length(tweets_new) > 0) {
  store_tweets_db(tweets_new)
}

# update the posting

knitr::knit(input = 'twitteRstats.Rmd', output = 'twitteRstats.md', quiet = TRUE)

files <- c('twitteRstats.md', list.files(path = 'figure', full.names = TRUE)) 

# the blog_dir and a subdirectory figure need to exist!
file.copy(from = files, to = paste0(blog_dir, files), overwrite = TRUE)

