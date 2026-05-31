--------------------------------------------- Union and Union ALL ---------------------------------------------------------------------------------------------------------------
-- Q) Combine employee IDs from both HR and Training datasets without duplicates. (Use - UNION : Unique Employee List)
SELECT Employee_ID
FROM hr_analytic_dataset

UNION

SELECT  Employee_ID
FROM employee_training;

-- Q) Combine employee IDs from both tables including duplicates. (Use - UNION ALL : Raw Combined Employee Data)
SELECT Employee_ID
FROM hr_analytic_dataset

UNION ALL

SELECT  Employee_ID
FROM employee_training;