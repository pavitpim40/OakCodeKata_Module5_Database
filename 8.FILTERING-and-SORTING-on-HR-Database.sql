-- 1-5
SELECT first_name ||' '||last_name AS Full_Name, salary  FROM employees WHERE salary < 6000;
SELECT first_name,last_name, department_id, salary FROM employees  WHERE salary > 8000;
SELECT first_name, last_name, department_id  FROM employees  WHERE last_name = 'McEwen';
SELECT *  FROM employees  WHERE department_id IS NULL;
SELECT *  FROM  departments  WHERE department_name = 'Marketing';

-- 6-10
SELECT first_name || ' ' || last_name as Full_Name, hire_date, salary, department_id FROM employees WHERE first_name NOT LIKE '%M%'  ORDER BY department_id;
SELECT * FROM employees WHERE salary BETWEEN 8000 AND 12000 AND commission_pct IS NOT NULL OR  department_id NOT IN (40 , 120 , 70) AND   hire_date < '1987-06-05';
SELECT first_name ||' '||last_name AS Full_Name, salary FROM  employees WHERE commission_pct IS NULL;
SELECT first_name ||' '||last_name AS Full_Name, phone_number ||' - '|| email AS Contact_Details, salary  AS Remuneration FROM employees WHERE salary BETWEEN 9000 AND 17000;
SELECT first_name, last_name, salary  FROM employees  WHERE first_name LIKE '%m';

-- 11-15
SELECT first_name || ' ' || last_name as Name, salary FROM  employees WHERE salary NOT BETWEEN 7000 AND 15000 ORDER BY first_name || ' ' || last_name;
SELECT first_name ||' '||last_name AS Full_Name, job_id, hire_date FROM employees WHERE hire_date BETWEEN '2007-11-05' AND '2009-07-05';
SELECT first_name ||' '|| last_name AS Full_Name, department_id FROM employees WHERE department_id = 70 OR department_id = 90;
SELECT first_name ||' '||last_name AS Full_Name, salary, manager_id FROM employees WHERE manager_id IS NOT NULL;
SELECT * FROM employees WHERE hire_date < '2002-06-21';

-- 16-20
SELECT first_name, last_name, email, salary, manager_id FROM employees WHERE manager_id IN (120 , 103 , 145);
SELECT * FROM employees WHERE first_name LIKE '%D%' OR first_name LIKE '%S%' OR first_name LIKE '%N%' ORDER BY salary DESC;
SELECT first_name ||' '||last_name AS Full_Name, hire_date, commission_pct, email ||' -  '||phone_number AS Contact_Details, salary FROM employees WHERE salary > 11000  OR phone_number LIKE '______3%' ORDER BY first_name DESC;
SELECT first_name,last_name, department_id FROM employees WHERE first_name LIKE '__s%';
SELECT employee_id, first_name, job_id, department_id FROM employees WHERE department_id NOT IN (50, 30, 80);

-- 21-25
SELECT employee_id, first_name, job_id, department_id FROM employees WHERE department_id IN (30 , 40 , 90);
SELECT employee_id FROM job_history GROUP BY employee_id HAVING COUNT(*) >=2;
SELECT job_id, COUNT(*), SUM(salary), MAX(salary)-MIN(salary) AS salary_difference FROM employees GROUP BY job_id;
SELECT job_id FROM job_history WHERE end_date-start_date >300 GROUP BY job_id HAVING COUNT(*)>=2;
SELECT country_id,  COUNT(*) FROM locations GROUP BY country_id;

-- 26-30
SELECT manager_id, COUNT(*) FROM employees GROUP BY manager_id;
SELECT * FROM jobs ORDER BY job_title DESC;
SELECT first_name, last_name, hire_date FROM employees WHERE job_id IN ('SA_REP', 'SA_MAN');
SELECT department_id, AVG(salary) FROM employees WHERE commission_pct IS NOT NULL GROUP BY department_id;
SELECT DISTINCT department_id FROM employees GROUP BY department_id, manager_id HAVING COUNT(employee_id) >=4;

-- 31-35
SELECT department_id FROM employees WHERE commission_pct IS NOT NULL	GROUP BY department_id HAVING COUNT(commission_pct)>10;
SELECT employee_id , MAX(end_date) FROM job_history WHERE employee_id IN (SELECT employee_id FROM job_history GROUP BY 1 HAVING COUNT(employee_id) > 1) GROUP BY 1;
SELECT * FROM employees WHERE commission_pct IS NULL AND salary BETWEEN 7000 AND 12000 AND department_id=50;
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id HAVING AVG(salary)>8000;
SELECT job_title, max_salary-min_salary AS salary_differences FROM jobs WHERE max_salary BETWEEN 12000 AND 18000;

-- 36-38
SELECT first_name, last_name FROM employees WHERE  first_name  LIKE 'D%' OR last_name LIKE 'D%';
SELECT * FROM jobs WHERE min_salary > 9000;
SELECT * FROM employees  WHERE hire_date > '1987-09-07';