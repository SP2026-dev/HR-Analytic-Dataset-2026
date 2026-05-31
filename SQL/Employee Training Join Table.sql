CREATE TABLE employee_training(
Employee_ID INT,
Training_Date DATE,
Training_Cost DECIMAL(10,2));

COPY  employee_training(Employee_ID,Training_Date,Training_Cost)
FROM 'C:/Users/pandi/OneDrive/Desktop/Final Github Project Upload/Project 02 - HR Analytic Dataset/Dashboard/HR Analytic Dashboard.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM employee_training;

