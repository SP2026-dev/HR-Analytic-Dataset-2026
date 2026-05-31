--------------------------------------------- Joins ---------------------------------------------------------------------------------------------------------------
-- Q) Show employees who have attended training programs. (Use - INNER JOIN : Matching Records from both tables)
SELECT h.Employee_ID, h.First_Name,Department_Type,e.Training_Date,e.Training_Cost
FROM hr_analytic_dataset h
INNER JOIN employee_training e
ON h.Employee_ID = e.Employee_ID;

-- Q) Show all employees and their training details if available. (Use - LEFT JOIN: Include all employees even if training not attended)
SELECT h.Employee_ID,h.First_Name,h.Department_Type,e.Training_Date,e.Training_Cost
FROM hr_analytic_dataset h
LEFT JOIN  employee_training e
ON h.Employee_ID = e.Employee_ID;

-- Q) Show all training records including employees not present in HR table. (Use - RIGHT JOIN: All training records analysis)
SELECT h.Employee_ID,h.First_Name,e.Training_Date,e.Training_Cost
FROM hr_analytic_dataset h
RIGHT JOIN  employee_training e
ON h.Employee_ID = e.Employee_ID;

-- Q) Show all employees and all training records from both tables. (Use - FULL JOIN : Complete dataset comparison)
SELECT h.Employee_ID,h.First_Name,e.Training_Date,e.Training_Cost
FROM hr_analytic_dataset h
FULL JOIN  employee_training e
ON h.Employee_ID = e.Employee_ID;

-- Q) Generate all possible combinations of employees and business units. (Use - CROSS JOIN: Combination analysis)
SELECT h.First_Name,b.Business_Unit
FROM hr_analytic_dataset h
CROSS JOIN (SELECT DISTINCT Business_Unit FROM hr_analytic_dataset)b;

-- Q) Show employees working in same department. (Use - SELF JOIN: Find colleagues in same department)
SELECT a.First_Name,a.Department_Type,b.First_Name 
FROM hr_analytic_dataset a
JOIN hr_analytic_dataset b
ON a.Department_Type = b.Department_Type AND a.Employee_ID <> b.Employee_ID;

-- Q) Count employees who attended training department-wise. (Use - INNER JOIN + COUNT() : Department Training Participation)
SELECT h.Department_Type, COUNT(e.Employee_ID) AS trained_employees
FROM hr_analytic_dataset h
INNER JOIN employee_training e
ON h.Employee_ID = e.Employee_ID
GROUP BY Department_Type;

-- Q) Find employees who never attended training. (Use - LEFT JOIN + NULL CHECK : Training Gap Analysis)
SELECT h.Employee_ID,h.First_Name,h.Department_Type
FROM hr_analytic_dataset h
LEFT JOIN  employee_training e
ON h.Employee_ID = e.Employee_ID
WHERE e.Employee_ID IS NULL;