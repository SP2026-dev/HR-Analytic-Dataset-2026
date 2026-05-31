--------------------------------------------- CTE ---------------------------------------------------------------------------------------------------------------
-- Q) Create a CTE to show employees having engagement score greater than 4. (Use - Simple CTE : High - Performing Employee Analysis)
WITH  high_engagement AS (
SELECT Employee_ID, First_Name,Engagement_Score
FROM hr_analytic_dataset
WHERE Engagement_Score>4)SELECT * FROM  high_engagement;

-- Q) Create a CTE combining employee and training details. (Use - CTE + JOINS : Combined HR and Training Analysis)
WITH employee_training_data AS (
SELECT h.Employee_ID, h.First_Name,h.Department_Type,e.Training_Date,e.Training_Cost
FROM hr_analytic_dataset h
INNER JOIN employee_training e
ON h.Employee_ID = e.Employee_ID
)SELECT * FROM employee_training_data;

-- Q) Create a CTE to find employees having engagement score below company average. (Use : Low Engagement Employee Analysis)
WITH avg_engagement AS (
SELECT AVG(Engagement_Score) AS avg_score
FROM hr_analytic_dataset)
SELECT Employee_ID, First_Name,Engagement_Score
FROM hr_analytic_dataset
WHERE Engagement_Score<(SELECT  avg_score FROM avg_engagement);

-- Q) Create multiple CTEs for average engagement score and average satisfaction score. (Use - Multiple CTE :  Employee Identification)
WITH avg_engagement AS (
SELECT AVG(Engagement_Score) AS avg_engagement
FROM hr_analytic_dataset),
avg_satisfaction AS (
SELECT AVG(Satisfaction_Score) AS avg_satisfaction
FROM hr_analytic_dataset)
SELECT h.Employee_ID,h.First_Name,h.Engagement_Score,h.Satisfaction_Score
FROM hr_analytic_dataset h
WHERE h.Engagement_Score>
(
SELECT avg_engagement
FROM avg_engagement
) AND Satisfaction_Score>
(
SELECT avg_satisfaction
FROM avg_satisfaction
)

-- Q) Find employees whose training cost is above average. (Use - Multiple CTE + JOIN : High Training Investment Analysis)
WITH avg_training_cost AS(
SELECT AVG(Training_Cost) AS avg_cost
FROM employee_training),
employee_training_data AS (
SELECT h.Employee_ID,h.First_Name,h.Department_Type,e.Training_Cost
FROM hr_analytic_dataset h
INNER JOIN employee_training e
ON h.Employee_ID = e.Employee_ID
),
high_cost_training AS (
SELECT * FROM  employee_training_data
WHERE Training_Cost >
(
SELECT avg_cost
FROM avg_training_cost
)
)
SELECT * FROM high_cost_training;

-- Q) Calculate safe training cost per engagement score. (Use -  Multiple CTE + NULLIF : Avoid Divide-By-Zero Error in Analytics)
WITH training_data AS (
SELECT h.Employee_ID,h.First_Name,h.Engagement_Score,e.Training_Cost
FROM hr_analytic_dataset h
INNER JOIN employee_training e
ON h.Employee_ID = e.Employee_ID
),
cost_analysis AS (
SELECT Employee_ID,First_Name,Training_Cost,Engagement_Score,ROUND(Training_Cost / NULLIF(Engagement_Score, 0),2) AS cost_per_score
FROM training_data
)SELECT * FROM cost_analysis;

-- Q) Find employees having engagement score above department running average. 
-- (Use - Multiple CTE + WINDOWS FUNCTION : Advanced Employee Performance Analysis)
WITH employee_scores AS (
SELECT Employee_ID,First_Name,Department_Type,Engagement_Score,
ROUND(AVG(Engagement_Score) OVER(PARTITION BY Department_Type),2) AS department_avg
FROM hr_analytic_dataset),
high_performers AS (
SELECT * FROM employee_scores
WHERE Engagement_Score > department_avg)
SELECT *FROM high_performers;