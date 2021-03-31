SELECT * FROM regions;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM countries;
SELECT * FROM jobs;

SELECT * FROM employees
WHERE LENGTH(first_name) = (SELECT MAX(LENGTH(first_name)) FROM employees);

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT city FROM employees e, departments d, locations l 
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
GROUP BY l.city
HAVING SUM(e.salary) = (SELECT MIN(SUM(e.salary)) FROM employees e, departments d, locations l 
WHERE e.department_id = d.department_id AND d.location_id = l.location_id GROUP BY l.city);

SELECT * FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees) AND salary > 15000);

SELECT * FROM departments
WHERE department_id NOT IN (SELECT DISTINCT NVL(department_id, 0) FROM employees);

SELECT * FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT NVL(manager_id, 0) FROM employees);

SELECT * FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees GROUP BY manager_id
HAVING COUNT(*) > 6);

SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');

SELECT * FROM employees
WHERE manager_id IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE TO_CHAR(hire_date, 'yyyy') = '2005'))
AND hire_date < '01-JAN-2005';

SELECT * FROM employees
WHERE manager_id IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE TO_CHAR(hire_date, 'MON') = 'JAN'))
AND job_id IN (SELECT job_id FROM jobs WHERE LENGTH(job_title) > 15);



