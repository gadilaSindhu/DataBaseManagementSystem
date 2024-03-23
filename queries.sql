-- create
CREATE TABLE worker (
  workerId int not null primary key,
  workername varchar(20) not null,
  dept varchar(20) not null,
  salary int not null,
  doj datetime not null,
);

GO
-- insert
INSERT INTO worker VALUES (1,'Anil', 'Accounts', 10000, '01-01-2020');
INSERT INTO worker VALUES (2,'Anu', 'Admin', 11000, '01-10-2020');
INSERT INTO worker VALUES (3,'Anil Kumar', 'HR', 5000, '03-11-2020');
INSERT INTO worker VALUES (4,'Anuradh' , 'Marketing', 12000, '11-12-2021');
INSERT INTO worker VALUES (5,'Anuradh Kumar', 'Establishment', 8000, '01-01-2020');
INSERT INTO worker VALUES (6,'Anoop', 'Finance', 10000, '01-01-1998');
INSERT INTO worker VALUES (7,'Anoop Kumar', 'Stores', 9000, '01-01-2001');
INSERT INTO worker VALUES (8,'Adarsh', 'Security', 7000, '01-01-2008');

-- change name of worker of Anil kumar to Anil Prasad
UPDATE worker
SET workername = 'Anil Prasad'
WHERE workername = 'Anil Kumar';
SELECT * FROM worker

-- Change the salary of workers to 5500 whose salary is less than 6000
UPDATE worker
SET salary = 5500
WHERE salary < 6000
SELECT * FROM worker

--- Display the worker details drawing max salary
SELECT * FROM worker WHERE salary = (SELECT MAX(salary) from worker)

--Display the worker details drawing min salary
SELECT * FROM worker WHERE salary = (SELECT MIN(salary) from worker)

--display the highest 2nd worker salary
SELECT MAX(salary) FROM worker WHERE salary NOT IN(SELECT max(salary) from worker)

-- display oldest worker as per DOJ
SELECT * from worker WHERE doj = (SELECT MIN(doj) from worker)

-- display newest worker as per DOJ
SELECT * FROM worker WHERE doj = (SELECT MAX(doj) from worker)

-- Display name of all workers and department in format "Anil is working in Account"
SELECT CONCAT (CONCAT (workername, ' is working in '),dept) FROM worker

-- Display name of a workers and salary in format “Anil salary is 10000”
SELECT CONCAT (CONCAT (workername, ' salary is '),salary) FROM worker

-- sort the worker data based on Salary and then dept
SELECT * from worker ORDER BY salary
SELECT * FROM worker ORDER BY dept

-- sort the worker data based on Salary reverse order and then dept in ascending order
SELECT * from worker ORDER BY salary desc
SELECT * FROM worker ORDER BY dept asc

-- Display the first character of all workers
SELECT SUBSTRING (workername, 1, 1) FROM worker

-- display whose name ends with S
SELECT * FROM worker WHERE workername LIKE '%S'

-- display workers who are working in Account, Security
SELECT * FROM worker WHERE dept= 'Accounts'
SELECT * FROM worker WHERE dept= 'Security'

-- Display workers who are not working in HR
SELECT * FROM worker WHERE dept != 'HR'

-- Display workers whose salary is greater than 8000 and less than 12000
SELECT * FROM worker WHERE salary>8000 and salary<12000

-- Display unique departments
SELECT distinct dept FROM worker

--Display count of all workers
SELECT COUNT(*) FROM worker

-- Display count of workers in each department
SELECT dept, COUNT(*) FROM worker GROUP BY dept

-- Display avg salary for each department
SELECT dept, AVG(salary) AS Average_salary FROM worker GROUP BY dept

-- Display departments where count of workers is more than 1
SELECT dept FROM worker GROUP BY dept, workerId HAVING COUNT(workerId) > 1 