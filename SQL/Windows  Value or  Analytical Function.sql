--------------------------------------------- Windows Function --------------------------------------------------------------------------------------
-- Q) Show previous employee engagement score within each department. (Use - Current Employee Score Compare With Previous Employee)
SELECT Employee_ID, First_Name,Department_Type,Engagement_Score,
LAG(Engagement_Score) OVER(PARTITION BY Department_Type  ORDER BY Engagement_Score) AS previous_engagement_score
FROM hr_analytic_dataset;

-- Q) Show next employee engagement score within each department. (Use - Future/Next Value Comparison)
SELECT Employee_ID, First_Name,Department_Type,Engagement_Score,
LEAD(Engagement_Score) OVER(PARTITION BY Department_Type  ORDER BY Engagement_Score) AS next_engagement_score
FROM hr_analytic_dataset;

-- Q) Find highest engagement score employee in each department. (Use - Identify Top Performer of the Department)
SELECT Employee_ID, First_Name,Department_Type,Engagement_Score,
FIRST_VALUE(First_Name) OVER(PARTITION BY Department_Type  ORDER BY Engagement_Score DESC) AS top_employee
FROM hr_analytic_dataset;

-- Q) Find lowest engagement score employee in each department. (Use - Identify Low Performer of the Department)
SELECT Employee_ID, First_Name,Department_Type,Engagement_Score,
LAST_VALUE(First_Name) OVER(PARTITION BY Department_Type  ORDER BY Engagement_Score DESC ROWS BETWEEN UNBOUNDED PRECEDING 
AND UNBOUNDED FOLLOWING) AS lowest_employee
FROM hr_analytic_dataset;

-- Q) Compare current employee rating with previous employee rating. (Use - Performance Trend Analysis)
SELECT Employee_ID, First_Name,Current_Employee_Rating,
LAG(Current_Employee_Rating) OVER(ORDER BY Current_Employee_Rating) AS  previous_rating
FROM hr_analytic_dataset;

-- Q) Show next employee satisfaction score. (Use - Employee Satisfaction Comparison)
SELECT Employee_ID, First_Name,Satisfaction_Score,
LEAD(Satisfaction_Score) OVER(ORDER BY Satisfaction_Score) AS  next_satisfaction_score
FROM hr_analytic_dataset;