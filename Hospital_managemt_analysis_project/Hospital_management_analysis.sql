DROP TABLE IF EXISTS hospital_data;

CREATE TABLE hospital_data(
	Hospital_Name VARCHAR(100),
	Location VARCHAR(100),
	Department VARCHAR(50),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM hospital_data;

-- 1.	Total Number of Patients
-- o	Write an SQL query to find the total number of patients across all hospitals.

SELECT SUM(patients_count) AS total_patients
FROM hospital_data;

-- 2.	Average Number of Doctors per Hospital
-- o	Retrieve the average count of doctors available in each hospital.

SELECT hospital_name, AVG(doctors_count) AS average_doctors
FROM hospital_data
GROUP BY hospital_name
ORDER BY hospital_name DESC;

-- 3.	Top 3 Departments with the Highest Number of Patients
-- o	Find the top 3 hospital departments that have the highest number of patients.

SELECT department, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC LIMIT 3;


-- 4.	Hospital with the Maximum Medical Expenses
-- o	Identify the hospital that recorded the highest medical expenses.

 SELECT hospital_name, SUM(medical_expenses) AS total_expenses
 FROM hospital_data
 GROUP BY hospital_name
 ORDER BY total_expenses DESC LIMIT 1;

-- 5.	Daily Average Medical Expenses
-- o	Calculate the average medical expenses per day for each hospital.

SELECT hospital_name, 
AVG(medical_expenses / GREATEST((discharge_date - admission_date), 1)) 
AS avg_daily_expenses
FROM hospital_data
GROUP BY hospital_name;



-- 6.	Longest Hospital Stay
-- o	Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

SELECT hospital_name, (discharge_date - admission_date) AS longest_stay
FROM hospital_data
ORDER BY longest_stay DESC LIMIT 1;


-- 7.	Total Patients Treated Per City:
-- o	Count the total number of patients treated in each city.

SELECT location, SUM(patients_count) AS total_patients_treated
FROM hospital_data
GROUP BY location
ORDER BY total_patients_treated DESC;

-- 8.	Average Length of Stay Per Department:
-- o	Calculate the average number of days patients spend in each department.

SELECT department, AVG(GREATEST((discharge_date - admission_date), 1)) AS avg_length_of_stay
FROM hospital_data
GROUP BY department
ORDER BY avg_length_of_stay DESC;

-- 9.	Identify the Department with the Lowest Number of Patients:
-- o	Find the department with the least number of patients.

SELECT department, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients ASC LIMIT 1;

-- 10.	Monthly Medical Expenses Report:
-- •	Group the data by month and calculate the total medical expenses for each month.

SELECT (admission_date) AS month, SUM(medical_expenses) AS total_medical_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;