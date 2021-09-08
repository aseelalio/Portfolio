# SELECT FROM CODE
SELECT 
    first_name, last_name
FROM
    EMPLOYEES;
    
SELECT 
    *
FROM
    EMPLOYEES; # SELECT ALL FROM EMPLOYEES
    
# WHERE CLAUSE CODE 
SELECT 
    *
FROM
    EMPLOYEES
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
# AND/OR/IN/NOT IN/ LIKE/ NOT LIKE/ BETWEEN...AND... OPERATORS CLAUSE CODES
# EXITS/ NOT EXITS/ IS NULL/ IS NOT NULL/ COMPARISIN .... OPERATORS CLAUSE CODES

#AND 
SELECT 
    *
FROM
    EMPLOYEES
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    *
FROM
    EMPLOYEES
WHERE
    FIRST_NAME = 'Kellie' AND gender = 'F';
    
#OR 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'DENIS'
 OR first_name = 'Elvis';
 
 
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
#LOGICAL ORDER OF AND/OR IN A CODE BLOCK --PARANTHASIS--
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M'
        OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan'; # the code under is a more effcient way 
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan'); 

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan'); 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

#PATTERNS

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%'); #all names starting with mar 
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar'); #all names ending with ar 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_'); # all names starting with mar with four letters 
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');

# PRACTICE/ Wildcard Characters % _ * whenever you wished to put anything in its place 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mark%');

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%JACK%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
    
# BETWEEN .. AND... 
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01'; #OR NOT BETWEEN 

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

#IS NOT NULL / IS NULL 
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;

#OTHER COMPARISN OPERATORS (MATHMATICAL SIGNS)
SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark'; # or !=

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01'; #after or >= if we want to include 01/01/2000
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01'; # before or <= to include 1985/02/01

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND hire_date >= '2000-01-01';

SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000';
    
# SELECT DISTICT  > NOT DUPLICATE 
SELECT DISTINCT
    gender
FROM
    employees;

SELECT 
    hire_date
FROM
    employees; 
# AGGREGATE FUNCTIONS COUNT()/SUM()/MAX()/MIN()/AVG() >> they ignore null values unless told no to 
SELECT 
    COUNT(emp_no)
FROM
    employees; #number of employees in our database 
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees; #how mnay diff names can be found in the employees table (no duplicates)

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= '100000'; # or count(*)

SELECT 
    COUNT(*)
FROM
dept_manager;

#ORDERBY
SELECT 
    *
FROM
    employees
ORDER BY first_name; #SAME AS ADDING ASC BY IN THE END 
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;
SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name ASC;
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

#GROUPBY IMPPPP SELECT FROM WHERE GRP BY ORDER BY
SELECT 
    first_name
FROM
    employees
GROUP BY first_name; # is the same as select distinct 
SELECT DISTINCT
    first_name
FROM
    employees;
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name ASC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary ASC;

#HAVING NEEDS TO BE INSTERTED BETWEEB GRP BY AND ORDER BY / HAVING CAN BE APPLIED AGGREGATED GROUPS

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name ASC;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT first_name, COUNT(first_name) AS name_count
FROM 
employees 
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC
limit 100;


SELECT emp_no, COUNT(emp_no) AS emp_count 
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no ASC;

SELECT emp_no 
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no 
HAVING COUNT(from_date) > 1
ORDER BY emp_no;


#LIMIT 

SELECT 
    *
FROM
    employees
ORDER BY salary DESC
LIMIT 10;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

#INSERT STATEMENT 
INSERT INTO employees 
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES 
(999901, '1986-04-21', 'John','Smith','M','2011-01-01'); #INT NO QUAOTES/ MUST PLACE VALUES IN THE EXACT SAME ORDER OF THE COULOUM NAMES

INSERT INTO employees VALUES (999903, '1977-09-14', 'Jonathan','Creek','M','1999-01-01'); #it has to be in the same couloumn order 




SELECT 
    *
FROM
 dept_emp
    ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO titles (emp_no, title, from_date) VALUES (999903,'Senior Engineer','1994-10-01');
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES (999903,'d005', '1997-10-01','9999-01-01');

SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup 
(
dept_no CHAR (4) NOT NULL,
dept_name VARCHAR(40) NOT NULL);

Alter table departments_dup
Alter dept_name SET DEFAULT 'NULL';
Alter table departments_dup
Alter dept_no NULL;


#insert all rows in the departments to department duplicate 
INSERT INTO departments_dup 
( dept_no,
dept_name)
SELECT 
* 
FROM 
departments;
USE employees; 
INSERT INTO departments VALUES ('d010','Business Analysis');
    

#UPDATE STATMENT 
USE employees;
UPDATE employees 
SET 
first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-12-31',
gender = 'F'
WHERE 
emp_no = 999901;

SELECT * FROM employees 
ORDER BY emp_no DESC 
LIMIT 10; 

UPDATE departments 
SET 
dept_name = 'Data Analysis'
WHERE 
dept_no = 'd010';

#ROLLBACK AND COMMIT 
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
dept_no = 'd011',
dept_name = 'Quality Control';

ROLLBACK;
COMMIT;

#DELETE STATEMENT >> THE WHERE STATMENT IS EMPORTANT WHEN DELETING UNLESS WE WANT TO LOSE ALL THE INFO 

SELECT * FROM 
employees 
WHERE 
emp_no = 999903;

SELECT * FROM 
titles 
WHERE 
emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;

ROLLBACK;
COMMIT; 

DELETE FROM departments
WHERE 
dept_no = 'd010';

ROLLBACK;

# MAIN DIFF BETWEEN DROP/TRUNCATE/DELETE
# DROP > LOSE EVERYTHING 
# TRUNCATE > REMOVE ALL RECORDS FROM A TABLE JUST LIKE A DELETE WITHOUT A WHERE STATMENT 
# DELETE > REMOVES ROW BY ROW WITH THE WHERE BLOCK 

#SQL AGGREGATE FUNCTIONS 
#COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT
COUNT(salary)
FROM 
salaries;

SELECT 
COUNT(DISTINCT from_date)
FROM 
Salaries;

SELECT 
COUNT(*)
FROM 
salaries; # the star only goes with count

SELECT 
COUNT(DISTINCT dept_no)
FROM 
dept_emp; 

#SUM()

SELECT
SUM(salary)
FROM 
salaries;

SELECT 
SUM(salary)
FROM 
salaries 
where from_date > '1997-01-01';

#MIN() AND MIN()

SELECT 
MAX(salary)
FROM 
salaries; 

SELECT 
MIN(salary)
FROM 
salaries;

SELECT 
MAX(emp_no)
FROM 
employees;

SELECT 
MIN(emp_no)
FROM 
employees; 

#AVG() / ROUND()

SELECT 
ROUND(AVG(salary), 2)
from 
salaries; 

SELECT 
ROUND(AVG(salary),2)
FROM 
salaries 
where from_date > '1997-01-01';

#COALESCE() / IFNULL() / coalesce is as ifnull() with more than two parameters 


DELETE FROM departments_dup 
WHERE
    dept_no = 'd010';

ROLLBACK;
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

INSERT INTO departments_dup (dept_no) VALUES ('d010');

#ifnull not more than two parameters 
SELECT dept_no, IFNULL(dept_name, 'Department name not provided') as dept_name
FROM 
departments_dup;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

#visualize couloums by coalesce
select dept_no,
dept_name,
coalesce('departement manager name') AS fake_col
from 
departments_dup;

select dept_no, dept_name,
coalesce(dept_no,dept_name) as dept_info
from 
departments_dup
order by dept_no ASC;

select 
IFNULL(dept_no,'N/A') AS DEPT_NO,
IFNULL(dept_name,'Departement name not provided') as dept_name,
coalesce(dept_no, dept_name) as dept_info
from
departments_dup
ORDER BY dept_no ASC;

#JOINS > relationships between objects 
select * from departments_dup;
commit;
delete from departments_dup
where 
dept_no = 'd010';

