--------------------------------------------- DQL---------------------------------------------------------------------------------------------------------------
-- Q) Count total employees department-wise. (Use - GROUP BY + COUNT() : Department Headcount Analysis)
SELECT Department_Type,COUNT(*) AS total_employees
FROM hr_analytic_dataset
GROUP BY Department_Type;

-- Q) Find average engagement score department-wise. (Use - GROUP BY + AVG() : Department Performance Analysis)
SELECT Department_Type,ROUND(AVG(Engagement_Score),2) AS avg_engagement
FROM hr_analytic_dataset
GROUP BY Department_Type;

-- Q) Find total training cost department-wise. (Use - GROUP BY + SUM() : Training Budget Analysis)
SELECT Department_Type,SUM(Training_Cost) AS total_training_cost
FROM hr_analytic_dataset
GROUP BY Department_Type;

-- Q) Find maximum engagement score department-wise. (Use - GROUP BY + MAX() : Best Performer Analysis)
SELECT Department_Type,MAX(Engagement_Score) AS max_score
FROM hr_analytic_dataset
GROUP BY Department_Type;

-- Q) Find minimum satisfaction score department-wise. (Use - GROUP BY + Min() : Low Satisfaction Analysis)
SELECT Department_Type,MIN(Satisfaction_Score) AS min_score
FROM hr_analytic_dataset
GROUP BY Department_Type;

-- Q) Display employees based on highest engagement score. (Use - ORDER BY DESC : Top Employee Sorting)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
ORDER BY Engagement_Score DESC;

-- Q) Display employees based on lowest engagement score. (Use - ORDER BY ASC : Bottom Employee Sorting)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
ORDER BY Engagement_Score;

-- Q) Show employees having satisfaction score greater than 3. 
-- (Use - WHERE : High Satisfaction Employee Filtering)
SELECT Employee_ID,First_Name,Satisfaction_Score
FROM hr_analytic_dataset
WHERE Satisfaction_Score > 3;

-- Q) Find departments having average engagement score greater than 3.
-- (Use - HAVING : Top - Performing Department Analysis)
SELECT Department_Type,ROUND(AVG(Engagement_Score),2) AS avg_score
FROM hr_analytic_dataset
GROUP BY Department_Type
HAVING AVG(Engagement_Score) > 3;

-- Q) Display unique department types. (Use - DISTINCT : Unique Department Identification)
SELECT DISTINCT Department_Type
FROM hr_analytic_dataset;

-- Q) Display top 5 employees based on engagement score. (Use - LIMIT : Top Employee Analysis)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
ORDER BY Engagement_Score DESC
LIMIT 5;

-- Q) Display botto, 5 employees based on engagement score. (Use - LIMIT : Bottom Employee Analysis)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
ORDER BY Engagement_Score ASC
LIMIT 5;

-- Q) Skip first 5 employees and display next 5 employees. (Use - OFFSET : Pagination)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
ORDER BY Employee_ID
LIMIT 5 OFFSET 5;

-- Q) Find employees having engagement score between 3 and 5. (Use - BETWEEN : Range filtering)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
WHERE Engagement_Score BETWEEN 3 AND 5;

-- Q) Find employees whose first name starts with 'A'. (Use - LIKE a%: Pattern Matching)
SELECT Employee_ID,First_Name
FROM hr_analytic_dataset
WHERE First_Name LIKE 'A%';

-- Q) Find employees whose first name having 'ri' . (Use - LIKE %ri% : Pattern Matching)
SELECT Employee_ID,First_Name
FROM hr_analytic_dataset
WHERE First_Name LIKE '%ri%';

-- Q) Find employees whose first name ends with 'd'. (Use - LIKE %d : Pattern Matching)
SELECT Employee_ID,First_Name
FROM hr_analytic_dataset
WHERE First_Name LIKE '%d';

-- Q) Find employees belonging to specific departments. (Use - IN : Multiple value filtering)
SELECT Employee_ID,First_Name,Department_Type
FROM hr_analytic_dataset
WHERE Department_Type IN
(
    'Sales',
    'HR',
    'Finance'
);