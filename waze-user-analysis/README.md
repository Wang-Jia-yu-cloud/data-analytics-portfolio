## Executive Summary

### Business Problem
User retention is critical to the long-term growth of the Waze platform. 
However, a portion of users gradually reduce their engagement and eventually 
stop using the app. The company needs a reliable way to identify users who are 
likely to churn so that proactive retention strategies can be implemented.

### Response
A three-stage analysis was conducted on ~14,300 users:
- **Hypothesis testing** — evaluated whether device type (iPhone vs Android) influences engagement patterns
- **Logistic regression** — established a baseline churn prediction model
- **Tree-based modeling** — built and tuned Random Forest and XGBoost classifiers using cross-validation and feature engineering

### Impact
The XGBoost model (AUC: 0.689) can flag high-risk users before they churn, 
enabling the operations team to prioritise retention outreach. 
Note: the model's ability to detect churned users is limited by the low churn 
rate in the dataset (18%), and should be further validated with more balanced data.

### Key Insights
- Device type does not meaningfully influence user engagement — iPhone and Android users behave similarly
- Users with fewer activity days and lower km driven are disproportionately likely to churn
- `n_days_after_onboarding`, `activity_days`, and `driven_km_drives` are the strongest churn predictors

### Recommendation
Target retention interventions at newer users showing early signs of disengagement — 
specifically those with declining drive frequency and low app activity — 
as these are the clearest behavioural signals of upcoming churn.