drop table departments_dup;
CREATE TABLE departments_dup 
(
dept_no CHAR (4),
dept_name VARCHAR(40));
INSERT INTO departments_dup 
( dept_no,
dept_name)
SELECT 
* 
FROM 
departments;
ALTER TABLE departments_dup
CHANGE column dept_no dept_no CHAR(4) NULL;
ALTER TABLE departments_dup
change column dept_name dept_name varchar(40)NULL;

select * from departments_dup;
insert into departments_dup (dept_name) values ('Public Relations');
delete from departments_dup 
where 
dept_no = 'd002';
insert into departments_dup (dept_no) values ('d010');
insert into departments_dup (dept_no) values ('d011');

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup
(emp_no int(11) NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL);
insert into dept_manager_dup
select * from dept_manager;

select * from dept_manager_dup;

INSERT INTO dept_manager_dup (emp_no, from_date)
values (999904,'2017-01-01'),
(999905,'2017-01-01'),
(999906,'2017-01-01'),
(999907,'2017-01-01');

delete from dept_manager_dup 
where 
dept_no = 'd001';

insert into departments_dup (dept_name)
values ('Public Retaltions');

delete from departments_dup 
where 
dept_no = 'd002';
delete from departments_dup 
where 
dept_name = 'Public Relations';


#INNER JOIN 

SELECT * FROM dept_manager_dup
order by dept_no;

SELECT * FROM departments_dup
order by dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
    group by m.emp_no
    order by dept_no;
   
    
SELECT 
e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM 
employees e 
inner join 
dept_manager d on e.emp_no = d.emp_no
order by e.emp_no;

#duplicate rows in joins 
INSERT INTO dept_manager_dup VALUES ('110228','d003','1992-03-21','9999-01-01');
INSERT INTO departments_dup VALUES ('d009','Customer Service');
INSERT INTO departments_dup VALUES ('d010','Data Analytics');
#>> if duplicate is found add group by emp.no

show variables like 'sql_mode';
set global sql_mode='';

select * from departments_dup;
select * from dept_manager_dup;

SET sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

#LEFT JOIN
DELETE FROM departments_dup where dept_no = 'd009';
DELETE FROM dept_manager_dup where emp_no = '110228';
DELETE FROM departments_dup where dept_no = 'd010';

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
    group by m.emp_no
    order by dept_no;
    
    SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
    order by d.dept_no;
    
    # we can add a where cluase to for the outcome to include only null values 
    
    SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date 
    FROM 
    employees e 
    LEFT JOIN 
    dept_manager d ON e.emp_no = d.emp_no
    where e.last_name = 'Markovitch'
    order by d.dept_no DESC,e.emp_no;
    
    #RIGHT JOIN 
    
    SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        RIGHT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
    order by d.dept_no;
    
    #JOIN AND WHERE 
    SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary 
    FROM 
    employees e 
    INNER JOIN 
    salaries s ON e.emp_no = s.emp_no
    where s.salary > '145000'
    order by s.salary asc;
    
    SELECT 
    e.emp_no, e.first_name, e.last_name, t.title
    FROM 
    employees e
    JOIN 
    titles t on e.emp_no = t.emp_no
    where 
    first_name = 'Margareta' and last_name = 'Markovitch';
    
    #CROSS JOIN 
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no, d.dept_no;

select * from departments;
select * from dept_manager;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

#cross joining more than 2 tables 

SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
    join 
    employees e on e.emp_no = dm.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

Select 
dm.*, d.*
FROM 
dept_manager dm 
cross join 
departments d
where 
d.dept_no = 'd009'
order by dm.emp_no;

select * from employees
order by emp_no;

select 
e.*, d.*
from 
employees e 
cross join
departments d 
where 
e.emp_no < 10011;

#aggeragte functions in join // must use group by 
SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender; 

#join more than two tables 
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no;
    
    select 
    e.first_name, e.last_name, e.hire_date, t.title, d.dept_name  
    from 
    employees e 
    join 
    titles t on e.emp_no = t.emp_no 
    join 
    dept_manager dm on t.emp_no = dm.emp_no
    join 
    departments d on dm.dept_no = d.dept_no
    where t.title = 'Manager'
    order by first_name;

