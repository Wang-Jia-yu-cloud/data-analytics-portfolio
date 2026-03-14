# Waze User Churn Analysis

## Executive Summary

This project analyzes user behavior data to understand what drives user churn 
and whether machine learning models can identify users at risk of leaving.

The analysis combines hypothesis testing and predictive modeling to examine 
engagement patterns and build churn prediction models. Among the models tested, 
XGBoost delivered the best performance with an AUC of 0.689 on the test set.

The results show that declining engagement is a strong signal of churn risk, 
while device type has no meaningful impact on user retention.

---

## Business Problem

User retention is critical for Waze's long-term growth. Some users gradually 
reduce their activity and eventually stop using the app. Identifying these users 
early allows the business team to take action and improve retention.

The dataset contains behavioral data for approximately 14,999 users, including 
app sessions, driving activity, and navigation behavior.

This analysis focuses on two key questions:

1. Does device type influence user engagement?
2. Can statistical or machine learning models predict user churn so the 
   business team can intervene early?

Churn is defined as users who either uninstall the app or stop using it.

---

## Analysis Approach

The analysis followed a structured workflow combining statistical testing and 
predictive modeling.

- An independent samples t-test was used to examine whether iPhone and Android 
  users differ in their average number of drives.
- A binomial logistic regression model was built as a baseline for predicting churn.
- Two machine learning models — Random Forest and XGBoost — were trained to 
  improve prediction performance.
- The data was split into training, validation, and test sets. The final model 
  was evaluated on the test set to obtain an unbiased estimate of performance.

---

## Key Insights

**User engagement strongly predicts retention**  
Retained users are more active. They show more active days and more drives, 
indicating that engagement frequency is a strong signal of churn risk.

**Device type does not influence user engagement**  
The hypothesis test found no significant difference between iPhone and Android 
users. This suggests device type is not an important factor in retention.

**Several behavioral metrics strongly predict churn**  
The most important model predictors include `n_days_after_onboarding`, 
`total_navigations_fav1`, and `duration_minutes_drives`.

**Feature engineering improves model performance**  
Engineered variables such as `total_sessions_per_day`, `duration_per_drive`, 
and `km_per_drive` ranked among the top predictors, showing that feature 
engineering added meaningful value.

**Tree-based models outperform logistic regression**  
Random Forest and XGBoost both performed better than the baseline logistic 
regression model. XGBoost achieved the best result with an AUC of 0.689 
on the test set.

**Class imbalance limits recall performance**  
Only 18% of users churn, which makes it harder for the model to consistently 
identify churned users.

---

## Recommendation

Future iterations should incorporate more detailed user behavior data and expand 
the dataset to include more churn cases. A larger and more balanced dataset would 
help the model better learn churn patterns and improve its ability to identify 
at-risk users.

From a business perspective, retention efforts should focus on new users with 
low activity or declining drive frequency, as these behaviors are the strongest 
early signals of churn.

---

## Data Dictionary

| Column Name | Type | Description |
|---|---|---|
| `label` | object | Indicates whether a user churned or was retained |
| `sessions` | int | Number of times a user opened the app during the month |
| `drives` | int | Number of trips where the user drove at least 1 km |
| `device` | object | Device type used to start a session |
| `total_sessions` | float | Estimated total number of sessions since onboarding |
| `n_days_after_onboarding` | int | Number of days since the user signed up |
| `total_navigations_fav1` | int | Total navigations to the user's first favorite destination |
| `total_navigations_fav2` | int | Total navigations to the user's second favorite destination |
| `driven_km_drives` | float | Total kilometers driven during the month |
| `duration_minutes_drives` | float | Total driving time in minutes during the month |
| `activity_days` | int | Number of days the user opened the app during the month |
| `driving_days` | int | Number of days the user drove at least 1 km during the month |

---

## Skills Demonstrated

Hypothesis Testing · Logistic Regression · Machine Learning Modeling · 
Feature Engineering · Model Evaluation (AUC, Recall) · 
Predictive Analytics for User Retention
