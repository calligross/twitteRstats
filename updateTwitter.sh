#!/bin/bash
cd ~/R/twitteRstats
git pull origin master
Rscript checkPackages.R
Rscript updatedb.R 
git add tweets.db
git commit -m 'updated tweets.db'
git push origin master
cd ../Blog
git pull origin master
# cp ../twitteRstats/twitteRstats.md .
# cp ../twitteRstats/figure/twitterstats-* figure/
git add figure/twitterstats-*
git add twitteRstats.md 
git commit -m "Updated twitterstats"
git push origin master
