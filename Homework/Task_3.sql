SELECT * FROM employees WHERE first_name = 'David';
SELECT * FROM employees WHERE job_id = 'FI_ACCOUNT';
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 50 AND salary > 4000;
SELECT * FROM employees WHERE department_id = 20 OR department_id = 30;
SELECT * FROM employees WHERE first_name LIKE '_a%a';
SELECT * FROM employees WHERE (department_id = 50 OR department_id = 80) AND commission_pct IS NOT null ORDER BY 4;
SELECT * FROM employees WHERE lower (first_name) LIKE '%n%n%';
SELECT * FROM employees WHERE first_name LIKE '_____%' ORDER BY department_id DESC nulls LAST;
SELECT * FROM employees WHERE (salary BETWEEN 3000 AND 7000) AND commission_pct IS null AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');
SELECT * FROM employees WHERE first_name LIKE '%\%%' ESCAPE '\';
SELECT employee_id, job_id, first_name, salary FROM employees WHERE employee_id >= 120 AND job_id != 'IT_PROG' ORDER BY job_id, first_name DESC;







