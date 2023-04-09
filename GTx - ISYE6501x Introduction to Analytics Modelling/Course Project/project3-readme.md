# Project 3: Web APIs and NLP

## Background - The Rise of Sentiment
Stock selection has evolved over the years - from the study of balance sheets Fundamental Analysis to the analysis of chart patterns in Technical Analysis. These two methodologies have been the bread and butter of hedge funds before the emergence of social media. However, with the emergence of content aggregation platforms like Twitter and Reddit, the Market was at the mercy of what is now known as ['Reddit Stocks'](https://finance.yahoo.com/news/12-best-reddit-stocks-invest-233132376.html#:~:text=Leading%20subreddits%20like%20r%2FWallStreetBets,respectively%2C%20as%20of%20Q3%202022.).

As an analyst in a hedge fund, I acknowledge the effect of public sentiment on price action, and how the general population is in fact a worthy opponent to the financial institutions when it comes to making market waves. Therefore, we now define a third methodology of stock selection - Sentiment Analysis.

## Executive Summary
In the modern era where millenials dominate the thought-space, I propose to leverage on Sentiment Analysis as a worthy complement to Fundamental and Technical Analysis.

As an analyst in a hedge fund, I would like to leverage on the [top investing and trading communities](https://www.investopedia.com/reddit-top-investing-and-trading-communities-5189322) on Reddit. The subreddit, r/wallstreetbets, is a clear favourite with more than 10 million members. However, the next in line would be two popular Subreddits

1. [r/StockMarket](https://subredditstats.com/r/StockMarket) with 2,493,511	members
2. [r/investing](https://subredditstats.com/r/investing) with 2,088,862 members

I would like to find out if these two subreddits are distinct in their content (ie if they are separable/classifiable through modelling), and if so, I would choose to perform Sentiment Analysis on both Subreddits during Stock Selection.

Conversely, if I discover that they are not distinct (ie not clearly separable/classifiable through modelling), then I would just pick one of the two Subreddits in my Sentiment Analysis.

[Further Reading: Subreddit Descriptions](https://www.investing.com/academy/stocks/reddit-meme-stocks-to-buy/)

## Problem Statement
I would create a few models to perform binary text classification on the two Subreddits. With the intention of attaining a good degree of separation between the two Subreddit classes. This is measured by the Receiver Operating Characteristics Area Under the Curve (ROC-AUC). ROC curve is a probability curve that shows model performance at all classification threshold with 2 parameters which is True Predicted Positive (TPR) and False Predicted Positive (FPR). The larger the area under the curve represents the larger the degree of separability between classes.

## Datasets

###  Data Sets
1. Scraped Data from r/investing
2. Scraped Data from r/StockMarket

### Jupyter Notebooks
    a. Reddit Scrape

    b. Random Forest Model

    c. Naive Bayes Model

    d. Logistic Regression Model

    e. Project 3 Main

## Conclusions and Findings
The final model chosen is Naive Bayes with Count or TFID Vectorizer

- From the model stats and ROC AUC curve, Naive Bayes Models (both CVEC and TVEC) and Logistic Regression with TFID Vectorizer performed the best. But NAive Bayes had a slightly higher ROCAUC score of 0.83
- We can look at other models (KNN) to see if they can do better than our current models.
- To further build on this project, we can look at sentiment analysis on the 2 topics. We can also look at specific topics in each subreddit that are unique.