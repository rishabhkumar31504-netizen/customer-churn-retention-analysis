CREATE DATABASE customer_churn_analysis;

USE customer_churn_analysis;

USE customer_churn_analysis;

SELECT COUNT(*) AS total_rows
FROM telco_churn;

USE customer_churn_analysis;

RENAME TABLE telctelco_churn TO telco_churn;

SHOW TABLES;

SELECT COUNT(*) AS total_rows
FROM telco_churn;

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    SUM(CASE
        WHEN Churn = 'No' THEN 1
        ELSE 0
    END) AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS retention_rate_pct

FROM telco_churn;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

SELECT
    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct

FROM telco_churn
GROUP BY tenure_group
ORDER BY MIN(tenure);

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct

FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;

SELECT
    InternetService,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct

FROM telco_churn
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;

SELECT
    TechSupport,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct

FROM telco_churn
GROUP BY TechSupport
ORDER BY churn_rate_pct DESC;

SELECT
    Contract,

    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct

FROM telco_churn
GROUP BY Contract, tenure_group
HAVING COUNT(*) >= 30
ORDER BY churn_rate_pct DESC;

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low charges'
        WHEN MonthlyCharges < 70 THEN 'Medium charges'
        ELSE 'High charges'
    END AS charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM telco_churn
GROUP BY charge_group
ORDER BY churn_rate_pct DESC;


SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END)
        AS missing_customer_ids,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END)
        AS missing_churn_values,
    COUNT(DISTINCT customerID) AS unique_customers
FROM telco_churn;