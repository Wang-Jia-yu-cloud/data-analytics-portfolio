# HR Employee Churn Analysis — Salifort Motors

## Executive Summary

Salifort Motors is experiencing a high employee turnover rate, creating both operational disruption and significant recruitment and training costs. To better understand the problem, the HR team conducted an employee survey to identify factors associated with attrition.

This project analyzes the survey data to identify the drivers of employee turnover and to build predictive models that estimate the likelihood of employees leaving the company.

After removing duplicate records, 11,991 employee records were included in the analysis. Exploratory analysis shows that satisfaction level, tenure, and workload are the strongest drivers of attrition. Clustering analysis further reveals three employee segments with significantly different attrition risks.

Among the models tested, XGBoost achieved the best performance, with 97% accuracy, an AUC of 0.987, and an F1-score of 0.91 on the test set.

---

## Business Problem

Employee turnover creates substantial costs through recruitment, onboarding, and lost productivity. Salifort Motors wants to understand why employees leave and which employees are most at risk of departure so that targeted retention strategies can be implemented.

This analysis focuses on four key questions:

1. What employee characteristics are most strongly associated with attrition?
2. Are there distinct employee groups with different attrition risk profiles?
3. Can predictive models accurately identify employees likely to leave?
4. What actions could help improve employee retention?

The dataset contains 14,999 employee records (11,991 after removing duplicates), including satisfaction level, workload metrics, tenure, promotion history, department, and salary level.

---

## Analysis Approach

**Exploratory Data Analysis**
Compared satisfaction levels, workload, and tenure distributions between employees who stayed and those who left. Key visualizations include KDE plots, scatterplots, and a correlation heatmap.

**Hypothesis Testing**
A Chi-square test was conducted to evaluate whether salary level is associated with employee attrition.

**Employee Segmentation**
K-Means clustering (k=3) was applied to identify groups of employees with similar work patterns and attrition risk profiles.

**Modeling**
Four predictive models were trained and compared: Logistic Regression (baseline), Decision Tree, Random Forest, and XGBoost. Hyperparameter tuning was performed using GridSearchCV.

**Evaluation**
Models were evaluated using precision, recall, F1-score, accuracy, and AUC-ROC on a held-out test dataset (80/20 split).

---

## Key Insights

### Two distinct high-risk employee groups

![Employee Clusters](employee_clusters.png)

Analysis reveals two main attrition patterns. Overworked employees (high working hours and strong performance but low satisfaction) show a 42% attrition rate. Disengaged employees (low hours and low performance) show a 26% attrition rate. Employees in the healthy segment have only 2% attrition.

---

### Satisfaction level is the strongest predictor of attrition

![Feature Distribution by Left Status](feature_distribution.png)

Employees who left report significantly lower satisfaction levels. The 3–5 year tenure window represents the highest risk period for dissatisfaction-driven departures.

![Tenure vs Satisfaction Level](tenure_vs_satisfaction.png)

---

### Salary level is significantly associated with attrition

![Churn Rate by Salary Level](churn_rate.png)

Employees with low salaries show a 20.5% attrition rate, compared with 4.8% for high-salary employees. A Chi-square test confirms this relationship is statistically significant (χ² = 175.21, p < 0.001).

---

### Overwork without recognition increases attrition risk

![Promotion vs Monthly Hours](promotion_vs_hours.png)

Employees working 250+ monthly hours without a promotion in the past five years have the highest departure rates, suggesting that unrecognized overwork contributes strongly to turnover.

---

### XGBoost is the best performing model

| Model | Precision | Recall | F1 | Accuracy | AUC |
|-------|-----------|--------|----|----------|-----|
| Logistic Regression | 0.42 | 0.84 | 0.56 | 0.78 | — |
| Decision Tree | 0.783 | 0.926 | 0.849 | 0.945 | 0.960 |
| Random Forest | 0.983 | 0.914 | 0.947 | 0.983 | 0.983 |
| **XGBoost** | **0.899** | **0.938** | **0.918** | **0.972** | **0.987** |

![XGBoost Feature Importance](feature_importance.png)

XGBoost achieved an AUC of 0.987 and recall of 0.92, correctly identifying 368 of 401 employees who left in the test dataset. The most important predictive features include tenure, satisfaction level, and employee cluster label.

![XGBoost Confusion Matrix](confusion_matrix.png)

---

## Business Recommendations

- **Prioritize intervention for overworked employees** — Employees in the high-workload cluster show the highest attrition rate. HR should monitor employees with long working hours, 4+ years of tenure, and declining satisfaction scores.
- **Address workload imbalance** — Both excessive workload and under-utilization are associated with attrition. Reviewing project allocation and establishing healthy workload benchmarks could reduce turnover risk.
- **Review compensation for lower-salary employees** — Since salary level is significantly associated with attrition, targeted compensation reviews or additional benefits may help retain employees in this group.
- **Strengthen promotion and recognition pathways** — Employees working long hours without recent promotions show elevated departure rates. Clearer career development pathways and recognition programs could improve retention among high performers.
- **Focus on the 3–5 year tenure window** — This period represents the highest attrition risk. Structured career conversations and development planning at this stage could help prevent voluntary departures.

---

## Skills Demonstrated

`Python` `Exploratory Data Analysis` `Hypothesis Testing` `K-Means Clustering` `Feature Engineering` `Machine Learning Modeling` `Hyperparameter Tuning (GridSearchCV)` `Model Evaluation` `XGBoost` `Random Forest`
