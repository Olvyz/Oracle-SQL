SELECT department_id, MIN(salary), MAX(salary), MIN(hire_date), MAX(hire_date), COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY COUNT (*) DESC;

SELECT SUBSTR(first_name, 1, 1) first_letter, COUNT(SUBSTR(first_name, 1, 1)) count
FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(SUBSTR(first_name, 1, 1)) > 1
ORDER BY COUNT (*) DESC;

SELECT department_id, salary, count (*) 
FROM employees
GROUP BY department_id, salary
ORDER BY department_id;

SELECT TO_CHAR(hire_date, 'D'), TO_CHAR(hire_date, 'Day'), count(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'D'), TO_CHAR(hire_date, 'Day')
ORDER BY TO_CHAR(hire_date, 'D');

SELECT department_id, COUNT (*) employees, SUM(salary) salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30 AND SUM(salary) > 300000
ORDER BY department_id;

SELECT region_id, SUM(LENGTH(country_name)) name_length 
FROM countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;

SELECT job_id, ROUND(AVG(salary)) avg_salary
FROM employees
GROUP BY job_id
ORDER BY job_id;

SELECT department_id, COUNT(job_id)
FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1
ORDER BY department_id;

SELECT department_id, job_id, MIN(salary), MAX (salary)
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000
ORDER BY department_id;
 
SELECT manager_id, AVG(NVL2(commission_pct, NULL, salary)) avg_salary 
FROM employees
GROUP BY manager_id
HAVING AVG(NVL2(commission_pct, NULL, salary)) BETWEEN 6000 AND 9000
ORDER BY manager_id;

SELECT ROUND(MAX(AVG(salary)), -3)
FROM employees
GROUP BY department_id;




