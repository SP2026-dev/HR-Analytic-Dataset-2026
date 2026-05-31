--------------------------------------------- CASE ---------------------------------------------------------------------------------------------------------------
-- Q) Categorize employees based on engagement score. (Use - Case : Employee Engagement Classification)
SELECT Employee_ID,First_Name,Engagement_Score,
    CASE
        WHEN Engagement_Score >= 4 THEN 'Highly Engaged'
        WHEN Engagement_Score >= 3 THEN 'Moderately Engaged'
        ELSE 'Low Engaged'
    END AS engagement_category
FROM hr_analytic_dataset;

-- Q) Show whether employee attended training or not. (Use - Case + NULL : Training Participation Tracking)
SELECT h.Employee_ID,h.First_Name,e.Training_Date,
    CASE
        WHEN e.Training_Date IS NULL
        THEN 'Training Not Attended'
        ELSE 'Training Attended'
    END AS training_status
FROM hr_analytic_dataset h
LEFT JOIN employee_training e
ON h.Employee_ID = e.Employee_ID;

-- Q) Count high and low engagement employees. (Use - Case + Aggregate Functions : Employee Engagement Summary)
SELECT
    CASE
        WHEN Engagement_Score >= 4
        THEN 'High Engagement'

        ELSE 'Low Engagement'
    END AS engagement_group,

    COUNT(*) AS total_employees
FROM hr_analytic_dataset
GROUP BY
    CASE
        WHEN Engagement_Score >= 4
        THEN 'High Engagement'

        ELSE 'Low Engagement'
    END;

-- Q) Categorize employees based on department average engagement score.(Use - Case + Windows Function:Department - Wise Performance Benchmarking)
SELECT Employee_ID,First_Name,Department_Type,Engagement_Score,
    ROUND(AVG(Engagement_Score) OVER(PARTITION BY Department_Type),2) AS dept_avg,
    CASE
        WHEN Engagement_Score >
        AVG(Engagement_Score) OVER(PARTITION BY Department_Type)
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS performance_status
FROM hr_analytic_dataset;