SELECT manager_id, to_char(null)job_id, to_number(null)department_id, sum(salary) FROM employees 
GROUP BY manager_id
UNION
SELECT to_number(null), job_id, to_number(null), sum(salary) FROM employees 
GROUP BY job_id
UNION
SELECT to_number(null), to_char(null), department_id, sum(salary) FROM employees 
GROUP BY department_id;

SELECT department_id FROM employees 
WHERE manager_id = 100
MINUS
SELECT department_id FROM employees 
WHERE manager_id = 145 OR manager_id = 201;

SELECT first_name, last_name, salary FROM employees 
WHERE first_name LIKE '_a%'
INTERSECT
SELECT first_name, last_name, salary FROM employees 
WHERE lower(last_name) LIKE '%s%'
ORDER BY salary DESC;

SELECT location_id, postal_code, city, c.country_name FROM locations l
JOIN countries c ON (l.country_id = c.country_id)
WHERE c.country_name IN ('Italy', 'Germany')
UNION ALL
SELECT location_id, postal_code, city, to_char(null) FROM locations 
WHERE postal_code LIKE '%9%';

SELECT country_id id, country_name country, region_id region FROM countries
WHERE LENGTH(country_name) > 8
UNION
SELECT country_id id, country_name country, region_id region FROM countries
WHERE region_id in (SELECT region_id FROM regions WHERE region_name NOT LIKE 'Europe')
ORDER BY country DESC;

