select * from employees where instr (lower(first_name), 'b') != 0;

select * from employees where lower(first_name) like '%a%a%';

select SUBSTR(department_name, 1, instr(department_name, ' ')-1) from departments where instr(department_name, ' ') != 0;

select first_name, SUBSTR(first_name, 2, length(first_name)-2) from employees;

select * from employees where SUBSTR(job_id, instr(job_id, '_')+1) != 'CLERK' and length(SUBSTR(job_id, instr(job_id, '_')+1)) > 3;

select * from employees where to_char(hire_date, 'dd') = '01';

select * from employees where to_char(hire_date, 'yyyy') = '2008';

select to_char(sysdate+1, 'fm"Tomorrow is "Ddspth "day of" Month') from dual;

select first_name, to_char(hire_date, 'fmDDth "of" Month, yyyy') as hire_date2 from employees;

select first_name, salary, salary*1.2, to_char(salary*1.2, '$999,999.99') from employees;

select sysdate, sysdate+(1/(24*60*60)) sek, sysdate+(1/(24*60)) min, sysdate+(1/24) hours, sysdate+1 day, add_months(sysdate, 1), add_months(sysdate, 12) from dual;

select first_name, salary, (salary+to_number('$12,345.55', '$99,999.99')) new_salary from employees;

select first_name, hire_date, round(months_between(to_date('SEP, 18:45:00 18 2009', 'MM, HH24:MI:SS DD yyyy'), hire_date)) months from employees;

select first_name, salary, nvl(to_char(salary*(1+commission_pct),'$999,999.99'), to_char(salary,'$999,999.99')) new_salary from employees;

select first_name, last_name, nvl2(nullif(length(first_name), length(last_name)), 'different length', 'same length') condition from employees;

select first_name, commission_pct, nvl2(commission_pct, 'Yes', 'No') condition from employees;

select first_name, coalesce(commission_pct, manager_id, salary) condition from employees;

select first_name, salary, 
CASE WHEN salary < 5000 THEN 'Low level'
WHEN salary >= 5000 and salary < 10000 THEN 'Normal level'
WHEN salary >= 10000 THEN 'High level'
END as condition from employees;

select country_name, decode(region_id, 1, 'Europe', 2, 'America', 3, 'Asia', 4, 'Africa') as condition from countries;

select country_name, 
CASE region_id
WHEN 1 THEN 'Europe'
WHEN 2 THEN 'America'
WHEN 3 THEN 'Asia'
WHEN 4 THEN 'Africa'
END as condition from countries;

select first_name, salary, commission_pct, 
CASE WHEN salary < 10000 and commission_pct is null THEN 'BAD'
WHEN (salary >= 10000 and salary < 15000) or commission_pct is not null THEN 'NORMAL'
WHEN salary >= 15000 THEN 'GOOD'
END as condition from employees;
