#tips and tricks for Joins 
select 
d.dept_name, AVG(s.salary) as average_salary 
from 
departments d
join 
dept_manager dm on d.dept_no = dm.dept_no
join 
salaries s on dm.emp_no = s.emp_no
group by dept_name
having average_salary > 60000
order by average_salary DESC;

select 
e.gender, count(dm.emp_no)
from 
employees e 
join 
dept_manager dm on e.emp_no = dm.emp_no
group by gender;

#UNION VS UNION ALL > desplay duplicates 
DROP TABLES IF EXISTS employees_dup;
CREATE TABLE employees_dup 
(
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M','F'),
hire_date date);

INSERT INTO employees_dup 
select e.*
from 
employees e
LIMIT 20; 
SELECT * FROM employees_dup;

INSERT INTO employees_dup VALUES ('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

SELECT 
e.emp_no,
e.first_name,
e.last_name,
NULL AS dept_no,
NULL AS from_date
from
employees_dup e 
where 
e.emp_no = 10001
union select 
NULL AS emp_no,
NULL AS first_name, 
NULL AS last_name, 
m.dept_no,
m.from_date
from 
dept_manager m;

select 
e.emp_no,
e.first_name 
from 
employees e 
where 
last_name = 'Denis' 
UNION SELECT 
dm.dept_no,
dm.from_date
FROM 
dept_manager dm;

#SQL SUBQUERIES
select * from dept_manager;
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);

SELECT 
    *
FROM
    dept_manager dm
WHERE
    dm.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

#SQL SUBQUURIES EXISTS / NOT EXISTS >>> test row values >> quicker with large data sets 
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);

# order by always in the outer query 
      SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
            order by emp_no;    
            
SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
                 t.emp_no = e.emp_no and title = 'Assistant Engineer');

#diff exercise vid num 209 



SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS departemnet_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS departemnet_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
)

SELECT * FROM emp_manager;

INSERT INTO emp_manager 
SELECT
U.*
FROM (SELECT a.* FROM (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS departemnet_ID,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
    UNION 
    SELECT B.* 
    FROM (
        SELECT e.emp_no AS employee_ID,
            MIN(de.dept_no) AS departemnet_ID,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B
    UNION SELECT C.* FROM 
    (SELECT e.emp_no as employee_ID, MIN(dm.dept_no) as departement_ID, (select emp_no 
    from dept_manager where emp_no = '110039') as Manager_ID
    FROM 
    employees e 
   join dept_emp de on e.emp_no = de.emp_no 
   where 
   e.emp_no = '110022'
   group by e.emp_no 
   order by e.emp_no) AS C 
   UNION 
   SELECT D.* FROM 
(SELECT e.emp_no as employee_ID, min(dm.dept_no) as departement_id, (select emp_no 
    from dept_manager where emp_no = '110022') as Manager_ID
    FROM 
    employees e 
   join dept_emp de on e.emp_no = de.emp_no 
   where 
   e.emp_no = '110039'
   group by e.emp_no 
   order by e.emp_no) AS D) AS U;
   
   #SELF JOIN 214 

SELECT 
    e1.emp_no, e1.dept_no, e2.manager_no
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
            
#SQL VIEWS
select * from dept_emp;


select 
emp_no, from_date, to_date, count(emp_no) as Num
from 
dept_emp
group by emp_no 
having Num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
CREATE OR REPLACE VIEW v_avg_manager_salary AS
SELECT 
 ROUND(AVG(s.salary),2) AS avg_salary
FROM 
salaries s
JOIN 
dept_manager dm ON dm.emp_no = s.emp_no;

#STORED ROUTINES

USE employees;

DROP procedure IF EXISTS select_employees;


DELIMITER $$ 
CREATE procedure select_employees()
BEGIN 

SELECT * FROM employees
LIMIT 1000;

END$$
DELIMITER;







	
   
   
    
    
    
    



































    
    
    
    
    
    
    
   





    












    

    






















    













    
    

