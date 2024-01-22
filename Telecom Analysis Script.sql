USE telecom;
SELECT * FROM telecom_customer_churn
SELECT COUNT(*) 'Customer ID'
FROM telecom_customer_churn
-- Checking distribution of categorical variables; Gender, age, Contract type --
SELECT Gender, Age, Contract, COUNT(*) AS count
FROM telecom.telecom_customer_churn
GROUP BY Gender, Age, Contract

-- Gender Count --
SELECT
    Gender,
    COUNT(*) as Count
FROM telecom_customer_churn
WHERE Gender IS NOT NULL
GROUP BY Gender;

-- Married/Not Married Correlation to Churn --
SELECT 
	Married,
    Count(*) as Customer_Churned_Count
FROM telecom_customer_churn
WHERE `Customer Status` = 'Churned' and Married IS NOT NULL
GROUP BY Married

-- Contract type count -- 
SELECT 
	Contract,
	COUNT(*) as Count
FROM telecom_customer_churn
WHERE Contract IS NOT NULL
GROUP BY Contract 

-- Identifying customer status--
SELECT DISTINCT LOWER(TRIM(`Customer Status`)) AS CustomerStatus
FROM telecom_customer_churn;

-- Analyzing churn rate --
SELECT 
    `Customer Status`,
    COUNT(*) as total_customers,
    SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) as churned_customers,
    (SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) / 4835) * 100 as churn_rate
FROM telecom_customer_churn
WHERE `Customer Status` IN ('Stayed', 'Churned', 'Joined')
GROUP BY `Customer Status`;

-- Customer Churned Reason --
SELECT DISTINCT `Churn Reason`
FROM (
    SELECT
        `Customer ID`,
        `Churn Reason`,
        `Churn Category`
    FROM telecom_customer_churn
    WHERE `Customer Status` LIKE '%Churned%'
) AS Subquery;


-- Count Per reason of Customer Churn --
SELECT
    `Churn Reason`,
    COUNT(*) as count_per_reason
FROM (
    SELECT
        `Customer ID`,
        `Churn Reason`,
        `Churn Category`
    FROM telecom_customer_churn
    WHERE `Customer Status` LIKE '%Churned%'
) AS Subquery
GROUP BY `Churn Reason`;

-- Churn Reason = Dissatisfaction --
SELECT
    `Churn Reason`,
    COUNT(*) as Churn_Reason_Count
FROM telecom_customer_churn
WHERE `Churn Category` = 'Dissatisfaction'
GROUP BY `Churn Reason`;

-- Churn Reason = Competitor -- 
SELECT
	`Churn Reason`,
    COUNT(*) as Churn_reason_count
FROM telecom_customer_churn
WHERE `Churn Category` = 'Competitor'
GROUP BY `Churn Reason`

-- Churn Reason = Other --
SELECT
	`Churn Reason`,
    COUNT(*) as Churn_reason_count
FROM telecom_customer_churn
WHERE `Churn Category` = 'Other'
GROUP BY `Churn Reason`

-- Churn Reason = Price -- 
SELECT
	`Churn Reason`,
    COUNT(*) as Churn_reason_count
FROM telecom_customer_churn
WHERE `Churn Category` = 'Price'
GROUP BY `Churn Reason`

-- Churn reason = Attitude --
SELECT
	`Churn Reason`,
    COUNT(*) as Churn_reason_count
FROM telecom_customer_churn
WHERE `Churn Category` = 'Attitude'
GROUP BY `Churn Reason`

