# Waze User Churn Analysis

## Executive Summary

This project analyzes user behavior data to understand the drivers of user churn 
and evaluate whether machine learning models can identify at-risk users.

The analysis combines statistical testing and predictive modeling to examine 
engagement patterns and build churn prediction models. Among the models tested, 
XGBoost achieved the strongest performance with an AUC of 0.689 on the test set.

The results show that declining engagement is a strong indicator of churn risk, 
while device type has no meaningful impact on user retention.

---

## Business Problem

User retention is critical for Waze's long-term growth. Some users gradually 
reduce their activity and eventually stop using the app. Identifying these users 
early allows the business team to intervene and improve retention.

The dataset contains behavioural data for approximately 14,999 users, including 
app sessions, driving activity, and navigation behavior.

This analysis focuses on two key questions:

1. Does device type influence user engagement?
2. Can statistical or machine learning models predict user churn so that the 
   business team can take early action to reduce churn?

Churn is defined as users who either uninstall the app or stop using it.

---

## Analysis Approach

The analysis followed a structured workflow combining statistical testing and 
predictive modeling.

- An independent samples t-test was conducted to examine whether iPhone and 
  Android users differ significantly in their average number of drives.
- A binomial logistic regression model was developed as a baseline for 
  predicting user churn.
- Two machine learning models — Random Forest and XGBoost — were trained and 
  compared to improve predictive performance.
- The dataset was split into training, validation, and test sets to support 
  model selection and evaluation. Final performance was assessed on the test 
  set to provide an unbiased estimate of model accuracy.

---

## Key Insights

**User engagement strongly predicts retention**  
Retained users show higher engagement, with more active days and drives, 
confirming that usage frequency is a key indicator of churn risk.

**Device type does not influence user engagement**  
The hypothesis test found no significant difference between iPhone and Android 
users, indicating that device type is not a meaningful factor in retention.

**Several behavioral metrics strongly predict churn**  
The most important model predictors include `n_days_after_onboarding`, 
`total_navigations_fav1`, and `duration_minutes_drives`.

**Feature engineering improves model performance**  
Engineered variables such as `total_sessions_per_day`, `duration_per_drive`, 
and `km_per_drive` ranked among the top predictors, highlighting the value 
of feature engineering.

**Tree-based models outperform logistic regression**  
Random Forest and XGBoost both improve predictive performance over the baseline 
model. XGBoost performs best with an AUC of 0.689 on the test set.

**Class imbalance limits recall performance**  
Because churn represents only 18% of users, models struggle to consistently 
identify churned users.

---

## Recommendation

Future iterations of the model could improve performance by incorporating more 
granular user behavior data and addressing class imbalance through resampling 
or alternative modeling techniques.

From a business perspective, retention initiatives should prioritize new users 
with low activity levels or declining drive frequency, as these behavioral 
signals are the strongest indicators of future churn.

---

## Data Dictionary

| Column Name | Type | Description |
|---|---|---|
| `label` | object | Binary target variable indicating whether a user churned or was retained |
| `sessions` | int | Number of times a user opened the app during the month |
| `drives` | int | Number of trips where the user drove at least 1 km |
| `device` | object | Device type used to start the session |
| `total_sessions` | float | Estimated total number of sessions since onboarding |
| `n_days_after_onboarding` | int | Number of days since the user signed up |
| `total_navigations_fav1` | int | Total navigations to the user's first favorite destination |
| `total_navigations_fav2` | int | Total navigations to the user's second favorite destination |
| `driven_km_drives` | float | Total kilometers driven during the month |
| `duration_minutes_drives` | float | Total driving duration in minutes during the month |
| `activity_days` | int | Number of days the user opened the app during the month |
| `driving_days` | int | Number of days the user drove at least 1 km during the month |

---

## Skills Demonstrated

Hypothesis Testing · Logistic Regression · Machine Learning Modeling · 
Feature Engineering · Model Evaluation (AUC, Recall) · 
Class Imbalance Analysis · Predictive Analytics for User Retention
