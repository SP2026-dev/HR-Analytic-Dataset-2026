--------------------------------------------- Windows Function --------------------------------------------------------------------------------------
-- Q) Show each employee along with total engagement score of their department. (Use - Department Engagement Analysis)
SELECT Employee_ID, First_Name, Department_Type,Engagement_Score,
SUM(Engagement_Score) OVER(PARTITION BY Department_Type) AS total_department_engagement
FROM hr_analytic_dataset;

-- Q) Show employee rating along with average rating of their department. (Use - Performance Comparison Inside Departments)
SELECT Employee_ID, First_Name, Department_Type, Current_Employee_Rating,
ROUND(AVG( Current_Employee_Rating) OVER(PARTITION BY Department_Type),2) AS avg_department_rating
FROM hr_analytic_dataset;

-- Q) Count total employees in each business unit while keeping all rows. (Use - Headcount Analysis)
SELECT Employee_ID, First_Name, Business_Unit,
COUNT(*) OVER( PARTITION BY Business_Unit) AS total_employees
FROM hr_analytic_dataset;

--Q) Find lowest satisfaction score in every department. (Use - Identify Low Employee Satisfaction Areas)
SELECT Employee_ID, First_Name, Department_Type, Satisfaction_Score,
MIN( Satisfaction_Score)  OVER(PARTITION BY Department_Type) AS  minimum_satisfaction_score
FROM hr_analytic_dataset;

-- Q) Find highest engagement score in each department. (Use - Identify Highly Engaged Employees)
SELECT Employee_ID, First_Name, Department_Type,Engagement_Score,
MAX(Engagement_Score) OVER(PARTITION BY Department_Type) AS highest_engagement_score
FROM hr_analytic_dataset;

-- Q) Calculate running total of training cost by training date. (Use - Training Expense Trend Analysis)
SELECT Employee_ID, First_Name,Training_Date, Training_Cost,
SUM( Training_Cost) OVER(ORDER BY Training_Date) AS  running_training_cost
FROM hr_analytic_dataset;

-- Q) Show average training duration by training program. (Use - Training Program Efficiency Analysis)
SELECT Employee_ID, First_Name,Training_Program_Name,Training_Duration_Days,
ROUND(AVG(Training_Duration_Days) OVER(PARTITION BY Training_Duration_Days),2) AS  avg_training_duration
FROM hr_analytic_dataset;

-- Q) Show overall average engagement score without grouping rows. (Use - Company - Wide Engagement Benchmarking)
SELECT Employee_ID, First_Name,Engagement_Score,
ROUND(AVG(Engagement_Score) OVER(),2) AS company_avg_engagement
FROM hr_analytic_dataset;

-- Q) Find rating gap between employee and top performer in department. (Use - Performance Gap Analysis)
SELECT Employee_ID, First_Name, Department_Type,Current_Employee_Rating,
MAX(Current_Employee_Rating) OVER( PARTITION BY Department_Type) - Current_Employee_Rating AS rating_gap
FROM hr_analytic_dataset;

-- Q) Find percentage contribution of each employee training cost in their training program. (Use - Training Budget Distribution Analysis)
SELECT Employee_ID, First_Name,Training_Program_Name,Training_Cost,
ROUND(Training_Cost * 100.0 / SUM(Training_Cost) OVER (PARTITION BY Training_Program_Name),2) AS training_cost_percentage
FROM hr_analytic_dataset;