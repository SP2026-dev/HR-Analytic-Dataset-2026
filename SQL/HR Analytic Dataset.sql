------------------------------------------------------------------- Import CSV -----------------------------------------------------------------------
CREATE TABLE HR_Analytic_Dataset (
    Unique_ID VARCHAR(50),
    Employee_ID INT,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Start_Date DATE,
    Exit_Date VARCHAR(5),
    Title VARCHAR(150),
    Supervisor VARCHAR(150),
    Email VARCHAR(150),
    Business_Unit VARCHAR(100),
    Employee_Status VARCHAR(100),
    Employee_Type VARCHAR(100),
    Pay_Zone VARCHAR(50),
    Employee_Classification_Type VARCHAR(100),
    Termination_Type VARCHAR(100),
    Termination_Description VARCHAR(255),
    Department_Type VARCHAR(100),
    Division VARCHAR(100),
    DOB DATE,
    States VARCHAR(100),
    Job_Function_Description VARCHAR(255),
    Gender_Code VARCHAR(20),
    Location_Code VARCHAR(50),
    Race_Desc VARCHAR(100),
    Marital_Desc VARCHAR(50),
    Performance_Score VARCHAR(50),
    Current_Employee_Rating INT,
    Survey_Date DATE,
    Engagement_Score INT,
    Satisfaction_Score INT,
    Working_Life_Balance_Score INT,
    Training_Date DATE,
    Training_Program_Name VARCHAR(255),
    Training_Type VARCHAR(100),
    Training_Outcome VARCHAR(100),
    Locations VARCHAR(100),
    Trainer VARCHAR(150),
    Training_Duration_Days INT,
    Training_Cost DECIMAL(10,2)
);


COPY HR_Analytic_Dataset(
Unique_ID, Employee_ID, First_Name, Last_Name,
Start_Date, Exit_Date, Title, Supervisor, Email,
Business_Unit, Employee_Status, Employee_Type,
Pay_Zone, Employee_Classification_Type,
Termination_Type, Termination_Description,
Department_Type, Division, DOB, States,
Job_Function_Description, Gender_Code,
Location_Code, Race_Desc, Marital_Desc,
Performance_Score, Current_Employee_Rating,
Survey_Date, Engagement_Score,
Satisfaction_Score, Working_Life_Balance_Score,
Training_Date, Training_Program_Name,
Training_Type, Training_Outcome, Locations,
Trainer, Training_Duration_Days, Training_Cost
)
FROM 'C:\Users\pandi\OneDrive\Desktop\Final Github Project Upload\Project 02 - HR Analytic Dataset\Dashboard\HR Analytic Dashboard.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM HR_Analytic_Dataset;