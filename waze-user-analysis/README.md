## Executive Summary

### Issue / Problem
This project uses Waze user data to explore two key questions: whether 
device type influences user engagement, and whether a machine learning 
model can predict which users are likely to churn. For the purposes of 
this project, churn is defined as users who have uninstalled the app or 
stopped using it.

### Response
- A two-sample hypothesis test was conducted to determine whether 
  iPhone and Android users differ significantly in their driving behaviour.
- A binomial logistic regression model was built as a baseline 
  to predict user churn.
- To obtain a model with the highest predictive power, two machine 
  learning models were built and compared: Random Forest and XGBoost.
- The data was split into training, validation, and test sets. 
  Performing model selection on a separate validation set enables 
  testing of the champion model on the test set, which gives a better 
  estimate of future performance.

### Impact
- The hypothesis test found no significant difference in driving 
  behaviour between iPhone and Android users, suggesting device type 
  is not a meaningful factor in user engagement.
- The ML models demonstrate that user behavioural data contains 
  predictive signal for churn, but the class imbalance in the dataset 
  (18% churned) limits the model's ability to consistently identify 
  at-risk users. Additional or more balanced data would be needed to 
  improve recall performance.
- Engineered features proved valuable in improving model performance, 
  suggesting that further feature development could meaningfully 
  strengthen future iterations of this model.

### Key Insights
- `n_days_after_onboarding`, `activity_days`, and `driven_km_drives` 
  are among the strongest predictors of churn
- Engineered features such as `km_per_drive`, `drives_per_day`, and 
  `session_per_day` accounted for several of the top predictors
- The XGBoost model outperformed both logistic regression and Random 
  Forest across key metrics, achieving an AUC of 0.689 on the test set
- Recall remains low across all models due to class imbalance — 
  churned users are harder to detect than retained users

### Recommendation
A second iteration of this project is recommended, with a focus on 
collecting more granular user behaviour data and addressing class 
imbalance through resampling techniques. In the meantime, retention 
efforts should prioritise newer users with low app activity and 
declining drive frequency, as these are the strongest behavioural 
signals of upcoming churn.
