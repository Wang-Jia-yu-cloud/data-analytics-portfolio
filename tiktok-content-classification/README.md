# TikTok Content Classification Analysis

## Executive Summary

This project analyzes TikTok videos to distinguish claim-based content from opinion-based content and evaluate whether machine learning can accurately classify them.

EDA, hypothesis testing, and feature engineering identified engagement metrics and content characteristics as strong signals. Random Forest achieved nearly 100% accuracy on the test set, outperforming XGBoost.

---

## Business Problem
TikTok hosts a large volume of user-generated content, including factual claims and personal opinions. Users can flag content that may contain claims, but the high number of reports creates a backlog for moderators. Accurately classifying videos as claim-based or opinion-based can help prioritize moderation, detect misinformation, and improve algorithmic ranking.

**Key questions:**
1. Does the number of views differ between claim and opinion videos?
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

- **Claim videos get more views** —
Claim-based videos receive significantly higher view counts than opinion videos, confirming that content type influences visibility.
- **Engagement metrics dominate classification** — Features like video views, likes, and shares are the strongest predictors in the model, showing that user interaction patterns effectively differentiate claim vs opinion videos.
- **Content characteristics have limited impact** — Video duration and transcription text length contribute very little to the model, indicating that engagement signals outweigh structural content features.
- **Machine learning models perform extremely well** — Random Forest achieved near-perfect accuracy on the test set, demonstrating that the model can reliably classify videos based on engagement patterns.
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
