# Data Analytics Portfolio

> This portfolio showcases my data analytics projects across business intelligence, predictive modelling, and AI applications.

Each project is built around a real-world business question, using tools such as Power BI, Tableau, SQL, Python, machine learning, and LLM systems to explore data, communicate insights, and build practical solutions.
---

## Projects

### 1. Olist E-commerce Customer Experience Dashboard

**The question:** What should Olist monitor to improve customer satisfaction?

Built a Power BI dashboard using the public Olist e-commerce dataset to analyse sales performance, delivery reliability, review scores, and product-category customer experience risks.

* **Tech:** Power BI · Power Query · DAX · Data Modelling
* **Key Insight:** Late deliveries are strongly linked with lower review scores and a much higher low-review rate. Product categories with longer delivery times and weaker reviews should be monitored more closely.

🔗 [View Project](https://github.com/Wang-Jia-yu-cloud/data-analytics-portfolio/tree/main/Olist-E-commerce-Customer-Experience-Dashboard)

---

### 2. E-Commerce Sales Analysis

**The question:** Where is revenue being left on the table?

Analyzed transactional data to identify revenue trends, product performance, and gaps between traffic and conversion.

* **Tech:** Python · MySQL · Tableau
* **Key Insight:** Identified CNY 993M in potential revenue opportunity hidden in high-traffic, low-conversion products — often overlooked in standard dashboards.

🔗 [View Project](https://github.com/Wang-Jia-yu-cloud/data-analytics-portfolio/tree/main/ecommerce-sales-analysis)

---

### 3. NYC Taxi Operational Performance Analysis

**The question:** When, where, and how do taxis generate revenue?

Explored 400K+ yellow taxi trips to analyze demand patterns, revenue distribution, and tipping behavior across time and geography.

* **Tech:** Python · MySQL · Tableau
* **Key Insight:** Evening commute hours drive peak demand; credit card payments dominate (72.96%), though recorded tips may underestimate true tipping due to missing cash data.

🔗 [View Project](https://github.com/Wang-Jia-yu-cloud/data-analytics-portfolio/tree/main/nyc-taxi-analysis)

---

### 4. Waze User Churn Analysis

**The question:** Who is likely to churn, and why?

Applied hypothesis testing and machine learning models (Logistic Regression, Random Forest, XGBoost) to predict user churn based on behavioral data.

* **Tech:** Python · Scikit-learn · XGBoost
* **Key Insight:** XGBoost achieved an AUC of 0.689; declining engagement and session patterns emerged as key early indicators of churn.

🔗 [View Project](https://github.com/Wang-Jia-yu-cloud/data-analytics-portfolio/tree/main/waze-user-analysis)

---

### 5. TikTok Content Classification

**The question:** Can we distinguish factual claims from opinions?

Built a classification model to separate factual claims from opinion-based content, with applications in content moderation and misinformation detection.

* **Tech:** Python · Scikit-learn · XGBoost
* **Key Insight:** Random Forest achieved near-perfect performance (99% recall), driven primarily by engagement-based features, indicating strong separability between claim and opinion content.

🔗 [View Project](https://github.com/Wang-Jia-yu-cloud/data-analytics-portfolio/tree/main/tiktok-content-classification)

---

### 6. HR Employee Attrition Analysis

**The question:** Which employees are most at risk of leaving?

Combined K-Means clustering with XGBoost to segment employees and predict attrition at an individual level.

* **Tech:** Python · Scikit-learn · XGBoost
* **Key Insight:** Achieved AUC of 0.987; tenure, satisfaction level, and employee segmentation were the strongest predictors, with a clearly identifiable high-risk group.

🔗 [View Project](https://github.com/Wang-Jia-yu-cloud/data-analytics-portfolio/tree/main/hr-employee-churn-analysis)

---

### 7. ASB Customer Support Agent (RAG)

**The question:** Can an AI chatbot provide accurate, context-aware banking support?

Built an end-to-end Retrieval-Augmented Generation (RAG) system using 1,000+ real ASB help articles, with conversation memory, intent detection, and live deployment.

* **Tech:** Python · OpenAI GPT-4o-mini · Pinecone · Streamlit
* **Key Insight:** Delivered a production-style AI assistant capable of handling FAQs, product queries, and escalation scenarios — grounded in real documentation rather than model hallucination.

🔗 [GitHub](https://github.com/Wang-Jia-yu-cloud/asb-customer-support-agent) · 🌐 [Live Demo](https://asb-customer-support-agent.streamlit.app)

---

## Skills

| Category                                  | Tools & Technologies                                                                                                               |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **Business Intelligence & Visualisation** | Power BI · Power Query · DAX · Tableau · Dashboard Design · Data Modelling                                                         |
| **Languages & Tools**                     | Python · SQL · MySQL                                                                                                               |
| **Machine Learning & Statistics**         | Scikit-learn · XGBoost · Random Forest · Logistic Regression · Hypothesis Testing · Feature Engineering · K-Means Clustering · EDA |
| **AI / LLM Systems**                      | OpenAI API · RAG · Pinecone · Vector Databases · AI Agent Development                                                              |
