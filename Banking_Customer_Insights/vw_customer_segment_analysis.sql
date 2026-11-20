CREATE DATABASE banking_customer_insights;
USE banking_customer_insights;
SHOW DATABASES;
USE banking_customer_insights;

CREATE TABLE customer_data (
    CustomerId BIGINT PRIMARY KEY,
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard TINYINT,
    IsActiveMember TINYINT,
    EstimatedSalary DECIMAL(15,2),
    Exited TINYINT,
    Age_Group VARCHAR(30),
    Tenure_Group VARCHAR(30),
    Product_Segment VARCHAR(50),
    Engagement_Status VARCHAR(30),
    Customer_Status VARCHAR(30),
    Balance_Segment VARCHAR(50)
);
SHOW TABLES;
USE banking_customer_insights;

SELECT COUNT(*) AS total_customers
FROM customer_data;
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT CustomerId) AS unique_customers
FROM customer_data;
SELECT
    CustomerId,
    COUNT(*) AS occurrences
FROM customer_data
GROUP BY CustomerId
HAVING COUNT(*) > 1;
SELECT
    SUM(CustomerId IS NULL) AS missing_customer_id,
    SUM(Geography IS NULL) AS missing_geography,
    SUM(Age IS NULL) AS missing_age,
    SUM(Balance IS NULL) AS missing_balance,
    SUM(NumOfProducts IS NULL) AS missing_products,
    SUM(Exited IS NULL) AS missing_exit_status
FROM customer_data;
SELECT
    Exited,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS percentage
FROM customer_data
GROUP BY Exited;
SELECT
    COUNT(*) AS total_customers,

    ROUND(AVG(Age), 1) AS average_customer_age,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(AVG(NumOfProducts), 2) AS average_products,

    SUM(Exited = 1) AS exited_customers,

    SUM(Exited = 0) AS retained_customers,

    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct

FROM customer_data;
SELECT
    Geography,
    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS customer_share_pct,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct

FROM customer_data

GROUP BY Geography

ORDER BY customer_count DESC;
SELECT
    Gender,
    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS customer_share_pct,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct

FROM customer_data

GROUP BY Gender

ORDER BY customer_count DESC;

SELECT
    Balance_Segment,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS customer_share_pct,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(SUM(Balance), 2) AS total_balance,

    ROUND(
        SUM(Balance) * 100.0 /
        (SELECT SUM(Balance) FROM customer_data),
        2
    ) AS balance_contribution_pct

FROM customer_data

GROUP BY Balance_Segment

ORDER BY average_balance DESC;

SELECT
    Product_Segment,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS customer_share_pct,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct

FROM customer_data

GROUP BY Product_Segment

ORDER BY customer_count DESC;
SELECT
    NumOfProducts,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS customer_share_pct,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct

FROM customer_data

GROUP BY NumOfProducts

ORDER BY NumOfProducts;
SELECT
    Engagement_Status,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS customer_share_pct,

    SUM(Exited = 1) AS exited_customers,

    SUM(Exited = 0) AS retained_customers,

    ROUND(
        AVG(Exited) * 100,
        2
    ) AS exit_rate_pct,

    ROUND(
        AVG(Balance),
        2
    ) AS average_balance

FROM customer_data

GROUP BY Engagement_Status

ORDER BY exit_rate_pct DESC;
SELECT
    Age_Group,

    COUNT(*) AS customer_count,

    SUM(Exited = 1) AS exited_customers,

    SUM(Exited = 0) AS retained_customers,

    ROUND(
        AVG(Exited) * 100,
        2
    ) AS exit_rate_pct,

    ROUND(
        AVG(Balance),
        2
    ) AS average_balance,

    ROUND(
        AVG(NumOfProducts),
        2
    ) AS average_products

FROM customer_data

GROUP BY Age_Group

ORDER BY exit_rate_pct DESC;
SELECT
    Age_Group,
    Gender,

    COUNT(*) AS customer_count,

    SUM(Exited = 1) AS exited_customers,

    ROUND(
        AVG(Exited) * 100,
        2
    ) AS exit_rate_pct

FROM customer_data

GROUP BY
    Age_Group,
    Gender

ORDER BY
    Age_Group,
    Gender;
    
    SELECT
    Age_Group,
    Gender,
    COUNT(*) AS customer_count,
    SUM(Exited = 1) AS exited_customers,
    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct
FROM customer_data
GROUP BY Age_Group, Gender
ORDER BY Age_Group, Gender;

SELECT
    Geography,
    Age_Group,
    Engagement_Status,

    COUNT(*) AS customer_count,

    SUM(Exited = 1) AS exited_customers,

    ROUND(
        AVG(Exited) * 100,
        2
    ) AS exit_rate_pct,

    ROUND(
        AVG(Balance),
        2
    ) AS average_balance

FROM customer_data

GROUP BY
    Geography,
    Age_Group,
    Engagement_Status

HAVING COUNT(*) >= 20

ORDER BY
    exit_rate_pct DESC;
    
    CREATE OR REPLACE VIEW vw_customer_segment_analysis AS

SELECT
    Geography,
    Age_Group,
    Engagement_Status,

    COUNT(*) AS customer_count,

    SUM(Exited = 1) AS exited_customers,

    SUM(Exited = 0) AS retained_customers,

    ROUND(AVG(Exited) * 100, 2) AS exit_rate_pct,

    ROUND(AVG(Balance), 2) AS average_balance,

    ROUND(AVG(NumOfProducts), 2) AS average_products

FROM customer_data

GROUP BY
    Geography,
    Age_Group,
    Engagement_Status;
    
    SELECT *
FROM vw_customer_segment_analysis
ORDER BY exit_rate_pct DESC;
