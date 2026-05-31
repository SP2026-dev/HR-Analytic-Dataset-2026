--------------------------------------------- Subquery ---------------------------------------------------------------------------------------------------------------
-- Q) Find employees having engagement score greater than average engagement score.
-- (Use - Single Row Subquery : Above- Average Employee Analysis)
SELECT Employee_ID, First_Name,Engagement_Score
FROM hr_analytic_dataset
WHERE Engagement_Score >
(
    SELECT AVG(Engagement_Score)
    FROM hr_analytic_dataset
);

-- Q) Find employees working in departments having engagement score greater than 4. 
-- (Use - Multiple Row Subquery : Department - Wise High Engagement Analysis)
SELECT Employee_ID, First_Name,Department_Type
FROM  hr_analytic_dataset
WHERE Department_Type IN
(
    SELECT Department_Type
    FROM  hr_analytic_dataset
    WHERE Engagement_Score > 4
);

-- Q) Find employees having engagement score greater than department average. 
-- (Use - Correlated Subquery : Department - Wise Performance Benchmarking)
SELECT h1.Employee_ID,h1.First_Name,h1.Department_Type,h1.Engagement_Score
FROM hr_analytic_dataset h1
WHERE h1.Engagement_Score >
(
    SELECT AVG(h2.Engagement_Score)
    FROM hr_analytic_dataset h2
    WHERE h1.Department_Type = h2.Department_Type
);

-- Q) Find employees having second highest engagement score. 
-- (Use - Nested Subquery : Second Best Employee Analysis)
SELECT Employee_ID,First_Name,Engagement_Score
FROM hr_analytic_dataset
WHERE Engagement_Score =
(
    SELECT MAX(Engagement_Score)
    FROM hr_analytic_dataset
    WHERE Engagement_Score <
    (
        SELECT MAX(Engagement_Score)
        FROM hr_analytic_dataset
    )
);

-- Q) Find employees who attended training. (Use - Subquery + EXISTS : Training Participation Analysis)
SELECT h.Employee_ID,h.First_Name
FROM hr_analytic_dataset h
WHERE EXISTS
(
    SELECT 1
    FROM employee_training e
    WHERE h.Employee_ID = e.Employee_ID
);

-- Q) Find employees who attended training. (Use - Subquery + NOT EXISTS : Training Gap Analysis)
SELECT h.Employee_ID,h.First_Name
FROM hr_analytic_dataset h
WHERE NOT EXISTS
(
    SELECT 1
    FROM employee_training e
    WHERE h.Employee_ID = e.Employee_ID
);