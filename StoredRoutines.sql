#STORED ROUTINES

USE employees;

DROP procedure IF EXISTS select_employees;

DELIMITER $$ 
CREATE procedure select_employees()
BEGIN 

SELECT * FROM employees
LIMIT 1000;

END$$
DELIMITER ;

call employees.select_employees();

DROP PROCEDURE IF EXISTS avg_emp_salary;
DELIMITER $$
CREATE PROCEDURE avg_emp_salary()
BEGIN

SELECT 
AVG(SALARY)
from 
salaries;

END$$
DELIMITER ;

#STORED PROCEDURE WITH INPUT PARAMETERS 
DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INT)
BEGIN 
SELECT 
e.first_name, e.last_name, s.salary, s.from_date, s.to_date 
FROM 
employees e 
join 
salaries s on e.emp_no = s.emp_no 
where 
e.emp_no = p_emp_no;
END $$
DELIMITER ; 


DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INT)
BEGIN 
SELECT 
e.first_name, e.last_name, AVG(s.salary)
FROM 
employees e 
join 
salaries s on e.emp_no = s.emp_no 
where 
e.emp_no = p_emp_no;
END $$
DELIMITER ; 


#STORED PROCEDURE WITH IN AND OUT PARAMETERS >> THE OUT TO STORE THE RESULT 

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out (IN p_emp_no INT , OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
AVG(s.salary)
INTO p_avg_salary FROM 
employees e 
join 
salaries s ON e.emp_no = s.emp_no 
WHERE 
e.emp_no = p_emp_no;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE emp_info ( IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INT)
BEGIN 
SELECT 
e.emp_no 
INTO p_emp_no
FROM 
employees e
WHERE 
e.first_name = p_first_name and e.last_name = p_last_name;
END $$
DELIMITER ;




#FUNCTIONS

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INT) RETURNS DECIMAL (10,2) 
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 
DECLARE v_avg_salary DECIMAL (10,2);

SELECT 
AVG(s.salary)
INTO v_avg_salary
FROM
employees e 
JOIN
salaries s on e.emp_no = s.emp_no 
WHERE 
e.emp_no = p_emp_no;

RETURN v_avg_salary;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION emp_ino (p_first_name VARCHAR(255),p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA 
BEGIN

DECLARE v_latest_salary DECIMAL (10,2);
DECLARE v_max_from_date DATE;

SELECT 
MAX(s.from_date) 
into 
v_max_from_date
from 
salaries s
join 
employees e on e.emp_no = s.emp_no
where 
e.first_name = p_first_name and e.last_name = p_last_name;

SELECT 
salary 
into v_latest_salary
from
salaries s 
join 
employees e on e.emp_no = s.emp_no
where 
e.first_name = p_first_name and e.last_name = p_last_name and 
s.from_date = v_max_from_date;

RETURN v_latest_salary;

END$$

DELIMITER ;

SELECT emp_ino('Aruna','Journel');



#including a function in a select statement 
SET @v_emp_no = 11300;
SELECT 
emp_no,
first_name,
last_name,
f_emp_avg_salary(@v_emp_no) AS average_salary 
from 
employees
WHERE 
emp_no = @v_emp_no;

#ADVANCED SQL TOPICS 
#DECLARE INLY FOR LOCAL VARAIBLES ONLY 

#SESSION VARIABLES
SET @s_var1 = 3;
select @s_var1;


SET @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300,@v_avg_salary);
select @v_avg_salary;

set @v_emp_no = 0;
call employees.emp_info('Aruna','Journel',@v_emp_no);
select @v_emp_no;

#GLOBAL VARAIBLES
#SET GLOBAL OR SET GLOBAL @@

SET GLOBAL max_connections = 1000;
SET @@global.max_connections = 1; 	 

#USER-DEFINED VS SYSTEM-DEFINED >> MAX CONNECTIONS IS GLOBAL ONLY 
#SET SESSION sql_mode = 'STRICT_TRANS....' OR SET GLOBAL sql_mode



















