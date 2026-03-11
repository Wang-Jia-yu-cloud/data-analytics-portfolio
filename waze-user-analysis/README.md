## Executive Summary

### Business Problem
Waze faces an 18% monthly user churn rate, with limited visibility into which users are at risk of leaving. Without a predictive signal, retention efforts are reactive and untargeted.

### Response
A three-stage analysis was conducted on ~14,300 users:
- **Hypothesis testing** — evaluated whether device type (iPhone vs Android) influences driving behaviour
- **Logistic regression** — established a baseline churn prediction model
- **Tree-based modeling** — built and tuned Random Forest and XGBoost classifiers using cross-validation and feature engineering

### Impact
The XGBoost model (AUC: 0.689) can flag high-risk users before they churn, enabling the operations team to prioritise retention outreach rather than responding after the fact.

### Key Insights
- Device type has no significant effect on drives (p = 0.14) — not a churn driver
- Users with fewer activity days and lower km driven are disproportionately likely to churn
- `n_days_after_onboarding`, `activity_days`, and `driven_km_drives` are the strongest churn predictors
- Class imbalance (18% churn) constrained recall across all models — churned users remain harder to capture

### Recommendation
Target retention interventions at newer users showing early signs of disengagement — specifically those with declining drive frequency and low app activity — as these are the clearest behavioural signals of upcoming churn.
