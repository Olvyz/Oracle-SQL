SELECT * FROM regions;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM countries;
SELECT * FROM jobs;

SELECT r.region_name,  COUNT(*) FROM employees e 
JOIN departments d ON (e.department_id = d.department_id) 
JOIN locations l ON (d.location_id = l.location_id)
JOIN countries c ON (l.country_id = c.country_id)
JOIN regions r ON (c.region_id = r.region_id)
GROUP BY r.region_name;

SELECT e.first_name, e.last_name, e.job_id, l.street_address, l.city, c.country_name, r.region_name FROM employees e 
LEFT OUTER JOIN departments d ON (e.department_id = d.department_id) 
LEFT OUTER JOIN locations l ON (d.location_id = l.location_id)
LEFT OUTER JOIN countries c ON (l.country_id = c.country_id)
LEFT OUTER JOIN regions r ON (c.region_id = r.region_id);

SELECT ee.employee_id, ee.first_name, COUNT(*) FROM employees e
JOIN employees ee ON (e.manager_id = ee.employee_id)
GROUP BY ee.first_name, ee.employee_id
HAVING COUNT(*) > 6;

SELECT department_name, COUNT (*) FROM employees 
JOIN departments USING (department_id)
GROUP BY department_name
HAVING COUNT(*) > 30; 

SELECT d.department_name FROM employees e
RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id)
GROUP BY department_name
HAVING COUNT(employee_id) = 0; 

SELECT e.* FROM employees e
JOIN employees ee ON (e.manager_id = ee.employee_id)
WHERE TO_CHAR(ee.hire_date, 'yyyy') = '2005' AND e.hire_date < '01-JAN-2005';

SELECT country_name, region_name FROM countries
NATURAL JOIN regions;

SELECT first_name, last_name, salary, min_salary, max_salary FROM employees e
JOIN jobs j ON (e.job_id = j.job_id)
WHERE e.salary < j.min_salary + 1000;

SELECT first_name, last_name, salary, min_salary, max_salary FROM employees e
JOIN jobs j ON (e.job_id = j.job_id AND salary < min_salary + 1000);

SELECT DISTINCT e.first_name, e.last_name, c.country_name FROM employees e 
FULL OUTER JOIN departments d ON (e.department_id = d.department_id) 
FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
FULL OUTER JOIN countries c ON (l.country_id = c.country_id)
ORDER by e.first_name;

SELECT first_name, last_name, country_name FROM employees e
CROSS JOIN countries c;

SELECT r.region_name,  COUNT(*) 
FROM employees e, departments d, locations l, countries c, regions r 
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
GROUP BY r.region_name;

SELECT d.department_name 
FROM employees e, departments d
WHERE e.department_id (+) = d.department_id
AND e.first_name IS NULL; 

