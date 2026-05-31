--------------------------------------------- Windows Function --------------------------------------------------------------------------------------
-- Q) Rank employees based on engagement score within each department. (Use - Identify Top Performers)
SELECT Employee_ID, First_Name,Department_Type,Engagement_Score,
RANK() OVER(PARTITION BY Department_Type  ORDER BY Engagement_Score DESC) AS  engagement_rank
FROM hr_analytic_dataset;

-- Q) Give dense rank to employees based on employee rating department-wise. (Use - Countinous Ranking on Same Score Without Gap)
SELECT Employee_ID, First_Name,Department_Type,Current_Employee_Rating,
DENSE_RANK() OVER(PARTITION BY Department_Type  ORDER BY Current_Employee_Rating DESC) AS dense_employee_rank
FROM hr_analytic_dataset;

-- Q) Assign unique row number to employees based on engagement score inside each business unit. 
-- (Use - Unique Employee Ranking Inside Each Business Unit)
SELECT Employee_ID, First_Name, Business_Unit,Engagement_Score,
ROW_NUMBER() OVER(PARTITION BY Business_Unit  ORDER BY Engagement_Score DESC) AS row_num
FROM hr_analytic_dataset;

-- Q) Find percentile rank of employee engagement score company-wide. (Use - Employee Performance Percentile Analysis)
SELECT Employee_ID, First_Name,Engagement_Score,
PERCENT_RANK() OVER(ORDER BY Engagement_Score) AS engagement_percent_rank
FROM hr_analytic_dataset;

-- Q) Divide employees into 4 groups based on engagement score. (Use - Employee Performance Segmentation)
SELECT Employee_ID, First_Name,Engagement_Score,
NTILE(4) OVER( ORDER BY Engagement_Score DESC) AS engagement_quartile
FROM hr_analytic_dataset;

-- Q) Find top 3 employees by engagement score in every department. (Use - Top Performer)
SELECT * FROM (SELECT Employee_ID, First_Name,Department_Type,Engagement_Score,
RANK() OVER(PARTITION BY Department_Type  ORDER BY Engagement_Score DESC) AS emp_rank
FROM hr_analytic_dataset) ranked_data WHERE  emp_rank <= 3;

-- Q) Find lowest rated employee in each department. (Use - Low Performance Identification)
SELECT * FROM(SELECT Employee_ID, First_Name,Department_Type, Current_Employee_Rating,
ROW_NUMBER() OVER(PARTITION BY Department_Type  ORDER BY Current_Employee_Rating ASC) AS rn
FROM hr_analytic_dataset) ranked_data WHERE rn = 1;

-- Q) Divide employees into 5 groups based on training cost. (Use - Budget Segmentation)
SELECT Employee_ID, First_Name,Training_Cost, 
NTILE(5) OVER(ORDER BY Training_Cost DESC) AS training_cost_group
FROM hr_analytic_dataset;

-- Q) Rank employees based on satisfaction score. (Use - Employee Satisfaction Analysis)
SELECT Employee_ID, First_Name,Department_Type,Satisfaction_Score,
RANK() OVER(PARTITION BY  Department_Type ORDER BY Satisfaction_Score DESC) AS satisfaction_rank
FROM hr_analytic_dataset;

-- Q) Assign row number to employees based on latest training date. (Use - Recent Employee Training Analysis)
SELECT Employee_ID, First_Name,Training_Date,
ROW_NUMBER() OVER(  ORDER BY Training_Date DESC) AS training_recency_rank
FROM hr_analytic_dataset;