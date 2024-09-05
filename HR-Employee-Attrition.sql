
SELECT * FROM [HR-Employee-Attrition];


-- Identifying different Genders

SELECT 
		DISTINCT Gender
FROM [HR-Employee-Attrition]



-- Identifying different Marital Status involved

SELECT
		DISTINCT MaritalStatus
FROM [HR-Employee-Attrition]
		


-- Identifying different Job Role

SELECT
		DISTINCT JobRole
FROM [HR-Employee-Attrition]



-- Identifying different Education Field

SELECT
		DISTINCT EducationField	
FROM [HR-Employee-Attrition]



-- Identifying different Department

SELECT
		DISTINCT Department
FROM [HR-Employee-Attrition]



-- Identifying different Business Travel

SELECT 
		DISTINCT BusinessTravel
FROM [HR-Employee-Attrition]



-- Identifying different Education Level

SELECT 
		DISTINCT Education as EducationLevel
FROM [HR-Employee-Attrition]
ORDER BY Education



-- Identifying different Age level

SELECT
		DISTINCT Age as AgeLevel
FROM [HR-Employee-Attrition]
GROUP BY Age
ORDER BY Age DESC;


-- Identify the Average age
SELECT
		AVG(Age) as Average_Age_of_Employee
FROM [HR-Employee-Attrition]


-- Total Employee BY GENDER
SELECT
		Gender,
		SUM(EmployeeCount) as TotalEmployee_by_Gender
FROM [HR-Employee-Attrition]
GROUP BY Gender
ORDER BY Gender;


-- Total Employee
SELECT 
		SUM(EmployeeCount) as TotalEmployee
FROM [HR-Employee-Attrition]


--SELECT
--		COUNT((Attrition) / 2 FROM [HR-Employee-Attrition]) 
	--	WHERE Attrition = 0 * 100
