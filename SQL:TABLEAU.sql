use employees_mod;

#TABLAUO TASK 1
SELECT 

    YEAR(d.from_date) AS calendar_year,
    e.gender,     
    COUNT(e.emp_no) AS num_of_employees

FROM     
     t_employees e         
          JOIN     
     t_dept_emp d ON d.emp_no = e.emp_no

GROUP BY calendar_year , e.gender 

HAVING calendar_year >= 1990;

#TABLUAO TASK 2
use employees_mod;
SELECT 
    *
FROM
    t_employees
ORDER BY emp_no;

SELECT 
d.dept_name,
ee.gender,
dm.emp_no,
dm.from_date,
dm.to_date,
e.calendar_year,
CASE 
WHEN 
 YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1 ELSE 0 
 END AS active_col
FROM 
(SELECT YEAR(hire_date) AS calendar_year 
FROM
t_employees GROUP BY calendar_year) e
CROSS JOIN 
t_dept_manager dm
JOIN 
t_departments d on dm.dept_no = d.dept_no
JOIN 
t_employees ee on dm.emp_no = ee.emp_no 
ORDER BY dm.emp_no, calendar_year;

#TASK 3
SELECT 
    e.gender,
    d.dept_name,
    AVG(s.salary) AS avg_salary,
    YEAR(s.from_date) AS calendar_year
FROM
  t_salaries s
        JOIN
    t_employees e ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON s.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY e.gender , d.dept_no , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;


#TASK 4 
DROP IF EXISTS avg_salary_byrange
DELIMITER $$
CREATE PROCEDURE avg_salary_byrange (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN 
SELECT 
e.gender,d.dept_name,AVG(s.salary) as salary
FROM
t_salaries s
JOIN 
t_employees e on e.emp_no = s.emp_no 
JOIN 
t_dept_emp de on s.emp_no = de.emp_no 
JOIN 
t_departments d on d.dept_no = de.dept_no
WHERE 
s.salary between p_min_salary and p_max_salary
GROUP BY de.dept_no, e.gender;

END $$
DELIMITER ;

DROP PROCEDURE avg_salary_byrange;





















