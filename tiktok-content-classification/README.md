# TikTok Content Classification Analysis

## Executive Summary

This project analyzes TikTok videos to distinguish claim-based content from opinion-based content and evaluate whether machine learning can accurately classify them.

EDA, hypothesis testing, and feature engineering identified engagement metrics and content characteristics as strong signals. Random Forest achieved nearly 100% accuracy on the test set, outperforming XGBoost.

---

## Business Problem
TikTok hosts a large volume of user-generated content, including factual claims and personal opinions. Users can flag content that may contain claims, but the high number of reports creates a backlog for moderators. Accurately classifying videos as claim-based or opinion-based can help prioritize moderation, detect misinformation, and improve algorithmic ranking.

**Key questions:**
1. Do claim videos differ in engagement from opinion videos?
2. Can machine learning classify claim vs opinion videos accurately?

Dataset: 19,382 TikTok videos with metadata, engagement metrics, and creator attributes.

---

## Analysis Approach

1. **EDA** — Examined distributions of engagement metrics, video features, and creator attributes
2. **Hypothesis Testing** — Welch t-test to compare views between claim and opinion videos
3. **Feature Engineering** — Calculated engagement rate, text length, and encoded categorical variables
4. **Modeling** — Trained Random Forest and XGBoost with hyperparameter tuning via GridSearchCV
5. **Evaluation** — Split data into training, validation, and test sets; assessed performance using precision, recall, F1-score, and accuracy

---

## Key Insights

- **Claim videos get higher engagement** — Significantly more views, likes, shares, and comments than opinion videos
- **Engagement metrics are strong predictors** — User interaction patterns differentiate content types
- **Content characteristics matter** — Video duration and transcription text length help classify content
- **ML models perform extremely well** — Random Forest achieved near-perfect accuracy on test data

---

## Data Dictionary

| Column | Type | Description |
|---|---|---|
| claim_status | object | Claim or opinion label |
| video_duration_sec | int | Video length in seconds |
| video_transcription_text | object | Transcribed content |
| verified_status | object | Creator verification status |
| author_ban_status | object | Author moderation status |
| video_view_count | float | Number of views |
| video_like_count | float | Number of likes |
| video_share_count | float | Number of shares |
| video_download_count | float | Number of downloads |
| video_comment_count | float | Number of comments |
