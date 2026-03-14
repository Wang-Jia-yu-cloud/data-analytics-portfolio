# Waze user analysis

## Executive Summary

### Business Problem

User retention is critical for Waze's long-term growth. Some users gradually 
reduce their activity and eventually stop using the app. Identifying these users 
early allows the business team to intervene and improve overall retention.

This analysis uses a synthetic dataset created in collaboration with Coursera 
and Waze, containing behavioural data for approximately 14,999 users. 
The focus is on two questions:

-  whether device type influences user engagement？
-  whether statistical or machine learning models can predict user churn so 
  that the business team can take early action to reduce churn.

Churn is defined as users who have either uninstalled the app or stopped using it.

---

### Analysis Approach

- A two-sample hypothesis test was conducted to examine whether iPhone and 
  Android users differ significantly in their average number of drives.
- A binomial logistic regression model was developed as a baseline for 
  predicting user churn.
- Two machine learning models, Random Forest and XGBoost, were trained and 
  compared to improve prediction accuracy.
- The data was split into training, validation, and test sets to support model 
  selection and evaluation. The final model was assessed on the test set to 
  provide an unbiased estimate of performance.

---

### Key Insights

- Retained users show higher engagement, with more active days and drives, 
  confirming that user activity frequency is a key indicator of churn risk.
- There is no significant difference in engagement between iPhone and Android 
  users, indicating that device type does not affect retention.
- The strongest predictors of churn in the model are `n_days_after_onboarding`, 
  `total_navigations_fav1`, and `duration_minutes_drives`.
- Engineered features like `total_sessions_per_day`, `duration_per_drive`, 
  and `km_per_drive` are also among the top predictors, highlighting the value 
  of feature engineering for improving predictive performance.
- Tree-based models outperform the logistic regression baseline. XGBoost 
  achieves slightly better results than Random Forest, with an AUC of 0.689 
  on the test set.
- Model recall remains limited due to the low churn rate (18%), which makes it 
  harder to consistently identify users who are likely to churn.

---

### Recommendation

- Collect more detailed user behaviour data and address class imbalance to 
  improve model performance in the next phase.
- Meanwhile, target retention initiatives at new users with low activity or 
  declining drive frequency, as these are the clearest early warning signs 
  of churn.

---

### Appendix – Data Dictionary

| Column Name | Type | Description |
|---|---|---|
| `label` | obj | Binary target variable ("retained" vs "churned") for if a user has churned anytime during the course of the month |
| `sessions` | int | The number of occurrence of a user opening the app during the month |
| `drives` | int | An occurrence of driving at least 1 km during the month |
| `device` | obj | The type of device a user starts a session with |
| `total_sessions` | float | A model estimate of the total number of sessions since a user has onboarded |
| `n_days_after_onboarding` | int | The number of days since a user signed up for the app |
| `total_navigations_fav1` | int | Total navigations since onboarding to the user's favorite place 1 |
| `total_navigations_fav2` | int | Total navigations since onboarding to the user's favorite place 2 |
| `driven_km_drives` | float | Total kilometers driven during the month |
| `duration_minutes_drives` | float | Total duration driven in minutes during the month |
| `activity_days` | int | Number of days the user opens the app during the month |
| `driving_days` | int | Number of days the user drives (at least 1 km) during the month |
