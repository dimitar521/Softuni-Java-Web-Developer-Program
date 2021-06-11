-- 16. Create View Employees with Job Titles 
-- Write a SQL query to create view v_employees_job_titles with full employee name and job title. When middle name is NULL replace it with empty string (''). Submit your query statements as Run skeleton, run queries & check DB. 
-- Example 
-- full_name 	job_title 
-- Guy R Gilbert 	Production Technician 
-- Kevin F Brown 	Marketing Assistant 
-- Roberto Tamburello 	Engineering Manager 
-- … 	…

Create view  v_employees_job_titles as
    SELECT concat_ws(' ',`first_name`,`middle_name`,`last_name`)as 'full_name',job_title FROM  `employees`;