--  - (SELECT SUM(EmployeeCount) FROM [HR-Employee-Attrition] 




-- Total Employee

;with total_employee as
(
	SELECT 
			SUM(EmployeeCount) as total_employee
	FROM [HR-Employee-Attrition]
),
active_employee AS 
(
	SELECT
			COUNT(Attrition) / 2 AS active_employee
	FROM [HR-Employee-Attrition]
	WHERE Attrition = 0
),
average_employee_attrition AS 
(
	SELECT	
			ae.
			CAST(ae.total_employee - ae.active_employee / 100 AS DECIMAL(10,2)) AS total_attrition
	FROM average_active_employee
);

	
	   
-- Total OverTime

SELECT 
		SUM(CAST(OverTime as Int)) as TotalOverTime
FROM [HR-Employee-Attrition]


-- Average Hourly Rate

SELECT
		AVG(HourlyRate) AS HourlyRate
FROM [HR-Employee-Attrition]



-- Total Attrition BY JobRole & Gender

SELECT
		COUNT(Attrition) AS TotalAttrition,
		JobRole,
		Gender
FROM [HR-Employee-Attrition]
GROUP BY Gender, JobRole
ORDER BY Gender, JobRole DESC;




-- AVG Working Years

SELECT 
		Gender,
		AVG(TotalWorkingYears) as WorkingYears
FROM [HR-Employee-Attrition]
GROUP BY Gender



-- Identifying MaritalStatus relationship with OverTime

SELECT
		MaritalStatus,
		SUM(CAST(OverTime AS int)) as TotalOverTime
FROM [HR-Employee-Attrition]
GROUP BY MaritalStatus, OverTime
ORDER BY MaritalStatus, OverTime DESC;


-- Identifying OverTime by gender

SELECT 
--		Age,
		Gender,
		SUM(CAST(OverTime AS INT)) AS TotalOverTime
FROM [HR-Employee-Attrition]
GROUP BY  Gender, OverTime
ORDER BY  Gender, OverTime DESC;




-- Distance From Home according to Marital Status

SELECT
		DISTINCT Age, MaritalStatus,
		DistanceFromHome
FROM [HR-Employee-Attrition]
GROUP BY Age, MaritalStatus, DistanceFromHome
ORDER BY Age, MaritalStatus, DistanceFromHome DESC;




-- Number of companies worked by MaritalStatus

SELECT 
		MaritalStatus,
--		Age,
		SUM(NumCompaniesWorked) as TotalCompaniesWorked
FROM [HR-Employee-Attrition]
GROUP BY  MaritalStatus, NumCompaniesWorked
ORDER BY  MaritalStatus, NumCompaniesWorked DESC;



-- TOTAL ATTRITION by BusinessTravel by Gender

SELECT
		Gender,
		BusinessTravel,
		COUNT(Attrition) AS TOTALATTRITION
FROM [HR-Employee-Attrition]
GROUP BY Gender, BusinessTravel
ORDER BY Gender, BusinessTravel DESC;



-- Identify BusinessTravel by Marital Status

SELECT
		Age,
		Gender,
		BusinessTravel,
		MaritalStatus
FROM [HR-Employee-Attrition]
GROUP BY Age, Gender, BusinessTravel, MaritalStatus
ORDER BY Age, Gender;



-- Total Hourly rate by gender

SELECT
		Gender,
		SUM(HourlyRate) AS TotalHourlyRate
FROM [HR-Employee-Attrition]
GROUP BY Gender;




-- TOTAL Level of EducationField by Gender

SELECT
		MaritalStatus,
		COUNT(Gender) AS TotalGender,
		EducationField
FROM [HR-Employee-Attrition]
GROUP BY  Gender, MaritalStatus, EducationField
ORDER BY Gender, MaritalStatus DESC;


-- TOTAL ATTRITION BY EDUCATION FIELD

SELECT 
		EducationField,
		COUNT(Attrition) AS TOTAL_Attrition
FROM [HR-Employee-Attrition]
GROUP BY Attrition, EducationField
ORDER BY Attrition, EducationField DESC;


-- TOTAL ATTRITION BY MARITALSTATUS

SELECT
		Gender,
		COUNT(Attrition) AS ATTRITION,
		MaritalStatus
FROM [HR-Employee-Attrition]
GROUP BY MaritalStatus, Gender 
ORDER BY MaritalStatus, Gender




-- IDENTIFY level of performanceRate above 2


SELECT
		DISTINCT PerformanceRating,
		Gender
FROM [HR-Employee-Attrition]
WHERE PerformanceRating > 2
GROUP BY Gender, PerformanceRating
ORDER BY Gender, PerformanceRating DESC;

 

SELECT 
		Gender,
		Department,
		AVG(PercentSalaryHike) as AverageSalaryHike
FROM [HR-Employee-Attrition]
GROUP BY Gender, Department
ORDER BY Gender, Department DESC;

 
SELECT
		CASE
				WHEN Age <= 18 AND Age <= 25 THEN '18 - 25'
				WHEN Age > 25 AND Age <= 35 THEN '26 - 35'
				WHEN Age > 35 AND Age <= 45 THEN '36 - 45'
				WHEN Age > 45 AND AGE <= 55 THEN '46 - 55'
				WHEN Age > 55 AND Age <= 65 THEN '56 - 65'
				else '66+'
		END AS age_range,
		Gender, 
		MonthlyIncome
FROM [HR-Employee-Attrition]
GROUP BY age, Gender, MonthlyIncome
ORDER BY age, Gender, MonthlyIncome ASC;


-- Total Attrition by Age Range

SELECT 
		CASE
			WHEN AGE <= 18 AND AGE <= 25 THEN '18 - 25'
			WHEN AGE > 25 AND AGE <= 35 THEN '26 - 35'
			WHEN AGE > 35 AND AGE <= 45 THEN '36 - 45'
			WHEN AGE > 45 AND AGE <= 55 THEN '46 - 55'
			WHEN AGE > 55 AND AGE <= 65 THEN '56 - 65'
			ELSE '66 PLUS'
			END AS AGE_RANGE,
			COUNT(Attrition) AS TOTAL_ATTRITION
FROM [HR-Employee-Attrition]
GROUP BY AGE, Attrition
ORDER BY AGE, Attrition ASC;





SELECT 
		DISTINCT MaritalStatus, --Department,
		SUM(MonthlyIncome) AS Monthly_income,
		EducationField
FROM [HR-Employee-Attrition]
GROUP BY MaritalStatus, EducationField
ORDER BY MaritalStatus, EducationField DESC;


-- AVG MOnthly Income
SELECT
		 AVG(CAST(Monthlyincome AS DECIMAL(10,2))) AS MonthlyIncome
FROM [HR-Employee-Attrition]


-- TOTAL ATTRITION RATE BY PERFORMANCE RATING

SELECT
		COUNT(Attrition) AS TotalAttrition,
		PerformanceRating
FROM [HR-Employee-Attrition]
GROUP BY PerformanceRating
ORDER BY PerformanceRating


-- TOTAL ATTRITION RATE BY WORK DISTANCE

SELECT
		COUNT(Attrition) as TotalAttrition,
		DistanceFromHome
FROM [HR-Employee-Attrition]
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome DESC;


-- TOTAL ATTRITION RATE BY RELATIONSHIP SATISFACTION

SELECT
		COUNT(Attrition) as TotalAttrition,
		RelationshipSatisfaction
FROM [HR-Employee-Attrition]
GROUP BY RelationshipSatisfaction
ORDER BY RelationshipSatisfaction DESC;



-- TOTAL ATTRITION BY JOB SATISFACTION

SELECT
		COUNT(Attrition) as TotalAttrition,
		JobSatisfaction
FROM [HR-Employee-Attrition]
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction DESC;



-- TOTAL ATTRITION BY JOB INVOLVEMENT

SELECT
		COUNT(Attrition) as TotalAttrition,
		JobInvolvement
FROM [HR-Employee-Attrition]
GROUP BY JobInvolvement
ORDER BY JobInvolvement DESC;




-- TOTAL ATTRITION RATE BY WORKLIFE BALANCE

SELECT
		COUNT(Attrition) as TotalAttrition,
		WorkLifeBalance
FROM [HR-Employee-Attrition]
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance DESC;

		