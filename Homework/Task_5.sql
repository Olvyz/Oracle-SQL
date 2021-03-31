SELECT * from employees where instr (lower(first_name), 'b') != 0;

SELECT * from employees where lower(first_name) like '%a%a%';

SELECT SUBSTR(department_name, 1, instr(department_name, ' ')-1) from departments where instr(department_name, ' ') != 0;

SELECT first_name, SUBSTR(first_name, 2, length(first_name)-2) from employees;

SELECT * FROM employees WHERE SUBSTR(job_id, instr(job_id, '_')+1) != 'CLERK' AND length(SUBSTR(job_id, instr(job_id, '_')+1)) > 3;

SELECT * FROM employees WHERE to_char(hire_date, 'dd') = '01';

SELECT * FROM employees WHERE to_char(hire_date, 'yyyy') = '2008';

SELECT to_char(sysdate+1, 'fm"Tomorrow is "Ddspth "day of" Month') FROM dual;

SELECT first_name, to_char(hire_date, 'fmDDth "of" Month, yyyy') AS hire_date2 FROM employees;

SELECT first_name, salary, salary*1.2, to_char(salary*1.2, '$999,999.99') FROM employees;

SELECT sysdate, sysdate+(1/(24*60*60)) sek, sysdate+(1/(24*60)) min, sysdate+(1/24) hours, sysdate+1 day, add_months(sysdate, 1), add_months(sysdate, 12) FROM dual;

SELECT first_name, salary, (salary+to_number('$12,345.55', '$99,999.99')) new_salary FROM employees;

SELECT first_name, hire_date, round(months_between(to_date('SEP, 18:45:00 18 2009', 'MM, HH24:MI:SS DD yyyy'), hire_date)) months FROM employees;

SELECT first_name, salary, nvl(to_char(salary*(1+commission_pct),'$999,999.99'), to_char(salary,'$999,999.99')) new_salary FROM employees;

SELECT first_name, last_name, nvl2(nullif(length(first_name), length(last_name)), 'different length', 'same length') condition FROM employees;

SELECT first_name, commission_pct, nvl2(commission_pct, 'Yes', 'No') condition FROM employees;

SELECT first_name, coalesce(commission_pct, manager_id, salary) condition FROM employees;

SELECT first_name, salary, 
CASE WHEN salary < 5000 THEN 'Low level'
WHEN salary >= 5000 FROM salary < 10000 THEN 'Normal level'
WHEN salary >= 10000 THEN 'High level'
END AS condition FROM employees;

SELECT country_name, decode(region_id, 1, 'Europe', 2, 'America', 3, 'Asia', 4, 'Africa') AS condition FROM countries;

SELECT country_name, 
CASE region_id
WHEN 1 THEN 'Europe'
WHEN 2 THEN 'America'
WHEN 3 THEN 'Asia'
WHEN 4 THEN 'Africa'
END AS condition FROM countries;

SELECT first_name, salary, commission_pct, 
CASE WHEN salary < 10000 AND commission_pct IS null THEN 'BAD'
WHEN (salary >= 10000 AND salary < 15000) or commission_pct IS NOT null THEN 'NORMAL'
WHEN salary >= 15000 THEN 'GOOD'
END AS condition FROM employees;
































