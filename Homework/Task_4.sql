SELECT * FROM employees WHERE length(first_name) > 10;
SELECT * FROM employees WHERE mod(salary, 1000) = 0;
SELECT phone_number, RPAD(phone_number, 3) FROM employees WHERE phone_number LIKE('___.___.____');
SELECT phone_number, substr(phone_number, 1, 3) FROM employees WHERE phone_number LIKE('___.___.____');
SELECT first_name FROM employees WHERE length(first_name) > 5 AND INSTR(first_name, 'm') = length(first_name);
SELECT first_name FROM employees WHERE length(first_name) > 5 AND substr(first_name, -1) = 'm';
SELECT NEXT_DAY(SYSDATE, 5) FROM dual;
SELECT * FROM employees WHERE months_between(SYSDATE, hire_date) > 150;
SELECT phone_number, replace(phone_number, '.', '-') FROM employees;
SELECT UPPER(first_name), lower(email), INITCAP(job_id) FROM employees;
SELECT concat(first_name, salary) FROM employees;
SELECT hire_date, round(hire_date,'mm'), trunc(hire_date, 'yyyy') FROM employees;
SELECT rpad(first_name, 10, '$'), lpad(last_name, 15, '!') FROM employees;
SELECT first_name, instr(first_name, 'a', 1, 2) FROM employees;
SELECT '!!!HELLO!! MY FRIEND!!!!!!!!', trim (both '!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!') FROM dual;
SELECT salary, round(salary*3.1415), trunc(salary*3.1415, -3)/1000 FROM employees;
SELECT hire_date, add_months(hire_date, 6), last_day(hire_date) FROM employees;
SELECT SYSDATE FROM dual;




