## Executive Summary

Waze wants to reduce user churn by identifying at-risk users before they leave.  
This project builds a predictive model using behavioral data from ~14,300 monthly active users.

**Analysis pipeline**  
The project covers three stages: hypothesis testing, logistic regression, and tree-based modeling  
(Random Forest + XGBoost) with cross-validated hyperparameter tuning.

**Key findings**  
- iPhone and Android users show no significant difference in average drives (p = 0.14)  
- The final XGBoost model achieved an AUC of 0.689 on the test set  
- Top predictors of churn: `n_days_after_onboarding`, `driven_km_drives`, `activity_days`  
- Class imbalance (18% churn rate) limited recall; churned users remain harder to detect

**Recommendation**  
Focus retention efforts on newer users with declining drive activity,  
as onboarding recency and engagement intensity are the strongest churn signals.
