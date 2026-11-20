# Banking Customer Insights & Retention Analytics

## Project Overview

This project explores customer portfolio characteristics, banking product adoption, account balance distribution, customer engagement and customer exit patterns.

Using a customer churn dataset from Kaggle, I developed an end-to-end analytics workflow using Python, MySQL and Power BI to transform raw customer records into structured analysis and interactive management dashboards.

The project is framed around a hypothetical commercial banking environment, with business questions relevant to customer management and retention in the Kenyan banking sector. The underlying dataset is international and does not represent actual Kenyan banking customers.

## Business Objectives

The analysis seeks to answer the following questions:

1. How is the customer portfolio distributed across demographic and geographical segments?
2. Which customer groups hold higher account balances?
3. How many banking products do customers hold?
4. How does product adoption vary across customer segments?
5. Are inactive customers more likely to exit?
6. How do customer exit rates vary across product and balance segments?

## Tools and Technologies

- Python – Data inspection, cleaning, feature engineering and validation.
- Pandas and NumPy – Data manipulation and preparation.
- MySQL – Relational data storage and analytical queries.
- Power BI – Data modelling, DAX measures, interactive reporting and visualisation.

## Project Workflow

### 1. Data Preparation – Python
- Inspected dataset structure and data quality.
- Checked missing values and duplicate records.
- Standardised categorical fields.
- Created age, tenure, product, engagement and balance segments.
- Validated the prepared dataset.

### 2. Database and Analysis – MySQL
- Created the project database and customer table.
- Loaded the prepared dataset.
- Validated customer records and portfolio totals.
- Developed analytical queries covering customer demographics, balances, product adoption and customer exits.

### 3. Business Intelligence – Power BI
Developed three report pages:

- Executive Portfolio Overview
- Customer Segmentation Analysis
- Product Adoption & Customer Engagement

The report includes portfolio KPIs, customer distribution, balance segments, product holdings, engagement comparisons and exit-rate analysis.

## Selected Findings

- The dataset contains 10,000 customer records.
- The observed customer exit rate is 20.37%.
- Customers holding one or two products account for 96.74% of the portfolio.
- Customers holding two products have an observed exit rate of 7.58%.
- Inactive customers have an observed exit rate of 26.85%, compared with 14.27% among active customers.
- The Mid-Lower Balance segment has the highest observed exit rate at 27.38%.

## Business Implications

The findings identify customer groups and patterns that warrant further investigation, including inactive customers, product-holding segments and customers with different balance profiles.

The analysis can support further investigation into customer engagement, product adoption and retention strategies. The observed relationships are descriptive and should not be interpreted as evidence of causation.

## Data Source and Limitations

Source: [Kaggle – Bank Customer Churn Modelling](https://www.kaggle.com/datasets/shubh0799/churn-modelling)

The dataset contains customer-level information from France, Germany and Spain. It is not Kenyan banking data, and its monetary units have not been established as KES.

The dataset does not contain transaction history, product revenue, fees or cost-to-serve information. Consequently, account balance is not treated as profit, and this project does not calculate customer profitability or customer lifetime value.

## Project Status

Python data preparation, SQL analysis and the three-page Power BI dashboard have been developed. Further work focuses on documentation, reproducibility and portfolio presentation.
