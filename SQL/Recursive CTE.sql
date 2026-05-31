--------------------------------------------- Recursive CTE ---------------------------------------------------------------------------------------------------------------
-- Q)  Display employee-manager hierarchy. (Use - Recursive CTE : Organizational Hierarchy Analysis)
WITH RECURSIVE employee_hierarchy AS (

-- Anchor Query
SELECT Employee_ID, Manager_ID,1 AS hierarchy_level
FROM Recursive_CTE
WHERE Manager_ID IS NULL

UNION ALL

-- Recursive Query
SELECT r.Employee_ID,r.Manager_ID,eh.hierarchy_level + 1
FROM Recursive_CTE r
INNER JOIN employee_hierarchy eh
ON r.Manager_ID = eh.Employee_ID
)

SELECT * FROM employee_hierarchy;
