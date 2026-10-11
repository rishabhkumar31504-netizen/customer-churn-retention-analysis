# Customer Churn & Retention Analysis

## Project Overview
This project analyzes customer churn to identify customer segments with high churn rates and uncover opportunities to improve customer retention. It uses Excel, MySQL, Python, and Power BI to transform customer data into actionable business insights.

## Tools & Technologies
- **Excel:** Data exploration, summary analysis, and visualizations
- **MySQL:** SQL queries, aggregations, and customer segmentation
- **Python:** Data cleaning, exploratory data analysis, and visualizations
- **Power BI:** Interactive dashboard and KPI reporting

## Business Objectives
- Measure overall customer churn and retention.
- Compare churn across contract types.
- Identify tenure groups with higher churn rates.
- Analyze churn by payment method and internet service.
- Recommend potential customer retention strategies.

## Key Findings
- **Total customers:** 7,043
- **Churned customers:** 1,869
- **Retained customers:** 5,174
- **Overall churn rate:** 26.54%
- **Retention rate:** 73.46%

Additional analysis indicates that month-to-month customers and customers with shorter tenure have higher churn rates.

## Dashboard
![Customer Churn & Retention Analysis Dashboard](images/customer-churn-dashboard.png)

The Power BI dashboard includes:
- Total customers, churned customers, and retained customers
- Overall churn rate
- Churn rate by contract type
- Churn rate by customer tenure
- Churn rate by payment method
- Churn rate by internet service
- Interactive slicers for exploring customer segments

## Recommendations
1. Investigate why month-to-month customers are more likely to leave.
2. Improve onboarding and engagement during the first months of service.
3. Evaluate payment-method-related churn patterns.
4. Test targeted retention offers and measure their effectiveness.

## Project Structure
- `Data/` — Source and related data files
- `Excel/` — Excel analysis and dashboard
- `Notebooks/` — Python analysis notebooks
- `outputs/` — Exported analysis results
- `PowerBI/` — Power BI dashboard
- `Sql/` — SQL scripts and queries

## Conclusion
This project demonstrates an end-to-end customer analytics workflow, from data preparation and SQL analysis to Python exploration and interactive Power BI reporting. It highlights how data analysis can support customer retention decisions.

*Note: Recommendations are hypotheses to test; this analysis identifies associations and does not establish the causes of churn.*