# TikTok Content Classification Analysis

## Executive Summary

This project analyzes TikTok video data to understand the characteristics of claim-based content versus opinion-based content, and to evaluate whether machine learning models can accurately classify them.

The analysis combines exploratory data analysis, hypothesis testing, feature engineering, and predictive modeling to identify patterns in video engagement and content characteristics.

Two machine learning models — Random Forest and XGBoost — were trained to classify videos. The Random Forest model achieved the best performance, reaching nearly perfect classification accuracy on the test dataset.

The results suggest that engagement metrics and content characteristics provide strong signals that distinguish claim-based content from opinion-based content.

---

## Business Problem

Social media platforms such as TikTok contain a large amount of user-generated content. Some videos present factual claims, while others express opinions or personal perspectives.

Accurately distinguishing between these content types is important for:

- Content moderation
- Misinformation detection
- Algorithmic content ranking
- Policy enforcement

This project analyzes TikTok video metadata and engagement metrics to answer two key questions:

1. Do claim-based videos behave differently from opinion videos in terms of engagement?
2. Can machine learning models accurately classify whether a video contains a claim or an opinion?

The dataset contains 19,382 TikTok videos with information about engagement metrics, video characteristics, and creator attributes.

---

## Analysis Approach

The analysis followed a structured data science workflow.

First, exploratory data analysis (EDA) was conducted to understand the distribution of engagement metrics, creator characteristics, and content features.

Next, a Welch two-sample t-test was used to determine whether claim videos receive significantly different view counts compared to opinion videos.

Several feature engineering steps were then applied, including:

- Calculating engagement rate
- Measuring transcription text length
- Encoding categorical variables

Two machine learning models were trained:

- Random Forest
- XGBoost

The dataset was split into training, validation, and test sets, and hyperparameters were tuned using GridSearchCV with cross-validation.

The final model was evaluated on the test set to estimate real-world performance.

---

## Key Insights

### Claim videos receive significantly more views
The hypothesis test shows a statistically significant difference in view counts between claim and opinion videos. Claim-based videos tend to attract higher levels of attention and engagement compared to opinion-based content.

### Engagement metrics strongly differentiate content types
Metrics such as `video_view_count`, `video_like_count`, `video_share_count`, and `video_comment_count` were among the most important predictors in the machine learning models. This suggests that user interaction patterns differ between claim-based and opinion-based videos.

### Content length also contributes to classification
Text length derived from the video transcription and video duration both contribute to predicting content type. This indicates that content structure and delivery may vary between claims and opinions.

### Machine learning models classify content with very high accuracy
Both models performed extremely well on the validation and test datasets. The Random Forest model achieved the strongest overall performance, with accuracy close to 100% on the test set.

---

## Recommendation

From a platform perspective, automated classification systems could help flag potential claim-based content for further review, especially when engagement signals indicate rapid spread.

Future work could improve the model by incorporating:

- Deeper natural language processing (NLP) on video transcripts
- Temporal engagement patterns
- Additional moderation signals

These improvements would allow platforms to better identify content that may require moderation or fact-checking.

---

## Data Dictionary

| Column | Type | Description |
|---|---|---|
| claim_status | object | Indicates whether the video contains a claim or opinion |
| video_duration_sec | int | Length of the video in seconds |
| video_transcription_text | object | Transcription of the spoken content |
| verified_status | object | Whether the creator is verified |
| author_ban_status | object | Moderation status of the author |
| video_view_count | float | Number of video views |
| video_like_count | float | Number of likes |
| video_share_count | float | Number of shares |
| video_download_count | float | Number of downloads |
| video_comment_count | float | Number of comments |

---

